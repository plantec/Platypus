"
<ISO10303-11-EXPRESS>
ENTITY instance_construction_expression 
	SUBTYPE OF ( binary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInstanceConstructionExpression,
	#superclass : #PltBinaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInstanceConstructionExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceConstructionExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceConstructionExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceConstructionExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceConstructionExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceConstructionExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceConstructionExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInstanceConstructionExpression >> accept: aVisitor [
  ^aVisitor acceptInstanceConstructionExpression: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> fromValues: values [
  ^self instanceConstructionExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInstanceConstructionExpression >> instanceConstructionExpressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> instanceConstructionExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> instanceConstructionExpressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInstanceConstructionExpression >> isPltInstanceConstructionExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> localFromValues: values [
  ^self instanceConstructionExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> localToValues: values [
  ^self instanceConstructionExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInstanceConstructionExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInstanceConstructionExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self instanceConstructionExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInstanceConstructionExpression >> pltLocalCopyTo: another [
  self instanceConstructionExpressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInstanceConstructionExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceConstructionExpression >> toValues: values [
  ^self instanceConstructionExpressionToValues: (super toValues: values)


]
