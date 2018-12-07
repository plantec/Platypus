"
<ISO10303-11-EXPRESS>
ENTITY file_schema 
	SUBTYPE OF ( header_instance );
	schema_identifiers : LIST [ 1 : ? ] OF schema_name;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFileSchema,
	#superclass : #PltHeaderInstance,
	#instVars : [
		'schemaIdentifiers'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltFileSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileSchema class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltFileSchema >> accept: aVisitor [
  ^aVisitor acceptFileSchema: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileSchema >> fastSetSchemaIdentifiers: aListOfString [
  schemaIdentifiers := aListOfString


]

{ #category : #'platypus-generated-copying' }
PltFileSchema >> fileSchemaCopyTo: another [
  another fastSetSchemaIdentifiers: self schemaIdentifiers


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> fileSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSchemaIdentifiers: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> fileSchemaToValues: values [
  values add: self schemaIdentifiers.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> fromValues: values [
  ^self fileSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltFileSchema >> isPltFileSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> localFromValues: values [
  ^self fileSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> localToValues: values [
  ^self fileSchemaToValues: values


]

{ #category : #'platypus-generated-copying' }
PltFileSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltFileSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self fileSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltFileSchema >> pltLocalCopyTo: another [
  self fileSchemaCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltFileSchema >> schemaIdentifiers [
  ^schemaIdentifiers


]

{ #category : #'platypus-generated-accessing' }
PltFileSchema >> schemaIdentifiers: aListOfString [
  schemaIdentifiers := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileSchema >> schemaIdentifiersUsingContext: aContext [
  ^self schemaIdentifiers


]

{ #category : #'platypus-generated-set-accessing' }
PltFileSchema >> setSchemaIdentifiers: aListOfString [
  self schemaIdentifiers: aListOfString


]

{ #category : #'platypus-generated-initializing' }
PltFileSchema >> stepInitialize [
  super stepInitialize.
  schemaIdentifiers := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltFileSchema >> toValues: values [
  ^self fileSchemaToValues: (super toValues: values)


]
