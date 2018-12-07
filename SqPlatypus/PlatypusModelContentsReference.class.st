Class {
	#name : #PlatypusModelContentsReference,
	#superclass : #PlatypusStepReference,
	#instVars : [
		'useP21Syntax',
		'modelContents',
		'folder',
		'newLabelCounter',
		'dataInstances'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #menus }
PlatypusModelContentsReference class >> addPlatypusModelContentsFromFilenamed: aFilename [ 
	PlatypusSchemaInstanceReference
		chooseSchemaInstanceForClient: nil
		selectingBlock: [:hierarList :chosen | 
			hierarList close.
			chosen newModelContents  listLabel: aFilename; stepFileIn: aFilename]
]

{ #category : #menus }
PlatypusModelContentsReference class >> canBeCreatedInteractively [
	^ false
]

{ #category : #accessing }
PlatypusModelContentsReference class >> externalLabel [
	^ 'a STEP model content'
]

{ #category : #menus }
PlatypusModelContentsReference class >> menuAddReferenceIntoOwner: aReference [ 
	| key oldDict |
	key := UIManager default request: 'schema instance name' initialAnswer: ''.
	key notEmpty
		ifTrue: [oldDict := aReference taxonomyRoot
						findDeeplySuchThat: [:r | (r isKindOf: PlatypusSchemaInstanceReference)
								and: [r  schemaInstance name asUppercase = key asUppercase]].
			oldDict
				ifNotNil: [oldDict menuNewModelContents]]
]

{ #category : #menus }
PlatypusModelContentsReference class >> subMenuLabel [
	^ 'STEP/EXPRESS'
]

{ #category : #updating }
PlatypusModelContentsReference >> accept: input notifying: aRequestor [ 
	| stream |
	stream := ReadStream on: input.
	self
		parseStepStream: stream
		onError: [:d :l | 
			aRequestor
				ifNil: [self notify: d at: l]
				ifNotNil: [aRequestor notify: d at: l].
			^ false].
	^ true

]

{ #category : #accessing }
PlatypusModelContentsReference >> accessibleSchemata [
	^self modelContents schemata
]

{ #category : #accessing }
PlatypusModelContentsReference >> at: position [
	^self dataInstances at: position
]

{ #category : #accessing }
PlatypusModelContentsReference >> buildDataInstancesIndexes [
	^ self modelContents buildDataInstancesIndexes
]

{ #category : #accessing }
PlatypusModelContentsReference >> codeText: p21Syntax [ 
	| stream |
	Cursor wait
		showWhile: [
			^ String streamContents: [:strm |
				PlatypusModelContentsStepWriter new
				stream: strm
				modelContents: self modelContents
				values: self modelContents sortedDataInstances 
				p21Syntax: p21Syntax]].

]

{ #category : #copying }
PlatypusModelContentsReference >> copyInside: aSchemaInstanceReference [ 
	| cpy refCpy tmpFileName tmpStream |
	cpy := PltModelContents new owner: aSchemaInstanceReference schemaInstance.
	refCpy := self class new modelContents: cpy.
	aSchemaInstanceReference addModelContentsReference: refCpy.
	tmpFileName := 'platypus_tmp.step' asFileReference asAbsolute.
	tmpFileName ensureDeleted.
	[tmpStream := tmpFileName writeStream.
	self stepWriteIntoStream: tmpStream]
		ensure: [tmpStream close].
	refCpy stepFileIn: tmpFileName pathString.
	tmpFileName ensureDeleted.
	refCpy checks.
	^ refCpy
]

{ #category : #accessing }
PlatypusModelContentsReference >> dataInstances [
	self modelContents dataInstances 
		ifNil: [^ dataInstances := OrderedCollection new ].
	^ dataInstances ifNil: [dataInstances := self modelContents sortedDataInstances asOrderedCollection]
]

{ #category : #'initialize/release' }
PlatypusModelContentsReference >> destroy [
	modelContents := nil.
	dataInstances := nil.
	super destroy
]

{ #category : #enumerating }
PlatypusModelContentsReference >> do: aBlock [
	self subReferences ifNil: [^self ].
	self subReferences do: aBlock
]

{ #category : #checking }
PlatypusModelContentsReference >> doInternalChecking [
	super doInternalChecking.
	self assert: self metaData owner = self owner metaData
]

{ #category : #accessing }
PlatypusModelContentsReference >> elementTag [
	^ #dataEntities
]

{ #category : #accessing }
PlatypusModelContentsReference >> folder [
	^ folder
]

{ #category : #testing }
PlatypusModelContentsReference >> haveMetaConceptDefinitions [
	^ self modelContents notNil and: [self modelContents haveMetaConceptDefinitions]
]

{ #category : #accessing }
PlatypusModelContentsReference >> headerInstances [
	^ self modelContents headerInstances
]

{ #category : #accessing }
PlatypusModelContentsReference >> headerInstances: aCollection [ 
	self modelContents headerInstances: aCollection
]

{ #category : #accessing }
PlatypusModelContentsReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/blue_file'
]

{ #category : #testing }
PlatypusModelContentsReference >> isChangeable [
	^ true
]

{ #category : #testing }
PlatypusModelContentsReference >> isCopyable [
	^ false
]

{ #category : #testing }
PlatypusModelContentsReference >> isModelContentsReference [
	^ true
]

{ #category : #testing }
PlatypusModelContentsReference >> isPltValue [
	^ false
]

{ #category : #testing }
PlatypusModelContentsReference >> isRemoveable [
	^ true
]

{ #category : #testing }
PlatypusModelContentsReference >> isSchemaReference [ 
^ false
]

{ #category : #menus }
PlatypusModelContentsReference >> menuDoNotRecordComputedInstances [
	self recordComputedInstances: false
]

{ #category : #menus }
PlatypusModelContentsReference >> menuParseStepFile [
	| result |
	(result := UIManager default
		chooseFullFileNameMatching: nil
		label: 'Choose a STEP file')
		ifNotNil: [self stepFileIn: result.
			self listLabel: result name.
			TamManager changed: self.
			].
	^ false
]

{ #category : #menus }
PlatypusModelContentsReference >> menuRecordComputedInstances [
	self recordComputedInstances: true
]

{ #category : #menus }
PlatypusModelContentsReference >> menuStepWrite [
	| stream result  |
	stream := UITheme current 
		fileSaveIn: World
		title: 'File name'
		extensions: #('step')
		path: ''.
	stream
		ifNotNil: [
			[result := self stepWriteIntoStream: stream useP21Syntax: useP21Syntax]
				ensure: [stream close].
			self listLabel: stream name.
			TamManager changed: self].
	^ result
]

{ #category : #accessing }
PlatypusModelContentsReference >> metaData [
	^ self modelContents
]

{ #category : #accessing }
PlatypusModelContentsReference >> modelContents [
	^ modelContents
]

{ #category : #accessing }
PlatypusModelContentsReference >> modelContents: aModelContents [
	modelContents := aModelContents
]

{ #category : #accessing }
PlatypusModelContentsReference >> modelContentsReference [
	^ self
]

{ #category : #accessing }
PlatypusModelContentsReference >> newLabelCounter [
	^ newLabelCounter ifNil: [newLabelCounter := self modelContents dataInstances size]
]

{ #category : #accessing }
PlatypusModelContentsReference >> newPersistentLabel [
	newLabelCounter := self modelContents newPersistentLabelFrom: self newLabelCounter + 1.
	^ newLabelCounter asString
]

{ #category : #updating }
PlatypusModelContentsReference >> notify: error at: location in: stream [ 
	| window model |
	window := self newEditor.
	model := window model.
	model sourceHandlerSilently: self contents: stream contents.
	model notify: error at: location.
	window openInWorld
]

{ #category : #updating }
PlatypusModelContentsReference >> parseMetaStepStream: aStream [ 
	self
		parseMetaStepStream: aStream
		onError: [:d :l | 
			self
				notify: d
				at: l
				in: aStream.
			^ false].
	^ true
]

{ #category : #updating }
PlatypusModelContentsReference >> parseMetaStepStream: aStream onError: aBlock [ 
	self parseStepStream: aStream onError: aBlock.

]

{ #category : #updating }
PlatypusModelContentsReference >> parseStepStream: aStream [ 
	^ self 
		parseStepStream: aStream 
		onError:  [:d :l | 
			self
				notify: d
				at: l
				in: aStream].

]

{ #category : #updating }
PlatypusModelContentsReference >> parseStepStream: aStream onError: aBlock [ 
	|  instancier rder f |
	Cursor read 
		showWhile: [ | result |
			f := StepGenericRepository new.
			(aStream contents beginsWith: 'ISO-10303-21')
				ifTrue: [rder := #parseStream:onError:]
				ifFalse: [rder := #parseDataStream:onError:].
			f 
				perform: rder 
				with: aStream 
				with: [:d :l | aBlock value: d value: l. ^ nil].
			self modelContents removeAll.
			instancier := PlatypusRepositoryBuilder 
				folder: f 
				modelContents: self modelContents.
			instancier doFolder.
			dataInstances := nil.
			self buildDataInstancesIndexes.
			self modelContents changeDate: DateAndTime now asString.
			self buildSubReferencesSilently.
			result := self verifySilently.
			TamManager changed: self.
			^result]
]

{ #category : #accessing }
PlatypusModelContentsReference >> parserStartingState [
	^ StepParser startingStateForDataEntities
]

{ #category : #accessing }
PlatypusModelContentsReference >> recordComputedInstances [
	^ self modelContents recordComputedInstances 
]

{ #category : #accessing }
PlatypusModelContentsReference >> recordComputedInstances: aBoolean [
	self modelContents recordComputedInstances: aBoolean
]

{ #category : #updating }
PlatypusModelContentsReference >> relabelWith: newName [ 
	| fileName |
	fileName := self modelContents headerInstances
				ifNotNil: [self modelContents headerInstances
						detect: [:hi | hi isPltFileName]
						ifNone: [].
					fileName
						ifNil: [fileName := PltFileName new.
							self modelContents headerInstances add: fileName.
							fileName owningModel: self modelContents].
					fileName name: newName.
					self updateModel].
	super relabelWith: newName
]

{ #category : #updating }
PlatypusModelContentsReference >> removeAt: position [
	| inst |
	inst := (self subReferences at: position) ifNotNil: [:r | r value ].
	inst ifNotNil: [self modelContents remove: inst].
	dataInstances remove: inst.
	self buildSubReferencesSilently.
	self reinitializeLabelSilently.
	self updateEditor.

]

{ #category : #updating }
PlatypusModelContentsReference >> removeComputedInstances [ 
	self modelContents removeComputedInstances.
	self reinitializeEditor.
	self treeHasChanged  
]

{ #category : #updating }
PlatypusModelContentsReference >> removeSilently [
	self owner
		removeAllModelContentsOf: (Array with: self).
	^ super removeSilently
]

{ #category : #updating }
PlatypusModelContentsReference >> removeSubReferencesSilently [
	dataInstances := nil.
	super removeSubReferencesSilently
]

{ #category : #updating }
PlatypusModelContentsReference >> replace: old with: new [
	dataInstances := nil.
	self modelContents replace: old with: new.
	
]

{ #category : #updating }
PlatypusModelContentsReference >> replaceTokenListWithParserResult: result [ 
	result 
		ifNotNil: [
			self modelContents headerInstances: result first.
			self modelContents dataInstances: result second.
			self modelContents buildDataInstancesIndexes.
			self checks.
			self buildSubReferencesSilently.
			self treeHasChanged.
			^ true].
	^ false
]

{ #category : #updating }
PlatypusModelContentsReference >> resolvesMetaConceptDefinitions [
	modelContents resolvesMetaConceptDefinitions.
	self reinitializeLabelSilently.
	self buildSubReferencesSilently
]

{ #category : #updating }
PlatypusModelContentsReference >> resolvesMetaMappingDefinitions [
	modelContents resolvesMetaMappingRules.
	self buildDataInstancesIndexes.
	self reinitializeLabelSilently.
	self buildSubReferencesSilently.
	TamManager changed: self
]

{ #category : #accessing }
PlatypusModelContentsReference >> schemaInstance [
	^ self modelContents schemaInstance
]

{ #category : #accessing }
PlatypusModelContentsReference >> shortName [
	^ listLabel ifNil: [self owner listLabel , ''' model']
]

{ #category : #menus }
PlatypusModelContentsReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring  
			the #shifted boolean"
	| myMenu |
	super specificMenu: menu shifted: b.
	menu addLine.
	myMenu := MenuMorph new.
	#(#- #('parse a step file' #menuParseStepFile) #- #('write to a step file' #menuStepWrite) #- #('remove computed instances' #removeComputedInstances))
		do: [:item | item == #-
				ifTrue: [myMenu addLine]
				ifFalse: [myMenu
						add: item first
						target: self
						selector: item second]].
	(self recordComputedInstances
		ifTrue: [#(#('do not record computed instances' #menuDoNotRecordComputedInstances) ) ]
		ifFalse: [#(#('record computed instances' #menuRecordComputedInstances) ) ])
		do: [:item | item == #-
				ifTrue: [myMenu addLine]
				ifFalse: [myMenu
						add: item first
						target: self
						selector: item second]].
	menu
		add: 'step ...' 
		target: self
		selector: nil
		argumentList: #().
	menu lastItem subMenu: myMenu.
	^ menu

]

{ #category : #updating }
PlatypusModelContentsReference >> stepFileIn: aFileName [ 
	| stream result |
	(stream := (Filename named: aFileName) readStream)
		ifNotNil: [[result := self parseStepStream: stream]
				ensure: [stream close].
			^ result]
]

{ #category : #'step file writing' }
PlatypusModelContentsReference >> stepWriteIntoStream: aStream [ 
	self stepWriteIntoStream: aStream useP21Syntax: true
]

{ #category : #'step file writing' }
PlatypusModelContentsReference >> stepWriteIntoStream: aStream useP21Syntax: aBoolean [
	self modelContents stepWriteIntoStream: aStream useP21Syntax: aBoolean
]

{ #category : #updating }
PlatypusModelContentsReference >> updateEditor [
	^ self announce: (TamForceEditorUpdating new sourceHandler: self modelContentsReference).
]

{ #category : #accessing }
PlatypusModelContentsReference >> useP21Syntax [
	^ useP21Syntax
		ifNil: [useP21Syntax := true]
]

{ #category : #accessing }
PlatypusModelContentsReference >> useP21Syntax: aBoolean [
	useP21Syntax := aBoolean 

]

{ #category : #accessing }
PlatypusModelContentsReference >> value [
	^ self modelContents
]

{ #category : #checking }
PlatypusModelContentsReference >> verifySilently [ 
	^ super verifySilently
]
