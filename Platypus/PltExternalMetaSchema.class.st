"
<ISO10303-11-EXPRESS>
ENTITY external_meta_schema 
	SUBTYPE OF ( external_schema );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExternalMetaSchema,
	#superclass : #PltExternalSchema,
	#instVars : [
		'nativeSchema'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExternalMetaSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalMetaSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalMetaSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalMetaSchema class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExternalMetaSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalMetaSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExternalMetaSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExternalMetaSchema >> accept: aVisitor [
  ^aVisitor acceptExternalMetaSchema: self


]

{ #category : #'platypus-generated-copying' }
PltExternalMetaSchema >> externalMetaSchemaCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> externalMetaSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> externalMetaSchemaToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> fromValues: values [
  ^self externalMetaSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExternalMetaSchema >> isPltExternalMetaSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> localFromValues: values [
  ^self externalMetaSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> localToValues: values [
  ^self externalMetaSchemaToValues: values


]

{ #category : #'platypus-generated-copying' }
PltExternalMetaSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExternalMetaSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self externalMetaSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExternalMetaSchema >> pltLocalCopyTo: another [
  self externalMetaSchemaCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltExternalMetaSchema >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltExternalMetaSchema >> toValues: values [
  ^self externalMetaSchemaToValues: (super toValues: values)


]
