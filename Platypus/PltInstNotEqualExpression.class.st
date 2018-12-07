"
<ISO10303-11-EXPRESS>
ENTITY inst_not_equal_expression 
	SUBTYPE OF ( inst_comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInstNotEqualExpression,
	#superclass : #PltInstComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInstNotEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstNotEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstNotEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstNotEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstNotEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstNotEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstNotEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInstNotEqualExpression >> accept: aVisitor [
  ^aVisitor acceptInstNotEqualExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> fromValues: values [
  ^self instNotEqualExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInstNotEqualExpression >> instNotEqualExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> instNotEqualExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> instNotEqualExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInstNotEqualExpression >> isPltInstNotEqualExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> localFromValues: values [
  ^self instNotEqualExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> localToValues: values [
  ^self instNotEqualExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInstNotEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInstNotEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self instNotEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInstNotEqualExpression >> pltLocalCopyTo: another [
  self instNotEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInstNotEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInstNotEqualExpression >> toValues: values [
  ^self instNotEqualExpressionToValues: (super toValues: values)


]
