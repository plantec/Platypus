"
<ISO10303-11-EXPRESS>
ENTITY plus_expression 
	SUBTYPE OF ( arithmetic_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := '+';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlusExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltPlusExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlusExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlusExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlusExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlusExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlusExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlusExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltPlusExpression >> accept: aVisitor [
  ^aVisitor acceptPlusExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> fromValues: values [
  ^self plusExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltPlusExpression >> isPltPlusExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> localFromValues: values [
  ^self plusExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> localToValues: values [
  ^self plusExpressionToValues: values


]

{ #category : #'platypus-generated-deriving' }
PltPlusExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltPlusExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltPlusExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'+'


]

{ #category : #'platypus-generated-copying' }
PltPlusExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltPlusExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self plusExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPlusExpression >> pltLocalCopyTo: another [
  self plusExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPlusExpression >> plusExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> plusExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> plusExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltPlusExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltPlusExpression >> toValues: values [
  ^self plusExpressionToValues: (super toValues: values)


]
