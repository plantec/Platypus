"
<ISO10303-11-EXPRESS>
ENTITY inst_comparison_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInstComparisonExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInstComparisonExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstComparisonExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstComparisonExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstComparisonExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstComparisonExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstComparisonExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstComparisonExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInstComparisonExpression >> accept: aVisitor [
  ^aVisitor acceptInstComparisonExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> fromValues: values [
  ^self instComparisonExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInstComparisonExpression >> instComparisonExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> instComparisonExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> instComparisonExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInstComparisonExpression >> isPltInstComparisonExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> localFromValues: values [
  ^self instComparisonExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> localToValues: values [
  ^self instComparisonExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInstComparisonExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInstComparisonExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self instComparisonExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInstComparisonExpression >> pltLocalCopyTo: another [
  self instComparisonExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInstComparisonExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInstComparisonExpression >> toValues: values [
  ^self instComparisonExpressionToValues: (super toValues: values)


]
