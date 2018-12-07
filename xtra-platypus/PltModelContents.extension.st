Extension { #name : #PltModelContents }

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> add: anEntityInstance [
	(self includesInstance: anEntityInstance)
		ifTrue: [^ self].
	(anEntityInstance persistentLabel isNil
			or: [anEntityInstance persistentLabel isEmpty])
		ifTrue: [anEntityInstance persistentLabel: self newPersistentLabel].
	(self instanceLabelled: anEntityInstance persistentLabel)
		ifNotNil: [^ self error: 'persistent label already used'].
	anEntityInstance owningModel: self.
	self dataInstances add: anEntityInstance.
	self addToIndexes: anEntityInstance withPosition: dataInstances size.
	
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> addToIndexes: anEntityInstance withPosition: aPosition [
	self entitiesByInstanceIndex at: anEntityInstance referenced ifAbsentPut: Set new.
	self positionByDataInstanceIndex at: anEntityInstance put: aPosition.
	anEntityInstance inheritedDefinitions
		do: [:d | 
			(self entitiesByInstanceIndex at: anEntityInstance)
				add: d.
			self dataInstancesByEntityIndex at: d  ifAbsentPut: Set new.
			(self dataInstancesByEntityIndex at: d )
				add: anEntityInstance].
	(anEntityInstance persistentLabel isNil
			or: [anEntityInstance persistentLabel isEmpty])
		ifTrue: [self error: 'An instance without label is recorded']
		ifFalse: [self dataInstancesByLabelIndex at: anEntityInstance persistentLabel put: anEntityInstance]
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> asStepStream [
	| strm |
	strm := ReadWriteStream on: String new.
	self stepWriteIntoStream: strm.
	^ strm reset

]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> at: position [
	^ self dataInstances at: position 
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> at: position put: aNewOne [ 
	| old oid |
	self halt.
	old := self at: position.
	self dataInstances at: position put: aNewOne.
	old ifNotNil: 
			[self removeFromIndexes: old].
	aNewOne ifNotNil: 
			[self addToIndexes: aNewOne withPosition: position.
			aNewOne owningModel: self]
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> buildDataInstancesIndexes [
	self dataInstancesByLabelIndex: Dictionary new.
	self entitiesByInstanceIndex: IdentityDictionary new.
	self dataInstancesByEntityIndex: IdentityDictionary new.
	self positionByDataInstanceIndex: IdentityDictionary new.
	self dataInstances
		doWithIndex: [:v :p | v ifNotNil: [self addToIndexes: v withPosition: p]]
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstances [
	^ dataInstances
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstances: aCollection [ 
	dataInstances := aCollection
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstancesByEntityIndex [
	^ dataInstancesByEntityIndex
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstancesByEntityIndex: anObject [ 
	dataInstancesByEntityIndex := anObject
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstancesByLabelIndex [
	^ dataInstancesByLabelIndex
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> dataInstancesByLabelIndex: anObject [
	dataInstancesByLabelIndex := anObject
]

{ #category : #'*xtra-platypus-initialize-release' }
PltModelContents >> destroyInstances [
	headerInstances ifNotNil: [headerInstances do: [:i | i destroy]].
	dataInstances ifNotNil: [dataInstances do: [:i | i destroy]].
	dataInstancesByLabelIndex := nil.
	positionByDataInstanceIndex := nil
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> entitiesByInstanceIndex [
	^entitiesByInstanceIndex
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> entitiesByInstanceIndex: anObject [
	entitiesByInstanceIndex := anObject
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> fileSchema [
	^ self headerInstances
		ifNotNil: [self headerInstances
				detect: [:hi | hi isPltFileSchema]
				ifNone: []]
]

{ #category : #'*xtra-platypus-initialize-release' }
PltModelContents >> finalize [
	self destroy.
	super finalize
]

{ #category : #'*xtra-platypus-checking' }
PltModelContents >> forgetAllErrors [ 
	self schemaInstance ifNil: [^ self ].
	self schemaInstance forgetAllErrorsOf: self.
	PlatypusInstanceDoer new 
		do: [:c :p | self schemaInstance forgetAllErrorsOf: (c at: p) ]
		from: self dataInstances
		in: self
	
]

{ #category : #'*xtra-platypus-testing' }
PltModelContents >> haveMetaConceptDefinitions [
	^ self dataInstances
		anySatisfy: [:inst | (inst isPltInternalRepresentation
					and: [inst definition name asUppercase = PltMetaConceptDefinition platypusMetaData name asUppercase])] 
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> headerInstances [
	^ headerInstances
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> headerInstances: aCollection [ 
	headerInstances := aCollection.

]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> includesInstance: anEntityInstance [
	self entitiesByInstanceIndex ifNil: [^false].
	^ self entitiesByInstanceIndex includesKey: anEntityInstance.

]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> indexOf: anInstance [
	^ self positionByDataInstanceIndex at: anInstance ifAbsent: [0]
]

{ #category : #'*xtra-platypus-initialize-release' }
PltModelContents >> initialize [
	super initialize.
	headerInstances := OrderedCollection new.
	dataInstances  := OrderedCollection new.
	self dataInstancesByLabelIndex: Dictionary new.
	self entitiesByInstanceIndex: IdentityDictionary new.
	self dataInstancesByEntityIndex: IdentityDictionary new.
	self positionByDataInstanceIndex: IdentityDictionary new.

]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> instanceLabelled: aLabel [
	^ self dataInstancesByLabelIndex at: aLabel ifAbsent: []
]

{ #category : #'*xtra-platypus-testing' }
PltModelContents >> isEmpty [
	^ dataInstances isEmpty
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> lookUpEntityDefinitionBN: aName [ 
	| found |
	self schemata do: 
			[:sch | 
			(found := sch linkedMetaData isNil ifFalse: [sch linkedMetaData lookUpEntityDefinitionBN: aName])
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> lookUpNamedTypeBN: aName [ 
	| found |
	self schemata
		do: [:sch | (found := sch linkedMetaData lookUpNamedTypeBN: aName)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> newPersistentLabel [
	^ (self newPersistentLabelFrom: dataInstances size + 1) asString
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> newPersistentLabelFrom: anInteger [
	| ca |
	ca := anInteger.
	[(self instanceLabelled: ca asString) notNil] 
		whileTrue: [ca := ca + 1].
	^ ca 
]

{ #category : #'*xtra-platypus-testing' }
PltModelContents >> notEmpty [
	^ dataInstances notEmpty
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> positionByDataInstanceIndex [
	^ positionByDataInstanceIndex ifNil: [positionByDataInstanceIndex := IdentityDictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> positionByDataInstanceIndex: anObject [
	positionByDataInstanceIndex := anObject
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> privateRemove: anEntityInstance [
	| pos |
	pos := self indexOf: anEntityInstance.
	pos > 0 
		ifTrue: [self dataInstances at: pos put: nil].
	self removeFromIndexes: anEntityInstance 

]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> recordComputedInstances [
	^ recordComputedInstances ifNil: [recordComputedInstances := true ]
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> recordComputedInstances: aBoolean [
	recordComputedInstances := aBoolean
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> remove: anEntityInstance [
	PlatypusInstanceReplacer new remove: anEntityInstance from: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> removeAll [
	self destroyInstances.
	self initialize.
	self buildDataInstancesIndexes
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> removeComputedInstances [
	| temporaries idx |
	temporaries := self dataInstances select: [:v | v notNil and: [ v isComputed] ].
	idx := IdentityDictionary new.
	temporaries do: [:t | idx at: t put: PltMissingValue new].
	self removeIndex: idx
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> removeFromIndexes: anEntityInstance [ 
	| entities s |
	self positionByDataInstanceIndex removeKey: anEntityInstance ifAbsent: [].
	(entities := self entitiesByInstanceIndex
					at: anEntityInstance
					ifAbsent: []) isNil
		ifFalse: [entities
				do: [:ent | 
					(s := self dataInstancesByEntityIndex at: ent) remove: anEntityInstance.
					s isEmpty
						ifTrue: [self dataInstancesByEntityIndex removeKey: ent ]].
			self entitiesByInstanceIndex removeKey: anEntityInstance].
	(anEntityInstance persistentLabel isNil
			or: [anEntityInstance persistentLabel isEmpty])
		ifFalse: [self dataInstancesByLabelIndex removeKey: anEntityInstance persistentLabel ifAbsent: []]
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> removeFromOwner [
	self owner ifNil: [^ self ].
	self owner removeModelContents: self

]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> removeIndex: anIndex [
	PlatypusInstanceReplacer new removeIndex: anIndex from: self 
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> replace: old with: new [
	PlatypusInstanceReplacer new replace: old with: new in: self 
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> replaceIndex: anIndex [
	PlatypusInstanceReplacer new replaceIndex: anIndex in: self 
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> resolves [
	^ self resolvesNotifying: nil
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> resolvesMetaConceptDefinitions [
	| metaRefs evalResult newInst interpreter instDefinition metaExpression toBeRecord |
	metaRefs := OrderedCollection new.
	toBeRecord := OrderedCollection new.
	self dataInstances
		do: [:inst | (inst isPltInternalRepresentation
					and: [inst definition name asUppercase = PltMetaConceptDefinition platypusMetaData name asUppercase])
				ifTrue: [metaExpression := inst valueOfExplicitAttributeNamed: 'expression'.
					instDefinition := inst valueOfExplicitAttributeNamed: 'definition'.
					interpreter := PlatypusExpressInterpretor new.
					evalResult := interpreter
								evaluate: metaExpression val
								in: self schemaInstance
								to: instDefinition
								notifying: nil
								ifFail: [self halt]. 
					newInst := evalResult val.
					instDefinition addRecordsToExternalRepresentation: newInst.
					instDefinition becomeInstance: newInst.
					toBeRecord add: newInst.
					metaRefs add: inst]].
	(PlatypusModelContentsRecorder modelContents: self)
		checksAll: toBeRecord.
	metaRefs
		do: [:mr | self remove: mr].
	self tamarisItemRef removeSubReferences
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> resolvesMetaMappingRules [
	PlatypusModelContentsMetaDefinitionsBuilder new acceptModelContents: self
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> resolvesNotifying: aRequestor [
	| checker |
	checker := PlatypusModelContentsResolver new.
	checker checks: self.
	aRequestor ifNotNil: [ checker errors do: [ :err | aRequestor notify: err asString ] ].
	^ checker haveError not
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> schemaInstance [ 
	^ self owner
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> schemata [
	| fileSchema declaredSchemata sch |
	declaredSchemata := OrderedCollection new.
	(fileSchema := self fileSchema)
		ifNotNil: [fileSchema schemaIdentifiers
				do: [:id | (sch := self owner lookUpSchemaDefinitionBN: id)
						ifNotNil: [declaredSchemata add: sch]]].
	self owner ifNotNil: [
		self owner schemata
			do: [:s | (declaredSchemata includes: s)
				ifFalse: [declaredSchemata add: s]]].
	^ declaredSchemata
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> semanticChecks [
	^ self semanticChecksNotifying: nil
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> semanticChecksNotifying: aRequestor [
	| checker |
	checker := PlatypusModelContentsSemanticChecker new.
	checker checks: self.
	aRequestor ifNotNil: [ checker errors do: [ :err | aRequestor notify: err asString ] ].
	^ checker haveError not
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> sortedDataInstances [ 
	^ (self dataInstances select: [:e | e notNil]) asArray sort: [:a :b |
			(a persistentLabel isAllDigits and: [b persistentLabel isAllDigits])
				ifTrue: [a persistentLabel asInteger < b persistentLabel asInteger]
				ifFalse: [a persistentLabel  < b persistentLabel]]
]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> stepWriteIntoStream: aStream [ 
	self stepWriteIntoStream: aStream useP21Syntax: true

]

{ #category : #'*xtra-platypus-data-management' }
PltModelContents >> stepWriteIntoStream: aStream useP21Syntax: aBoolean [ 
	Cursor write showWhile: [
		PlatypusModelContentsStepWriter new
			stream: aStream
			modelContents: self
			p21Syntax: aBoolean]
]

{ #category : #'*xtra-platypus-accessing' }
PltModelContents >> subInstancesOf: entity [ 
	^ self dataInstancesByEntityIndex
		at: entity
		ifAbsent: [Set new]
]

{ #category : #'*xtra-platypus-tamaris' }
PltModelContents >> tamarisChildrenIntoOwner: ownerRef [
	| children |
	dataInstances ifNil: [ ^OrderedCollection new ].
	children := OrderedCollection new.
	self sortedDataInstances  
		doWithIndex: [:inst :p |
			children add: (inst tamarisStepValueReferenceClass owner: ownerRef position: p)].
	^ children
]

{ #category : #'*xtra-platypus-checking' }
PltModelContents >> verifyNotifying: aRequestor [
	self forgetAllErrors.
	self validationDate: DateAndTime now asString.
	((self resolvesNotifying: aRequestor) and: [ self semanticChecksNotifying: aRequestor ])
		ifTrue: [ self validationResult: true ]
		ifFalse: [ self validationResult: false ].
	^ self validationResult
]

{ #category : #'*xtra-platypus-checking' }
PltModelContents >> verifySilently [
	^ self verifyNotifying: nil
]
