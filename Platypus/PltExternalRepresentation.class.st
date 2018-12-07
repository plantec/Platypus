"
<ISO10303-11-EXPRESS>
ENTITY external_representation 
	SUBTYPE OF ( generic_instance );
	records : LIST OF simple_record;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExternalRepresentation,
	#superclass : #PltGenericInstance,
	#instVars : [
		'records'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExternalRepresentation class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalRepresentation class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalRepresentation class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalRepresentation class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalRepresentation class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalRepresentation class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalRepresentation class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExternalRepresentation >> accept: aVisitor [
  ^aVisitor acceptExternalRepresentation: self


]

{ #category : #'platypus-generated-copying' }
PltExternalRepresentation >> externalRepresentationCopyTo: another [
  another fastSetRecords: self records


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> externalRepresentationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRecords: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> externalRepresentationToValues: values [
  values add: self records.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltExternalRepresentation >> fastSetRecords: aListOfPltSimpleRecord [
  records := aListOfPltSimpleRecord


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> fromValues: values [
  ^self externalRepresentationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExternalRepresentation >> isPltExternalRepresentation [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> localFromValues: values [
  ^self externalRepresentationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> localToValues: values [
  ^self externalRepresentationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltExternalRepresentation >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExternalRepresentation >> pltCopyTo: another [
  super pltCopyTo: another.
  self externalRepresentationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExternalRepresentation >> pltLocalCopyTo: another [
  self externalRepresentationCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltExternalRepresentation >> records [
  ^records


]

{ #category : #'platypus-generated-accessing' }
PltExternalRepresentation >> records: aListOfPltSimpleRecord [
  records := aListOfPltSimpleRecord ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltSimpleRecord as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltExternalRepresentation >> recordsUsingContext: aContext [
  ^self records


]

{ #category : #'platypus-generated-set-accessing' }
PltExternalRepresentation >> setRecords: aListOfPltSimpleRecord [
  self records: aListOfPltSimpleRecord


]

{ #category : #'platypus-generated-initializing' }
PltExternalRepresentation >> stepInitialize [
  super stepInitialize.
  records := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalRepresentation >> toValues: values [
  ^self externalRepresentationToValues: (super toValues: values)


]
