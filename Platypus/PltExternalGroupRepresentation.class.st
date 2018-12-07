"
<ISO10303-11-EXPRESS>
ENTITY external_group_representation 
	SUBTYPE OF ( group_representation );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExternalGroupRepresentation,
	#superclass : #PltGroupRepresentation,
	#instVars : [
		'recordsCache'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExternalGroupRepresentation class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalGroupRepresentation class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalGroupRepresentation class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalGroupRepresentation class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalGroupRepresentation class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalGroupRepresentation class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalGroupRepresentation class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExternalGroupRepresentation >> accept: aVisitor [
  ^aVisitor acceptExternalGroupRepresentation: self


]

{ #category : #'platypus-generated-copying' }
PltExternalGroupRepresentation >> externalGroupRepresentationCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> externalGroupRepresentationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> externalGroupRepresentationToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> fromValues: values [
  ^self externalGroupRepresentationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExternalGroupRepresentation >> isPltExternalGroupRepresentation [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> localFromValues: values [
  ^self externalGroupRepresentationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> localToValues: values [
  ^self externalGroupRepresentationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltExternalGroupRepresentation >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExternalGroupRepresentation >> pltCopyTo: another [
  super pltCopyTo: another.
  self externalGroupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExternalGroupRepresentation >> pltLocalCopyTo: another [
  self externalGroupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltExternalGroupRepresentation >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalGroupRepresentation >> toValues: values [
  ^self externalGroupRepresentationToValues: (super toValues: values)


]
