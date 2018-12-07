"
<ISO10303-11-EXPRESS>
ENTITY greater_equal_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGreaterEqualExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGreaterEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGreaterEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGreaterEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGreaterEqualExpression >> accept: aVisitor [
  ^aVisitor acceptGreaterEqualExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> fromValues: values [
  ^self greaterEqualExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGreaterEqualExpression >> greaterEqualExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> greaterEqualExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> greaterEqualExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGreaterEqualExpression >> isPltGreaterEqualExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> localFromValues: values [
  ^self greaterEqualExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> localToValues: values [
  ^self greaterEqualExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGreaterEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGreaterEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self greaterEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGreaterEqualExpression >> pltLocalCopyTo: another [
  self greaterEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltGreaterEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltGreaterEqualExpression >> toValues: values [
  ^self greaterEqualExpressionToValues: (super toValues: values)


]
