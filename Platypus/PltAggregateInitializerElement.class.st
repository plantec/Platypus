"
<ISO10303-11-EXPRESS>
ENTITY aggregate_initializer_element 
	SUBTYPE OF ( dictionary_instance );
	SELF\entity_instance.owner : aggregate_initializer;
	val : primitive;
	repetition : OPTIONAL expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateInitializerElement,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'repetition',
		'val'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateInitializerElement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerElement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerElement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerElement class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerElement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerElement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerElement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateInitializerElement >> accept: aVisitor [
  ^aVisitor acceptAggregateInitializerElement: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerElement >> aggregateInitializerElementCopyTo: another [
  another fastSetOwner: self owner.
  another fastSetVal: self val.
  another fastSetRepetition: self repetition


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> aggregateInitializerElementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwner: valuesloc removeFirst.
  self setVal: valuesloc removeFirst.
  self setRepetition: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> aggregateInitializerElementToValues: values [
  values add: self owner.
  values add: self val.
  values add: self repetition.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInitializerElement >> fastSetOwner: aPltAggregateInitializer [
  owner := aPltAggregateInitializer


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInitializerElement >> fastSetRepetition: aPltExpression [
  repetition := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInitializerElement >> fastSetVal: aPltExpression [
  val := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> fromValues: values [
  ^self aggregateInitializerElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateInitializerElement >> isPltAggregateInitializerElement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> localFromValues: values [
  ^self aggregateInitializerElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> localToValues: values [
  ^self aggregateInitializerElementToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> owner: aPltAggregateInitializer [
  owner := aPltAggregateInitializer


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInitializerElement >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerElement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerElement >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateInitializerElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerElement >> pltLocalCopyTo: another [
  self aggregateInitializerElementCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> repetition [
  ^repetition


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> repetition: aPltExpression [
  repetition := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInitializerElement >> repetitionUsingContext: aContext [
  ^self repetition


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInitializerElement >> setOwner: aPltAggregateInitializer [
  self owner: aPltAggregateInitializer


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInitializerElement >> setRepetition: aPltExpression [
  self repetition: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInitializerElement >> setVal: aPltExpression [
  self val: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltAggregateInitializerElement >> stepInitialize [
  super stepInitialize.
  owner := nil.
  val := nil.
  repetition := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> toValues: values [
  ^self aggregateInitializerElementToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> val [
  ^val


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerElement >> val: aPltExpression [
  val := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerElement >> val: aPltExpression repetition: aPltExpression1 [ 	self setVal:aPltExpression.	self setRepetition:aPltExpression1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInitializerElement >> valUsingContext: aContext [
  ^self val


]
