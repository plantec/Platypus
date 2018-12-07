"
<ISO10303-11-EXPRESS>
ENTITY simple_unary_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( unary_expression );
	expr : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSimpleUnaryExpression,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'expr'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSimpleUnaryExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleUnaryExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleUnaryExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleUnaryExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleUnaryExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleUnaryExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleUnaryExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSimpleUnaryExpression >> accept: aVisitor [
  ^aVisitor acceptSimpleUnaryExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltSimpleUnaryExpression >> expr [
  ^expr


]

{ #category : #'platypus-generated-accessing' }
PltSimpleUnaryExpression >> expr: aPltExpression [
  expr := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSimpleUnaryExpression >> exprUsingContext: aContext [
  ^self expr


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSimpleUnaryExpression >> fastSetExpr: aPltExpression [
  expr := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> fromValues: values [
  ^self simpleUnaryExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSimpleUnaryExpression >> isPltSimpleUnaryExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> localFromValues: values [
  ^self simpleUnaryExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> localToValues: values [
  ^self simpleUnaryExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSimpleUnaryExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSimpleUnaryExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self simpleUnaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSimpleUnaryExpression >> pltLocalCopyTo: another [
  self simpleUnaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSimpleUnaryExpression >> setExpr: aPltExpression [
  self expr: aPltExpression


]

{ #category : #'platypus-generated-copying' }
PltSimpleUnaryExpression >> simpleUnaryExpressionCopyTo: another [
  another fastSetExpr: self expr


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> simpleUnaryExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> simpleUnaryExpressionToValues: values [
  values add: self expr.
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSimpleUnaryExpression >> stepInitialize [
  super stepInitialize.
  expr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleUnaryExpression >> toValues: values [
  ^self simpleUnaryExpressionToValues: (super toValues: values)


]
