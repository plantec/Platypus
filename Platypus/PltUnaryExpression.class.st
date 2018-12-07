"
<ISO10303-11-EXPRESS>
ENTITY unary_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUnaryExpression,
	#superclass : #PltExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUnaryExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnaryExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnaryExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnaryExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnaryExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnaryExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnaryExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUnaryExpression >> accept: aVisitor [
  ^aVisitor acceptUnaryExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> fromValues: values [
  ^self unaryExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUnaryExpression >> isPltUnaryExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> localFromValues: values [
  ^self unaryExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> localToValues: values [
  ^self unaryExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltUnaryExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUnaryExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self unaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUnaryExpression >> pltLocalCopyTo: another [
  self unaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltUnaryExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> toValues: values [
  ^self unaryExpressionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUnaryExpression >> unaryExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> unaryExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUnaryExpression >> unaryExpressionToValues: values [
  ^values


]
