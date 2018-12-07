"
<ISO10303-11-EXPRESS>
ENTITY comparison_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( logical_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltComparisonExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltComparisonExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltComparisonExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltComparisonExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltComparisonExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltComparisonExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltComparisonExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltComparisonExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltComparisonExpression >> accept: aVisitor [
  ^aVisitor acceptComparisonExpression: self


]

{ #category : #'platypus-generated-copying' }
PltComparisonExpression >> comparisonExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> comparisonExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> comparisonExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> fromValues: values [
  ^self comparisonExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltComparisonExpression >> isPltComparisonExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> localFromValues: values [
  ^self comparisonExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> localToValues: values [
  ^self comparisonExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltComparisonExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltComparisonExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self comparisonExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltComparisonExpression >> pltLocalCopyTo: another [
  self comparisonExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltComparisonExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltComparisonExpression >> toValues: values [
  ^self comparisonExpressionToValues: (super toValues: values)


]
