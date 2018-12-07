"
<ISO10303-11-EXPRESS>
ENTITY group_representation 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( generic_instance );
	definition : entity_definition_reference;
	instRef : generic_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGroupRepresentation,
	#superclass : #PltGenericInstance,
	#instVars : [
		'instRef',
		'definition'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGroupRepresentation class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupRepresentation class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupRepresentation class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupRepresentation class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupRepresentation class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupRepresentation class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupRepresentation class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGroupRepresentation >> accept: aVisitor [
  ^aVisitor acceptGroupRepresentation: self


]

{ #category : #'platypus-generated-accessing' }
PltGroupRepresentation >> definition [
  ^definition


]

{ #category : #'platypus-generated-accessing' }
PltGroupRepresentation >> definition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> definition: aPltEntityDefinitionReference instRef: aPltGenericInstanceReference [ 	self setDefinition:aPltEntityDefinitionReference.	self setInstRef:aPltGenericInstanceReference.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGroupRepresentation >> definitionUsingContext: aContext [
  ^self definition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGroupRepresentation >> fastSetDefinition: aPltEntityDefinitionReference [
  definition := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGroupRepresentation >> fastSetInstRef: aPltGenericInstance [
  instRef := aPltGenericInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> fromValues: values [
  ^self groupRepresentationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGroupRepresentation >> groupRepresentationCopyTo: another [
  another fastSetDefinition: self definition.
  another fastSetInstRef: self instRef


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> groupRepresentationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDefinition: valuesloc removeFirst.
  self setInstRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> groupRepresentationToValues: values [
  values add: self definition.
  values add: self instRef.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltGroupRepresentation >> instRef [
  ^instRef


]

{ #category : #'platypus-generated-accessing' }
PltGroupRepresentation >> instRef: aPltGenericInstance [
  instRef := aPltGenericInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGroupRepresentation >> instRefUsingContext: aContext [
  ^self instRef


]

{ #category : #'platypus-generated-classifying' }
PltGroupRepresentation >> isPltGroupRepresentation [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> localFromValues: values [
  ^self groupRepresentationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> localToValues: values [
  ^self groupRepresentationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGroupRepresentation >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGroupRepresentation >> pltCopyTo: another [
  super pltCopyTo: another.
  self groupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGroupRepresentation >> pltLocalCopyTo: another [
  self groupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGroupRepresentation >> setDefinition: aPltEntityDefinitionReference [
  self definition: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltGroupRepresentation >> setInstRef: aPltGenericInstance [
  self instRef: aPltGenericInstance


]

{ #category : #'platypus-generated-initializing' }
PltGroupRepresentation >> stepInitialize [
  super stepInitialize.
  definition := nil.
  instRef := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupRepresentation >> toValues: values [
  ^self groupRepresentationToValues: (super toValues: values)


]
