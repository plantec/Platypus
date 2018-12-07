"
<ISO10303-11-EXPRESS>
ENTITY binary_supertype_expression 
	SUBTYPE OF ( supertype_expression );
	parenthesis : OPTIONAL BOOLEAN;
	left_expr : supertype_expression;
	right_expr : supertype_expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBinarySupertypeExpression,
	#superclass : #PltSupertypeExpression,
	#instVars : [
		'leftExpr',
		'parenthesis',
		'rightExpr'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBinarySupertypeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinarySupertypeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinarySupertypeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinarySupertypeExpression class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinarySupertypeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinarySupertypeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinarySupertypeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBinarySupertypeExpression >> accept: aVisitor [
  ^aVisitor acceptBinarySupertypeExpression: self


]

{ #category : #'platypus-generated-copying' }
PltBinarySupertypeExpression >> binarySupertypeExpressionCopyTo: another [
  another fastSetParenthesis: self parenthesis.
  another fastSetLeftExpr: self leftExpr.
  another fastSetRightExpr: self rightExpr


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> binarySupertypeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setParenthesis: valuesloc removeFirst.
  self setLeftExpr: valuesloc removeFirst.
  self setRightExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> binarySupertypeExpressionToValues: values [
  values add: self parenthesis.
  values add: self leftExpr.
  values add: self rightExpr.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinarySupertypeExpression >> fastSetLeftExpr: aPltSupertypeExpression [
  leftExpr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinarySupertypeExpression >> fastSetParenthesis: aBoolean [
  parenthesis := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinarySupertypeExpression >> fastSetRightExpr: aPltSupertypeExpression [
  rightExpr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> fromValues: values [
  ^self binarySupertypeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBinarySupertypeExpression >> isPltBinarySupertypeExpression [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> leftExpr [
  ^leftExpr


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> leftExpr: aPltSupertypeExpression [
  leftExpr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinarySupertypeExpression >> leftExprUsingContext: aContext [
  ^self leftExpr


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> localFromValues: values [
  ^self binarySupertypeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> localToValues: values [
  ^self binarySupertypeExpressionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> parenthesis [
  ^parenthesis


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> parenthesis: aBoolean [
  parenthesis := aBoolean


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> parenthesis: aBoolean leftExpr: aPltSupertypeExpression rightExpr: aPltSupertypeExpression1 [ 	self setParenthesis:aBoolean.	self setLeftExpr:aPltSupertypeExpression.	self setRightExpr:aPltSupertypeExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinarySupertypeExpression >> parenthesisUsingContext: aContext [
  ^self parenthesis


]

{ #category : #'platypus-generated-copying' }
PltBinarySupertypeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBinarySupertypeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self binarySupertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBinarySupertypeExpression >> pltLocalCopyTo: another [
  self binarySupertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> rightExpr [
  ^rightExpr


]

{ #category : #'platypus-generated-accessing' }
PltBinarySupertypeExpression >> rightExpr: aPltSupertypeExpression [
  rightExpr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinarySupertypeExpression >> rightExprUsingContext: aContext [
  ^self rightExpr


]

{ #category : #'platypus-generated-set-accessing' }
PltBinarySupertypeExpression >> setLeftExpr: aPltSupertypeExpression [
  self leftExpr: aPltSupertypeExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltBinarySupertypeExpression >> setParenthesis: aBoolean [
  self parenthesis: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltBinarySupertypeExpression >> setRightExpr: aPltSupertypeExpression [
  self rightExpr: aPltSupertypeExpression


]

{ #category : #'platypus-generated-initializing' }
PltBinarySupertypeExpression >> stepInitialize [
  super stepInitialize.
  parenthesis := nil.
  leftExpr := nil.
  rightExpr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltBinarySupertypeExpression >> toValues: values [
  ^self binarySupertypeExpressionToValues: (super toValues: values)


]
