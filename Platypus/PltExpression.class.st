"
<ISO10303-11-EXPRESS>
ENTITY expression 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( dictionary_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExpression,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'cachedDomain'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExpression >> accept: aVisitor [
  ^aVisitor acceptExpression: self


]

{ #category : #'platypus-generated-copying' }
PltExpression >> expressionCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> expressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> expressionToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> fromValues: values [
  ^self expressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExpression >> isPltExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> localFromValues: values [
  ^self expressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> localToValues: values [
  ^self expressionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltExpression >> owner [
	^ owner


]

{ #category : #'platypus-generated-copying' }
PltExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self expressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExpression >> pltLocalCopyTo: another [
  self expressionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltExpression >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltExpression >> toValues: values [
  ^self expressionToValues: (super toValues: values)


]
