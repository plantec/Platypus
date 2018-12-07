Extension { #name : #PltSchemaInstance }

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> addElement: aSchemaDefinition [ 
	self schemata add: aSchemaDefinition.
		aSchemaDefinition owner: self
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> addError: anError for: anEntityInstance [
	self errorsIndex at: anEntityInstance ifAbsentPut: [OrderedCollection new].
	(self errorsIndex at: anEntityInstance) add: anError
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> addModelContents: aModelContents [ 
	self associatedModels
		add: aModelContents

]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> allSchemata [
	^ self schemataLinkedMetaData 
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> bindings [
	^ self allSchemata 
		inject: Set new
		into: [:c :e | 
			c addAll: e primaryElements; yourself].

]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> checksMetaData [
	^ self metaDataFolder checksInstances
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> dataSchemaInstances [
	^ (self dataSchemata collect: [:sch | sch owner]) asSet 
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> dataSchemata [
	^ (self schemataLinkedMetaData copyWithoutAll: self metaSchemata)" copyWithoutAll: self mappingSchemata "
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> errorQualifier [
	^ 'schema instance ''' , self name, ''''
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> errorsFor: anEntityInstance [
	^ self errorsIndex at: anEntityInstance ifAbsent: [#()]

]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> errorsIndex [
	^ errorsIndex ifNil: [errorsIndex := IdentityDictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> externalSchemaInstances [
	^ ((self externalSchemata
		collect: [:s | s  schemaInstance]) select: [:l | l notNil]) asSet
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> externalSchemaLinks [
	^ self schemata
		ifNil: [#()]
		ifNotNil: [self schemata
				select: [:s | s isLink]]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> externalSchemaLinks: aCollectionOfLinks [
	^ self schemata addAll: aCollectionOfLinks
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> externalSchemata [
	^ (self externalSchemaLinks
		collect: [:l | l linkedMetaData]) select: [:l | l notNil]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> externalSchemataNames [
	^ self externalSchemata
		collect: [:ext | ext name asUppercase]
]

{ #category : #'*xtra-platypus-release' }
PltSchemaInstance >> finalize [
	associatedModels := nil.
	schemata := nil.
	tamarisItemReferencesIndex := nil.
	super finalize
]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> forgetAllErrors [
	errorsIndex := nil

]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> forgetAllErrorsOf: anEntityInstance [
	self errorsIndex removeKey: anEntityInstance ifAbsent: [#()]


]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> generatedClassNameSuffix [

	^ 'SchemaInstance'
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> generatedSystemCategorySuffix [
	^ 'SchemaInstance'
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaInstance >> haveMetaSchemata [
	self schemata ifNil: [^ false ].
	self schemata
		do: [:sch | sch linkedMetaData ifNotNil: [ sch linkedMetaData  haveMetaSchemata
				ifTrue: [^ true]]].
	^ false
]

{ #category : #'*xtra-platypus-evaluating' }
PltSchemaInstance >> initializeContextInInterpretor: anInterpretor [ 
	self dataSchemata
		do: [:sch |  sch pushContextInInterpretor: anInterpretor]
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> insertElement: aSchemaDefinition [ 
	| toBeRemove key |
	key := aSchemaDefinition linkedMetaData name asUppercase.
	toBeRemove := self schemata
				detect: [:sch | sch linkedMetaData notNil and: [ sch linkedMetaData name asUppercase = key] ]
				ifNone: [].
	toBeRemove
		ifNil: [self addElement:  aSchemaDefinition.
			]
		ifNotNil: [toBeRemove isLink
				ifFalse: [self schemata
						at: (self schemata indexOf: toBeRemove)
						put: aSchemaDefinition.
					aSchemaDefinition owner: self]]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> internalSchemaInstances [
	^ (self internalSchemata
		collect: [:s | s schemaInstance]) asSet
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> internalSchemata [
	^ self schemata
		ifNil: [ #() ]
		ifNotNil: [:schta | schta select: [:s | s isLink not and: [s isPltExternalMetaSchema not]]]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> internalSchemataNames [
	^ self internalSchemata
		collect: [:int | int name asUppercase]
]

{ #category : #'*xtra-platypus-evaluating' }
PltSchemaInstance >> interpretorContextClass [
	^ PlatypusExpressInterpretorContext
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaInstance >> isPlatypusPrimitive [
	| iref |
	^ (iref := self tamarisItemRef) notNil and: [iref isMetaSchemaInstanceReference]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> lookUpEntityDefinitionBN: aString [ 
	| found |
	self schemata
		do: [:sch | (found := sch linkedMetaData lookUpEntityDefinitionBN: aString)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> lookUpEnumerationTypeFromElement: aString [ 
	| found |
	self schemataLinkedMetaData 
		do: [:sch | (found := sch lookUpEnumerationTypeFromElement: aString)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> lookUpIdentifierBN: aName [ 
 	| found |
	self schemata
		do: [:sch | (found := sch linkedMetaData lookUpIdentifierBN: aName)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> lookUpNamedTypeBN: aName [ 
	| found |
	self schemata
		do: [:sch | (found := sch linkedMetaData ifNotNil: [sch linkedMetaData lookUpNamedTypeBN: aName])
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> lookUpSchemaDefinitionBN: anIdentifier [ 
	| key |
	key := anIdentifier asUppercase.
	^ self schemataLinkedMetaData
				detect: [:s | s notNil and: [s name asUppercase = key]]
				ifNone: [].


]

{ #category : #'*xtra-platypus-evaluating' }
PltSchemaInstance >> mappingSchemata [
	^ (self schemata select: [ :sch | sch notNil and: [sch linkedMetaData notNil and: [sch linkedMetaData isMappingSchema]]])
		collect: [:sch | sch linkedMetaData]

]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> masterModel [
	^ self associatedModels
		ifEmpty: []
		ifNotEmpty: [:ms | ms first] 
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> masterModelAsStepStream [
	^ self masterModel ifNotNil: [:mm | mm asStepStream]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaConcept: aPltMetaConcept for: aPltDictionaryInstance [ 
	self metaConceptsIndex at: aPltDictionaryInstance put: aPltMetaConcept
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaConceptOf: aPltDictionaryInstance [ 
	^ self metaConceptsIndex at: aPltDictionaryInstance ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaConceptsIndex [
	^ metaConceptsIndex
		ifNil: [metaConceptsIndex := PlatypusWeakIdentityKeyDictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaDataFolder [
	| folder |
	folder := self metaDataSchemaInstance buildRepository.
	PlatypusMetaRepositoryBuilder build: folder with: self.
	^ folder
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaDataSchemaInstance [
	^ self class schemaDefinition schemaInstance
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> metaDataStream [
	| strm |
	strm := ReadWriteStream on: (String new).
	self metaDataToStream: strm.
	^ strm contents readStream
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> metaDataToStepFile: aFilename [ 
	| stream |
	(stream :=  (Filename named: aFilename) writeStream)
		ifNotNil: [[self metaDataToStream: stream]
				ensure: [stream close]]
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> metaDataToStream: aStream [ 
	| repo writer oldSchemata |
	oldSchemata := self schemata copy.
	self schemata: self dataSchemata.
	[repo := self metaDataFolder.
	writer := PlatypusCoreRepositoryStepFileWriter folder: repo.
	writer stream: aStream.
	writer doFolder] 
			ensure: [self schemata: oldSchemata]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaSchemata [
	| metaSchemata |
	metaSchemata := Set new.
	(self schemata select: [ :sch | sch notNil])
		do: [:sch | sch linkedMetaData ifNotNil: [metaSchemata addAll: sch linkedMetaData metaSchemata]].
	^ metaSchemata
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> metaSchemataNames [
	^ self metaSchemata
		collect: [:ext | ext name asUppercase]

]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> moveInto: aSchemaInstance [ 
	self internalSchemata
		do: [:sch | aSchemaInstance addElement: sch].
	self metaConceptsIndex
		keysAndValuesDo: [:k :v | aSchemaInstance metaConcept: v for: k].
	aSchemaInstance changeDate: self changeDate.
	aSchemaInstance validationDate: self validationDate.
	aSchemaInstance validationResult: self validationResult.
	self removeMetaConceptsIndex.
	self schemata: self schemata class new
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> namesBuilder [
	^ self isPlatypusPrimitive
		ifTrue: [PlatypusNamesBuilder meta]
		ifFalse: [namesBuilder
				ifNil: [namesBuilder := PlatypusNamesBuilder default]]
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> namesBuilder: x [
	namesBuilder:= x
	
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> namesBuilderPrefixedBy: aPrefix [ 
	self namesBuilder: (PlatypusNamesBuilder prefixedBy: aPrefix)
]

{ #category : #'*xtra-platypus-instance-creation' }
PltSchemaInstance class >> new [
	^ super new setDefaultName
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> owner [
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> prettyPrintedExpressCode [
	| code |
	code := WriteStream on: ''.
	self schemata
		do: [:sch | code nextPutAll: sch linkedMetaData prettyPrintedExpressCode. code nextPut: Character cr].
	^ code contents	
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> removeElement: aSchemaDefinition [ 
	self schemata remove: aSchemaDefinition ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> removeMetaConceptOf: aPltDictionaryInstance [ 
	^ self metaConceptsIndex
		removeKey: aPltDictionaryInstance
		ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> removeMetaConceptsIndex [
	metaConceptsIndex := nil
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> removeModelContents: aModelContents [
	self associatedModels 
		remove: aModelContents
		ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> removeTamarisItemRefFor: aPltEntityInstance [ 
	self tamarisItemReferencesIndex removeKey: aPltEntityInstance ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> removeTamarisItemReferencesIndex [
	tamarisItemReferencesIndex := nil
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> renameContextDefinition: aContextDefinition with: newName [
	aContextDefinition name: newName
]

{ #category : #'*xtra-platypus-data-management' }
PltSchemaInstance >> renameWith: newName [ 
	self name: newName
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> repositoryClassNameFromNamesBuilder: aNamesBuilder [ 
	^aNamesBuilder normalizedClassNameFrom: self name suffix: self repositoryClassNameSuffix
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> repositoryClassNameSuffix [
	^ 'Repository'
]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> resolvesNotifying: aRequestor [
	| checker |
	PlatypusStepOwnerSetter new acceptTry: self.
	checker := PlatypusExpressResolver checks: self.
	PlatypusStepOwnerSetter new acceptTry: self.
	self validationResult: checker haveError not.
	aRequestor ifNotNil: [checker errors do: [ :err | aRequestor notify: err asString ]].
	^ checker haveError not.

]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> resolvesSilently [
	^ self resolvesNotifying: nil
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> schemataLinkedMetaData [
	^ self schemata ifNil: [#()] ifNotNil: [self schemata
		collect: [:l | l ifNotNil: [l linkedMetaData]]]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> selectionString [
	| code |
	code := WriteStream on: ''.
	self schemata
		do: [:sch | 
			code nextPutAll: sch  selectionString.
			code nextPut: Character cr].
	^ code contents
]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> semanticChecksNotifying: aRequestor [
	| checker |
	checker := PlatypusExpressNamesChecker checks: self.
	checker haveError
		ifTrue: [ 
			aRequestor ifNotNil: [ checker errors do: [ :err | aRequestor notify: err asString ] ].
			^ false ].
	checker := PlatypusExpressSemanticChecker checks: self.
	aRequestor ifNotNil: [ checker errors do: [ :err | aRequestor notify: err asString ] ].
	^ checker haveError not
]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> semanticChecksSilently [
	^ self semanticChecksNotifying: nil
]

{ #category : #'*xtra-platypus-initializing' }
PltSchemaInstance >> setDefaultName [
	self name: 'schi' , self basicIdentityHash printString
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> systemCategoryFromNamesBuilder: aNameBuilder [ 
	^ aNameBuilder systemCategoryPrefix , '-' 
		, ((aNameBuilder normalizedNameFrom: self name first: true) 
				asIdentifier: true) 
			, self generatedSystemCategorySuffix
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> tamarisItemRef: aTamarisItemReference for: aPltEntityInstance [ 
	self tamarisItemReferencesIndex at: aPltEntityInstance put: aTamarisItemReference
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> tamarisItemRefOf: aPltEntityInstance [ 
	^ self tamarisItemReferencesIndex at: aPltEntityInstance ifAbsent: [nil]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> tamarisItemReferencesIndex [
	^ tamarisItemReferencesIndex
		ifNil: [tamarisItemReferencesIndex := PlatypusWeakIdentityKeyDictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> translatedSchemaCode [
	| code |
	code := WriteStream on: ''.
	self internalSchemata
		do: [:sch |code nextPutAll: sch prettyPrintedExpressCode.
					code nextPut: Character cr].
	^ code contents
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterClassPrefix [
	^ self namesBuilder classPrefix
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterClassPrefix: aString [ 
	self namesBuilder classPrefix: aString
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterRootClassName [
	^ self namesBuilder rootClassName
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterRootClassName: aString [ 
	self namesBuilder rootClassName: aString
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterRootClassSystemCategory [
	^ self namesBuilder rootClassSystemCategory
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterRootClassSystemCategory: aString [ 
	self namesBuilder rootClassSystemCategory: aString
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterSystemCategoryPrefix [
	^ self namesBuilder systemCategoryPrefix
]

{ #category : #'*xtra-platypus-code-generating' }
PltSchemaInstance >> translaterSystemCategoryPrefix: aString [ 
	self namesBuilder systemCategoryPrefix: aString
]

{ #category : #'*xtra-platypus-testing' }
PltSchemaInstance >> usePlatypusPrimitiveSchema [
	self schemata ifNil: [^ false ].
	^ self schemata
		anySatisfy: [:sch | sch isPlatypusPrimitiveSchema]
]

{ #category : #'*xtra-platypus-accessing' }
PltSchemaInstance >> validationResult: aBoolean [
	super validationResult: aBoolean.
	self validationDate: DateAndTime now asString.
	self changeDate isNil
		ifTrue: [self changeDate: self validationDate].

]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> verifyNotifying: aRequestor [
	self forgetAllErrors.
	self validationResult: ((self resolvesNotifying: aRequestor)  and: [self semanticChecksNotifying: aRequestor ]).
	^ self validationResult
]

{ #category : #'*xtra-platypus-checking' }
PltSchemaInstance >> verifySilently [
	^ self verifyNotifying: nil
]
