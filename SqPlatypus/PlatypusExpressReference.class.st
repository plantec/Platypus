Class {
	#name : #PlatypusExpressReference,
	#superclass : #PlatypusListItemReference,
	#instVars : [
		'subReferences',
		'interactiveCallArguments'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusExpressReference class >> elementClassFromSyntaxicSymbol: aSymbol [ 
	aSymbol == #schema
		ifTrue: [^ PlatypusSchemaReference].
	aSymbol == #entity
		ifTrue: [^ PlatypusEntityReference].
	aSymbol == #type
		ifTrue: [^ PlatypusTypeReference].
	aSymbol == #procedure
		ifTrue: [^ PlatypusProcedureReference].
	aSymbol == #function
		ifTrue: [^ PlatypusFunctionReference].
	aSymbol == #rule
		ifTrue: [^ PlatypusRuleReference]
]

{ #category : #accessing }
PlatypusExpressReference class >> saveOutputDirectoryName [
	^ 'Platypus-schemata'
]

{ #category : #'code updating' }
PlatypusExpressReference >> accept: input notifying: aRequestor [ 
	| result users |
	users := self schemaInstanceReference allUsers.
	result := 
		self expressParserClass
			parse: input
			startingAt: self smaCCStartingState
			owner: (self metaData owner ifNil: [PltSchemaInstance new namesBuilder: self metaData namesBuilder])
			onError: [:aString :position | 
				(PlatypusParserResultAcceptAbort
					requestor: aRequestor
					metaData: self metaData
					message: aString
					position: position) signal.
				nil].
	result ifNil: [^ false].
	result users: (users asArray sort: [:a :b | b usesSchemataOf: a]) asOrderedCollection.
	result users addFirst: self schemaInstanceReference.
	^ [self updateWithParserResult: result notifying: aRequestor]
		on: PlatypusParserResultAcceptingError
		do: [:ex | 
			(PlatypusParserResultAcceptAbort
				requestor: aRequestor
				metaData: self metaData
				message: ex messageText
				position: 1) signal.
		^ false].

]

{ #category : #'code updating' }
PlatypusExpressReference >> addFromTokenList: aTokenList [ 
	| start stop |
	aTokenList addFirst: PlatypusEolToken new;
		 add: PlatypusEolToken new.
	start := self addingStartNode.
	stop := start
				ifNotNil: [start previous].
	self tokenList
		replaceFromNode: start
		toNode: stop
		with:  aTokenList.
	self
		buildSubReferencesFrom: aTokenList first
		to: aTokenList last
		addingOrReplacing: #adding.
	self tokenList updateAllTokensPositions.
	self metaData schemaInstance validationResult: false.
	^ true
]

{ #category : #accessing }
PlatypusExpressReference >> addingStartNode [
	^ self tokenList beginningOfLineFrom: (self tokenList previousPrimaryElementCloseKeywordFrom: self stopNode)
]

{ #category : #'morphic wrapper' }
PlatypusExpressReference >> asMorph [
	^ self newEditor asMorph
]

{ #category : #accessing }
PlatypusExpressReference >> bindings [
	^ self metaData bindings
]

{ #category : #'code updating' }
PlatypusExpressReference >> buildSubReferencesFrom: start to: stop addingOrReplacing: addingReplacingOrReplacingAllSymbol [ 
	| oldContentsByClassIndexes key curr currNameNode newElementClass oldReference elementReference currKeyOldsReferencesList adding |
	oldContentsByClassIndexes := IdentityDictionary new.
	self subElementSymbols
		do: [:s | oldContentsByClassIndexes
				at: (self elementClassFromSyntaxicSymbol: s)
				put: Dictionary new].
	(addingReplacingOrReplacingAllSymbol = #replacing
			or: [addingReplacingOrReplacingAllSymbol = #replacingAll])
		ifTrue: [self subReferences
				do: [:sr | sr isLink
						ifFalse: [key := sr metaData name asUppercase.
							(oldContentsByClassIndexes at: sr class)
								at: key
								ifAbsentPut: OrderedCollection new.
							((oldContentsByClassIndexes at: sr class)
								at: key)
								add: sr]]].
	curr := start.
	[curr ~= stop]
		whileTrue: [(curr isPrimaryElementOpenKeyword
					and: [self subElementSymbols includes: curr lexicalElement])
				ifTrue: [currNameNode := self tokenList nextNonBlankFrom: curr next.
					key := currNameNode lexicalElement asUppercase.
					newElementClass := self elementClassFromSyntaxicSymbol: curr lexicalElement.
					oldReference := (oldContentsByClassIndexes at: newElementClass)
								at: key
								ifPresent: [:v | v first].
					oldReference
						ifNil: [adding := true.
							elementReference := newElementClass new owner: self.
							self subReferences add: elementReference]
						ifNotNil: [adding := false.
							elementReference := oldReference.
							currKeyOldsReferencesList := (oldContentsByClassIndexes at: newElementClass)
										at: key.
							currKeyOldsReferencesList removeFirst.
							currKeyOldsReferencesList isEmpty
								ifTrue: [(oldContentsByClassIndexes at: newElementClass)
										removeKey: key]].
					elementReference name: currNameNode lexicalElement.
					elementReference metaData: curr metaData.
					elementReference startNode: curr.
					elementReference
						stopNode: (self tokenList nextNonBlankFrom: (self tokenList closeTokenFrom: curr) next).
					curr metaData isNil ifFalse: [ curr metaData tamarisItemRef: elementReference.
					adding
						ifTrue: [self logToChangesAdding: elementReference]
						ifFalse: [addingReplacingOrReplacingAllSymbol ~= #replacingAll
								ifTrue: [self logToChangesUpdating: elementReference]].
					elementReference
						buildSubReferencesFrom: elementReference subReferencesScanStart
						to: elementReference stopNode
						addingOrReplacing: #replacingAll].
					curr := elementReference stopNode]
				ifFalse: [curr := curr next]].
	addingReplacingOrReplacingAllSymbol = #replacingAll
		ifTrue: [oldContentsByClassIndexes
				do: [:c | c
						do: [:srl | srl
								do: [:sr | 
									self logToChangesRemoving: sr oldCodeText: sr codeText.
									sr destroy.
									sr owner removeChildSilently: sr]]]]
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeStreamClass [
	^ self
		codeStreamClassFor: self tokenList
		from: self startNode
		to: self stopNode

]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeStreamClassFor: tokenList from: startNode to: stopNode [ 
	| currNode count |
	tokenList notNil
		ifTrue: [currNode := startNode isNil
						ifTrue: [tokenList first]
						ifFalse: [startNode].
			count := 0.
			[currNode notNil
				and: [currNode ~~ stopNode
						and: [count < self decorationMaxSize]]]
				whileTrue: [count := count + 1.
					currNode := currNode next].
			count < self decorationMaxSize
				ifTrue: [^ PlatypusStepCodeStream]].
	^ WriteStream
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeString [
	^ self isReleased
		ifTrue: ['']
		ifFalse: [
	self
		codeTextFrom: self startNode
		to: self stopNode
		stream: String new writeStream]
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeText [
	^ self isReleased ifTrue: ['']
		ifFalse: [self codeTextWithStreamClass: self codeStreamClass].

]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeTextFrom: startNode to: stopNode stream: aStream [ 
	^ self tokenList
		writeOn: aStream
		from: (self tokenList beginningOfLineFrom: startNode)
		to: (self tokenList endOfLineFrom: stopNode)
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeTextFrom: startNode to: stopNode streamClass: aStreamClass [ 
	^ self tokenList
		textWithStreamClass: aStreamClass
		from: (self tokenList beginningOfLineFrom: startNode)
		to: (self tokenList endOfLineFrom: stopNode)
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeTextWithStream: aStream [ 
	^ self
		codeTextFrom: self startNode
		to: self stopNode
		stream: aStream
]

{ #category : #'code accessing' }
PlatypusExpressReference >> codeTextWithStreamClass: aStreamClass [
	^ self
		codeTextFrom: self startNode
		to: self stopNode
		streamClass: aStreamClass
]

{ #category : #accessing }
PlatypusExpressReference >> contents [
	^ self subReferences ifNil: [#()]
]

{ #category : #'drag and drop' }
PlatypusExpressReference >> copyListItemHereFromTransfertMorph: aTransfertMorph [ 
	| aSchemaReference |
	aSchemaReference := aTransfertMorph passenger.
	^ self insertReference: aSchemaReference
]

{ #category : #'code accessing' }
PlatypusExpressReference >> decorationMaxSize [
	^ 7000
]

{ #category : #'initialize/release' }
PlatypusExpressReference >> destroy [
	self subReferences
				do: [:r | r destroy].
	subReferences := nil.
	super destroy
]

{ #category : #checking }
PlatypusExpressReference >> doInternalChecking [
	self assert: self metaData notNil.
	self assert: self metaData tamarisItemRef = self
]

{ #category : #accessing }
PlatypusExpressReference >> doItContext [
	^ self metaData
]

{ #category : #accessing }
PlatypusExpressReference >> editorClass [
	^ PlatypusExpressEditor
]

{ #category : #accessing }
PlatypusExpressReference >> elementClassFromSyntaxicSymbol: aSymbol [ 
	^ self class elementClassFromSyntaxicSymbol: aSymbol
]

{ #category : #'code updating' }
PlatypusExpressReference >> emptyModelContentsSubReferences [
	self schemaInstanceReference modelContentsReferences
		do: [:mcr | mcr removeSubReferencesSilently]
]

{ #category : #evaluating }
PlatypusExpressReference >> evaluate [
	^ nil
]

{ #category : #accessing }
PlatypusExpressReference >> externalSchemaInstances [
	^ self schemaInstanceReference metaData externalSchemaInstances

]

{ #category : #accessing }
PlatypusExpressReference >> externalSchemaInstancesReferences [
	^ self externalSchemaInstances
		collect: [:e | e tamarisItemRef]
]

{ #category : #searching }
PlatypusExpressReference >> findExpressReferenceDeeplySuchThat: aBlock [ 
	| res |
	self isReleased
		ifFalse: [(aBlock value: self)
				ifTrue: [^ self].
			self subReferences
				do: [:sr | (res := sr findExpressReferenceDeeplySuchThat: aBlock)
						ifNotNil: [^ res]]].
	^ nil
]

{ #category : #testing }
PlatypusExpressReference >> forceOkToChange [
	^ true
]

{ #category : #'code accessing' }
PlatypusExpressReference >> fullCodeString [
	^ self codeString
]

{ #category : #'generated code' }
PlatypusExpressReference >> generatedRootClassSystemCategory [
	^ self metaData rootClassSystemCategory asSymbol
]

{ #category : #'generated code' }
PlatypusExpressReference >> generatedRootClassSystemCategoryExists [
	^ (Smalltalk organization listAtCategoryNamed: self generatedRootClassSystemCategory) notEmpty
]

{ #category : #'generated code' }
PlatypusExpressReference >> generatedSystemCategory [
	^ self metaData generatedSystemCategory asSymbol
]

{ #category : #'generated code' }
PlatypusExpressReference >> generatedSystemCategoryExists [
	^ (Smalltalk organization listAtCategoryNamed: self generatedSystemCategory) notEmpty
]

{ #category : #'initialize/release' }
PlatypusExpressReference >> initialize [
	super initialize.
	subReferences := OrderedCollection new
]

{ #category : #accessing }
PlatypusExpressReference >> interactiveCallArguments [
	^ interactiveCallArguments
]

{ #category : #accessing }
PlatypusExpressReference >> interactiveCallArguments: aString [
	 interactiveCallArguments := aString
]

{ #category : #testing }
PlatypusExpressReference >> isCopyable [
	^ false
]

{ #category : #testing }
PlatypusExpressReference >> isEditable [
	^true
]

{ #category : #testing }
PlatypusExpressReference >> isMoveable [
	^ false
]

{ #category : #testing }
PlatypusExpressReference >> isRemoveable [
	^ true
]

{ #category : #testing }
PlatypusExpressReference >> isSchema [
	^ false
]

{ #category : #testing }
PlatypusExpressReference >> isSchemaElement [
	^false
]

{ #category : #testing }
PlatypusExpressReference >> isSchemaInstanceReference [
	^ false
]

{ #category : #testing }
PlatypusExpressReference >> isSchemaReference [
	^ false
]

{ #category : #menus }
PlatypusExpressReference >> keyStroke: aCharacter from: aListMorph [ 
	super keyStroke: aCharacter from: aListMorph.
	aCharacter = $B
		ifTrue: [^ self menuBrowseGenerated].
	aCharacter = $s
		ifTrue: [^ self menuSave].
	aCharacter = $S
		ifTrue: [^ self menuSaveAs].
	aCharacter = $t
		ifTrue: [^ self menuTranslate2Pharo].
	aCharacter = $T
		ifTrue: [^ self translateAndFileItIn]
]

{ #category : #accessing }
PlatypusExpressReference >> lexicalElement [
	^ self class lexicalElement
]

{ #category : #'smalltalk changes logging' }
PlatypusExpressReference >> logToChangesAdding: aReference [ 
	self logToChangesKey: 'Adding'  element: aReference longName codeText: aReference codeText  

]

{ #category : #'smalltalk changes logging' }
PlatypusExpressReference >> logToChangesKey: aChangeKey element: elementName codeText: aStringOrText [ 
	ChangesLog default logChange: '----Platypus: ' , aChangeKey , String cr , elementName , String cr , aStringOrText ,String cr,  '----'
]

{ #category : #'smalltalk changes logging' }
PlatypusExpressReference >> logToChangesRemoving: aReference oldCodeText: aStringOrText [ 
	self
		logToChangesKey: 'Removing'
		element: aReference longName
		codeText: aStringOrText
]

{ #category : #'smalltalk changes logging' }
PlatypusExpressReference >> logToChangesUpdating: aReference [ 
	self
		logToChangesKey: 'Updating'
		element: aReference longName
		codeText: aReference codeString
]

{ #category : #menus }
PlatypusExpressReference >> menuBrowseGenerated [
	| genClassName cls |
	genClassName := self metaData generatedClassName.
	cls := PlatypusPharoSmalltalk at: genClassName asSymbol ifAbsent: [^ self inform: (genClassName , ' is not generated')].
	cls browse
]

{ #category : #menus }
PlatypusExpressReference >> menuRelabel [
	| oldname newname |
	oldname := self metaData name.
	(newname := UIManager default
				request: 'new name ?'
				initialAnswer: (oldname
						ifNil: [''])) trimBoth
		ifEmpty: [^ false]
		ifNotEmpty: [:v | newname ~= oldname
				ifTrue: [
					^ self relabelWith: newname]]
]

{ #category : #menus }
PlatypusExpressReference >> menuSave [
	| fileName  |
	fileName := self saveFullPath.
	fileName ensureCreateDirectory.
	fileName := fileName / ( self name , '.exp').
	fileName ensureDelete.
	fileName ensureCreateFile.
	fileName writeStreamDo: [:fileStream | 
		fileStream nextPutAll: (self codeString copy replaceAll: Character cr with: Character lf). 
		fileStream flush]
]

{ #category : #menus }
PlatypusExpressReference >> menuSaveAs [
	| result |
	result := UITheme current
		fileSaveIn: World
		title: 'File name'
		extensions: #('exp')
		path: ''.
	result
		ifNotNil: [ 
			[ result nextPutAll: (self codeString copy replaceAll: Character cr with: Character lf) ]
				ensure: [ result close ] ]
]

{ #category : #menus }
PlatypusExpressReference >> menuTranslate2Pharo [
	| result fileName |
	Transcript show: 'Translating ' , self listLabel , '...'.
	result := self translated2Pharo.
	fileName := self saveFullPath /( self name, '-pharo.st').
	fileName ensureCreateFile.
	(fileName writeStream)
		ifNotNil: [:fileStream | Cursor write
				showWhile: [[fileStream nextPutAll: result]
						ensure: [fileStream close]]].
	
	(Workspace new contents: result; yourself)
		openLabel: 'Translation of ''' , self listLabel , ''''.
	Transcript show: String cr
]

{ #category : #menus }
PlatypusExpressReference >> menuTranslate2VisualWorks [
	| result fileName |
	Transcript show: 'Translating ' , self listLabel , '...'.
	result := self translateWithTranslator: self translaterForVisualWorks.
	fileName := self saveFullPath / ( self name, '-vw.st').
	fileName ensureCreateFile.
	(fileName writeStream)
		ifNotNil: [:fileStream | Cursor write
				showWhile: [[fileStream nextPutAll: result]
						ensure: [fileStream close]]].
	
	(Workspace new contents: result)
		openLabel: 'Translation of ''' , self listLabel , ''''.
	Transcript show: String cr
]

{ #category : #accessing }
PlatypusExpressReference >> metaData [
	^ nil
]

{ #category : #accessing }
PlatypusExpressReference >> modelContents [
	^ nil
]

{ #category : #accessing }
PlatypusExpressReference >> modelContentsReferences [
	^ self schemaInstanceReference  modelContentsReferences
]

{ #category : #accessing }
PlatypusExpressReference >> namesBuilder [
	^ self metaData schemaInstance namesBuilder
]

{ #category : #'morphic wrapper' }
PlatypusExpressReference >> newEditor [
	| editor |
	editor := self editorClass new.
	editor buildTamarisWindow.
	editor sourceHandler: self.
	editor messagesBrowser
		ifNotNil: [editor updateMessagesBrowser].
	^ editor mainWindow 
]

{ #category : #'code accessing' }
PlatypusExpressReference >> prettyPrintedExpressCode [
	^ self metaData prettyPrintedExpressCode
]

{ #category : #'initialize/release' }
PlatypusExpressReference >> reinitialize [
	self subReferences do: [:r | r destroy].
	self subReferences: OrderedCollection new
]

{ #category : #'code updating' }
PlatypusExpressReference >> relabelWith: aName [ 
	self metaData renameWith: aName.
	super relabelWith: aName.

]

{ #category : #updating }
PlatypusExpressReference >> remove [
	| oldOwner |
	self schemaInstanceReference showsUsersAsToBeChecked.
	oldOwner := self owner.
	self metaData ifNotNil: [ 
		self metaData schemaInstance validationResult: false].
	self removeSilently.
	self treeHasChanged
]

{ #category : #'code updating' }
PlatypusExpressReference >> removeAll [
	self subReferences: OrderedCollection new.
	self treeHasChanged 
]

{ #category : #'code updating' }
PlatypusExpressReference >> removeChildSilently: aReference [ 
	aReference isLink
		ifTrue: [(self metaData respondsTo: #removeElement:)
				ifTrue: [self metaData removeElement: aReference linked].
			self subReferences
				remove: aReference
				ifAbsent: []]
		ifFalse: [(aReference isKindOf: PlatypusExpressReference)
				ifTrue: [aReference metaData
						ifNotNil: [(self metaData respondsTo: #removeElement:)
								ifTrue: [self metaData removeElement: aReference metaData]].
					self subReferences
						remove: aReference
						ifAbsent: []]].
	super removeChildSilently: aReference
]

{ #category : #'code updating' }
PlatypusExpressReference >> replaceMetaDataWith: aMetaData [ 
	self metaData owner removeElement: self metaData.
	self metaData deepDestroy.
	self metaData: aMetaData.
	self metaData tamarisItemRef: self
]

{ #category : #'code updating' }
PlatypusExpressReference >> replaceTokenListWithParserResult: aParserResult [ 
	| start stop |
	self replaceMetaDataWith: aParserResult metaData.
	start := self tokenList beginningOfLineFrom: self startNode.
	stop := self tokenList endOfLineFrom: self stopNode.
	self tokenList
		replaceFromNode: start
		toNode: stop
		with: aParserResult tokenList.
	self startNode: aParserResult tokenList first.
	self stopNode: aParserResult tokenList last.
	self
		buildSubReferencesFrom: self subReferencesScanStart
		to: self stopNode
		addingOrReplacing: #replacingAll.
	self tokenList updateAllTokensPositions.
	self logToChangesUpdating: self.
	^ true
]

{ #category : #menus }
PlatypusExpressReference >> saveFullPath [
	| path |
	path := (FileSystem disk workingDirectory) / self class saveOutputDirectoryName.
	self parentsChain do: [:p | path := path / p listLabel].
	^ path
]

{ #category : #accessing }
PlatypusExpressReference >> schemaInstance [
	^ self schemaInstanceReference schemaInstance
]

{ #category : #accessing }
PlatypusExpressReference >> selectionString [
	^ self codeString
]

{ #category : #accessing }
PlatypusExpressReference >> smaCCStartingState [
	^ self subclassResponsibility
]

{ #category : #accessing }
PlatypusExpressReference >> specificButtonsColumn: aTaxonomyBrowser inAlignment: aButtonsAlignment [ 
	aTaxonomyBrowser editorModel ifNotNil: [aTaxonomyBrowser editorModel  addButtonsinAlignment: aButtonsAlignment.
	aButtonsAlignment addSpacer].
	^aButtonsAlignment
]

{ #category : #accessing }
PlatypusExpressReference >> startLevel [
	^ 0
]

{ #category : #accessing }
PlatypusExpressReference >> startNode [
	^ self subclassResponsibility
]

{ #category : #accessing }
PlatypusExpressReference >> stopNode [
	^ self subclassResponsibility
]

{ #category : #accessing }
PlatypusExpressReference >> subElementSymbols [
	^ PlatypusSchemaElementReference allSubclasses
		collect: [:c | c lexicalElement]
]

{ #category : #accessing }
PlatypusExpressReference >> subReferences [
	^ subReferences
		ifNil: [OrderedCollection new]
]

{ #category : #accessing }
PlatypusExpressReference >> subReferences: anObject [
	subReferences := anObject
]

{ #category : #'code updating' }
PlatypusExpressReference >> subReferencesScanStart [
	^  (self tokenList nextOpenKeywordFrom: self startNode) next
]

{ #category : #accessing }
PlatypusExpressReference >> tamarisItemRef [
	^ self
]

{ #category : #accessing }
PlatypusExpressReference >> tokenList [
	^ self schemaInstanceReference ifNotNil: [self schemaInstanceReference tokenList]
]

{ #category : #menus }
PlatypusExpressReference >> translateAndFileItIn [
	| src  |
	src := self translated2Pharo.
	CodeImporter evaluateString: src
]

{ #category : #menus }
PlatypusExpressReference >> translateWithTranslator: aTranslator [ 
	^ aTranslator translate: self metaData 
]

{ #category : #menus }
PlatypusExpressReference >> translated2Pharo [
	^ self translateWithTranslator: self translaterForPharo .

]

{ #category : #accessing }
PlatypusExpressReference >> translaterForPharo [
	^ self rootDictionaryReference translaterForPharo
]

{ #category : #accessing }
PlatypusExpressReference >> translaterForVisualWorks [
	^ self rootDictionaryReference translaterForVisualWorks
]

{ #category : #'code updating' }
PlatypusExpressReference >> updateWithParserResult: aParserResult [
	^ self updateWithParserResult: aParserResult notifying: nil
]

{ #category : #'code updating' }
PlatypusExpressReference >> updateWithParserResult: aParserResult notifying: aRequestor [
	| r |
	aParserResult tokenList noEndingEol.
	self replaceTokenListWithParserResult: aParserResult.
	self schemaInstanceReference recursivelyDo: [:ref | ref emphasisModel: nil].
	r := self schemaInstanceReference verifyNotifying: aRequestor.
	(aParserResult users copyWithout: self) do: [:schir | 
		r 
			ifTrue: [
				schir recursivelyDo: [:ref | ref emphasisModel: nil].
				schir verifyNotifying: aRequestor]
			ifFalse: [
				schir schemaInstance 
					addError: (PlatypusExpressResolverError 
						metaData: schir schemaInstance
						message: 'Used model named "', self schemaInstance name , '" has errors')]].
	self schemaInstanceReference codeUpdatedOn: DateAndTime now.
	^ true
	

]

{ #category : #accessing }
PlatypusExpressReference >> users [
	| allSchemaInstanceRefs |
	allSchemaInstanceRefs := PlatypusSchemaInstanceReference 
				allSchemaInstancesReferences.
	allSchemaInstanceRefs remove: self schemaInstanceReference.
	^ allSchemaInstanceRefs select: 
			[:schir | 
			(schir schemaInstance externalSchemataNames 
				intersection: self schemaInstanceReference schemaInstance 
						internalSchemataNames) 
					notEmpty]
]

{ #category : #accessing }
PlatypusExpressReference >> usersAsMeta [
	| allSchemaInstanceRefs |
	allSchemaInstanceRefs := PlatypusSchemaInstanceReference 
				allSchemaInstancesReferences.
	allSchemaInstanceRefs remove: self schemaInstanceReference.
	^ allSchemaInstanceRefs select: 
			[:schir | 
			(schir schemaInstance metaSchemataNames 
				intersection: self schemaInstanceReference schemaInstance 
						internalSchemataNames) 
					notEmpty]
]
