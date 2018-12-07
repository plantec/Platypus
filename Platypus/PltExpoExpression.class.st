"
<ISO10303-11-EXPRESS>
ENTITY expo_expression 
	SUBTYPE OF ( arithmetic_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExpoExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExpoExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpoExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpoExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpoExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpoExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpoExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpoExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExpoExpression >> accept: aVisitor [
  ^aVisitor acceptExpoExpression: self


]

{ #category : #'platypus-generated-copying' }
PltExpoExpression >> expoExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> expoExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> expoExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> fromValues: values [
  ^self expoExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExpoExpression >> isPltExpoExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> localFromValues: values [
  ^self expoExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> localToValues: values [
  ^self expoExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltExpoExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExpoExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self expoExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExpoExpression >> pltLocalCopyTo: another [
  self expoExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltExpoExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltExpoExpression >> toValues: values [
  ^self expoExpressionToValues: (super toValues: values)


]
