"
<ISO10303-11-EXPRESS>
ENTITY typed_expression 
	SUBTYPE OF ( simple_unary_expression );
	domain : named_type_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltTypedExpression,
	#superclass : #PltSimpleUnaryExpression,
	#instVars : [
		'domain'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltTypedExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltTypedExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTypedExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTypedExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTypedExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltTypedExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltTypedExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltTypedExpression >> accept: aVisitor [
  ^aVisitor acceptTypedExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltTypedExpression >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltTypedExpression >> domain: aPltNamedTypeReference [
  domain := aPltNamedTypeReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltTypedExpression >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltTypedExpression >> fastSetDomain: aPltNamedTypeReference [
  domain := aPltNamedTypeReference


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> fromValues: values [
  ^self typedExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltTypedExpression >> isPltTypedExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> localFromValues: values [
  ^self typedExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> localToValues: values [
  ^self typedExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltTypedExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltTypedExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self typedExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltTypedExpression >> pltLocalCopyTo: another [
  self typedExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltTypedExpression >> setDomain: aPltNamedTypeReference [
  self domain: aPltNamedTypeReference


]

{ #category : #'platypus-generated-initializing' }
PltTypedExpression >> stepInitialize [
  super stepInitialize.
  domain := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> toValues: values [
  ^self typedExpressionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltTypedExpression >> typedExpressionCopyTo: another [
  another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> typedExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDomain: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltTypedExpression >> typedExpressionToValues: values [
  values add: self domain.
  ^values


]
