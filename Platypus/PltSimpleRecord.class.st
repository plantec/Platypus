"
<ISO10303-11-EXPRESS>
ENTITY simple_record 
	SUBTYPE OF ( entity_instance );
	definition : entity_definition_reference;
	parameters : LIST OF primitive;
	SELF\entity_instance.owner : generic_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSimpleRecord,
	#superclass : #PltEntityInstance,
	#instVars : [
		'parameters',
		'definition'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSimpleRecord class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleRecord class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleRecord class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleRecord class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSimpleRecord class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleRecord class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSimpleRecord class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSimpleRecord >> accept: aVisitor [
  ^aVisitor acceptSimpleRecord: self


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> definition [
  ^definition


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> definition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> definition: aPltEntityDefinitionReference parameters: aListOfPltExpression owner: aPltGenericInstance [ 	self setDefinition:aPltEntityDefinitionReference.	self setParameters:aListOfPltExpression.	self setOwner:aPltGenericInstance.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSimpleRecord >> definitionUsingContext: aContext [
  ^self definition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSimpleRecord >> fastSetDefinition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSimpleRecord >> fastSetOwner: aPltGenericInstance [
  owner := aPltGenericInstance


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSimpleRecord >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> fromValues: values [
  ^self simpleRecordFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSimpleRecord >> isPltSimpleRecord [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> localFromValues: values [
  ^self simpleRecordFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> localToValues: values [
  ^self simpleRecordToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> owner: aPltGenericInstance [
  owner := aPltGenericInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSimpleRecord >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltSimpleRecord >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSimpleRecord >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltSimpleRecord >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSimpleRecord >> pltCopyTo: another [
  super pltCopyTo: another.
  self simpleRecordCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSimpleRecord >> pltLocalCopyTo: another [
  self simpleRecordCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSimpleRecord >> setDefinition: aPltEntityDefinitionReference [
  self definition: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltSimpleRecord >> setOwner: aPltGenericInstance [
  self owner: aPltGenericInstance


]

{ #category : #'platypus-generated-set-accessing' }
PltSimpleRecord >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-copying' }
PltSimpleRecord >> simpleRecordCopyTo: another [
  another fastSetDefinition: self definition.
  another fastSetParameters: self parameters.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> simpleRecordFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDefinition: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> simpleRecordToValues: values [
  values add: self definition.
  values add: self parameters.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSimpleRecord >> stepInitialize [
  super stepInitialize.
  definition := nil.
  parameters := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltSimpleRecord >> toValues: values [
  ^self simpleRecordToValues: (super toValues: values)


]
