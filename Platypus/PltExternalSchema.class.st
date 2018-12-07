"
<ISO10303-11-EXPRESS>
ENTITY external_schema 
	SUBTYPE OF ( dictionary_instance );
	name : schema_name;
	SELF\entity_instance.owner : schema_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExternalSchema,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExternalSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalSchema class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExternalSchema >> accept: aVisitor [
  ^aVisitor acceptExternalSchema: self


]

{ #category : #'platypus-generated-copying' }
PltExternalSchema >> externalSchemaCopyTo: another [
  another fastSetName: self name.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> externalSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> externalSchemaToValues: values [
  values add: self name.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltExternalSchema >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltExternalSchema >> fastSetOwner: aPltSchemaDefinition [
  owner := aPltSchemaDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> fromValues: values [
  ^self externalSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExternalSchema >> isPltExternalSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> localFromValues: values [
  ^self externalSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> localToValues: values [
  ^self externalSchemaToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltExternalSchema >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltExternalSchema >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> name: aString owner: aPltSchemaDefinition [ 	self setName:aString.	self setOwner:aPltSchemaDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltExternalSchema >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltExternalSchema >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltExternalSchema >> owner: aPltSchemaDefinition [
  owner := aPltSchemaDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltExternalSchema >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltExternalSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExternalSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self externalSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExternalSchema >> pltLocalCopyTo: another [
  self externalSchemaCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltExternalSchema >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltExternalSchema >> setOwner: aPltSchemaDefinition [
  self owner: aPltSchemaDefinition


]

{ #category : #'platypus-generated-initializing' }
PltExternalSchema >> stepInitialize [
  super stepInitialize.
  name := ''.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalSchema >> toValues: values [
  ^self externalSchemaToValues: (super toValues: values)


]
