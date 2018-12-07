"
<ISO10303-11-EXPRESS>
ENTITY less_than_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLessThanExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLessThanExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessThanExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessThanExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessThanExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessThanExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessThanExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessThanExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLessThanExpression >> accept: aVisitor [
  ^aVisitor acceptLessThanExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> fromValues: values [
  ^self lessThanExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLessThanExpression >> isPltLessThanExpression [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltLessThanExpression >> lessThanExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> lessThanExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> lessThanExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> localFromValues: values [
  ^self lessThanExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> localToValues: values [
  ^self lessThanExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLessThanExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLessThanExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self lessThanExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLessThanExpression >> pltLocalCopyTo: another [
  self lessThanExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLessThanExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLessThanExpression >> toValues: values [
  ^self lessThanExpressionToValues: (super toValues: values)


]
