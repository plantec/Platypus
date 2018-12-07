"
<ISO10303-11-EXPRESS>
ENTITY aggregate_data 
	ABSTRACT SUPERTYPE OF ( ONEOF ( aggregate_instance, aggregate_initializer ) ) 
	SUBTYPE OF ( expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateData,
	#superclass : #PltExpression,
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateData class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateData class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateData class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateData class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateData class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateData class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateData class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateData >> accept: aVisitor [
  ^aVisitor acceptAggregateData: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateData >> aggregateDataCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> aggregateDataFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> aggregateDataToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> fromValues: values [
  ^self aggregateDataFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateData >> isPltAggregateData [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> localFromValues: values [
  ^self aggregateDataFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> localToValues: values [
  ^self aggregateDataToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAggregateData >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateData >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateDataCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateData >> pltLocalCopyTo: another [
  self aggregateDataCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltAggregateData >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateData >> toValues: values [
  ^self aggregateDataToValues: (super toValues: values)


]
