"
<ISO10303-11-EXPRESS>
ENTITY array_instance 
	SUBTYPE OF ( aggregate_instance );
	contents : LIST OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltArrayInstance,
	#superclass : #PltAggregateInstance,
	#instVars : [
		'contents'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltArrayInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltArrayInstance >> accept: aVisitor [
  ^aVisitor acceptArrayInstance: self


]

{ #category : #'platypus-generated-copying' }
PltArrayInstance >> arrayInstanceCopyTo: another [
  another fastSetContents: self contents


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> arrayInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setContents: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> arrayInstanceToValues: values [
  values add: self contents.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltArrayInstance >> contents [
  ^contents


]

{ #category : #'platypus-generated-accessing' }
PltArrayInstance >> contents: aListOfPltExpression [
  contents := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltArrayInstance >> contentsUsingContext: aContext [
  ^self contents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltArrayInstance >> fastSetContents: aListOfPltExpression [
  contents := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> fromValues: values [
  ^self arrayInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltArrayInstance >> isPltArrayInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> localFromValues: values [
  ^self arrayInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> localToValues: values [
  ^self arrayInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltArrayInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltArrayInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self arrayInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltArrayInstance >> pltLocalCopyTo: another [
  self arrayInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltArrayInstance >> setContents: aListOfPltExpression [
  self contents: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltArrayInstance >> stepInitialize [
  super stepInitialize.
  contents := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayInstance >> toValues: values [
  ^self arrayInstanceToValues: (super toValues: values)


]
