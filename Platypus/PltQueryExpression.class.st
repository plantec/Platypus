"
<ISO10303-11-EXPRESS>
ENTITY query_expression 
	SUBTYPE OF ( aggr_unary_expression );
	variable : query_variable;
	aggregate_source : expression;
	such_that : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltQueryExpression,
	#superclass : #PltAggrUnaryExpression,
	#instVars : [
		'identifiersCache',
		'aggregateSource',
		'variable',
		'suchThat'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltQueryExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltQueryExpression >> accept: aVisitor [
  ^aVisitor acceptQueryExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> aggregateSource [
  ^aggregateSource


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> aggregateSource: aPltExpression [
  aggregateSource := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQueryExpression >> aggregateSourceUsingContext: aContext [
  ^self aggregateSource


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQueryExpression >> fastSetAggregateSource: aPltExpression [
  aggregateSource := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQueryExpression >> fastSetSuchThat: aPltExpression [
  suchThat := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQueryExpression >> fastSetVariable: aPltQueryVariable [
  variable := aPltQueryVariable


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> fromValues: values [
  ^self queryExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltQueryExpression >> isPltQueryExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> localFromValues: values [
  ^self queryExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> localToValues: values [
  ^self queryExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltQueryExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltQueryExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self queryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQueryExpression >> pltLocalCopyTo: another [
  self queryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQueryExpression >> queryExpressionCopyTo: another [
  another fastSetVariable: self variable.
  another fastSetAggregateSource: self aggregateSource.
  another fastSetSuchThat: self suchThat


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> queryExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVariable: valuesloc removeFirst.
  self setAggregateSource: valuesloc removeFirst.
  self setSuchThat: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> queryExpressionToValues: values [
  values add: self variable.
  values add: self aggregateSource.
  values add: self suchThat.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltQueryExpression >> setAggregateSource: aPltExpression [
  self aggregateSource: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltQueryExpression >> setSuchThat: aPltExpression [
  self suchThat: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltQueryExpression >> setVariable: aPltQueryVariable [
  self variable: aPltQueryVariable


]

{ #category : #'platypus-generated-initializing' }
PltQueryExpression >> stepInitialize [
  super stepInitialize.
  variable := nil.
  aggregateSource := nil.
  suchThat := nil


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> suchThat [
  ^suchThat


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> suchThat: aPltExpression [
  suchThat := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQueryExpression >> suchThatUsingContext: aContext [
  ^self suchThat


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> toValues: values [
  ^self queryExpressionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> variable [
  ^variable


]

{ #category : #'platypus-generated-accessing' }
PltQueryExpression >> variable: aPltQueryVariable [
  variable := aPltQueryVariable


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryExpression >> variable: aPltQueryVariable aggregateSource: aPltExpression suchThat: aPltExpression1 [ 	self setVariable:aPltQueryVariable.	self setAggregateSource:aPltExpression.	self setSuchThat:aPltExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQueryExpression >> variableUsingContext: aContext [
  ^self variable


]
