"
<ISO10303-11-EXPRESS>
ENTITY and_expression 
	SUBTYPE OF ( logical_expression );
DERIVE
	SELF\binary_expression.op_string : STRING := 'AND';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAndExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAndExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAndExpression >> accept: aVisitor [
  ^aVisitor acceptAndExpression: self


]

{ #category : #'platypus-generated-copying' }
PltAndExpression >> andExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> andExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> andExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> fromValues: values [
  ^self andExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAndExpression >> isPltAndExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> localFromValues: values [
  ^self andExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> localToValues: values [
  ^self andExpressionToValues: values


]

{ #category : #'platypus-generated-deriving' }
PltAndExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltAndExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltAndExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^'AND'


]

{ #category : #'platypus-generated-copying' }
PltAndExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAndExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self andExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAndExpression >> pltLocalCopyTo: another [
  self andExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltAndExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltAndExpression >> toValues: values [
  ^self andExpressionToValues: (super toValues: values)


]
