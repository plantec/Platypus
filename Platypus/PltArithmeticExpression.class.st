"
<ISO10303-11-EXPRESS>
ENTITY arithmetic_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( binary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltArithmeticExpression,
	#superclass : #PltBinaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltArithmeticExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltArithmeticExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArithmeticExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArithmeticExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArithmeticExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltArithmeticExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltArithmeticExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltArithmeticExpression >> accept: aVisitor [
  ^aVisitor acceptArithmeticExpression: self


]

{ #category : #'platypus-generated-copying' }
PltArithmeticExpression >> arithmeticExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> arithmeticExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> arithmeticExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> fromValues: values [
  ^self arithmeticExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltArithmeticExpression >> isPltArithmeticExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> localFromValues: values [
  ^self arithmeticExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> localToValues: values [
  ^self arithmeticExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltArithmeticExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltArithmeticExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self arithmeticExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltArithmeticExpression >> pltLocalCopyTo: another [
  self arithmeticExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltArithmeticExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltArithmeticExpression >> toValues: values [
  ^self arithmeticExpressionToValues: (super toValues: values)


]
