"
<ISO10303-11-EXPRESS>
ENTITY logical_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( binary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLogicalExpression,
	#superclass : #PltBinaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLogicalExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLogicalExpression >> accept: aVisitor [
  ^aVisitor acceptLogicalExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> fromValues: values [
  ^self logicalExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLogicalExpression >> isPltLogicalExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> localFromValues: values [
  ^self logicalExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> localToValues: values [
  ^self logicalExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLogicalExpression >> logicalExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> logicalExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> logicalExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltLogicalExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLogicalExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self logicalExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLogicalExpression >> pltLocalCopyTo: another [
  self logicalExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLogicalExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalExpression >> toValues: values [
  ^self logicalExpressionToValues: (super toValues: values)


]
