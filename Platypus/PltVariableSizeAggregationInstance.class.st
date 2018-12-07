"
<ISO10303-11-EXPRESS>
ENTITY variable_size_aggregation_instance 
	ABSTRACT SUPERTYPE OF ( ONEOF ( set_instance, bag_instance, list_instance ) ) 
	SUBTYPE OF ( aggregate_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltVariableSizeAggregationInstance,
	#superclass : #PltAggregateInstance,
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltVariableSizeAggregationInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltVariableSizeAggregationInstance >> accept: aVisitor [
  ^aVisitor acceptVariableSizeAggregationInstance: self


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> fromValues: values [
  ^self variableSizeAggregationInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltVariableSizeAggregationInstance >> isPltVariableSizeAggregationInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> localFromValues: values [
  ^self variableSizeAggregationInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> localToValues: values [
  ^self variableSizeAggregationInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self variableSizeAggregationInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationInstance >> pltLocalCopyTo: another [
  self variableSizeAggregationInstanceCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltVariableSizeAggregationInstance >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> toValues: values [
  ^self variableSizeAggregationInstanceToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationInstance >> variableSizeAggregationInstanceCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> variableSizeAggregationInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationInstance >> variableSizeAggregationInstanceToValues: values [
  ^values


]
