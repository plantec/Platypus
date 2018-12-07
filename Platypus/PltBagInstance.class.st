"
<ISO10303-11-EXPRESS>
ENTITY bag_instance 
	SUBTYPE OF ( variable_size_aggregation_instance );
	contents : BAG OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBagInstance,
	#superclass : #PltVariableSizeAggregationInstance,
	#instVars : [
		'contents'
	],
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBagInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagInstance class >> schemaDefinition [
  ^PltPlatypusAggregateDataSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBagInstance >> accept: aVisitor [
  ^aVisitor acceptBagInstance: self


]

{ #category : #'platypus-generated-copying' }
PltBagInstance >> bagInstanceCopyTo: another [
  another fastSetContents: self contents


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> bagInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setContents: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> bagInstanceToValues: values [
  values add: self contents.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltBagInstance >> contents [
  ^contents


]

{ #category : #'platypus-generated-accessing' }
PltBagInstance >> contents: aBagOfPltExpression [
  contents := aBagOfPltExpression ifNil: [ Bag new ] ifNotNil: [ aBagOfPltExpression as: Bag ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBagInstance >> contentsUsingContext: aContext [
  ^self contents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBagInstance >> fastSetContents: aBagOfPltExpression [
  contents := aBagOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> fromValues: values [
  ^self bagInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBagInstance >> isPltBagInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> localFromValues: values [
  ^self bagInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> localToValues: values [
  ^self bagInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltBagInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBagInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self bagInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBagInstance >> pltLocalCopyTo: another [
  self bagInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltBagInstance >> setContents: aBagOfPltExpression [
  self contents: aBagOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltBagInstance >> stepInitialize [
  super stepInitialize.
  contents := Bag new


]

{ #category : #'platypus-generated-group-accessing' }
PltBagInstance >> toValues: values [
  ^self bagInstanceToValues: (super toValues: values)


]
