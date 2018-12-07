"
<ISO10303-11-EXPRESS>
ENTITY simple_type 
	ABSTRACT SUPERTYPE OF ( ONEOF ( string_type, binary_type, logical_type, number_type ) ) 
	SUBTYPE OF ( dictionary_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSimpleType,
	#superclass : #PltDictionaryInstance,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSimpleType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSimpleType >> accept: aVisitor [
  ^aVisitor acceptSimpleType: self


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> fromValues: values [
  ^self simpleTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSimpleType >> isPltSimpleType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> localFromValues: values [
  ^self simpleTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> localToValues: values [
  ^self simpleTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSimpleType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSimpleType >> pltCopyTo: another [
  super pltCopyTo: another.
  self simpleTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSimpleType >> pltLocalCopyTo: another [
  self simpleTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSimpleType >> simpleTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> simpleTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> simpleTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSimpleType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleType >> toValues: values [
  ^self simpleTypeToValues: (super toValues: values)


]
