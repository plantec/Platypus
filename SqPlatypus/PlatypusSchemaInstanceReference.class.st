Class {
	#name : #PlatypusSchemaInstanceReference,
	#superclass : #PlatypusExpressReference,
	#instVars : [
		'schemaInstance',
		'tokenList',
		'modelContentsReferences'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #menus }
PlatypusSchemaInstanceReference class >> addReferenceFromFilenamed: aFilename intoOwner: aReference [ 
	| initial strm |
	initial := aFilename asFileReference basenameWithoutExtension.
	(UIManager default request: 'Model name: ' initialAnswer: initial)
		ifNotEmpty: [:key | (strm := StandardFileStream readOnlyFileNamed: aFilename)
				ifNotNil: [[self
						addReferenceFromStream: strm
						intoOwner: aReference
						modelName: key]
						ensure: [strm close]]]

]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> addReferenceFromStream: aStream intoOwner: aReference modelName: anIdent [ 
	| fileContents parsingResult codeHolder window newSchi |
	fileContents := aStream contents.
	parsingResult := PlatypusExpressParser
				parse: fileContents
				owner: self schemaInstanceClass new
				onError: [:aString :position | 
					codeHolder := TamStringHolder new.
					codeHolder contents: fileContents.
					window := codeHolder embeddedInMorphicWindowLabeled: anIdent , ' parse error'.
					codeHolder textMorph selectFrom: position to: position - 1.
					codeHolder textMorph replaceSelectionWith: aString , '->'.
					codeHolder textMorph selectFrom: position to: position + aString size + 1.
					window openInWorld.
					^ nil].
	(newSchi := self owner: aReference schemaInstanceNamed: anIdent) replaceTokenListWithParserResult: parsingResult.
	newSchi verifySilently.
	newSchi treeHasChanged.
	
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> addReferenceMenuItemToMenu: aMenu owner: anotherReference [ 
	| menuAddReference |
	(menuAddReference := self subMenuLabelSubMenu: aMenu)
		add: 'from scratch'
		target: self
		selector: #menuAddReferenceIntoOwner:
		argumentList: {anotherReference}.
	menuAddReference
		add: 'from file ...'
		target: self
		selector: #menuAddReferenceFromFileIntoOwner:
		argumentList: {anotherReference}
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> addReferenceToFromFileListTaxonFromFilenamed: aFilename [ 
	self addReferenceFromFilenamed: aFilename intoOwner: TamManager fromFileListTaxonomy
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> allExpressTranslaters [
	^ PlatypusSchemaInstanceReference allSubInstances
		select: [:d | d isReleased not
				and: [d canBeExpressTranslater]]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> allSchemaInstanceReferencesNamed: aName [ 
	^ self allSchemaInstancesReferences 
		select: [:r | r name asUppercase = aName asUppercase]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> allSchemaInstancesReferences [
	^ PlatypusSchemaInstanceReference allSubInstances
		select: [:d | d isReleased not and: [d schemaInstance notNil]]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> allSchemaReferences [
	^ self allSchemaInstancesReferences inject: OrderedCollection new into: [:all :schir | all 
				addAll:  schir internalSchemaReferences;
				yourself]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> allSchemaReferencesNamed: aName [
	^ self allSchemaReferences select: [:r | r name asUppercase = aName asUppercase]
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> canBeCreatedInteractively [
	^ true
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> chooseExpressTranslaterForClient: aClient selectingBlock: aBlock [ 
	| aghl |
	Cursor normal showWhile: 
			[aghl := TamGenericHierarchicalList 
						fromRootListItems: (self allExpressTranslaters 
								collect: [:n | TamGenericHierarchicalListItem linked: n])
						title: 'EXPRESS Translaters'
						client: aClient.
			aghl 
				doDeeply: [:el | el selectingBlock: [:e | aBlock value: aghl value: e linked]].
			aghl doDeeply: [:el | el unSelectingBlock: [:e | ]].
			aghl openModal]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> chooseSchemaForClient: aClient selectingBlock: aBlock candidats: aListOfSchemaRef [ 
	^ self 
		chooseSchemaForClient: aClient
		selectingBlock: aBlock
		candidats: aListOfSchemaRef
		title: 'EXPRESS schemata'
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> chooseSchemaForClient: aClient selectingBlock: aBlock candidats: aListOfSchemaRef title: aTitle [ 
	| aghl flatten |
	Cursor normal showWhile: 
			[flatten := aListOfSchemaRef 
						collect: [:schref | Array with: schref owner with: schref].
			aghl := TamGenericHierarchicalList 
						fromFlatCollection: flatten
						title: aTitle
						client: aClient.
			aghl doDeeply: 
					[:el | 
					
					el selectingBlock: [:e | aBlock value: aghl value: e linked]].
			aghl doDeeply: [:el | el unSelectingBlock: [:e | ]].
			aghl openModalAndExpand]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> chooseSchemaInstanceForClient: aClient selectingBlock: aBlock [ 
	| aghl |
	Cursor normal showWhile: 
			[aghl := TamGenericHierarchicalList 
						fromRootListItems: (self allSchemaInstancesReferences 
								collect: [:n | TamGenericHierarchicalListItem linked: n])
						title: 'EXPRESS models'
						client: aClient.
			aghl 
				doDeeply: [:el | el selectingBlock: [:e | aBlock value: aghl value: e linked]].
			aghl 
				doDeeply: [:el | el unSelectingBlock: [:e | ]].
			aghl openModal]
]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> initializePlatypusMetaSchemataIfNeeded [
	PlatypusInternalMetaSchemaInstanceReference 
		initializeExpressMetaDictionaryIfNeeded.
	PlatypusInternalPrimitiveSchemaInstanceReference 
		initializeExpressPrimitiveDictionaryIfNeeded
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> interactivelyResolvedSchemaSatisfying: aBlock message: aMessage [
	| chosen candidats |
	candidats := self selectSchemaReferences: aBlock.
	candidats isEmpty ifTrue: [^ nil].
	candidats size = 1 ifTrue: [^ candidats first].
	self 
		chooseSchemaForClient: nil
		selectingBlock: 
			[:l :e | 
			chosen := e linked.
			l close]
		candidats: candidats
		title: aMessage.
	^ chosen
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> menuAddReferenceFromFileIntoOwner: aReference [
	| result |
	result := Tamaris chooseFilePathMatching: #('*.exp') label: 'Choose file to read' translated.
	result
		ifNotNil: [ 
			result asFileReference exists
				ifFalse: [ ^ UIManager default inform: ' ' , result , ' not found ' ].
			self addReferenceFromFilenamed: result intoOwner: aReference ]
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> menuAddReferenceIntoOwner: aReference [ 
	(UIManager default request: 'Model name' initialAnswer: '')
		ifNotNil: [:key | self owner: aReference schemaInstanceNamed: key ]

]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> owner: aReference schemaInstance: aSchemaInstance [ 
	| newRef |
	newRef := self schemaInstance: aSchemaInstance.
	aReference insertReference: newRef.
	^ newRef
]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> owner: aReference schemaInstanceNamed: key [ 
	| newRef |
	newRef := self schemaInstanceNamed: key.
	aReference insertReference: newRef.
	^ newRef
]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> schemaInstance: aSchemaInstance [ 
	^ self new schemaInstance: aSchemaInstance
]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> schemaInstanceClass [
	^ PltSchemaInstance
]

{ #category : #'instance creation' }
PlatypusSchemaInstanceReference class >> schemaInstanceNamed: aString [ 
	| schemaInstance |
	schemaInstance := self schemaInstanceClass new.
	schemaInstance setName: aString.
	^ self schemaInstance: schemaInstance
]

{ #category : #scripting }
PlatypusSchemaInstanceReference class >> schemaInstanceReferenceNamed: anIdent acceptFromFileNamed: aFileName [ 
	| candidats schi str |
	candidats := PlatypusSchemaInstanceReference allSchemaInstanceReferencesNamed: anIdent.
	candidats size ~= 1
		ifTrue: [candidats size > 1
				ifTrue: [self inform: 'More than one schema instance named <<' , anIdent , '>> are present. Sorry'.
					^ nil]
				ifFalse: [self inform: 'No schema instance named <<' , anIdent , '>> is present. Sorry'. ^ nil]].
	schi := candidats anyOne.
	[str := StandardFileStream readOnlyFileNamed: aFileName]
		on: FileStreamException
		do: [self inform: 'No file named <<' , aFileName , '>>. Sorry'. ^ nil].
	[schi
		accept: (PlatypusStepTokenPrettyPrinter prettyPrint: str contents)
		notifying: nil]
		ensure: [str close].
	schi checksAll.
	^ schi
]

{ #category : #accessing }
PlatypusSchemaInstanceReference class >> selectSchemaReferences: aBlock [ 
	^ self allSchemaReferences 
		select: aBlock
]

{ #category : #menus }
PlatypusSchemaInstanceReference class >> subMenuLabel [
	^ 'an Express model  '
]

{ #category : #'drag and drop' }
PlatypusSchemaInstanceReference >> acceptDroppingMorph: aTransfertMorph copy: shouldCopy [ 
	(aTransfertMorph respondsTo: #passenger) ifFalse: [^ false].
	((aTransfertMorph passenger isKindOf: PlatypusSchemaReference) 
		or: [aTransfertMorph passenger isKindOf: PlatypusSchemaInstanceReference]) 
			ifFalse: [^ false].
	^ self insertLinkableListItemFromTransfertMorph: aTransfertMorph
		copy: shouldCopy
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> accessibleSchemata [
	^self schemaInstance schemata
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> addModelContentsReference: newRef [ 
	self addModelContentsReferenceSilently: newRef.
	TamManager changed: self.
	^ newRef
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> addModelContentsReferenceSilently: newRef [ 
	| modelContents |
	modelContents := newRef modelContents.
	self schemaInstance addModelContents: modelContents.
	newRef owner: self.
	modelContents tamarisItemRef: newRef.
	self modelContentsReferences add: newRef.
	^ newRef
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> addingStartNode [
	^ nil
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> allUsers [
	| allUsers |
	allUsers := self usersInto: Set new.
	allUsers remove: self ifAbsent: [].
	^ allUsers
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> canBeExpressTranslater [
	^ self platypusInternalMetaSchemaInstanceReference metaData schemata
		anySatisfy: [:sch | self metaData externalSchemata
				anySatisfy: [:mySch| mySch = sch ]]
]

{ #category : #'data checking' }
PlatypusSchemaInstanceReference >> checksMetaData [
	^ self schemaInstance checksMetaData
]

{ #category : #'data checking' }
PlatypusSchemaInstanceReference >> checksMetaDataAndExplore [
	(self checksMetaData) explore
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> children [
	| schemata superChildren |
	((superChildren := super children)
	 anySatisfy: [:ref | ref  isKindOf: PlatypusSchemaReference]) ifFalse: [
	schemata := self subReferences
				select: [:sr | sr isKindOf: PlatypusSchemaReference]]
	ifTrue: [schemata := OrderedCollection new].
	^ schemata , superChildren
		, (self modelContentsReferences
				ifNil: [#()])
]

{ #category : #'code accessing' }
PlatypusSchemaInstanceReference >> codeStreamClassFor: aTokenList from: aStartNode to: aSopNode [ 
	^ super
		codeStreamClassFor: aTokenList
		from: aStartNode
		to: aSopNode
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> codeUpdated [
	self modelContentsReferences 
		do: [:mcr | 
			mcr reinitializeLabelSilently.
			mcr removeSubReferencesSilently].	
	"self allUsers do: [:u | u codeUpdated]"

]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> codeUpdatedOn: aDate [
	self schemaInstance changeDate: aDate asString.
	self codeUpdated.

]

{ #category : #testing }
PlatypusSchemaInstanceReference >> containsOrHasALinkTo: aSchemaDefinition [
	(self subReferences anySatisfy: [:sr | sr metaData = aSchemaDefinition or: [sr isLinkTo: aSchemaDefinition]])
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #copying }
PlatypusSchemaInstanceReference >> copy [
	| copy codeText |
	copy := super copy.
	self isReleased
		ifFalse: [copy := self class schemaInstanceNamed: self schemaInstance name.
			codeText := self tokenList writeOn: '' writeStream.
			copy tokenList: (PlatypusExpressScanner on: codeText readStream) buildTokenList.
			copy
				subReferences: ((self subReferences
						select: [:sr | sr isLink])
						collect: [:sr | sr copy]).
			copy subReferences
				do: [:sr | sr isLink
						ifTrue: [sr owner: copy.
							copy  schemaInstance schemata add: sr linked]].
			copy accept: self codeText notifying: nil.
			copy modelContentsReferences: OrderedCollection new.
			copy schemaInstance resolves.
			self modelContentsReferences
				do: [:m | m copyInside: copy]].
	^ copy
]

{ #category : #'initialize/release' }
PlatypusSchemaInstanceReference >> destroy [
	self tokenList
		ifNotNil: [self tokenList destroy].
	tokenList := nil.
	schemaInstance := nil.
	modelContentsReferences
		ifNotNil: [modelContentsReferences
				do: [:mcr | mcr destroy].
			modelContentsReferences := nil].
	super destroy
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> doInternalChecking [
	super doInternalChecking.
	self assert: modelContentsReferences notNil.
	self knownAsInvalid
		ifFalse: [self subReferences
				do: [:sr | 
					self
						assert: (self metaData schemataLinkedMetaData
								anySatisfy: [:lmd | lmd = sr metaData]).
					sr doInternalChecking].
			self metaData schemataLinkedMetaData
				do: [:lmd | self
						assert: (self subReferences
								anySatisfy: [:sr | lmd = sr metaData])]].
	modelContentsReferences
		do: [:mcr | self assert: mcr metaData owner = self metaData].
	modelContentsReferences
		do: [:mcr | 
			self assert: mcr owner = self.
			mcr doInternalChecking]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> elementTag [ 
	^ #namespace
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> expressParserClassName [
	^ #PlatypusExpressParser
]

{ #category : #'code accessing' }
PlatypusSchemaInstanceReference >> fullCodeString [
	| stream |
	stream := String new writeStream.
	self subReferences
		do: [:ref | ref linked codeTextWithStream: stream].
	^ stream contents
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> haveMetaSchemata [
	^ self metaData notNil and: [self metaData haveMetaSchemata]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> icon [
	^ self usePlatypusPrimitiveSchema
		ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/package_yellow']
		ifFalse: [self haveMetaSchemata
				ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/package_mapping']
				ifFalse: [TamIcons mimeIcon: '10x10/mimetypes/package_blue']]
]

{ #category : #'initialize/release' }
PlatypusSchemaInstanceReference >> initialize [
	tokenList := PlatypusTokenList new.
	modelContentsReferences := OrderedCollection new.
	self showSubLists: #always.
	super initialize
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> insertLinkReferenceFrom: aReference [ 
	| link linkRef |
	(aReference isKindOf: PlatypusExpressReference) 
		ifFalse: [^ false].
	aReference isSchemaInstanceReference 
		ifTrue: [
			aReference internalSchemaReferences 
				do: [:sr | self insertLinkReferenceFrom: sr ]]
		ifFalse: [
			aReference isSchemaReference 
				ifTrue: [
					(self containsOrHasALinkTo: aReference metaData)
						ifTrue: [ ^ false ].
					self metaData 
						insertElement: (link := PlatypusSchemaWrapper linked: aReference).
					self subReferences 
						add: (linkRef := PlatypusSchemaLinkReference from: link).
					linkRef owner: self.
					self treeHasChanged.
					^ true]]
]

{ #category : #'drag and drop' }
PlatypusSchemaInstanceReference >> insertLinkableListItemFromTransfertMorph: aTransfertMorph copy: shouldCopy [ 
	shouldCopy ifTrue: [self copyListItemHereFromTransfertMorph: aTransfertMorph]
	ifFalse: [self linkListItemHereFromTransfertMorph: aTransfertMorph]

]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> insertReference: anotherReference [ 
	| parserResult code |
	((anotherReference isKindOf: PlatypusExpressReference) 
		and: [anotherReference isSchemaReference]) 
			ifFalse: [^ super insertReference: anotherReference].
	anotherReference schemaInstance == self schemaInstance ifTrue: [^ false].
	code := anotherReference codeString.
	parserResult := anotherReference expressParserClass 
				parse: code
				startingAt: anotherReference smaCCStartingState
				owner: self metaData
				onError: [:aString :position | position].
	self updateWithParserResult: parserResult.
	self treeHasChanged.
	^ true
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> internalSchemaReferences [
	^ self schemaReferences select: [:chld | chld metaData isLink not]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> internalSchemata [
	^ self metaData internalSchemata
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> isChangeable [ 
	^true
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> isCopyable [ 
	^ true
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> isMetaSchemaInstanceReference [
	^ self owner = TamManager platypusMetaDefaultTaxon
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> isMoveable [
	^ true
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> isSchemaInstanceReference [
	^ true
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> keyStroke: aCharacter from: aListMorph [ 
	super keyStroke: aCharacter from: aListMorph.
	aCharacter = $n
		ifTrue: [^ self menuNewSchema].
	aCharacter = $m
		ifTrue: [^ self storeAsMetaData].

]

{ #category : #'drag and drop' }
PlatypusSchemaInstanceReference >> linkListItemHereFromTransfertMorph: aTransfertMorph [ 
	self insertLinkReferenceFrom: aTransfertMorph passenger
]

{ #category : #'sublists handling' }
PlatypusSchemaInstanceReference >> linksReferences [
	^ self subReferencesOfKind: PlatypusSchemaLinkReference
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> lookUpIdentifierBN: anIdent [ 
	^ self metaData lookUpIdentifierBN: anIdent 
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> lookUpNamedTypeBN: anIdent [ 
	^ self metaData lookUpNamedTypeBN: anIdent
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> masterModelAsStepStream [
	^ self schemaInstance masterModelAsStepStream
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuCopyAs [
	| parsingResult key newRef code |
	key := UIManager default request: 'internal key ' initialAnswer: self shortName.
	key > ''
		ifTrue: [newRef := self class schemaInstanceNamed: self name.
			code := self codeString.
			parsingResult := self expressParserClass parseStream: code readStream owner: self metaData.
			newRef updateWithParserResult: parsingResult.
			self owner insertReference: newRef]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuForceTranslaterPrefix [
	(UIManager default request: 'class and system category prefix ?' initialAnswer: self metaData translaterClassPrefix)
		ifNotNil: [:prefix | self metaData schemaInstance namesBuilderPrefixedBy: prefix trimBoth] 
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuMetaDataToStepFile [
	| result |
	result := UITheme current 
		fileSaveIn: World
		title: 'Meta data file name'
		extensions: #('step')
		path: ''.
	result ifNotNil: [[self metaDataToStream: result] ensure: [result close]]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuNewModelContents [
	self newModelContents
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuNewSchema [
	| key parsingResult source |
	(key := UIManager default  request: 'Schema name?' initialAnswer: '')
		ifNotEmpty: [:e | 
			source := ('schema ' , key , ';\\end_schema;') withCRs.
			parsingResult := self expressParserClass
						parse: source
						startingAt: self expressParserClass startingStateForSchemaEntry
						owner: self metaData
						onError: [:aString :position | position].
			self updateWithParserResult: parsingResult.
			self treeHasChanged]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuSetTranslaterClassPrefix [
	(UIManager default request: 'Translated class prefix?' initialAnswer: self metaData translaterClassPrefix)
		ifNotNil: [:prefix | self metaData translaterClassPrefix: prefix trimBoth] 
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuSetTranslaterRootClassName [
	| name |
	(name := UIManager default request: 'Translated root class name?'
				initialAnswer: self metaData translaterRootClassName) 
			ifNotEmpty: [:e | self metaData translaterRootClassName: name trimBoth]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuSetTranslaterRootClassSystemCategory [
	| name |
	(name := UIManager default request: 'Translated root class system category?'
				initialAnswer: self metaData translaterRootClassSystemCategory) 
			ifNotEmpty: [:e | self metaData translaterRootClassSystemCategory: name trimBoth]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> menuSetTranslaterSystemCategoryPrefix [
	| prefix |
	(prefix := UIManager default request: 'Translated system categories prefix?'
				initialAnswer: self metaData translaterSystemCategoryPrefix) 
			ifNotEmpty: [:e | self metaData translaterSystemCategoryPrefix: prefix trimBoth]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> metaData [
	^ self schemaInstance
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> metaDataStream [
	^ self metaData metaDataStream
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> metaDataToStepFile: aFileName [ 
	self metaData metaDataToStepFile: aFileName
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> metaDataToStream: aStream [ 
	self metaData metaDataToStream: aStream
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> modelContentsReferences [
	^ modelContentsReferences
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> modelContentsReferences: aCollection [
	modelContentsReferences := aCollection
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> moveDownReference: aReference [ 
	^ aReference moveDown
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> moveDownSchemaReference: aReference [ 
	| index |
	index := self subReferences indexOf: aReference.
	index < self subReferences size
		ifTrue: [self subReferences swap: index with: index + 1.
			TamManager changed: self.
			^ true].
	^ false
]

{ #category : #'drag and drop' }
PlatypusSchemaInstanceReference >> moveListItemHereFromTransfertMorph: aTransfertMorph [ 
	(self copyListItemHereFromTransfertMorph: aTransfertMorph)
		ifTrue: [aTransfertMorph passenger remove.
			^ true].
	^ false
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> moveUpReference: aReference [ 
	| |
	^ aReference moveUp

]

{ #category : #updating }
PlatypusSchemaInstanceReference >> moveUpSchemaReference: aReference [ 
	| index |
	index := self subReferences indexOf: aReference.
	index > 1
		ifTrue: [self subReferences swap: index with: index - 1.
			TamManager changed: self.
			^ true].
	^ false
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> name [
	^ schemaInstance name
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> newModelContents [
	| modelContents newRef |
	modelContents := PltModelContents new owner: self schemaInstance.
	newRef := PlatypusModelContentsReference new modelContents: modelContents.
	^ self addModelContentsReference: newRef
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> platypusInternalMetaSchemaInstanceReference [
	^ PlatypusInternalMetaSchemaInstanceReference expressMetaDictionary
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> promote: aMetaModelSchemaInstanceReference [ 
	aMetaModelSchemaInstanceReference storeAsMetaDataOf: self
]

{ #category : #enumerating }
PlatypusSchemaInstanceReference >> recursivelyDo: aBlock [
	super recursivelyDo: aBlock.
	self modelContentsReferences do: [:mcr |
		mcr recursivelyDo: aBlock]
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> relabelWith: newName [ 
	| metaData |
	metaData := self metaData.
	metaData renameWith: newName.
	self treeHasChanged
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> removeAllModelContents [
	self removeAllModelContentsOf: self modelContentsReferences 

]

{ #category : #updating }
PlatypusSchemaInstanceReference >> removeAllModelContentsOf: aListOfModelContentsRef [ 
	| modelContents |
	aListOfModelContentsRef
		do: [:modelContentsRef | 
			modelContents := modelContentsRef modelContents.
			modelContents
				ifNotNil: [modelContents removeFromOwner].
			self modelContentsReferences
				ifNotNil: [self modelContentsReferences remove: modelContentsRef ifAbsent: []].
			modelContentsRef destroy.
			modelContents
				ifNotNil: [modelContents deepDestroy]]
]

{ #category : #updating }
PlatypusSchemaInstanceReference >> removeSilently [
	self logToChangesRemoving: self oldCodeText: self codeText.
	super removeSilently
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> replaceMetaDataWith: aMetaData [
	| keptName keptExternalLinks keptModelContentsReferences |
	keptModelContentsReferences := self modelContentsReferences.
	self modelContentsReferences: OrderedCollection new.
	keptName := self metaData name.
	keptExternalLinks := self metaData externalSchemaLinks.
	self metaData fastSetAssociatedModels: nil.
	self metaData deepDestroy.
	self metaData stepInitialize.
	self metaData name: keptName.
	keptModelContentsReferences
		do: [:ref | self addModelContentsReferenceSilently: ref].
	aMetaData moveInto: self metaData.
	self metaData externalSchemaLinks: keptExternalLinks.
	self metaData tamarisItemRef: self
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> rootSourceHandler [
	^ self 
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> schemaInstance [
	^ schemaInstance
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> schemaInstance: anObject [ 
	schemaInstance := anObject.
	self accept: '' notifying: nil
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> schemaInstanceReference [
	^ self
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> schemaReferences [
	^ self children select: [:chld | chld isLink not and: [chld isSchemaReference]]
]

{ #category : #'sublists handling' }
PlatypusSchemaInstanceReference >> schemataReferences [
	^ self subReferencesOfKind: PlatypusSchemaReference
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> shortName [
	| mdt |
	^ (mdt := self metaData) ifNil: ['???'] ifNotNil: [mdt name]

]

{ #category : #'sublists handling' }
PlatypusSchemaInstanceReference >> showSubLists [
	^  super showSubLists
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> showsUsersAsToBeChecked [
	self allUsers
		do: [:u | u emphasisModel: TamListItemMorphEmphasisModel boldRedStandard]
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> smaCCStartingState [
	^ self expressParserClass startingStateForSchemaInstanceEntry
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> specificMenu: menu shifted: b [ 
	| menuExpress arr |
	super specificMenu: menu shifted: b.
	menu addLine.
	menuExpress := MenuMorph new.
	arr := #(#- #('new schema (n)' #menuNewSchema) #('copy as...' #menuCopyAs) #- #('save... (s)' #menuSave) #('save as... (S)' #menuSaveAs) #- #('code pane (p)' #menuCodePane) #- #('clean all evaluation results' #menuCleanAllEvaluations ) #- #('new model contents' #menuNewModelContents) #- #('write meta-data to file' #menuMetaDataToStepFile) #('promote (m)' #storeAsMetaData) #('checks meta data' #checksMetaDataAndExplore) #- ) asOrderedCollection.
	self isMetaSchemaInstanceReference
		ifFalse: [arr addAll: #(#- #('force translater prefix' #menuForceTranslaterPrefix) #- #('set translater class prefix' #menuSetTranslaterClassPrefix) #('set translater system categories prefix' #menuSetTranslaterSystemCategoryPrefix) #('set translater root class name' #menuSetTranslaterRootClassName) #('set translater root class system category' #menuSetTranslaterRootClassSystemCategory) #- )].
	arr addAll: #(#('translate here (t)' #menuTranslate2Pharo)  #('translate and compile (T)' #translateAndFileItIn) #- #('translate to VisualWorks' #menuTranslate2VisualWorks) ).
	arr
		do: [:item | item == #-
				ifTrue: [menuExpress addLine]
				ifFalse: [menuExpress
						add: item first
						target: self
						selector: item second]].
	menu
		add: 'express ...'
		target: self
		selector: nil
		argumentList: #().
	menu lastItem subMenu: menuExpress.

	^ menu
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> startNode [
	^ self tokenList first
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> startNode: aNode [ 
	^ self
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> stopNode [
	^ self tokenList last
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> stopNode: aNode [
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> storeAsMetaData [
	Cursor wait
		showWhile: [self class
				chooseExpressTranslaterForClient: nil
				selectingBlock: [:hierarList :chosen | 
					hierarList close.
					chosen promote: self]]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> storeAsMetaDataHere [
	Cursor wait
		showWhile: [self storeAsMetaDataOf: self]
]

{ #category : #menus }
PlatypusSchemaInstanceReference >> storeAsMetaDataOf: aMetaModelSchemaInstanceReference [ 
	| newModelContents |
	aMetaModelSchemaInstanceReference removeAllModelContents.
	newModelContents := aMetaModelSchemaInstanceReference newModelContents.
	newModelContents parseMetaStepStream: self metaDataStream.
	newModelContents resolvesMetaConceptDefinitions.
	newModelContents resolvesMetaMappingDefinitions.
	aMetaModelSchemaInstanceReference verifySilently
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> subElementSymbols [
	^ Array with: PlatypusSchemaReference lexicalElement
]

{ #category : #'sublists handling' }
PlatypusSchemaInstanceReference >> subListsDefsArray [
	"return an array of array. Each element array is for one sublist and 
	contains first a selector for sublist accessing and second a label
	for the sublist"
	| subs |
	subs := OrderedCollection new.
	subs addAll: super subListsDefsArray.
	subs addAll: #(#(#linksReferences #externals) ).
	^ subs
]

{ #category : #'sublists handling' }
PlatypusSchemaInstanceReference >> subListsReferenceClassName [
	^ #PlatypusExpressSubListReference
]

{ #category : #'code updating' }
PlatypusSchemaInstanceReference >> subReferencesScanStart [
	^ self startNode
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> tokenList [
	^ tokenList
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> tokenList: aTokenList [
	tokenList := aTokenList
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> translaterForPharo [
	^ PlatypusToPharoTranslater new
]

{ #category : #accessing }
PlatypusSchemaInstanceReference >> translaterForVisualWorks [
	^ PlatypusToVisualWorksTranslater new
]

{ #category : #testing }
PlatypusSchemaInstanceReference >> usePlatypusPrimitiveSchema [
	^ self metaData notNil
			and: [self metaData usePlatypusPrimitiveSchema]
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> usersInto: aSet [ 
	| locals |
	(aSet includes: self) ifTrue: [ ^aSet ].
	self schemaInstance ifNil: [ ^aSet ]. 
	locals := PlatypusSchemaInstanceReference allSchemaInstancesReferences
		select: [:schir | schir schemaInstance notNil 
			and: [(schir schemaInstance externalSchemata
				intersection: self schemaInstance internalSchemata) notEmpty]].
	aSet addAll: locals.
	locals do: [:u | u usersInto: aSet].
	^ aSet
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> usesSchemataOf: otherSchemaInstanceReference [ 
	^ (self  schemaInstance externalSchemataNames intersection: otherSchemaInstanceReference schemaInstance internalSchemataNames) notEmpty
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> verifyModelContentsNotifying: aRequestor [
	self modelContentsReferences 
		do: [:mcr | 
			mcr removeSubReferencesSilently.
			mcr verifyNotifying: aRequestor].

]

{ #category : #checking }
PlatypusSchemaInstanceReference >> verifyModelContentsSilently [
	self modelContentsReferences 
		do: [:mcr | 
			mcr removeSubReferencesSilently.
			mcr verifySilently].

]

{ #category : #checking }
PlatypusSchemaInstanceReference >> verifyNotifying: aRequestor [
	| r |
	r := self schemaInstance verifyNotifying: aRequestor.
	self verifyModelContentsNotifying: aRequestor.
	^ r
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> verifySilently [
	| r |
	r := self schemaInstance verifySilently.
	self verifyModelContentsSilently.
	^ r
]

{ #category : #checking }
PlatypusSchemaInstanceReference >> verifyUsedModelsBeforeChecking [
	| invalidRefsStr |
	(self externalSchemaInstancesReferences
		select: [:ext | ext knownAsInvalid])
		ifNotEmpty: [:invalidRefs | 
			invalidRefsStr := String cr.
			invalidRefs
				do: [:ir | invalidRefsStr := invalidRefsStr , ('"' , ir name , '"' , String cr)].
			self inform: 'You must check following models before.' , String cr , invalidRefsStr , String cr.
			^ true].
	^ true
]
