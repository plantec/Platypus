"
<ISO10303-11-EXPRESS>
ENTITY equal_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEqualExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEqualExpression >> accept: aVisitor [
  ^aVisitor acceptEqualExpression: self


]

{ #category : #'platypus-generated-copying' }
PltEqualExpression >> equalExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> equalExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> equalExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> fromValues: values [
  ^self equalExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEqualExpression >> isPltEqualExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> localFromValues: values [
  ^self equalExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> localToValues: values [
  ^self equalExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self equalExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEqualExpression >> pltLocalCopyTo: another [
  self equalExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltEqualExpression >> toValues: values [
  ^self equalExpressionToValues: (super toValues: values)


]
