"
<ISO10303-11-EXPRESS>
ENTITY real_div_expression 
	SUBTYPE OF ( arithmetic_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRealDivExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRealDivExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealDivExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealDivExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealDivExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealDivExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealDivExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealDivExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRealDivExpression >> accept: aVisitor [
  ^aVisitor acceptRealDivExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> fromValues: values [
  ^self realDivExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltRealDivExpression >> isPltRealDivExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> localFromValues: values [
  ^self realDivExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> localToValues: values [
  ^self realDivExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRealDivExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRealDivExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self realDivExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRealDivExpression >> pltLocalCopyTo: another [
  self realDivExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRealDivExpression >> realDivExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> realDivExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> realDivExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltRealDivExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltRealDivExpression >> toValues: values [
  ^self realDivExpressionToValues: (super toValues: values)


]
