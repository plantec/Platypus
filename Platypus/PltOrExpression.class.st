"
<ISO10303-11-EXPRESS>
ENTITY or_expression 
	SUBTYPE OF ( logical_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := 'OR';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltOrExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltOrExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltOrExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOrExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOrExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOrExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltOrExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltOrExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltOrExpression >> accept: aVisitor [
  ^aVisitor acceptOrExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> fromValues: values [
  ^self orExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltOrExpression >> isPltOrExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> localFromValues: values [
  ^self orExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> localToValues: values [
  ^self orExpressionToValues: values


]

{ #category : #'platypus-generated-deriving' }
PltOrExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltOrExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltOrExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'OR'


]

{ #category : #'platypus-generated-copying' }
PltOrExpression >> orExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> orExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> orExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltOrExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltOrExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self orExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltOrExpression >> pltLocalCopyTo: another [
  self orExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltOrExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltOrExpression >> toValues: values [
  ^self orExpressionToValues: (super toValues: values)


]
