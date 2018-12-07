"
<ISO10303-11-EXPRESS>
ENTITY internal_representation 
	SUBTYPE OF ( generic_instance );
	definition : entity_definition_reference;
	parameters : LIST OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInternalRepresentation,
	#superclass : #PltGenericInstance,
	#instVars : [
		'parameters',
		'definition'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInternalRepresentation class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalRepresentation class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalRepresentation class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalRepresentation class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalRepresentation class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalRepresentation class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalRepresentation class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInternalRepresentation >> accept: aVisitor [
  ^aVisitor acceptInternalRepresentation: self


]

{ #category : #'platypus-generated-accessing' }
PltInternalRepresentation >> definition [
  ^definition


]

{ #category : #'platypus-generated-accessing' }
PltInternalRepresentation >> definition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> definition: aPltEntityDefinitionReference parameters: aListOfPltExpression [ 	self setDefinition:aPltEntityDefinitionReference.	self setParameters:aListOfPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInternalRepresentation >> definitionUsingContext: aContext [
  ^self definition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInternalRepresentation >> fastSetDefinition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInternalRepresentation >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> fromValues: values [
  ^self internalRepresentationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInternalRepresentation >> internalRepresentationCopyTo: another [
  another fastSetDefinition: self definition.
  another fastSetParameters: self parameters


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> internalRepresentationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDefinition: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> internalRepresentationToValues: values [
  values add: self definition.
  values add: self parameters.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInternalRepresentation >> isPltInternalRepresentation [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> localFromValues: values [
  ^self internalRepresentationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> localToValues: values [
  ^self internalRepresentationToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltInternalRepresentation >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltInternalRepresentation >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInternalRepresentation >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltInternalRepresentation >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInternalRepresentation >> pltCopyTo: another [
  super pltCopyTo: another.
  self internalRepresentationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInternalRepresentation >> pltLocalCopyTo: another [
  self internalRepresentationCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltInternalRepresentation >> setDefinition: aPltEntityDefinitionReference [
  self definition: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltInternalRepresentation >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltInternalRepresentation >> stepInitialize [
  super stepInitialize.
  definition := nil.
  parameters := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalRepresentation >> toValues: values [
  ^self internalRepresentationToValues: (super toValues: values)


]
