"
<ISO10303-11-EXPRESS>
ENTITY mult_expression 
	SUBTYPE OF ( arithmetic_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := '*';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMultExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltMultExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltMultExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMultExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMultExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMultExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMultExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMultExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMultExpression >> accept: aVisitor [
  ^aVisitor acceptMultExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> fromValues: values [
  ^self multExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMultExpression >> isPltMultExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> localFromValues: values [
  ^self multExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> localToValues: values [
  ^self multExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltMultExpression >> multExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> multExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> multExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-deriving' }
PltMultExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltMultExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltMultExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'*'


]

{ #category : #'platypus-generated-copying' }
PltMultExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMultExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self multExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMultExpression >> pltLocalCopyTo: another [
  self multExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltMultExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltMultExpression >> toValues: values [
  ^self multExpressionToValues: (super toValues: values)


]
