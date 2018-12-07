"
<ISO10303-11-EXPRESS>
ENTITY inst_equal_expression 
	SUBTYPE OF ( inst_comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInstEqualExpression,
	#superclass : #PltInstComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInstEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInstEqualExpression >> accept: aVisitor [
  ^aVisitor acceptInstEqualExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> fromValues: values [
  ^self instEqualExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInstEqualExpression >> instEqualExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> instEqualExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> instEqualExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInstEqualExpression >> isPltInstEqualExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> localFromValues: values [
  ^self instEqualExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> localToValues: values [
  ^self instEqualExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInstEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInstEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self instEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInstEqualExpression >> pltLocalCopyTo: another [
  self instEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInstEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInstEqualExpression >> toValues: values [
  ^self instEqualExpressionToValues: (super toValues: values)


]
