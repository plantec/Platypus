"
<ISO10303-11-EXPRESS>
ENTITY supertype_expression 
	ABSTRACT SUPERTYPE OF ( ONEOF ( sub_entity_ref_expression, binary_supertype_expression, oneof_supertype_expression ) ) 
	SUBTYPE OF ( dictionary_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSupertypeExpression,
	#superclass : #PltDictionaryInstance,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSupertypeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeExpression class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSupertypeExpression >> accept: aVisitor [
  ^aVisitor acceptSupertypeExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> fromValues: values [
  ^self supertypeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSupertypeExpression >> isPltSupertypeExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> localFromValues: values [
  ^self supertypeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> localToValues: values [
  ^self supertypeExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSupertypeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSupertypeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self supertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSupertypeExpression >> pltLocalCopyTo: another [
  self supertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltSupertypeExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-copying' }
PltSupertypeExpression >> supertypeExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> supertypeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> supertypeExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeExpression >> toValues: values [
  ^self supertypeExpressionToValues: (super toValues: values)


]
