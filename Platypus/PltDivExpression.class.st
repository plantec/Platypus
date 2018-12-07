"
<ISO10303-11-EXPRESS>
ENTITY div_expression 
	SUBTYPE OF ( arithmetic_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := '/';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDivExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDivExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDivExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDivExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDivExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDivExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDivExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDivExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDivExpression >> accept: aVisitor [
  ^aVisitor acceptDivExpression: self


]

{ #category : #'platypus-generated-copying' }
PltDivExpression >> divExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> divExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> divExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> fromValues: values [
  ^self divExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltDivExpression >> isPltDivExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> localFromValues: values [
  ^self divExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> localToValues: values [
  ^self divExpressionToValues: values


]

{ #category : #'platypus-generated-deriving' }
PltDivExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDivExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDivExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'/'


]

{ #category : #'platypus-generated-copying' }
PltDivExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDivExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self divExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDivExpression >> pltLocalCopyTo: another [
  self divExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltDivExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltDivExpression >> toValues: values [
  ^self divExpressionToValues: (super toValues: values)


]
