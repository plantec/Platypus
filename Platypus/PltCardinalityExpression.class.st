"
<ISO10303-11-EXPRESS>
ENTITY cardinality_expression 
	SUBTYPE OF ( logical_expression );
	card1 : expression;
	card2 : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltCardinalityExpression,
	#superclass : #PltLogicalExpression,
	#instVars : [
		'card1',
		'card2'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltCardinalityExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltCardinalityExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCardinalityExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCardinalityExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCardinalityExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltCardinalityExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltCardinalityExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltCardinalityExpression >> accept: aVisitor [
  ^aVisitor acceptCardinalityExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltCardinalityExpression >> card1 [
  ^card1


]

{ #category : #'platypus-generated-accessing' }
PltCardinalityExpression >> card1: aPltExpression [
  card1 := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> card1: aPltExpression card2: aPltExpression1 [ 	self setCard1:aPltExpression.	self setCard2:aPltExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCardinalityExpression >> card1UsingContext: aContext [
  ^self card1


]

{ #category : #'platypus-generated-accessing' }
PltCardinalityExpression >> card2 [
  ^card2


]

{ #category : #'platypus-generated-accessing' }
PltCardinalityExpression >> card2: aPltExpression [
  card2 := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCardinalityExpression >> card2UsingContext: aContext [
  ^self card2


]

{ #category : #'platypus-generated-copying' }
PltCardinalityExpression >> cardinalityExpressionCopyTo: another [
  another fastSetCard1: self card1.
  another fastSetCard2: self card2


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> cardinalityExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setCard1: valuesloc removeFirst.
  self setCard2: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> cardinalityExpressionToValues: values [
  values add: self card1.
  values add: self card2.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCardinalityExpression >> fastSetCard1: aPltExpression [
  card1 := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCardinalityExpression >> fastSetCard2: aPltExpression [
  card2 := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> fromValues: values [
  ^self cardinalityExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltCardinalityExpression >> isPltCardinalityExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> localFromValues: values [
  ^self cardinalityExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> localToValues: values [
  ^self cardinalityExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltCardinalityExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltCardinalityExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self cardinalityExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltCardinalityExpression >> pltLocalCopyTo: another [
  self cardinalityExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltCardinalityExpression >> setCard1: aPltExpression [
  self card1: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltCardinalityExpression >> setCard2: aPltExpression [
  self card2: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltCardinalityExpression >> stepInitialize [
  super stepInitialize.
  card1 := nil.
  card2 := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltCardinalityExpression >> toValues: values [
  ^self cardinalityExpressionToValues: (super toValues: values)


]
