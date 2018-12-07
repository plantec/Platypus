"
<ISO10303-11-EXPRESS>
ENTITY aggregation_type 
	ABSTRACT SUPERTYPE OF ( ONEOF ( variable_size_aggregation_type, array_type ) ) 
	SUBTYPE OF ( aggregate_type );
	lower_bound : OPTIONAL bound;
	upper_bound : OPTIONAL bound;
	is_general_type : BOOLEAN;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregationType,
	#superclass : #PltAggregateType,
	#instVars : [
		'isGeneralType',
		'upperBound',
		'lowerBound'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregationType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregationType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregationType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregationType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregationType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregationType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregationType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregationType >> accept: aVisitor [
  ^aVisitor acceptAggregationType: self


]

{ #category : #'platypus-generated-copying' }
PltAggregationType >> aggregationTypeCopyTo: another [
  another fastSetLowerBound: self lowerBound.
  another fastSetUpperBound: self upperBound.
  another fastSetIsGeneralType: self isGeneralType


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> aggregationTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLowerBound: valuesloc removeFirst.
  self setUpperBound: valuesloc removeFirst.
  self setIsGeneralType: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> aggregationTypeToValues: values [
  values add: self lowerBound.
  values add: self upperBound.
  values add: self isGeneralType.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregationType >> fastSetIsGeneralType: aBoolean [
  isGeneralType := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregationType >> fastSetLowerBound: aPltBound [
  lowerBound := aPltBound


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregationType >> fastSetUpperBound: aPltBound [
  upperBound := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> fromValues: values [
  ^self aggregationTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> isGeneralType [
  ^isGeneralType


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> isGeneralType: aBoolean [
  isGeneralType := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregationType >> isGeneralTypeUsingContext: aContext [
  ^self isGeneralType


]

{ #category : #'platypus-generated-classifying' }
PltAggregationType >> isPltAggregationType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> localFromValues: values [
  ^self aggregationTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> localToValues: values [
  ^self aggregationTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> lowerBound [
  ^lowerBound


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> lowerBound: aPltBound [
  lowerBound := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> lowerBound: aPltBound upperBound: aPltBound1 isGeneralType: aBoolean [
	self setLowerBound:aPltBound.	
	self setUpperBound:aPltBound1.
	self setIsGeneralType:aBoolean.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregationType >> lowerBoundUsingContext: aContext [
  ^self lowerBound


]

{ #category : #'platypus-generated-copying' }
PltAggregationType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregationType >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregationTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregationType >> pltLocalCopyTo: another [
  self aggregationTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregationType >> setIsGeneralType: aBoolean [
  self isGeneralType: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregationType >> setLowerBound: aPltBound [
  self lowerBound: aPltBound


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregationType >> setUpperBound: aPltBound [
  self upperBound: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltAggregationType >> stepInitialize [
  super stepInitialize.
  lowerBound := nil.
  upperBound := nil.
  isGeneralType := false


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregationType >> toValues: values [
  ^self aggregationTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> upperBound [
  ^upperBound


]

{ #category : #'platypus-generated-accessing' }
PltAggregationType >> upperBound: aPltBound [
  upperBound := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregationType >> upperBoundUsingContext: aContext [
  ^self upperBound


]
