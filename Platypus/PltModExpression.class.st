"
<ISO10303-11-EXPRESS>
ENTITY mod_expression 
	SUBTYPE OF ( arithmetic_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltModExpression,
	#superclass : #PltArithmeticExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltModExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltModExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltModExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltModExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltModExpression >> accept: aVisitor [
  ^aVisitor acceptModExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> fromValues: values [
  ^self modExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltModExpression >> isPltModExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> localFromValues: values [
  ^self modExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> localToValues: values [
  ^self modExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltModExpression >> modExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> modExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> modExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltModExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltModExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self modExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltModExpression >> pltLocalCopyTo: another [
  self modExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltModExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltModExpression >> toValues: values [
  ^self modExpressionToValues: (super toValues: values)


]
