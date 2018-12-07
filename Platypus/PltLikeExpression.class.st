"
<ISO10303-11-EXPRESS>
ENTITY like_expression 
	SUBTYPE OF ( logical_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLikeExpression,
	#superclass : #PltLogicalExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLikeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLikeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLikeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLikeExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLikeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLikeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLikeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLikeExpression >> accept: aVisitor [
  ^aVisitor acceptLikeExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> fromValues: values [
  ^self likeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLikeExpression >> isPltLikeExpression [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltLikeExpression >> likeExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> likeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> likeExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> localFromValues: values [
  ^self likeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> localToValues: values [
  ^self likeExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLikeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLikeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self likeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLikeExpression >> pltLocalCopyTo: another [
  self likeExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLikeExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLikeExpression >> toValues: values [
  ^self likeExpressionToValues: (super toValues: values)


]
