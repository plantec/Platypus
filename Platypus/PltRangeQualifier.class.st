"
<ISO10303-11-EXPRESS>
ENTITY range_qualifier 
	SUBTYPE OF ( index_qualifier );
	index1 : expression;
	index2 : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRangeQualifier,
	#superclass : #PltIndexQualifier,
	#instVars : [
		'index2',
		'index1'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRangeQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRangeQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRangeQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRangeQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRangeQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRangeQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRangeQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRangeQualifier >> accept: aVisitor [
  ^aVisitor acceptRangeQualifier: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRangeQualifier >> fastSetIndex1: aPltExpression [
  index1 := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRangeQualifier >> fastSetIndex2: aPltExpression [
  index2 := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> fromValues: values [
  ^self rangeQualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltRangeQualifier >> index1 [
  ^index1


]

{ #category : #'platypus-generated-accessing' }
PltRangeQualifier >> index1: aPltExpression [
  index1 := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> index1: aPltExpression index2: aPltExpression1 [ 	self setIndex1:aPltExpression.	self setIndex2:aPltExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRangeQualifier >> index1UsingContext: aContext [
  ^self index1


]

{ #category : #'platypus-generated-accessing' }
PltRangeQualifier >> index2 [
  ^index2


]

{ #category : #'platypus-generated-accessing' }
PltRangeQualifier >> index2: aPltExpression [
  index2 := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRangeQualifier >> index2UsingContext: aContext [
  ^self index2


]

{ #category : #'platypus-generated-classifying' }
PltRangeQualifier >> isPltRangeQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> localFromValues: values [
  ^self rangeQualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> localToValues: values [
  ^self rangeQualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRangeQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRangeQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self rangeQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRangeQualifier >> pltLocalCopyTo: another [
  self rangeQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRangeQualifier >> rangeQualifierCopyTo: another [
  another fastSetIndex1: self index1.
  another fastSetIndex2: self index2


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> rangeQualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setIndex1: valuesloc removeFirst.
  self setIndex2: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> rangeQualifierToValues: values [
  values add: self index1.
  values add: self index2.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltRangeQualifier >> setIndex1: aPltExpression [
  self index1: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltRangeQualifier >> setIndex2: aPltExpression [
  self index2: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltRangeQualifier >> stepInitialize [
  super stepInitialize.
  index1 := nil.
  index2 := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltRangeQualifier >> toValues: values [
  ^self rangeQualifierToValues: (super toValues: values)


]
