"
<ISO10303-11-EXPRESS>
ENTITY greater_than_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGreaterThanExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGreaterThanExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterThanExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterThanExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterThanExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterThanExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterThanExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterThanExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGreaterThanExpression >> accept: aVisitor [
  ^aVisitor acceptGreaterThanExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> fromValues: values [
  ^self greaterThanExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGreaterThanExpression >> greaterThanExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> greaterThanExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> greaterThanExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGreaterThanExpression >> isPltGreaterThanExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> localFromValues: values [
  ^self greaterThanExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> localToValues: values [
  ^self greaterThanExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGreaterThanExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGreaterThanExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self greaterThanExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGreaterThanExpression >> pltLocalCopyTo: another [
  self greaterThanExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltGreaterThanExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterThanExpression >> toValues: values [
  ^self greaterThanExpressionToValues: (super toValues: values)


]
