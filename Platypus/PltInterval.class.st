"
<ISO10303-11-EXPRESS>
ENTITY interval 
	SUBTYPE OF ( unary_expression );
	expr : and_expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInterval,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'expr'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInterval class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInterval class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInterval class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInterval class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInterval class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInterval class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInterval class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInterval >> accept: aVisitor [
  ^aVisitor acceptInterval: self


]

{ #category : #'platypus-generated-accessing' }
PltInterval >> expr [
  ^expr


]

{ #category : #'platypus-generated-accessing' }
PltInterval >> expr: aPltAndExpression [
  expr := aPltAndExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInterval >> exprUsingContext: aContext [
  ^self expr


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInterval >> fastSetExpr: aPltAndExpression [
  expr := aPltAndExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> fromValues: values [
  ^self intervalFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInterval >> intervalCopyTo: another [
  another fastSetExpr: self expr


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> intervalFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> intervalToValues: values [
  values add: self expr.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInterval >> isPltInterval [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> localFromValues: values [
  ^self intervalFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> localToValues: values [
  ^self intervalToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInterval >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInterval >> pltCopyTo: another [
  super pltCopyTo: another.
  self intervalCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInterval >> pltLocalCopyTo: another [
  self intervalCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltInterval >> setExpr: aPltAndExpression [
  self expr: aPltAndExpression


]

{ #category : #'platypus-generated-initializing' }
PltInterval >> stepInitialize [
  super stepInitialize.
  expr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltInterval >> toValues: values [
  ^self intervalToValues: (super toValues: values)


]
