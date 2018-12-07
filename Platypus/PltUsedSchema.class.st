"
<ISO10303-11-EXPRESS>
ENTITY used_schema 
	SUBTYPE OF ( include_schema );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUsedSchema,
	#superclass : #PltIncludeSchema,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUsedSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUsedSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUsedSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUsedSchema class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUsedSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUsedSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUsedSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUsedSchema >> accept: aVisitor [
  ^aVisitor acceptUsedSchema: self


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> fromValues: values [
  ^self usedSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUsedSchema >> isPltUsedSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> localFromValues: values [
  ^self usedSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> localToValues: values [
  ^self usedSchemaToValues: values


]

{ #category : #'platypus-generated-copying' }
PltUsedSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUsedSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self usedSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUsedSchema >> pltLocalCopyTo: another [
  self usedSchemaCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltUsedSchema >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> toValues: values [
  ^self usedSchemaToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUsedSchema >> usedSchemaCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> usedSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUsedSchema >> usedSchemaToValues: values [
  ^values


]
