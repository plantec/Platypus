Extension { #name : #PltContextDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> bindings [
	^ self primaryElements asOrderedCollection, self owner bindings asOrderedCollection 

]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> errorQualifier [
	^ super errorQualifier , ' ''' , self name, ''''
]

{ #category : #'*xtra-platypus-evaluating' }
PltContextDefinition >> expressTypeForTypeOf [
	^ (self owner isPltContextDefinition
		ifTrue: [self owner expressTypeForTypeOf , '.']
		ifFalse: [''])
		, self name asUppercase
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> functionDeclarations [
	^ self algorithmes select: [ :alg | alg isPltFunctionDeclaration ]
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> identifiers [
	^ self constants , self algorithmes
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> identifiersCache [
	^ identifiersCache
		ifNil: [identifiersCache := Dictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> identifiersCache: aDictionary [ 
	identifiersCache := aDictionary
]

{ #category : #'*xtra-platypus-evaluating' }
PltContextDefinition >> initializeContextInInterpretor: anInterpretor [ 
	self constants
		do: [:con | anInterpretor declareConstant: con]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> insertElement: aPrimaryElement [ 
	aPrimaryElement moveInto: self.
	self insertIntoCache: aPrimaryElement
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> insertIntoCache: aPrimaryElement [ 
	self insertIntoCache: aPrimaryElement named: aPrimaryElement name 

]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> insertIntoCache: aPrimaryElement named: anIdentifier [ 
	aPrimaryElement isPltNamedType
		ifTrue: [self insertIntoNamedTypeCache: aPrimaryElement named: aPrimaryElement name]
		ifFalse: [aPrimaryElement isPltGlobalRule
				ifFalse: [self insertIntoIdentifiersCache: aPrimaryElement named: aPrimaryElement name]]
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> localPrimariesElementsIndex [
	| locals anyOne |
	locals := Dictionary new.
	self namedTypesCache
		keysAndValuesDo: [:k :v | locals at: k put: v anyOne].
	self identifiersCache
		keysAndValuesDo: [:k :v | 
			anyOne := v anyOne.
			(anyOne isPltAlgorithmDeclaration
					or: [anyOne isPltConstantDefinition])
				ifTrue: [locals at: k put: anyOne]].
	^ locals
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> lookUpNamedTypeBN: aName [ 
	| availables |
	availables := self namedTypesCache
				at: aName asUppercase
				ifAbsent: [].
	^ availables
		ifNotNil: [availables anyOne]
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> lookUpSchemaDefinition [
	| ow |
	ow := self.
	[ow isPltSchemaDefinition] whileFalse: [ow := ow owner].
	^ow
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> namedTypes [
	^ self types , self entities 
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> namedTypesCache [
	| |
	^ namedTypesCache
		ifNil: [namedTypesCache := Dictionary new].

]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> namedTypesCache: aDictionary [ 
	namedTypesCache := aDictionary
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> primaryElements [
	self constants ifNil: [^OrderedCollection new].
	^ self constants , self types , self entities , self algorithmes
]

{ #category : #'*xtra-platypus-accessing' }
PltContextDefinition >> procedureDeclarations [
	^ self algorithmes
		select: [:alg | alg isPltProcedureDeclaration]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> rebuildLocalCaches [
	| enumVal |
	self namedTypesCache: Dictionary new.
	self identifiersCache: Dictionary new.
	self primaryElements
		do: [:pe | self insertIntoCache: pe].
	self types isNil
		ifFalse: [self types
				do: [:ty | ty domain
						ifNotNil: [ty domain isPltEnumerationType
								ifTrue: [ty domain elements
										do: [:el | 
											enumVal := PltEnumerationValue
														domain: (PltDefinedTypeReference ref: ty)
														element: el.
											enumVal domain owner: self.
											self insertIntoIdentifiersCache: enumVal named: el asUppercase]]]]]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeAlgorithmDeclaration: anAlgorithm [ 
	self algorithmes remove: anAlgorithm 		ifAbsent: []
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeConstantDefinition: aConstantDefinition [ 
	self constants remove: aConstantDefinition 		ifAbsent: []
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeDefinedType: aDefinedType [ 
	self types remove: aDefinedType 		ifAbsent: []
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeElement: aPrimaryElement [ 
	aPrimaryElement removeFrom: self.
	self removeFromCache: aPrimaryElement
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeEntityDefinition: anEntityDefinition [ 
	self entities remove: anEntityDefinition ifAbsent:[]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeFromCache: aPrimaryElement [ 
	aPrimaryElement isPltNamedType
		ifTrue: [self removeFromNamedTypeCache: aPrimaryElement]
		ifFalse: [aPrimaryElement isPltGlobalRule
				ifFalse: [self removeFromIdentifiersCache: aPrimaryElement named: aPrimaryElement name]]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeFromIdentifiersCache: aPrimaryElement named: anIdentifier [
	| key availables |
	key := anIdentifier asUppercase.
	(availables := self identifiersCache
				at: key
				ifAbsent: [])
		ifNotNil: [availables
				remove: aPrimaryElement
				ifAbsent: [].
			availables
				ifEmpty: [self identifiersCache removeKey: key]]
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> removeFromNamedTypeCache: aPrimaryElement [ 
	| key availables |
	key := aPrimaryElement name asUppercase.
	(availables := self namedTypesCache at: key ifAbsent: [])
		ifNotNil: [availables remove: aPrimaryElement ifAbsent: [].
				availables ifEmpty: [self namedTypesCache removeKey: key]].
	
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameAlgorithmDeclaration: anAlgorithm with: anIdent [ 
	self renamePrimaryElement: anAlgorithm with: anIdent 

]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameConstantDefinition: aConstantDefinition with: anIdent [ 
	self renamePrimaryElement: aConstantDefinition with: anIdent
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameDefinedType: aDefinedType with: anIdent [ 
	self renamePrimaryElement: aDefinedType with: anIdent
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameEntityDefinition: anEntityDefinition with: anIdent [ 
	self renamePrimaryElement: anEntityDefinition with: anIdent
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameGlobalRule: aGlobalRule with: anIdent [ 
	self renamePrimaryElement: aGlobalRule with: anIdent
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renamePrimaryElement: aPrimaryElement with: anIdent [ 
	self removeFromCache: aPrimaryElement.
	aPrimaryElement name: anIdent.
	self insertIntoCache: aPrimaryElement
]

{ #category : #'*xtra-platypus-data-management' }
PltContextDefinition >> renameWith: newName [ 
	self owner renameContextDefinition: self with: newName
]

{ #category : #'*xtra-platypus-code-generating' }
PltContextDefinition >> variableHolders [
	^ self primaryElements
]
