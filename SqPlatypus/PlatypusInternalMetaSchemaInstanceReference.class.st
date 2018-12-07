Class {
	#name : #PlatypusInternalMetaSchemaInstanceReference,
	#superclass : #PlatypusSchemaInstanceReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference class >> expressMetaDictionary [ ^ self initializeExpressMetaDictionaryIfNeeded 
]

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference class >> expressMetaDictionaryName [ ^ 'Platypus_meta_schemas' 
]

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference class >> expressMetaSchemasCode [ ^ PltPlatypusMetaSchemasSchemaInstance singleton expressSchemaCode 
]

{ #category : #initializing }
PlatypusInternalMetaSchemaInstanceReference class >> initializeExpressMetaDictionary [
	"self initializeExpressMetaDictionary"

	| newref |
	newref := self schemaInstanceNamed: self expressMetaDictionaryName.
	TamManager platypusMetaDefaultTaxon insertReference: newref.
	newref accept: self expressMetaSchemasCode notifying: nil.
	^ newref
]

{ #category : #initializing }
PlatypusInternalMetaSchemaInstanceReference class >> initializeExpressMetaDictionaryIfNeeded [
	"self initializeExpressMetaDictionaryIfNeeded"
	| candidats |
	(candidats := self allSchemaInstanceReferencesNamed: self expressMetaDictionaryName) size > 1
		ifTrue: [self error: 'Several meta schemas ??'].
	candidats isEmpty
		ifTrue: [^ self initializeExpressMetaDictionary]
		ifFalse: [^ candidats first] 
]

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference class >> lookUpExpressMetaDictionary [
	^ self allInstances copy detect: [:epd | epd isMetaSchemaInstanceReference]
		ifNone: []
]

{ #category : #copying }
PlatypusInternalMetaSchemaInstanceReference >> copy [ ^ self error: 'can''t copy a meta dictionary reference' 
]

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference >> expressParserClassName [ ^ #PlatypusExpressPrimitiveParser 
]

{ #category : #testing }
PlatypusInternalMetaSchemaInstanceReference >> isExpressMetaDictionary [ ^ self isReleased not and: [ self name = self class expressMetaDictionaryName ] 
]

{ #category : #accessing }
PlatypusInternalMetaSchemaInstanceReference >> namesBuilder [
	^ PlatypusNamesBuilder meta
]
