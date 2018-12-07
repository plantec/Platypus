"
<ISO10303-11-EXPRESS>
ENTITY escaped_expression 
	SUBTYPE OF ( expression );
	expr : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEscapedExpression,
	#superclass : #PltExpression,
	#instVars : [
		'expr'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEscapedExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapedExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapedExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapedExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapedExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapedExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapedExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEscapedExpression >> accept: aVisitor [
  ^aVisitor acceptEscapedExpression: self


]

{ #category : #'platypus-generated-copying' }
PltEscapedExpression >> escapedExpressionCopyTo: another [
  another fastSetExpr: self expr


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> escapedExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> escapedExpressionToValues: values [
  values add: self expr.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltEscapedExpression >> expr [
  ^expr


]

{ #category : #'platypus-generated-accessing' }
PltEscapedExpression >> expr: aPltExpression [
  expr := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEscapedExpression >> exprUsingContext: aContext [
  ^self expr


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEscapedExpression >> fastSetExpr: aPltExpression [
  expr := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> fromValues: values [
  ^self escapedExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEscapedExpression >> isPltEscapedExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> localFromValues: values [
  ^self escapedExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> localToValues: values [
  ^self escapedExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEscapedExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEscapedExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self escapedExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEscapedExpression >> pltLocalCopyTo: another [
  self escapedExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEscapedExpression >> setExpr: aPltExpression [
  self expr: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltEscapedExpression >> stepInitialize [
  super stepInitialize.
  expr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapedExpression >> toValues: values [
  ^self escapedExpressionToValues: (super toValues: values)


]
