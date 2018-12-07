"
<ISO10303-11-EXPRESS>
ENTITY xor_expression 
	SUBTYPE OF ( logical_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltXorExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltXorExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltXorExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltXorExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltXorExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltXorExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltXorExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltXorExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltXorExpression >> accept: aVisitor [
  ^aVisitor acceptXorExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> fromValues: values [
  ^self xorExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltXorExpression >> isPltXorExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> localFromValues: values [
  ^self xorExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> localToValues: values [
  ^self xorExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltXorExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltXorExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self xorExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltXorExpression >> pltLocalCopyTo: another [
  self xorExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltXorExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> toValues: values [
  ^self xorExpressionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltXorExpression >> xorExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> xorExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltXorExpression >> xorExpressionToValues: values [
  ^values


]
