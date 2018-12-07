"
<ISO10303-11-EXPRESS>
ENTITY aggr_unary_expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggrUnaryExpression,
	#superclass : #PltUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggrUnaryExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggrUnaryExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggrUnaryExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggrUnaryExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggrUnaryExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggrUnaryExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggrUnaryExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggrUnaryExpression >> accept: aVisitor [
  ^aVisitor acceptAggrUnaryExpression: self


]

{ #category : #'platypus-generated-copying' }
PltAggrUnaryExpression >> aggrUnaryExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> aggrUnaryExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> aggrUnaryExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> fromValues: values [
  ^self aggrUnaryExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggrUnaryExpression >> isPltAggrUnaryExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> localFromValues: values [
  ^self aggrUnaryExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> localToValues: values [
  ^self aggrUnaryExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAggrUnaryExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggrUnaryExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggrUnaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggrUnaryExpression >> pltLocalCopyTo: another [
  self aggrUnaryExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltAggrUnaryExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltAggrUnaryExpression >> toValues: values [
  ^self aggrUnaryExpressionToValues: (super toValues: values)


]
