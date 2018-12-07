"
<ISO10303-11-EXPRESS>
ENTITY positive_expression 
	SUBTYPE OF ( simple_unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPositiveExpression,
	#superclass : #PltSimpleUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltPositiveExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltPositiveExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPositiveExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPositiveExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPositiveExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltPositiveExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPositiveExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltPositiveExpression >> accept: aVisitor [
  ^aVisitor acceptPositiveExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> fromValues: values [
  ^self positiveExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltPositiveExpression >> isPltPositiveExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> localFromValues: values [
  ^self positiveExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> localToValues: values [
  ^self positiveExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltPositiveExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltPositiveExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self positiveExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPositiveExpression >> pltLocalCopyTo: another [
  self positiveExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPositiveExpression >> positiveExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> positiveExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> positiveExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltPositiveExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltPositiveExpression >> toValues: values [
  ^self positiveExpressionToValues: (super toValues: values)


]
