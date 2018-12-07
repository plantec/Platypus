"
<ISO10303-11-EXPRESS>
ENTITY less_equal_expression 
	SUBTYPE OF ( comparison_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLessEqualExpression,
	#superclass : #PltComparisonExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLessEqualExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessEqualExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessEqualExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessEqualExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLessEqualExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessEqualExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLessEqualExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLessEqualExpression >> accept: aVisitor [
  ^aVisitor acceptLessEqualExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> fromValues: values [
  ^self lessEqualExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLessEqualExpression >> isPltLessEqualExpression [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltLessEqualExpression >> lessEqualExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> lessEqualExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> lessEqualExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> localFromValues: values [
  ^self lessEqualExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> localToValues: values [
  ^self lessEqualExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLessEqualExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLessEqualExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self lessEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLessEqualExpression >> pltLocalCopyTo: another [
  self lessEqualExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLessEqualExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLessEqualExpression >> toValues: values [
  ^self lessEqualExpressionToValues: (super toValues: values)


]
