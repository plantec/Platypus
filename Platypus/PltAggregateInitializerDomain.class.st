"
<ISO10303-11-EXPRESS>
ENTITY aggregate_initializer_domain 
	SUBTYPE OF ( dictionary_instance );
	types : LIST [ 1 : ? ] OF parameter_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateInitializerDomain,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'types'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateInitializerDomain class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerDomain class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerDomain class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerDomain class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInitializerDomain class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerDomain class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInitializerDomain class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateInitializerDomain >> accept: aVisitor [
  ^aVisitor acceptAggregateInitializerDomain: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerDomain >> aggregateInitializerDomainCopyTo: another [
  another fastSetTypes: self types


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> aggregateInitializerDomainFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setTypes: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> aggregateInitializerDomainToValues: values [
  values add: self types.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInitializerDomain >> fastSetTypes: aListOfPltParameterType [
  types := aListOfPltParameterType


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> fromValues: values [
  ^self aggregateInitializerDomainFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateInitializerDomain >> isPltAggregateInitializerDomain [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> localFromValues: values [
  ^self aggregateInitializerDomainFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> localToValues: values [
  ^self aggregateInitializerDomainToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerDomain >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerDomain >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateInitializerDomainCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateInitializerDomain >> pltLocalCopyTo: another [
  self aggregateInitializerDomainCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInitializerDomain >> setTypes: aListOfPltParameterType [
  self types: aListOfPltParameterType


]

{ #category : #'platypus-generated-initializing' }
PltAggregateInitializerDomain >> stepInitialize [
  super stepInitialize.
  types := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInitializerDomain >> toValues: values [
  ^self aggregateInitializerDomainToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerDomain >> types [
  ^types


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInitializerDomain >> types: aListOfPltParameterType [
  types := aListOfPltParameterType ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltParameterType as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInitializerDomain >> typesUsingContext: aContext [
  ^self types


]
