"
<ISO10303-11-EXPRESS>
ENTITY internal_group_representation 
	SUBTYPE OF ( group_representation );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInternalGroupRepresentation,
	#superclass : #PltGroupRepresentation,
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInternalGroupRepresentation class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalGroupRepresentation class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalGroupRepresentation class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalGroupRepresentation class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInternalGroupRepresentation class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalGroupRepresentation class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInternalGroupRepresentation class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInternalGroupRepresentation >> accept: aVisitor [
  ^aVisitor acceptInternalGroupRepresentation: self


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> fromValues: values [
  ^self internalGroupRepresentationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInternalGroupRepresentation >> internalGroupRepresentationCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> internalGroupRepresentationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> internalGroupRepresentationToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInternalGroupRepresentation >> isPltInternalGroupRepresentation [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> localFromValues: values [
  ^self internalGroupRepresentationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> localToValues: values [
  ^self internalGroupRepresentationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltInternalGroupRepresentation >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInternalGroupRepresentation >> pltCopyTo: another [
  super pltCopyTo: another.
  self internalGroupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInternalGroupRepresentation >> pltLocalCopyTo: another [
  self internalGroupRepresentationCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltInternalGroupRepresentation >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltInternalGroupRepresentation >> toValues: values [
  ^self internalGroupRepresentationToValues: (super toValues: values)


]
