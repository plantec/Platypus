Extension { #name : #PltSchemaDefinition }

{ #category : #'*xtra-platypus-data-management' }
PltSchemaDefinition >> addTypeMap: aMetaMappingDefinition [
	self mappings add: aMetaMappingDefinition
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> dataInterface [
	^ self interface
		select: [:int | int isPltExternalMetaSchema not]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> externalMetaSchemaNamed: aName [ 
	| key |
	key := aName asUppercase.
	self metaInterface
		do: [:interf | interf nativeSchema name asUppercase = key
				ifTrue: [^ interf nativeSchema]].
	^ nil
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaDefinition >> generatedClassNameSuffix [

	^ 'SchemaDefinition'
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaDefinition >> generatedSystemCategorySuffix [
	^ 'Schema'
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaDefinition >> haveMetaSchemata [
	self interface
		do: [:int | int isPltExternalMetaSchema ifTrue: [^ true]].
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> initialize [
	super initialize.
	mappings := OrderedCollection new
]

{ #category : #'*xtra-platypus-evaluating' }
PltSchemaDefinition >> initializeContextInInterpretor: anInterpretor [ 
	self initializeContextInInterpretor: anInterpretor relatedSchemata: Set new.

]

{ #category : #'*xtra-platypus-evaluating' }
PltSchemaDefinition >> initializeContextInInterpretor: anInterpretor relatedSchemata: aSetOfSchemaDefinitions [ 
	(aSetOfSchemaDefinitions includes: self)
		ifFalse: [aSetOfSchemaDefinitions add: self.
			self dataInterface
				do: [:int | int nativeSchema
						ifNotNil: [int nativeSchema initializeContextInInterpretor: anInterpretor relatedSchemata: aSetOfSchemaDefinitions]].
			super initializeContextInInterpretor: anInterpretor]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> interfaceSchemata [
	^ (self interface)
		collect: [:i | i nativeSchema]
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaDefinition >> isMappingSchema [
	^ (self interface select: [:i | i isPltExternalMetaSchema]) notEmpty

]

{ #category : #'*xtra-platypus-testing' }
PltSchemaDefinition >> isPlatypusPrimitiveSchema [
	^ self owner notNil and: [self owner isPlatypusPrimitive]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> localLookUpIdentifierBN: aName [ 
	^ super lookUpIdentifierBN: aName
	
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> localLookUpNamedTypeBN: aName [ 
	^ super lookUpNamedTypeBN: aName
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> lookUpEntityDefinitionBN: aString [ 
	| availables |
	availables := self namedTypesCache
				at: aString asUppercase
				ifAbsent: [^ nil].
	^ availables
		detect: [:a | a isPltEntityDefinition]
		ifNone: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> lookUpEnumerationTypeFromElement: aString [ 
	self types
		do: [:ty | ty domain isPltEnumerationType
				ifTrue: [(ty domain elementSymbolCorrespondingTo: aString)
						ifNotNil: [^ ty]]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> lookUpIdentifierBN: aName [ 
	| found |
	(found := self localLookUpIdentifierBN: aName)
		ifNil: [self dataInterface
				do: [:interf | (found := interf lookUpIdentifierBN: aName)
						ifNotNil: [^ found]]].
	^ found
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> lookUpNamedTypeBN: aName [ 
	| found |
	(found := self localLookUpNamedTypeBN: aName)
		ifNil: [self dataInterface
				do: [:interf | (found := interf lookUpNamedTypeBN: aName)
						ifNotNil: [^ found]]].
	^ found
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> mappings [	 ^mappings


]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> mappings:aListOfPltMetaMappingDefinition [	mappings := aListOfPltMetaMappingDefinition ifNil: [OrderedCollection new] ifNotNil: [aListOfPltMetaMappingDefinition as: OrderedCollection]


]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> metaInterface [
	^ self interface
		select: [:int | int isPltExternalMetaSchema]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> metaSchemata [
	^ (self metaInterface
		select: [:i | i nativeSchema notNil]) collect: [:i | i nativeSchema]
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaDefinition >> moveInto: aSchemaInstance [ 
	aSchemaInstance schemata add: self.
	self owner: aSchemaInstance
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaDefinition >> removeFrom: aSchemaInstance [ 
	aSchemaInstance schemata remove: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaDefinition >> removeGlobalRule: aGlobalRule [
	self globalRules remove: aGlobalRule.

]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaDefinition >> renameWith: aString [
	self owner renameSchemaDefinition: self with: aString.

]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> schemaDefinition [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaDefinition >> setMappings:aListOfPltMetaMappingDefinition [	self mappings:aListOfPltMetaMappingDefinition


]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaDefinition >> systemCategoryFromNamesBuilder: aNameBuilder [ 
	^ aNameBuilder systemCategoryPrefix , '-' 
		, ((aNameBuilder normalizedNameFrom: self name first: true) 
				asIdentifier: true) 
			, self generatedSystemCategorySuffix
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaDefinition >> usePlatypusPrimitiveSchemata [
	self interface do: [:int | 
			(int notNil
							and: [int nativeSchema notNil
									and: [int nativeSchema isPlatypusPrimitiveSchema]]) ifTrue: [^ true]].
	^ false
]
