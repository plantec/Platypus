"
<ISO10303-11-EXPRESS>
ENTITY minus_expression 
	SUBTYPE OF ( arithmetic_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := '-';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMinusExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltMinusExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltMinusExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMinusExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMinusExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMinusExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMinusExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMinusExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMinusExpression >> accept: aVisitor [
  ^aVisitor acceptMinusExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> fromValues: values [
  ^self minusExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMinusExpression >> isPltMinusExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> localFromValues: values [
  ^self minusExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> localToValues: values [
  ^self minusExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltMinusExpression >> minusExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> minusExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> minusExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-deriving' }
PltMinusExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltMinusExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltMinusExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'-'


]

{ #category : #'platypus-generated-copying' }
PltMinusExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMinusExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self minusExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMinusExpression >> pltLocalCopyTo: another [
  self minusExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltMinusExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltMinusExpression >> toValues: values [
  ^self minusExpressionToValues: (super toValues: values)


]
