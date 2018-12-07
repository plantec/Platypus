"
<ISO10303-11-EXPRESS>
ENTITY aggregate_initializer 
	SUBTYPE OF ( aggregate_data );
	contents : LIST OF aggregate_initializer_element;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateInitializer,
	#superclass : #PltAggregateData,
	#instVars : [
		'contents'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateInitializer class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializer class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializer class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializer class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializer class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializer class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializer class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateInitializer >> accept: aVisitor [
  ^aVisitor acceptAggregateInitializer: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializer >> aggregateInitializerCopyTo: another [
  another fastSetContents: self contents


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> aggregateInitializerFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setContents: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> aggregateInitializerToValues: values [
  values add: self contents.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializer >> contents [
  ^contents


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializer >> contents: aListOfPltAggregateInitializerElement [
  contents := aListOfPltAggregateInitializerElement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltAggregateInitializerElement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInitializer >> contentsUsingContext: aContext [
  ^self contents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInitializer >> fastSetContents: aListOfPltAggregateInitializerElement [
  contents := aListOfPltAggregateInitializerElement


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> fromValues: values [
  ^self aggregateInitializerFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateInitializer >> isPltAggregateInitializer [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> localFromValues: values [
  ^self aggregateInitializerFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> localToValues: values [
  ^self aggregateInitializerToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializer >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializer >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateInitializerCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializer >> pltLocalCopyTo: another [
  self aggregateInitializerCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInitializer >> setContents: aListOfPltAggregateInitializerElement [
  self contents: aListOfPltAggregateInitializerElement


]

{ #category : #'platypus-generated-initializing' }
PltAggregateInitializer >> stepInitialize [
  super stepInitialize.
  contents := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializer >> toValues: values [
  ^self aggregateInitializerToValues: (super toValues: values)


]
