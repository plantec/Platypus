"
<ISO10303-11-EXPRESS>
ENTITY list_instance 
	SUBTYPE OF ( variable_size_aggregation_instance );
	contents : LIST OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltListInstance,
	#superclass : #PltVariableSizeAggregationInstance,
	#instVars : [
		'contents'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltListInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltListInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltListInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltListInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltListInstance >> accept: aVisitor [
  ^aVisitor acceptListInstance: self


]

{ #category : #'platypus-generated-accessing' }
PltListInstance >> contents [
  ^contents


]

{ #category : #'platypus-generated-accessing' }
PltListInstance >> contents: aListOfPltExpression [
  contents := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltListInstance >> contentsUsingContext: aContext [
  ^self contents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltListInstance >> fastSetContents: aListOfPltExpression [
  contents := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> fromValues: values [
  ^self listInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltListInstance >> isPltListInstance [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltListInstance >> listInstanceCopyTo: another [
  another fastSetContents: self contents


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> listInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setContents: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> listInstanceToValues: values [
  values add: self contents.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> localFromValues: values [
  ^self listInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> localToValues: values [
  ^self listInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltListInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltListInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self listInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltListInstance >> pltLocalCopyTo: another [
  self listInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltListInstance >> setContents: aListOfPltExpression [
  self contents: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltListInstance >> stepInitialize [
  super stepInitialize.
  contents := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltListInstance >> toValues: values [
  ^self listInstanceToValues: (super toValues: values)


]
