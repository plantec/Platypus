Class {
	#name : #PlatypusStepReference,
	#superclass : #PlatypusListItemReference,
	#instVars : [
		'pos',
		'subReferences',
		'attrOrRuleOrValue'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'instance creation' }
PlatypusStepReference class >> owner: anotherRef position: anInteger [ 
	^ self
		owner: anotherRef
		position: anInteger
		attributeOrRule: nil
]

{ #category : #'instance creation' }
PlatypusStepReference class >> owner: anotherRef position: aPosition attributeOrRule: anAttribute [ 
	^ self new
		owner: anotherRef
		position: aPosition
		attributeOrRule: anAttribute
]

{ #category : #'instance creation' }
PlatypusStepReference class >> owner: anotherRef position: aPosition value: aValue [ 
	^ self new
		owner: anotherRef
		position: aPosition
		value: aValue

]

{ #category : #updating }
PlatypusStepReference >> accept: input notifying: aRequestor [ 
	| result stream instancier folder |
	self isChangeable 
		ifFalse: [^ false ].
	stream := ReadStream on: input.
	result := StepParser
				parseStream: stream
				startingAt: self parserStartingState
				onError: [:aString :position | 
					aRequestor notNil
						ifTrue: [aRequestor notify: aString at: position].
					^ nil].
	result ifNil: [^ false].
	instancier := PlatypusRepositoryBuilder new.
	instancier modelContents: self modelContents.
	folder := self modelContentsReference folder.
	result isPltGenericInstance
		ifTrue: [folder replace: (folder instanceAt: result id) with: result].
	instancier folder: folder.
	result := instancier doSingleToken: result.
	self modelContents changeDate: DateAndTime now asString.
	result := self replaceTokenListWithParserResult: result.
	self verifySilently.
	TamManager changed: self.
	^result
]

{ #category : #updating }
PlatypusStepReference >> addAllSubReferences: aListOfReference [
	aListOfReference
		ifNotEmpty: [
			self privateEnsureSubReferences.
			subReferences addAll: aListOfReference]
]

{ #category : #updating }
PlatypusStepReference >> addSubReference: aReference [
	self privateEnsureSubReferences.
	subReferences add: aReference
]

{ #category : #accessing }
PlatypusStepReference >> at: position [
	| v |
	^ (v := self value) 
		ifMissing: [v] 
		ifNotMissing: [v at: position]
]

{ #category : #accessing }
PlatypusStepReference >> at: position put: newValue [ 
	self value at: position put: newValue.

]

{ #category : #accessing }
PlatypusStepReference >> attrOrRuleOrValue [
	^ attrOrRuleOrValue 
]

{ #category : #accessing }
PlatypusStepReference >> attrOrRuleOrValue: anAttributeOrWhereRuleOrValue [
	attrOrRuleOrValue := anAttributeOrWhereRuleOrValue
]

{ #category : #updating }
PlatypusStepReference >> buildSubReferencesSilently [
	self subReferences: (self value ifNil: [#()] ifNotNil: [:v | v tamarisChildrenIntoOwner: self])
]

{ #category : #testing }
PlatypusStepReference >> canEvaluate [
	attrOrRuleOrValue 
		ifNotNil: [
			^ attrOrRuleOrValue isPltWhereRule 
				or: [attrOrRuleOrValue isPltDerivedAttribute
					or: [attrOrRuleOrValue isPltInverseAttribute]]].
	^ false
			
]

{ #category : #accessing }
PlatypusStepReference >> children [
	^ self subReferences
	
]

{ #category : #accessing }
PlatypusStepReference >> codeText [
	^  self codeText: self useP21Syntax
]

{ #category : #accessing }
PlatypusStepReference >> codeText: p21Syntax [ 
	| val |
	self isReleased
		ifTrue: [^ ''].
	val := self value.
	val ifNil: [^ 'NIL'].
	val isPltValue
		ifTrue: [
			^ String streamContents: [:strm |
				PlatypusModelContentsStepWriter new
					stream: strm
					modelContents: self modelContents
					values: (Array with: val)
					p21Syntax: p21Syntax]]
		ifFalse: [^ val prettyPrintedExpressCode]
]

{ #category : #accessing }
PlatypusStepReference >> editorClass [
	^ PlatypusInstanceEditor
]

{ #category : #accessing }
PlatypusStepReference >> elementTag [
	self value isPltGenericInstance 
		ifTrue: [^ #dataEntity].
	^ #parameter
]

{ #category : #updating }
PlatypusStepReference >> evaluate [
	self canEvaluate ifFalse: [^ self ].
	self knownAsInvalid
		ifTrue: [self inform: 'Express model must checked']
		ifFalse: [Cursor wait
				showWhile: [| result int | 
					int := PlatypusExpressInterpretor new.
					self modelContents ifNotNil: [:mc | 
						mc recordComputedInstances
							ifTrue: [int modelContents: self modelContents]].
					 (result := int attributeOrRule: attrOrRuleOrValue instance: self owner value interpretingContext)
						ifNotNil: [
							self addSubReference:
								(result tamarisStepValueReferenceClass
										owner: self
										position: self subReferences size + 1
										value: result).
							TamManager changed: self]]]
]

{ #category : #testing }
PlatypusStepReference >> hasContents [
	^ subReferences notNil and: [subReferences notEmpty]
]

{ #category : #testing }
PlatypusStepReference >> hasSubReferences [
	^ subReferences notNil 
]

{ #category : #accessing }
PlatypusStepReference >> icon [
	attrOrRuleOrValue 
		ifNotNil: [
			attrOrRuleOrValue isPltWhereRule 
				ifTrue: [^ TamIcons mimeIcon: '10x10/mimetypes/where_rule'].
			attrOrRuleOrValue isPltExplicitAttribute  
				ifTrue: [^ TamIcons mimeIcon: '10x10/mimetypes/explicit_attribute'].
			attrOrRuleOrValue isPltInverseAttribute
				ifTrue: [^ TamIcons mimeIcon: '10x10/mimetypes/inverse_attribute'].
			attrOrRuleOrValue isPltDerivedAttribute
				ifTrue: [^ TamIcons mimeIcon: '10x10/mimetypes/derived_attribute']].
	^ TamIcons mimeIcon: '10x10/mimetypes/step_value'
]

{ #category : #testing }
PlatypusStepReference >> isChangeable [
	(self owner isKindOf: PlatypusStepReference)
		ifFalse: [^false ].
	attrOrRuleOrValue 
		ifNotNil: [ 
			^ attrOrRuleOrValue isPltExplicitAttribute].
	self value isPltGenericInstance 
		ifTrue: [^true].
	self parentsChain 
		reverseDo: [:p | 
			(p isKindOf: PlatypusListItemReference)
				ifTrue: [p isChangeable
							ifFalse: [^false ]]
				ifFalse: [^ true ]].
	^ true
]

{ #category : #testing }
PlatypusStepReference >> isModelContentsReference [
	^ false
]

{ #category : #testing }
PlatypusStepReference >> isPltValue [
	^ attrOrRuleOrValue notNil
		and: [attrOrRuleOrValue isPltValue]
]

{ #category : #testing }
PlatypusStepReference >> isRemoveable [
	^ attrOrRuleOrValue isNil
]

{ #category : #'file in/out' }
PlatypusStepReference >> menuStepWrite [
	| stream fullFilename result |
	fullFilename := UITheme current
				fileSaveIn: World
				title: 'File name'
				extensions: #('step' )
				path: ''.
	fullFilename
		ifNotNil: [[stream := (Filename named: fullFilename) writeStream.
			result := self stepWriteIntoStream: stream]
				ensure: [stream close]].
	^ result	

]

{ #category : #accessing }
PlatypusStepReference >> metaData [
	^ self value

]

{ #category : #accessing }
PlatypusStepReference >> modelContents [
	^ self modelContentsReference ifNotNil: [:mdr | mdr  modelContents]
]

{ #category : #accessing }
PlatypusStepReference >> modelContentsReference [
	^ self owner modelContentsReference
]

{ #category : #accessing }
PlatypusStepReference >> newEditor [
	| editor |
	editor := self editorClass new.
	editor buildTamarisWindow.
	editor sourceHandler: self.
	editor messagesBrowser
		ifNotNil: [editor updateMessagesBrowser].
	^ editor mainWindow
]

{ #category : #updating }
PlatypusStepReference >> owner: anotherRef position: anInteger [ 
	self
		owner: anotherRef
		position: anInteger
		attributeOrRule: nil
]

{ #category : #updating }
PlatypusStepReference >> owner: anotherRef position: anInteger attributeOrRule: anAttributeOrARule [ 
	self owner: anotherRef.
	self pos: anInteger.
	self attrOrRuleOrValue: anAttributeOrARule.

]

{ #category : #updating }
PlatypusStepReference >> owner: anotherRef position: anInteger value: aValue [ 
	self owner: anotherRef;
		 pos: anInteger;
		 attrOrRuleOrValue: aValue.

]

{ #category : #accessing }
PlatypusStepReference >> owningInstanceReference [
	self value isPltGenericInstance
		ifTrue: [^ self].
	^ self owner 
		ifNotNil: [ :o | o owningInstanceReference]

]

{ #category : #accessing }
PlatypusStepReference >> owningInstanceReferenceOfValue: aValue [
	self value = aValue
		ifTrue: [^ self].
	^ self owner 
		ifNotNil: [ :o | o owningInstanceReferenceOfValue: aValue]
]

{ #category : #accessing }
PlatypusStepReference >> parserStartingState [
	^ self value isPltGenericInstance 
		ifTrue: [StepParser startingStateForDataEntity]
		ifFalse: [StepParser startingStateForParameter]
]

{ #category : #accessing }
PlatypusStepReference >> pos [
	^ pos
]

{ #category : #accessing }
PlatypusStepReference >> pos: anObject [ 
	pos := anObject
]

{ #category : #updating }
PlatypusStepReference >> privateEnsureSubReferences [
	subReferences ifNil: [subReferences := OrderedCollection new].

]

{ #category : #updating }
PlatypusStepReference >> reinitializeEditor [
	self removeSubReferencesSilently.
	self reinitializeLabelSilently.
	super reinitializeEditor
]

{ #category : #updating }
PlatypusStepReference >> reinitializeLabel [
	self reinitializeLabelSilently.
	TamManager changed: self
]

{ #category : #updating }
PlatypusStepReference >> reinitializeLabelSilently [
	listLabel := nil.

]

{ #category : #updating }
PlatypusStepReference >> removeAt: position [ 
	| sr |
	subReferences ifNil: [^ self].
	(self subReferences removeAt: position) destroy.
	position
		to: subReferences size
		do: [:p | (sr := subReferences at: p) pos: sr pos - 1].

]

{ #category : #updating }
PlatypusStepReference >> removeSilently [
	pos
		ifNotNil: [(self owner removeAt: pos) ].
	^ super removeSilently
]

{ #category : #updating }
PlatypusStepReference >> removeSubReferences [
	subReferences
		ifNotNil: [self removeSubReferencesSilently.
			TamManager changed: self]
]

{ #category : #updating }
PlatypusStepReference >> removeSubReferencesSilently [
	subReferences
		ifNotNil: [
			subReferences
				do: [:instRef | instRef destroy].
			subReferences := nil]
]

{ #category : #updating }
PlatypusStepReference >> replace: aValue at: aPosition with: aNewValue [
	(self value isPltSetInstance or: [self value isPltBagInstance])
		ifTrue: [self value replace: aValue with: aNewValue]
		ifFalse: [self value at: aPosition put: aNewValue].
	self buildSubReferencesSilently 

]

{ #category : #updating }
PlatypusStepReference >> replaceTokenListWithParserResult: result [ 
	result
		ifNotNil: [ | inst |
			inst := self value.
			inst isPltGenericInstance 
				ifTrue: [
					[result inheritedDefinitions] on: Error do: [ ^ false ].
					self modelContentsReference replace: inst with: result.
					self owner value isPltDerivedAttribute 
						ifTrue: [self owner buildSubReferencesSilently]]
				ifFalse: [
					result isPltSimpleRecord 
						ifTrue: [[result inheritedDefinitions] on: Error do: [ ^ false ]].
					self owner replace: inst at: pos with: result].
			self updateAllReferences.
			self  verifySilently.
			^ true].
	^ false
]

{ #category : #'tam taxonomy browser' }
PlatypusStepReference >> selectingFrom: aTaxonomyBrowser [
	subReferences
		ifNil: [self buildSubReferencesSilently].
	super selectingFrom: aTaxonomyBrowser
]

{ #category : #accessing }
PlatypusStepReference >> shortName [
	attrOrRuleOrValue 
		ifNil: [^ self codeText asString contractTo: 100].
	attrOrRuleOrValue isPltWhereRule 
		ifTrue: [
			attrOrRuleOrValue label
				ifNotNil: [^ attrOrRuleOrValue label].
			^ 'rule #' , pos printString].
	^ (attrOrRuleOrValue isPltExplicitAttribute 
		ifTrue: [attrOrRuleOrValue name, ': ', self codeText, ' : ', attrOrRuleOrValue annotation]
		ifFalse: [self codeText]) withoutCr contractTo: 100

]

{ #category : #accessing }
PlatypusStepReference >> specificButtonsColumn: aTaxonomyBrowser inAlignment: aButtonsAlignment [ 
	aTaxonomyBrowser editorModel addButtonsinAlignment: aButtonsAlignment.
	^aButtonsAlignment
]

{ #category : #menus }
PlatypusStepReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring 
	the #shifted boolean"
	super specificMenu: menu shifted: b.
	menu
				add: 'code pane (p)'
				target: self
				selector: #menuCodePane.
	self canEvaluate
		ifTrue: [menu addLine.
			menu
				add: 'evaluate'
				target: self
				selector: #evaluate.
			menu addLine].
	^ menu
]

{ #category : #accessing }
PlatypusStepReference >> subReferences [
	^ subReferences
		ifNil: [OrderedCollection new]
]

{ #category : #accessing }
PlatypusStepReference >> subReferences: aCollection [
	aCollection 
		ifNotEmpty: [subReferences := aCollection]
		ifEmpty: [self removeSubReferencesSilently]
]

{ #category : #updating }
PlatypusStepReference >> updateAllReferences [
	| owningIRef owningInst |
	owningIRef := self owningInstanceReference.
	owningInst := owningIRef value.
	self modelContentsReference   
		recursivelyDo: [:ref |
			owningInst = ref value
				ifTrue: [ref updateRecursively]].
	self modelContentsReference reinitializeLabelSilently.
	self modelContentsReference updateEditor.
	TamManager changed: self modelContentsReference
]

{ #category : #updating }
PlatypusStepReference >> updateListLabel [
	listLabel := self shortName
]

{ #category : #updating }
PlatypusStepReference >> updateRecursively [
	self recursivelyDo: [:r | | d v |
		[
			r reinitializeLabelSilently.
			v := r value.
			v isPltMissingValue
				ifTrue: [r removeSubReferencesSilently]
				ifFalse: [
					r hasSubReferences 
						ifTrue: [
							d := v computedDomain.
							d isPltListType
								ifTrue: [ r buildSubReferencesSilently]]]
		]
			on: SubscriptOutOfBounds
			do: [r owner removeSubReferencesSilently]]
]

{ #category : #accessing }
PlatypusStepReference >> useP21Syntax [
	^ self modelContentsReference useP21Syntax
]

{ #category : #accessing }
PlatypusStepReference >> useP21Syntax: anObject [ 
	self modelContentsReference useP21Syntax: anObject 
]

{ #category : #accessing }
PlatypusStepReference >> value [
	^ self isPltValue
		ifTrue: [attrOrRuleOrValue]
		ifFalse: [[self owner at: pos] on: Error do: []]
]

{ #category : #accessing }
PlatypusStepReference >> value: aValue [
	attrOrRuleOrValue := aValue

]

{ #category : #checking }
PlatypusStepReference >> verifyNotifying: aRequestor [
	^ self modelContents verifyNotifying: aRequestor

]

{ #category : #checking }
PlatypusStepReference >> verifySilently [
	^ self modelContents verifySilently

]

{ #category : #'file in/out' }
PlatypusStepReference >> writeIntoStream: aStream [ 
	| code |
	code := self codeText asString.
	aStream nextPutAll: code.
	aStream flush
]
