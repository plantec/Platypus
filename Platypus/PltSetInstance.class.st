"
<ISO10303-11-EXPRESS>
ENTITY set_instance 
	SUBTYPE OF ( variable_size_aggregation_instance );
	contents : SET OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSetInstance,
	#superclass : #PltVariableSizeAggregationInstance,
	#instVars : [
		'contents'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSetInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSetInstance >> accept: aVisitor [
  ^aVisitor acceptSetInstance: self


]

{ #category : #'platypus-generated-accessing' }
PltSetInstance >> contents [
  ^contents


]

{ #category : #'platypus-generated-accessing' }
PltSetInstance >> contents: aSetOfPltExpression [
  contents := aSetOfPltExpression ifNil: [ Set new ] ifNotNil: [ aSetOfPltExpression as: Set ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSetInstance >> contentsUsingContext: aContext [
  ^self contents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSetInstance >> fastSetContents: aSetOfPltExpression [
  contents := aSetOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> fromValues: values [
  ^self setInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSetInstance >> isPltSetInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> localFromValues: values [
  ^self setInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> localToValues: values [
  ^self setInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSetInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSetInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self setInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSetInstance >> pltLocalCopyTo: another [
  self setInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSetInstance >> setContents: aSetOfPltExpression [
  self contents: aSetOfPltExpression


]

{ #category : #'platypus-generated-copying' }
PltSetInstance >> setInstanceCopyTo: another [
  another fastSetContents: self contents


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> setInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setContents: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> setInstanceToValues: values [
  values add: self contents.
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSetInstance >> stepInitialize [
  super stepInitialize.
  contents := Set new


]

{ #category : #'platypus-generated-group-accessing' }
PltSetInstance >> toValues: values [
  ^self setInstanceToValues: (super toValues: values)


]
