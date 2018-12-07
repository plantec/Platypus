Class {
	#name : #PlatypusModelContentsResolver,
	#superclass : #PlatypusModelContentsChecker,
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit dictionary schema' }
PlatypusModelContentsResolver >> acceptDefinedTypeReference: e [ 
	| found |
	e setRef: (found := self modelContents lookUpNamedTypeBN: e name).
	found
		ifNil: [self declareWithError: e]
		ifNotNil: [self declareWithoutError: e]
]

{ #category : #'visit dictionary schema' }
PlatypusModelContentsResolver >> acceptEntityDefinitionReference: e [ 
	| found chosen |
	e setRef: (found := self modelContents lookUpEntityDefinitionBN: e name).
	found
		ifNil: [(chosen := self interactivelyResolvedSchemaOwningEntityNamed: e name) isNil
				ifFalse: [self schemaInstance ifNotNil: [:schi | schi tamarisItemRef insertLinkReferenceFrom: chosen] ].
			e setRef: (found := self modelContents lookUpEntityDefinitionBN: e name).
			found
				ifNil: [self declareWithError: e]]
		ifNotNil: [self declareWithoutError: e]
]

{ #category : #'visit dictionary schema' }
PlatypusModelContentsResolver >> acceptEntityInstanceReference: e [ 
	| found |
	e
		ref: (found := self instanceLabelled: e persistentLabel).
	found
		ifNil: [self declareWithError: e]
		ifNotNil: [self declareWithoutError: e]
]

{ #category : #'visit population schema' }
PlatypusModelContentsResolver >> acceptEnumerationValue: e [ 
	super acceptEnumerationValue: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsResolver >> acceptInternalRepresentation: e [ 
	e definition acceptTry: self.
	(e definition isPltEntityDefinitionReference
			and: [e definition ref notNil])
		ifTrue: [e definition: e definition ref referenceOnSelf].
	super acceptInternalRepresentation: e
]

{ #category : #'visit environment schema' }
PlatypusModelContentsResolver >> acceptModelContents: e [ 
	self modelContents: e.
	e dataInstances
		do: [:v | v acceptTry: self]

]

{ #category : #'visit population schema' }
PlatypusModelContentsResolver >> acceptSimpleRecord: e [ 
	e definition acceptTry: self.
	(e definition isPltEntityDefinitionReference
			and: [e definition ref notNil])
		ifTrue: [e definition: e definition ref referenceOnSelf].
	super acceptSimpleRecord: e
]

{ #category : #'visit generic' }
PlatypusModelContentsResolver >> acceptTry: e [ 
	e isPltExpression ifTrue: [e removeCachedDomain].
	^ super acceptTry: e
]

{ #category : #accessing }
PlatypusModelContentsResolver >> checks: aMetaData [ 
	aMetaData acceptTry: self.
	self objectsWithErrorIndex do: [:k | 
		self registerError: (PlatypusModelContentsResolverError metaData: k message:  'unresolved symbol')].

]

{ #category : #accessing }
PlatypusModelContentsResolver >> instanceLabelled:  persistentLabel [ 
	^ modelContents instanceLabelled: persistentLabel
]

{ #category : #'visit generic' }
PlatypusModelContentsResolver >> interactivelyResolvedSchemaOwningEntityNamed: aName [ 
	| found |
	^ PlatypusSchemaInstanceReference
		interactivelyResolvedSchemaSatisfying: [:r | 
			(found := (r metaData lookUpNamedTypeBN: aName)) notNil 
				and: [found schemaDefinition isNil or: [r metaData = found schemaDefinition]]]
		message: '''' , aName , ''' is inside ?'
]
