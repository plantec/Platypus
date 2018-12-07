Class {
	#name : #PlatypusPostLoader,
	#superclass : #Object,
	#category : #PlatypusPostLoad
}

{ #category : #'class initialization' }
PlatypusPostLoader class >> initialize [
	PltPlatypusMetaSchemasSchemaInstance bootstraps.
	PltPlatypusExpressPrimitivesSchemaInstance bootstraps.
	PlatypusInternalMetaSchemaInstanceReference initializeExpressMetaDictionaryIfNeeded.
	PlatypusInternalPrimitiveSchemaInstanceReference initializeExpressPrimitiveDictionaryIfNeeded.
]
