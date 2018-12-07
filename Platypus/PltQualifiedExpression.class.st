"
<ISO10303-11-EXPRESS>
ENTITY qualified_expression 
	SUBTYPE OF ( unary_expression );
	head : expression;
	qualifiers : LIST OF qualifier;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltQualifiedExpression,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'qualifiers',
		'head'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltQualifiedExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifiedExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifiedExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifiedExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifiedExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifiedExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifiedExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltQualifiedExpression >> accept: aVisitor [
  ^aVisitor acceptQualifiedExpression: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQualifiedExpression >> fastSetHead: aPltExpression [
  head := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQualifiedExpression >> fastSetQualifiers: aListOfPltQualifier [
  qualifiers := aListOfPltQualifier


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> fromValues: values [
  ^self qualifiedExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltQualifiedExpression >> head [
  ^head


]

{ #category : #'platypus-generated-accessing' }
PltQualifiedExpression >> head: aPltExpression [
  head := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> head: aPltExpression qualifiers: aListOfPltQualifier [ 	self setHead:aPltExpression.	self setQualifiers:aListOfPltQualifier.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQualifiedExpression >> headUsingContext: aContext [
  ^self head


]

{ #category : #'platypus-generated-classifying' }
PltQualifiedExpression >> isPltQualifiedExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> localFromValues: values [
  ^self qualifiedExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> localToValues: values [
  ^self qualifiedExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltQualifiedExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltQualifiedExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self qualifiedExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQualifiedExpression >> pltLocalCopyTo: another [
  self qualifiedExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQualifiedExpression >> qualifiedExpressionCopyTo: another [
  another fastSetHead: self head.
  another fastSetQualifiers: self qualifiers


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> qualifiedExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setHead: valuesloc removeFirst.
  self setQualifiers: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> qualifiedExpressionToValues: values [
  values add: self head.
  values add: self qualifiers.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltQualifiedExpression >> qualifiers [
  ^qualifiers


]

{ #category : #'platypus-generated-accessing' }
PltQualifiedExpression >> qualifiers: aListOfPltQualifier [
  qualifiers := aListOfPltQualifier ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltQualifier as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQualifiedExpression >> qualifiersUsingContext: aContext [
  ^self qualifiers


]

{ #category : #'platypus-generated-set-accessing' }
PltQualifiedExpression >> setHead: aPltExpression [
  self head: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltQualifiedExpression >> setQualifiers: aListOfPltQualifier [
  self qualifiers: aListOfPltQualifier


]

{ #category : #'platypus-generated-initializing' }
PltQualifiedExpression >> stepInitialize [
  super stepInitialize.
  head := nil.
  qualifiers := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifiedExpression >> toValues: values [
  ^self qualifiedExpressionToValues: (super toValues: values)


]
