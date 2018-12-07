"
<ISO10303-11-EXPRESS>
ENTITY variable_size_aggregation_type 
	ABSTRACT SUPERTYPE OF ( ONEOF ( set_type, bag_type, list_type ) ) 
	SUBTYPE OF ( aggregation_type );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltVariableSizeAggregationType,
	#superclass : #PltAggregationType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltVariableSizeAggregationType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVariableSizeAggregationType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltVariableSizeAggregationType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltVariableSizeAggregationType >> accept: aVisitor [
  ^aVisitor acceptVariableSizeAggregationType: self


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> fromValues: values [
  ^self variableSizeAggregationTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltVariableSizeAggregationType >> isPltVariableSizeAggregationType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> localFromValues: values [
  ^self variableSizeAggregationTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> localToValues: values [
  ^self variableSizeAggregationTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationType >> pltCopyTo: another [
  super pltCopyTo: another.
  self variableSizeAggregationTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationType >> pltLocalCopyTo: another [
  self variableSizeAggregationTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltVariableSizeAggregationType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> toValues: values [
  ^self variableSizeAggregationTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltVariableSizeAggregationType >> variableSizeAggregationTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> variableSizeAggregationTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltVariableSizeAggregationType >> variableSizeAggregationTypeToValues: values [
  ^values


]
