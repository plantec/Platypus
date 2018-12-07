"
<ISO10303-11-EXPRESS>
ENTITY model_contents 
	SUBTYPE OF ( session_instance );
	SELF\entity_instance.owner : schema_instance;
INVERSE
	instances : SET [ 0 : ? ] OF application_instance FOR owning_model;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltModelContents,
	#superclass : #PltSessionInstance,
	#instVars : [
		'headerInstances',
		'dataInstancesByEntityIndex',
		'dataInstances',
		'entitiesByInstanceIndex',
		'dataInstancesByLabelIndex',
		'positionByDataInstanceIndex',
		'recordComputedInstances'
	],
	#category : #'Platypus-PlatypusEnvironmentSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltModelContents class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltModelContents class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModelContents class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModelContents class >> schemaDefinition [
  ^PltPlatypusEnvironmentSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltModelContents class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltModelContents class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltModelContents class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltModelContents >> accept: aVisitor [
  ^aVisitor acceptModelContents: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltModelContents >> fastSetOwner: aPltSchemaInstance [
  owner := aPltSchemaInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> fromValues: values [
  ^self modelContentsFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-inverse-accessing' }
PltModelContents >> instances [
  ^self instancesUsingContext: self class context


]

{ #category : #'platypus-generated-inverse-accessing' }
PltModelContents >> instancesUsingContext: aContext [
  | founds |
  founds := Set new.
  aContext allInstancesOf: PltApplicationInstance do: [:repo :inst |  | curr |
        (curr := inst owningModel) == self ifTrue: [ founds add: curr ] ].
  ^founds


]

{ #category : #'platypus-generated-classifying' }
PltModelContents >> isPltModelContents [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> localFromValues: values [
  ^self modelContentsFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> localToValues: values [
  ^self modelContentsToValues: values


]

{ #category : #'platypus-generated-copying' }
PltModelContents >> modelContentsCopyTo: another [
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> modelContentsFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> modelContentsToValues: values [
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltModelContents >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltModelContents >> owner: aPltSchemaInstance [
  owner := aPltSchemaInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltModelContents >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltModelContents >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltModelContents >> pltCopyTo: another [
  super pltCopyTo: another.
  self modelContentsCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltModelContents >> pltLocalCopyTo: another [
  self modelContentsCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltModelContents >> setOwner: aPltSchemaInstance [
  self owner: aPltSchemaInstance


]

{ #category : #'platypus-generated-initializing' }
PltModelContents >> stepInitialize [
  super stepInitialize.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltModelContents >> toValues: values [
  ^self modelContentsToValues: (super toValues: values)


]
