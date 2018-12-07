"
Build a repository of Platypus metamodele instances from a generic repository
"
Class {
	#name : #PlatypusRepositoryBuilder,
	#superclass : #StepGenericRepositoryAbstractVisitor,
	#instVars : [
		'valuesListStack',
		'modelContents',
		'index'
	],
	#category : #'Platypus-HW-STEP'
}

{ #category : #'instance creation' }
PlatypusRepositoryBuilder class >> folder: aDataFolder  modelContents: aModelContents [ 
	^ self new folder: aDataFolder modelContents: aModelContents 
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> dataInstances [
	^ modelContents dataInstances
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doAggregation: aCollection [ 
	| aggr | 
	aggr := self new: PltListInstance.
	aggr general: true.
	self push: aggr.
	aCollection
		do: [:val | self doToken: val].
	aggr adjustLowerAndUpperBounds.
	self pop.
	self top add: aggr
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doBinary: aBinary [ 
	self top add: (PltBinaryLiteral val: aBinary)

]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doBoolean: b [ 
	self doLogical: b
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doEnumeration: aString [ 
	| domain |
	aString = #UNKNOWN
		ifTrue: [self top add: PltUnknownConstant new]
		ifFalse: [aString = #T
			ifTrue: [self top add: PltTrueConstant new]
			ifFalse: [aString = #F
				ifTrue: [self top add: PltFalseConstant new]
				ifFalse: [
					(domain := self enumerationTypeNamed: aString)
						ifNil: [self top add: (PltEnumerationValue domain: nil element: aString asSymbol)]
						ifNotNil: [
							self top add: (PltEnumerationValue
								domain: (PltDefinedTypeReference ref: domain)
								element: (domain domain elementSymbolCorrespondingTo: aString))]]]]
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doExternalRepresentation: inst [ 
	index 
		at: inst
		ifPresent: [:found | self top add: found ]
		ifAbsent: [ 
			| rep sr | 
			rep := self new: PltExternalRepresentation.
			index at: inst put: rep.
			self push: rep records.
			inst records
				do: [:rec | 
					sr := self doSimpleRecord: rec.
					sr owner: rep].
			rep persistentLabel: inst label.
			rep owningModel: self modelContents.
			self pop.
			self top add: rep].
	^ inst
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doFolder [
	| instances |
	self push: OrderedCollection new.
	folder header
		do: [:h | 
			self doHeaderInstance: h.
			self headerInstances add: self top removeFirst].
	instances := folder instances.
	1
		to: instances size
		do: [:p | | i | (i := instances at: p)
				ifNotNil: [self doInstance: i.
					modelContents add: self top removeFirst]]
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doHeaderInstance: h [ 
	| inst values name |
	values := h values.
	name := h entityName asUppercase.
	name = 'FILE_SCHEMA'
		ifTrue: [inst := self fileSchemaHeaderInstance: values first]
		ifFalse: [name = 'FILE_NAME'
				ifTrue: [inst := self
								fileNameHeaderInstance: values first
								timeStamp: values second
								authors: values third
								organization: values fourth
								preprocessorVersion: values fifth
								originatingSystem: (values at: 6)
								authorization: (values at: 7)]
				ifFalse: [name = 'FILE_DESCRIPTION'
						ifTrue: [inst := self fileDescriptionHeaderInstance: values first implementationLevel: values second]
						ifFalse: [inst := self new: PltUserDefinedHeaderInstance.
							inst name: name.
							inst parameters: values]]].
	inst owningModel: modelContents.
	self top add: inst

]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doInstance: inst [ 
	(inst isKindOf: StepExternalRepresentation)
		ifTrue: [self doExternalRepresentation: inst]
		ifFalse: [self doInternalRepresentation: inst]
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doInstanceRef: i [ 
	i ref ifNil: [i ref: (folder ifNotNil: [:f | f instanceLabelled: i id])].
	self doToken: i ref
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doInternalRepresentation: inst [ 
	index 
		at: inst
		ifPresent: [:found | self top add: found ]
		ifAbsent: [
			| rep |
			rep := self new: PltInternalRepresentation.
			index at: inst put: rep.
			rep
				definition: (self lookUpEntityDefinitionBN: inst entityName).
			self push: rep parameters.
			inst values
				ifNotNil: [
					inst values
						do: [:val | self doToken: val]].
			self pop.
			rep persistentLabel: inst label.
			rep owningModel: self modelContents.
			self top add: rep].
	^ inst
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doLogical: l [ 
	self top
		add: (l = #UNKNOWN
				ifTrue: [PltUnknownConstant new]
				ifFalse: [l
						ifTrue: [PltTrueConstant new]
						ifFalse: [PltFalseConstant new]])
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doNullValue: e [ 
	self top add: PltMissingValue new
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doNumber: n [ 
	self top add: (n isFloat ifTrue: [PltRealLiteral val: n] ifFalse: [PltIntegerLiteral val: n])
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doRedefinedValue: aRedefinedValue [ 
	self top add: PltRedefinedAttributeValue new
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doSimpleRecord: aStepRecord [ 
	| sr |
	sr := self new: PltSimpleRecord.
	sr
		definition: (self lookUpEntityDefinitionBN: aStepRecord entityName).
	self push: sr parameters.
	aStepRecord values
		do: [:val | self doToken: val].
	self pop.
	self top add: sr.
	^ sr
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doSingleToken: t [
	index := IdentityDictionary new.
	folder instances 
		do: [:i |
			i ~= t 
				ifTrue: [index at: i put: (modelContents instanceLabelled: (folder oidOf: i)) ] ].
	^ super doSingleToken: t
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> doString: s [ 
	self top
		add: ( PltStringLiteral val: s)
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> enumerationTypeNamed: anIdent [ 
	^ self schemaInstance lookUpEnumerationTypeFromElement: anIdent
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> fileDescriptionHeaderInstance: description implementationLevel: implementationLevel [ 
	| inst |
	inst := self new: PltFileDescription.
	inst description addAll: description.
	inst implementationLevel: implementationLevel.
	^ inst
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> fileNameHeaderInstance: name timeStamp: timeStamp authors: author organization: organization preprocessorVersion: preprocessorVersion originatingSystem: originatingSystem authorization: authorization [ 
	| inst |
	inst := self new: PltFileName.
	inst name: name .
	inst timeStamp: timeStamp.
	inst author
		addAll: (author ).
	inst organization
		addAll: (organization).
	inst preprocessorVersion: preprocessorVersion.
	inst originatingSystem: originatingSystem.
	inst authorisation: authorization.
	^ inst
]

{ #category : #'data encoding' }
PlatypusRepositoryBuilder >> fileSchemaHeaderInstance: aListOfString [ 
	| inst |
	inst := self new: PltFileSchema.
	inst schemaIdentifiers addAll: aListOfString.
	^ inst
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> folder: aDataFolder modelContents: aModelContents [
	self folder: aDataFolder.
	self modelContents: aModelContents
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> headerInstances [
	^ modelContents headerInstances
]

{ #category : #'initialize-release' }
PlatypusRepositoryBuilder >> initialize [
	super initialize.
	valuesListStack := PlatypusStack new.
	index := IdentityDictionary new.

]

{ #category : #accessing }
PlatypusRepositoryBuilder >> lookUpEntityDefinitionBN: entityName [ 
	| found type metaData |
	self schemata
		do: [:sch | (metaData := sch linkedMetaData)
				ifNotNil: [(found := metaData lookUpEntityDefinitionBN: entityName)
						ifNotNil: ["type := self new:
							PltEntityDefinitionReference. type setName:
							entityName. type setRef: found.
							^ type"
							^ found referenceOnSelf]]].
	type := self new: PltEntityDefinitionReference.
	type setName: entityName.
	^ type
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> modelContents [
	^modelContents
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> modelContents: anObject [
	modelContents := anObject
]

{ #category : #'step instance creation' }
PlatypusRepositoryBuilder >> new: aClass [ 
	^ aClass new stepInitialize
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> pop [
	^ valuesListStack pop
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> push: anObject [ 
	^ valuesListStack push: anObject
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> schemaInstance [
	^ self modelContents schemaInstance
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> schemata [
	^ self modelContents schemata
]

{ #category : #accessing }
PlatypusRepositoryBuilder >> top [
	^ valuesListStack top
]
