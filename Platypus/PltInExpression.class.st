"
<ISO10303-11-EXPRESS>
ENTITY in_expression 
	SUBTYPE OF ( logical_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInExpression >> accept: aVisitor [
  ^aVisitor acceptInExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> fromValues: values [
  ^self inExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInExpression >> inExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> inExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> inExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInExpression >> isPltInExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> localFromValues: values [
  ^self inExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> localToValues: values [
  ^self inExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self inExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInExpression >> pltLocalCopyTo: another [
  self inExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInExpression >> toValues: values [
  ^self inExpressionToValues: (super toValues: values)


]
