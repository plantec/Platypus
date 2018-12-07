"
<ISO10303-11-EXPRESS>
ENTITY binary_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( expression );
	parenthesis : OPTIONAL BOOLEAN;
	left_expr : expression;
	right_expr : expression;
DERIVE
	op_string : STRING := ?;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBinaryExpression,
	#superclass : #PltExpression,
	#instVars : [
		'leftExpr',
		'parenthesis',
		'rightExpr'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBinaryExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBinaryExpression >> accept: aVisitor [
  ^aVisitor acceptBinaryExpression: self


]

{ #category : #'platypus-generated-copying' }
PltBinaryExpression >> binaryExpressionCopyTo: another [
  another fastSetParenthesis: self parenthesis.
  another fastSetLeftExpr: self leftExpr.
  another fastSetRightExpr: self rightExpr


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> binaryExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setParenthesis: valuesloc removeFirst.
  self setLeftExpr: valuesloc removeFirst.
  self setRightExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> binaryExpressionToValues: values [
  values add: self parenthesis.
  values add: self leftExpr.
  values add: self rightExpr.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryExpression >> fastSetLeftExpr: aPltExpression [
  leftExpr := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryExpression >> fastSetParenthesis: aBoolean [
  parenthesis := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryExpression >> fastSetRightExpr: aPltExpression [
  rightExpr := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> fromValues: values [
  ^self binaryExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBinaryExpression >> isPltBinaryExpression [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> leftExpr [
  ^leftExpr


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> leftExpr: aPltExpression [
  leftExpr := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryExpression >> leftExprUsingContext: aContext [
  ^self leftExpr


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> localFromValues: values [
  ^self binaryExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> localToValues: values [
  ^self binaryExpressionToValues: values


]

{ #category : #'platypus-generated-deriving' }
PltBinaryExpression >> opString [
  ^self opStringUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltBinaryExpression >> opStringUsingContext: aContext [
  ^self opStringUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltBinaryExpression >> opStringUsingContext: aContext receiver: aReceiver [
  ^nil


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> parenthesis [
  ^parenthesis


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> parenthesis: aBoolean [
  parenthesis := aBoolean


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> parenthesis: aBoolean leftExpr: aPltExpression rightExpr: aPltExpression1 [ 	self setParenthesis:aBoolean.	self setLeftExpr:aPltExpression.	self setRightExpr:aPltExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryExpression >> parenthesisUsingContext: aContext [
  ^self parenthesis


]

{ #category : #'platypus-generated-copying' }
PltBinaryExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBinaryExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self binaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBinaryExpression >> pltLocalCopyTo: another [
  self binaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> rightExpr [
  ^rightExpr


]

{ #category : #'platypus-generated-accessing' }
PltBinaryExpression >> rightExpr: aPltExpression [
  rightExpr := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryExpression >> rightExprUsingContext: aContext [
  ^self rightExpr


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryExpression >> setLeftExpr: aPltExpression [
  self leftExpr: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryExpression >> setParenthesis: aBoolean [
  self parenthesis: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryExpression >> setRightExpr: aPltExpression [
  self rightExpr: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltBinaryExpression >> stepInitialize [
  super stepInitialize.
  parenthesis := nil.
  leftExpr := nil.
  rightExpr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryExpression >> toValues: values [
  ^self binaryExpressionToValues: (super toValues: values)


]
