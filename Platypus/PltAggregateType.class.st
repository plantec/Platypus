"
<ISO10303-11-EXPRESS>
ENTITY aggregate_type 
	ABSTRACT SUPERTYPE OF ( ONEOF ( aggregation_type, general_aggregate_type ) ) 
	SUBTYPE OF ( dictionary_instance );
	element_type : parameter_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateType,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'elementType'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateType >> accept: aVisitor [
  ^aVisitor acceptAggregateType: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateType >> aggregateTypeCopyTo: another [
  another fastSetElementType: self elementType


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> aggregateTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setElementType: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> aggregateTypeToValues: values [
  values add: self elementType.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltAggregateType >> elementType [
  ^elementType


]

{ #category : #'platypus-generated-accessing' }
PltAggregateType >> elementType: aPltParameterType [
  elementType := aPltParameterType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateType >> elementTypeUsingContext: aContext [
  ^self elementType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateType >> fastSetElementType: aPltParameterType [
  elementType := aPltParameterType


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> fromValues: values [
  ^self aggregateTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateType >> isPltAggregateType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> localFromValues: values [
  ^self aggregateTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> localToValues: values [
  ^self aggregateTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAggregateType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateType >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateType >> pltLocalCopyTo: another [
  self aggregateTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateType >> setElementType: aPltParameterType [
  self elementType: aPltParameterType


]

{ #category : #'platypus-generated-initializing' }
PltAggregateType >> stepInitialize [
  super stepInitialize.
  elementType := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateType >> toValues: values [
  ^self aggregateTypeToValues: (super toValues: values)


]
