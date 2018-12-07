"
<ISO10303-11-EXPRESS>
ENTITY population_dependent_bound 
	SUBTYPE OF ( bound );
	bound_value : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPopulationDependentBound,
	#superclass : #PltBound,
	#instVars : [
		'boundValue'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltPopulationDependentBound class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltPopulationDependentBound class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPopulationDependentBound class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPopulationDependentBound class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPopulationDependentBound class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltPopulationDependentBound class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPopulationDependentBound class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltPopulationDependentBound >> accept: aVisitor [
  ^aVisitor acceptPopulationDependentBound: self


]

{ #category : #'platypus-generated-accessing' }
PltPopulationDependentBound >> boundValue [
  ^boundValue


]

{ #category : #'platypus-generated-accessing' }
PltPopulationDependentBound >> boundValue: aPltExpression [
  boundValue := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltPopulationDependentBound >> boundValueUsingContext: aContext [
  ^self boundValue


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltPopulationDependentBound >> fastSetBoundValue: aPltExpression [
  boundValue := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> fromValues: values [
  ^self populationDependentBoundFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltPopulationDependentBound >> isPltPopulationDependentBound [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> localFromValues: values [
  ^self populationDependentBoundFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> localToValues: values [
  ^self populationDependentBoundToValues: values


]

{ #category : #'platypus-generated-copying' }
PltPopulationDependentBound >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltPopulationDependentBound >> pltCopyTo: another [
  super pltCopyTo: another.
  self populationDependentBoundCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPopulationDependentBound >> pltLocalCopyTo: another [
  self populationDependentBoundCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPopulationDependentBound >> populationDependentBoundCopyTo: another [
  another fastSetBoundValue: self boundValue


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> populationDependentBoundFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setBoundValue: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> populationDependentBoundToValues: values [
  values add: self boundValue.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltPopulationDependentBound >> setBoundValue: aPltExpression [
  self boundValue: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltPopulationDependentBound >> stepInitialize [
  super stepInitialize.
  boundValue := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltPopulationDependentBound >> toValues: values [
  ^self populationDependentBoundToValues: (super toValues: values)


]
