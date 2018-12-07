"
<ISO10303-11-EXPRESS>
ENTITY schema_instance 
	SUBTYPE OF ( session_instance );
	name : STRING;
	associated_models : LIST [ 0 : ? ] OF model_contents;
	schemata : LIST [ 0 : ? ] OF schema_definition;
DERIVE
	accepted : entity_instance := SELF.accept_schema_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSchemaInstance,
	#superclass : #PltSessionInstance,
	#instVars : [
		'tamarisItemReferencesIndex',
		'errorsIndex',
		'associatedModels',
		'metaConceptsIndex',
		'name',
		'schemata',
		'namesBuilder'
	],
	#category : #'Platypus-PlatypusEnvironmentSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSchemaInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaInstance class >> schemaDefinition [
  ^PltPlatypusEnvironmentSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSchemaInstance >> accept: aVisitor [
  ^aVisitor acceptSchemaInstance: self


]

{ #category : #'platypus-generated-deriving' }
PltSchemaInstance >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltSchemaInstance >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltSchemaInstance >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptSchemaInstanceUsingContext: aContext


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> associatedModels [
  ^associatedModels


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> associatedModels: aListOfPltModelContents [
  associatedModels := aListOfPltModelContents ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltModelContents as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaInstance >> associatedModelsUsingContext: aContext [
  ^self associatedModels


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaInstance >> fastSetAssociatedModels: aListOfPltModelContents [
  associatedModels := aListOfPltModelContents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaInstance >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaInstance >> fastSetSchemata: aListOfPltSchemaDefinition [
  schemata := aListOfPltSchemaDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> fromValues: values [
  ^self schemaInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> interpreterScope [ 
	^ self associatedModels ifEmpty: [] ifNotEmpty: [:l | l first]


]

{ #category : #'platypus-generated-classifying' }
PltSchemaInstance >> isPltSchemaInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> localFromValues: values [
  ^self schemaInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> localToValues: values [
  ^self schemaInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> name: aString associatedModels: aListOfPltModelContents schemata: aListOfPltSchemaDefinition [ 	self setName:aString.	self setAssociatedModels:aListOfPltModelContents.	self setSchemata:aListOfPltSchemaDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaInstance >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-copying' }
PltSchemaInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSchemaInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self schemaInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSchemaInstance >> pltLocalCopyTo: another [
  self schemaInstanceCopyTo: another


]

{ #category : #'as yet unclassified' }
PltSchemaInstance >> schemaInstance [
	^ self
]

{ #category : #'platypus-generated-copying' }
PltSchemaInstance >> schemaInstanceCopyTo: another [
  another fastSetName: self name.
  another fastSetAssociatedModels: self associatedModels.
  another fastSetSchemata: self schemata


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> schemaInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setAssociatedModels: valuesloc removeFirst.
  self setSchemata: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> schemaInstanceToValues: values [
  values add: self name.
  values add: self associatedModels.
  values add: self schemata.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> schemata [
  ^schemata


]

{ #category : #'platypus-generated-accessing' }
PltSchemaInstance >> schemata: aListOfPltSchemaDefinition [
  schemata := aListOfPltSchemaDefinition ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltSchemaDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaInstance >> schemataUsingContext: aContext [
  ^self schemata


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaInstance >> setAssociatedModels: aListOfPltModelContents [
  self associatedModels: aListOfPltModelContents


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaInstance >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaInstance >> setSchemata: aListOfPltSchemaDefinition [
  self schemata: aListOfPltSchemaDefinition


]

{ #category : #'platypus-generated-initializing' }
PltSchemaInstance >> stepInitialize [
  super stepInitialize.
  name := ''.
  associatedModels := OrderedCollection new.
  schemata := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaInstance >> toValues: values [
  ^self schemaInstanceToValues: (super toValues: values)


]
