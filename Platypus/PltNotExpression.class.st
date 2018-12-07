"
<ISO10303-11-EXPRESS>
ENTITY not_expression 
	SUBTYPE OF ( simple_unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNotExpression,
	#superclass : #PltSimpleUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNotExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNotExpression >> accept: aVisitor [
  ^aVisitor acceptNotExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> fromValues: values [
  ^self notExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNotExpression >> isPltNotExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> localFromValues: values [
  ^self notExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> localToValues: values [
  ^self notExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNotExpression >> notExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> notExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> notExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNotExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNotExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self notExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNotExpression >> pltLocalCopyTo: another [
  self notExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNotExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNotExpression >> toValues: values [
  ^self notExpressionToValues: (super toValues: values)


]
