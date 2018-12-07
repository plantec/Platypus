"
<ISO10303-11-EXPRESS>
ENTITY negative_expression 
	SUBTYPE OF ( simple_unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNegativeExpression,
	#superclass : #PltSimpleUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNegativeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNegativeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNegativeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNegativeExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNegativeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNegativeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNegativeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNegativeExpression >> accept: aVisitor [
  ^aVisitor acceptNegativeExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> fromValues: values [
  ^self negativeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNegativeExpression >> isPltNegativeExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> localFromValues: values [
  ^self negativeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> localToValues: values [
  ^self negativeExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNegativeExpression >> negativeExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> negativeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> negativeExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNegativeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNegativeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self negativeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNegativeExpression >> pltLocalCopyTo: another [
  self negativeExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNegativeExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNegativeExpression >> toValues: values [
  ^self negativeExpressionToValues: (super toValues: values)


]
