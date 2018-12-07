"
<ISO10303-11-EXPRESS>
ENTITY aggregate_instance 
	ABSTRACT SUPERTYPE OF ( ONEOF ( array_instance, variable_size_aggregation_instance ) ) 
	SUBTYPE OF ( aggregate_data );
	lower_bound : integer_literal;
	upper_bound : integer_literal;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAggregateInstance,
	#superclass : #PltAggregateData,
	#instVars : [
		'general',
		'upperBound',
		'lowerBound'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAggregateInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAggregateInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAggregateInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAggregateInstance >> accept: aVisitor [
  ^aVisitor acceptAggregateInstance: self


]

{ #category : #'platypus-generated-copying' }
PltAggregateInstance >> aggregateInstanceCopyTo: another [
  another fastSetLowerBound: self lowerBound.
  another fastSetUpperBound: self upperBound


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> aggregateInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLowerBound: valuesloc removeFirst.
  self setUpperBound: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> aggregateInstanceToValues: values [
  values add: self lowerBound.
  values add: self upperBound.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInstance >> fastSetLowerBound: aPltIntegerLiteral [
  lowerBound := aPltIntegerLiteral


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAggregateInstance >> fastSetUpperBound: aPltIntegerLiteral [
  upperBound := aPltIntegerLiteral


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> fromValues: values [
  ^self aggregateInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAggregateInstance >> isPltAggregateInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> localFromValues: values [
  ^self aggregateInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> localToValues: values [
  ^self aggregateInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInstance >> lowerBound [
  ^lowerBound


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInstance >> lowerBound: aPltIntegerLiteral [
  lowerBound := aPltIntegerLiteral


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> lowerBound: aPltIntegerLiteral upperBound: aPltIntegerLiteral1 [ 	
	self setLowerBound:aPltIntegerLiteral.	self setUpperBound:aPltIntegerLiteral1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInstance >> lowerBoundUsingContext: aContext [
  ^self lowerBound


]

{ #category : #'platypus-generated-copying' }
PltAggregateInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAggregateInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self aggregateInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAggregateInstance >> pltLocalCopyTo: another [
  self aggregateInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInstance >> setLowerBound: aPltIntegerLiteral [
  self lowerBound: aPltIntegerLiteral


]

{ #category : #'platypus-generated-set-accessing' }
PltAggregateInstance >> setUpperBound: aPltIntegerLiteral [
  self upperBound: aPltIntegerLiteral


]

{ #category : #'platypus-generated-initializing' }
PltAggregateInstance >> stepInitialize [
  super stepInitialize.
  lowerBound := nil.
  upperBound := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAggregateInstance >> toValues: values [
  ^self aggregateInstanceToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInstance >> upperBound [
  ^upperBound


]

{ #category : #'platypus-generated-accessing' }
PltAggregateInstance >> upperBound: aPltIntegerLiteral [
  upperBound := aPltIntegerLiteral


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAggregateInstance >> upperBoundUsingContext: aContext [
  ^self upperBound


]
