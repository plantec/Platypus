Class {
	#name : #PlatypusExpressResolver,
	#superclass : #PlatypusExpressChecker,
	#instVars : [
		'resolutionPass',
		'parent'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit generic' }
PlatypusExpressResolver >> acceptAggregationType: e lower: l upper: u symbol: subtype flags: aCollection [ 
	super
		acceptAggregationType: e
		lower: l
		upper: u
		symbol: subtype
		flags: aCollection.
	self acceptTry: e elementType.
	e elementType
		ifNotNil: [(e elementType isPltNamedTypeReference
					and: [e elementType ref notNil])
				ifTrue: [e elementType: e elementType ref referenceOnSelf]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptAssignable: e [
	e head acceptTry: self.
	e qualifiers acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptAttribute: e [ 
	e redeclaring
		ifNotNil: [self acceptTry: e redeclaring].
	(e domain isPltNamedTypeReference and: [e domain ref notNil]) ifTrue: [e domain: e domain ref referenceOnSelf]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptAttributeReference: e [ 
	| inversedEntity invKey invertedAttr |
	e entityRef acceptTry: self.
	resolutionPass = 1
		ifTrue: [
			e ref: nil.
			self declareWithError: e].
	e entityRef ref
		ifNil: [self declareWithError: e]
		ifNotNil: [
			e ref
				ifNil: [self declareWithError: e.
					inversedEntity := e entityRef ref.
					invKey := e name asUppercase.
					invertedAttr := inversedEntity inheritedAttributesReverseDetect: [:attr | attr name asUppercase = invKey].
					e ref: invertedAttr.
					invertedAttr notNil
						ifTrue: [self declareWithoutError: e]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptConstantDefinition: e [ 
	super acceptConstantDefinition: e.
	e domain
		ifNotNil: [(e domain isPltNamedTypeReference
					and: [e domain ref notNil])
				ifTrue: [e domain: e domain ref referenceOnSelf]].
	e metaConcept acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptDefinedType: e [ 
	super acceptDefinedType: e.
	e metaConcept acceptTry: self.
	e domain
		ifNotNil: [(e domain isPltNamedTypeReference
					and: [e domain ref notNil])
				ifTrue: [e domain: e domain ref referenceOnSelf]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptDerivedAttribute: e [ 
	self acceptAttribute: e.
	super acceptDerivedAttribute: e.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptDictionaryInstanceReference: e [ 
	| found |
	resolutionPass = 1
		ifTrue: [
			e setRef: nil.
			self declareWithError: e].
	e ref ifNil: [
		(found := self lookUpIdentifierBN: e name) ifNil: [found := self lookUpNamedTypeBN: e name].
		e setRef: found.
		found
			ifNil: [self declareWithError: e]
			ifNotNil: [self declareWithoutError: e]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptDomainEquivalentItem: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptEntityDefinition: e [ 
	| sup |
	self logInfo: '	', e class name , ': ' , e name.
	super acceptEntityDefinition: e.
	resolutionPass = 1 
		ifTrue: [e destroySubtypes]
		ifFalse: 
			[1 to: e supertypes size
				do: 
					[:pos | 
					sup := e supertypes at: pos.
					sup isPltEntityDefinitionReference 
						ifFalse: 
							[sup ref ifNotNil: 
									[sup ref isPltEntityDefinition 
										ifTrue: [e supertypes at: pos put: sup ref referenceOnSelf]
										ifFalse: 
											[sup ref: nil.
											self declareWithError: sup]]]].
			e updateSupertypes].
	e metaConcept acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptEntityInstancesSet: e [ 
	
	^ self acceptTry: e entityRef
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptEscapedExpression: e [ 
	| resolver |
	self parent
		ifNil: [super acceptEscapedExpression: e]
		ifNotNil: [
			e acceptTry: (resolver := self parent copy). 
			resolver objectsWithErrorIndex addAll: self objectsWithErrorIndex]

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptExplicitAttribute: e [ 
	self acceptAttribute: e.
	super acceptExplicitAttribute: e.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptExternalMetaSchema: e [
	self acceptExternalSchema: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptExternalSchema: e [ 
	| chosen |
	resolutionPass = 1
		ifTrue: [
			e nativeSchema: nil.
			self declareWithError: e].
	e nativeSchema: (e schemaInstance lookUpSchemaDefinitionBN: e name).
	e nativeSchema ifNil: [
		(chosen := self interactivelyResolvedSchemaNamed: e name) isNil
			ifFalse: [
				self schemaInstance tamarisItemRef
					ifNotNil: [:tamRef | 
						tamRef insertLinkReferenceFrom: chosen.
						e nativeSchema: (e schemaInstance lookUpSchemaDefinitionBN: e name)].
						e nativeSchema ifNil: [^ self declareWithError: e]]].
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptFunctionDeclaration: e [ 
	super acceptFunctionDeclaration: e.
	e returnType
		ifNotNil: [(e returnType isPltNamedTypeReference
					and: [e returnType ref notNil])
				ifTrue: [e returnType: e returnType ref referenceOnSelf]].
	e metaConcept acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptGlobalRule: e [ 
	super acceptGlobalRule: e.
	e metaConcept acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptIdentifier: e [ 
	| found |
	resolutionPass = 1
		ifTrue: [
			e setRef: nil.
			self declareWithError: e]
		ifFalse: [
			e ref ifNil: [
				e parameters
					ifNil: [(found := self lookUpIdentifierBN: e name) ifNil: [found := self lookUpNamedTypeBN: e name]]
					ifNotNil: [found := self lookUpFunctionCallOrConstructorNamed: e name].
			e setRef: found.
			found
				ifNil: [self declareWithError: e]
				ifNotNil: [
					((found isPltFunctionDeclaration or: [found isPltEntityDefinition]) and: [e parameters isNil])
						ifTrue: [e parameters: #()].
					self declareWithoutError: e]]].
	e parameters acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptIncludeSchema: e [
	self acceptExternalSchema: e 

]

{ #category : #'visit population schema' }
PlatypusExpressResolver >> acceptInternalRepresentation: e [ 
	^ e definition acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptInverseAttribute: e [ 
	self acceptTry: e invertedAttr.
	self acceptAttribute: e.
	self acceptTry: e domain.
	super acceptInverseAttribute: e.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptLocalVariable: e [ 
	super acceptLocalVariable: e.
	e domain
		ifNotNil: [(e domain isPltNamedTypeReference
					and: [e domain ref notNil])
				ifTrue: [e domain: e domain ref referenceOnSelf]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptMetaConceptDefinition: e [ 
	| result metaResolContext |
	resolutionPass = 1
		ifTrue: [self declareWithError: e]
		ifFalse: [ | resolver | 
				e haveError
				ifTrue: [metaResolContext := OrderedCollection new.
					metaResolContext addAll: self schemaInstance metaSchemata asArray.
					metaResolContext add: e definition class platypusMetaData.			
					resolver := self new visitContexts: metaResolContext parent: self.
					result := resolver checks: e metaExpression.
					result haveError
						ifTrue: [
							self declareWithError: e.
							e updateExpression.
							self objectsWithErrorIndex addAll: result objectsWithErrorIndex]
						ifFalse: [e haveError: false]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptMetaMappingDefinition: e [ 
	| result metaResolContext |
	resolutionPass = 1
		ifTrue: [
			self declareWithError: e.
			e haveError: true]
		ifFalse: [
			e haveError
				ifTrue: [
					e definition: (self lookUpPath: e definitionPath).
					e definition isNil
						ifTrue: [self declareWithError: e]
						ifFalse: [ | resolver |
							metaResolContext := OrderedCollection new.
							metaResolContext addAll: self schemaInstance metaSchemata asArray.
							metaResolContext add: e definition class platypusMetaData.
							resolver := PlatypusExpressResolver new visitContexts: metaResolContext parent: self.
							result := resolver checks: e metaExpression.
							result haveError
								ifTrue: [
									e updateExpression.
									self objectsWithErrorIndex addAll: result objectsWithErrorIndex]
								ifFalse: [e haveError: false]]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptMetaMappingRule: e [ 
	| result metaResolContext |
	resolutionPass = 1
		ifTrue: [self declareWithError: e.
			e haveError: true]
		ifFalse: [e haveError
				ifTrue: [ | resolver |
					metaResolContext := OrderedCollection new.
					metaResolContext addAll: self schemaInstance metaSchemata asArray.
					resolver := PlatypusExpressResolver new visitContexts: metaResolContext parent: self.
					result := resolver checks: e metaExpression.
					result haveError
						ifTrue: [
							e updateExpression.
							self objectsWithErrorIndex addAll: result objectsWithErrorIndex]
						ifFalse: [e haveError: false].
					result := resolver checks: e metaCondition.
					result haveError
						ifTrue: [
							e haveError: true.
							e updateCondition.
							self objectsWithErrorIndex addAll: result objectsWithErrorIndex]
						ifFalse: [e haveError: false]]]
]

{ #category : #'visit environment schema' }
PlatypusExpressResolver >> acceptModelContents: e [

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptNamedTypeReference: e [ 
	| found |
	resolutionPass = 1
		ifTrue: [
			e setRef: nil.
			self declareWithError: e].
	(found := e ref) ifNil: [e setRef: (found := self lookUpNamedTypeBN: e name).
	found
		ifNil: [self declareWithError: e]
		ifNotNil: [self declareWithoutError: e]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptParameterDefinition: e [ 
	super acceptParameterDefinition: e.
	e domain
		ifNotNil: [(e domain isPltNamedTypeReference
					and: [e domain ref notNil])
				ifTrue: [e domain: e domain ref referenceOnSelf]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptProcedureDeclaration: e [ 
	super acceptProcedureDeclaration: e.
	e metaConcept acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptQualifiedExpression: e [ 
	| qual enumVal refed |
	e head referenced ~= e head
		ifTrue: [e head ref: nil].
	super acceptQualifiedExpression: e.
	e head referenced
		ifNil: [e head
				ref: (self lookUpNamedTypeBN: e head name).
			e head referenced
				ifNil: [self declareWithError: e head]
				ifNotNil: [self declareWithoutError: e head]].
	((refed := e head referenced) notNil
			and: [refed isPltDefinedType
					and: [e qualifiers size = 1]])
		ifTrue: [qual := e qualifiers first.
			qual isPltEnumerationValue
				ifFalse: [self declareWithError: qual.
					(refed hasEnumerationElementNamed: qual name)
						ifTrue: [enumVal := PltEnumerationValue
										domain: (PltDefinedTypeReference ref: refed)
										element: qual name.

							self declareWithoutError: qual.
							e qualifiers at: 1 put: enumVal]]].
	(e head isPltNamedTypeReference
			and: [e head ref notNil])
		ifTrue: [e head: e domain ref referenceOnSelf]
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptQueryExpression: e [ 
	super acceptQueryExpression: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptRemarkReference: e [ 
	| refed prefRefed |
	super acceptRemarkReference: e.
	e inside name asUppercase = e prefix asUppercase
		ifTrue: [e suffix
				ifNil: [refed := e inside referenced]
				ifNotNil: [(refed := self lookUp: e suffix from: e inside referenced)
						ifNil: [refed := self lookUp: e suffix from: e inside referenced owner]]]
		ifFalse: [(prefRefed := (self lookUp: e prefix from: e inside referenced)
						ifNil: [self lookUp: e prefix from: e inside referenced owner])
				ifNotNil: [e suffix
						ifNil: [refed := prefRefed]
						ifNotNil: [refed := self lookUp: e suffix from: prefRefed]]].
	refed
		ifNil: [self declareWithError: e]
		ifNotNil: [self declareWithoutError: e.
			e referenced: PltDictionaryInstanceReference new.
			e referenced name: refed name.
			e referenced ref: refed]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptSchemaDefinition: e [
	self logInfo: 'schema ' , e name.
	super acceptSchemaDefinition: e.
	e metaConcept acceptTry: self
]

{ #category : #'visit environment schema' }
PlatypusExpressResolver >> acceptSchemaInstance: e [ 
	resolutionPass <= 1
		ifTrue: [
			e internalSchemata
				do: [:sch | sch rebuildLocalCaches]].
	e internalSchemata
		do: [:sch | 
			sch dataInterface
				do: [:int | 
					int implicitlyImportedItems: OrderedCollection new.
					self acceptTry: int]].
	e internalSchemata acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptSelectType: e [ 
	| sel |
	super acceptSelectType: e.
	1
		to: e selections size
		do: [:pos | 
			sel := e selections at: pos.
			(sel  isPltNamedTypeReference
					and: [sel ref notNil])
				ifTrue: [e selections at: pos put: sel ref referenceOnSelf]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptSelfIdentifier: e [ 

]

{ #category : #'visit population schema' }
PlatypusExpressResolver >> acceptSimpleRecord: e [ 
	^ e definition acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptSubEntityRefExpression: e [ 
	super acceptSubEntityRefExpression: e.
	(e entityRef notNil
			and: [e entityRef isPltNamedTypeReference
			and: [e entityRef ref notNil]])
		ifTrue: [e entityRef: e entityRef ref referenceOnSelf]
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> acceptTry: e [
	e removeCachedDomain.
	^ super acceptTry: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressResolver >> acceptUniquenessRuleAttributeIdentifier: e [ 
	| redclEntity ruleAttribute |
	e groupRefName
		ifNil: [^ self acceptIdentifier: e].
	resolutionPass = 1
		ifTrue: [e setRef: nil.
			self declareWithError: e]
		ifFalse: [e ref ifNil: [(redclEntity := self lookUpNamedTypeBN: e groupRefName)
				ifNil: [e ref: nil.
					self declareWithError: e]
				ifNotNil: [(ruleAttribute := redclEntity attributeBN: e name)
						ifNil: [self declareWithError: e]
						ifNotNil: [e ref: ruleAttribute.
							self declareWithoutError: e]]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressResolver >> acceptUnresolvedSymbol: e [
	resolutionPass > 1
		ifTrue: [
			e token = 'schema_definition' ifTrue: [self halt].
			(e resolvesFrom: self)
				ifFalse: [self declareWithError: e] ]

]

{ #category : #'visit generic' }
PlatypusExpressResolver >> checks: aMetaData [ 
	self checksAll: (Array with: aMetaData)
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> checksAll: aCollection [ 
	| stop prevErrsSet currErrsSet |
	resolutionPass := 1.
	aCollection do: [:e | e acceptTry: self].
	prevErrsSet := IdentitySet new.
	currErrsSet := IdentitySet new.
	[
		resolutionPass := resolutionPass + 1.
		currErrsSet addAll: self objectsWithErrorIndex.
		aCollection acceptTry: self.
		(stop := resolutionPass > 4 and: [(prevErrsSet difference: currErrsSet) isEmpty])
			ifFalse: [
				prevErrsSet addAll: currErrsSet.
				self forget].
		stop] whileFalse.
		self objectsWithErrorIndex do: [:k | 
			self registerError: (PlatypusExpressResolverError metaData: k message: 'unresolved symbol')].

]

{ #category : #accessing }
PlatypusExpressResolver >> interactivelyResolvedSchemaNamed: aName [ 
	| key |
	key := aName asUppercase .
	^ PlatypusSchemaInstanceReference 
		interactivelyResolvedSchemaSatisfying: [:r | 
			r name asUppercase = key] message: '''', aName,''' is for ?'.

]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUp: anIdent [ 
	| found |
	(found := self lookUpIdentifierBN: anIdent) isNil
		ifTrue: [found := self lookUpNamedTypeBN: anIdent].
	^ found
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUp: ident from: aMetaData [ 
	^ aMetaData isNil
		ifFalse: [(aMetaData lookUpIdentifierBN: ident)
				ifNil: [(aMetaData lookUpNamedTypeBN: ident)
						ifNil: [aMetaData name asUppercase = ident asUppercase
								ifTrue: [aMetaData]]]]
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUpFunctionCallOrConstructorNamed: aName [ 
	| found |
	found := self lookUpIdentifierBN: aName.
	(found isNil
			or: [found isPltAlgorithmDeclaration not])
		ifTrue: [found := self lookUpNamedTypeBN: aName].
	^ found
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUpIdentifierBN: aName [ 
	| found |
	resolutionPass = 1 ifTrue: [self halt].
	visitPath reverseDo: 
			[:el | el ifNotNil: [
			el isPltSchemaInstance 
				ifFalse: [(found := el lookUpIdentifierBN: aName) ifNotNil: [^ found]]]].
	^ PltPlatypusExpressPrimitivesSchemaInstance lookUpIdentifierBN: aName
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUpNamedTypeBN: aName [ 
	| found |
	visitPath
		reverseDo: [:el | el 
			ifNotNil: [el isPltSchemaInstance
				ifFalse: [(found := el lookUpNamedTypeBN: aName)
						ifNotNil: [^ found]]]].
		^ PltPlatypusExpressPrimitivesSchemaInstance lookUpNamedTypeBN: aName
]

{ #category : #'visit generic' }
PlatypusExpressResolver >> lookUpPath: aListOfString [ 
	| ident found path key |
	ident := aListOfString first.
	key := ident asUppercase.
	found := self schemaInstance allSchemata
				detect: [:schi | schi notNil and: [key = schi key]]
				ifNone: [self lookUp: ident].
	path := aListOfString allButFirst.
	[path isEmpty
		or: [found isNil]]
		whileFalse: [found := self lookUp: path first from: found.
			path := path allButFirst].
	^ found
]

{ #category : #accessing }
PlatypusExpressResolver >> parent [
	^ parent
]

{ #category : #accessing }
PlatypusExpressResolver >> parent: aResolver [
	parent := aResolver
]

{ #category : #accessing }
PlatypusExpressResolver >> visitContexts: aCollection parent: aResolver [
	super visitContexts: aCollection.
	self parent: aResolver

]
