"
<ISO10303-11-EXPRESS>
ENTITY not_equal_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNotEqualExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNotEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNotEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNotEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNotEqualExpression >> accept: aVisitor [
  ^aVisitor acceptNotEqualExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> fromValues: values [
  ^self notEqualExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNotEqualExpression >> isPltNotEqualExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> localFromValues: values [
  ^self notEqualExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> localToValues: values [
  ^self notEqualExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNotEqualExpression >> notEqualExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> notEqualExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> notEqualExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNotEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNotEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self notEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNotEqualExpression >> pltLocalCopyTo: another [
  self notEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNotEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNotEqualExpression >> toValues: values [
  ^self notEqualExpressionToValues: (super toValues: values)


]
