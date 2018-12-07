"
<ISO10303-11-EXPRESS>
ENTITY referenced_schema 
	SUBTYPE OF ( include_schema );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltReferencedSchema,
	#superclass : #PltIncludeSchema,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltReferencedSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltReferencedSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReferencedSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReferencedSchema class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReferencedSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltReferencedSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltReferencedSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltReferencedSchema >> accept: aVisitor [
  ^aVisitor acceptReferencedSchema: self


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> fromValues: values [
  ^self referencedSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltReferencedSchema >> isPltReferencedSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> localFromValues: values [
  ^self referencedSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> localToValues: values [
  ^self referencedSchemaToValues: values


]

{ #category : #'platypus-generated-copying' }
PltReferencedSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltReferencedSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self referencedSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltReferencedSchema >> pltLocalCopyTo: another [
  self referencedSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltReferencedSchema >> referencedSchemaCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> referencedSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> referencedSchemaToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltReferencedSchema >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltReferencedSchema >> toValues: values [
  ^self referencedSchemaToValues: (super toValues: values)


]
