"
<ISO10303-11-EXPRESS>
ENTITY element_qualifier 
	SUBTYPE OF ( index_qualifier );
	index : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltElementQualifier,
	#superclass : #PltIndexQualifier,
	#instVars : [
		'index'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltElementQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltElementQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltElementQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltElementQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltElementQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltElementQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltElementQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltElementQualifier >> accept: aVisitor [
  ^aVisitor acceptElementQualifier: self


]

{ #category : #'platypus-generated-copying' }
PltElementQualifier >> elementQualifierCopyTo: another [
  another fastSetIndex: self index


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> elementQualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setIndex: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> elementQualifierToValues: values [
  values add: self index.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltElementQualifier >> fastSetIndex: aPltExpression [
  index := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> fromValues: values [
  ^self elementQualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltElementQualifier >> index [
  ^index


]

{ #category : #'platypus-generated-accessing' }
PltElementQualifier >> index: aPltExpression [
  index := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltElementQualifier >> indexUsingContext: aContext [
  ^self index


]

{ #category : #'platypus-generated-classifying' }
PltElementQualifier >> isPltElementQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> localFromValues: values [
  ^self elementQualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> localToValues: values [
  ^self elementQualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltElementQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltElementQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self elementQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltElementQualifier >> pltLocalCopyTo: another [
  self elementQualifierCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltElementQualifier >> setIndex: aPltExpression [
  self index: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltElementQualifier >> stepInitialize [
  super stepInitialize.
  index := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltElementQualifier >> toValues: values [
  ^self elementQualifierToValues: (super toValues: values)


]
