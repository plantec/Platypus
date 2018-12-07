"
<ISO10303-11-EXPRESS>
ENTITY context_definition 
	ABSTRACT SUPERTYPE OF ( ONEOF ( schema_definition, statements_container ) ) 
	SUBTYPE OF ( dictionary_instance );
	name : STRING;
	constants : LIST OF constant_definition;
	types : LIST OF defined_type;
	entities : LIST OF entity_definition;
	algorithmes : LIST OF algorithm_declaration;
	SELF\entity_instance.owner : OPTIONAL context_owner;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltContextDefinition,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'entities',
		'constants',
		'identifiersCache',
		'types',
		'namedTypesCache',
		'name',
		'algorithmes'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltContextDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltContextDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltContextDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltContextDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltContextDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltContextDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltContextDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltContextDefinition >> accept: aVisitor [
  ^aVisitor acceptContextDefinition: self


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> algorithmes [
  ^algorithmes


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> algorithmes: aListOfPltAlgorithmDeclaration [
  algorithmes := aListOfPltAlgorithmDeclaration ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltAlgorithmDeclaration as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> algorithmesUsingContext: aContext [
  ^self algorithmes


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> constants [
  ^constants


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> constants: aListOfPltConstantDefinition [
  constants := aListOfPltConstantDefinition ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltConstantDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> constantsUsingContext: aContext [
  ^self constants


]

{ #category : #'platypus-generated-copying' }
PltContextDefinition >> contextDefinitionCopyTo: another [
  another fastSetName: self name.
  another fastSetConstants: self constants.
  another fastSetTypes: self types.
  another fastSetEntities: self entities.
  another fastSetAlgorithmes: self algorithmes.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> contextDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setConstants: valuesloc removeFirst.
  self setTypes: valuesloc removeFirst.
  self setEntities: valuesloc removeFirst.
  self setAlgorithmes: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> contextDefinitionToValues: values [
  values add: self name.
  values add: self constants.
  values add: self types.
  values add: self entities.
  values add: self algorithmes.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> entities [
  ^entities


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> entities: aListOfPltEntityDefinition [
  entities := aListOfPltEntityDefinition ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltEntityDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> entitiesUsingContext: aContext [
  ^self entities


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetAlgorithmes: aListOfPltAlgorithmDeclaration [
  algorithmes := aListOfPltAlgorithmDeclaration


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetConstants: aListOfPltConstantDefinition [
  constants := aListOfPltConstantDefinition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetEntities: aListOfPltEntityDefinition [
  entities := aListOfPltEntityDefinition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetOwner: aPltContextOwner [
  owner := aPltContextOwner


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltContextDefinition >> fastSetTypes: aListOfPltDefinedType [
  types := aListOfPltDefinedType


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> fromValues: values [
  ^self contextDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltContextDefinition >> isPltContextDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> localFromValues: values [
  ^self contextDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> localToValues: values [
  ^self contextDefinitionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> name: aString constants: aListOfPltConstantDefinition types: aListOfPltDefinedType entities: aListOfPltEntityDefinition algorithmes: aListOfPltAlgorithmDeclaration owner: aPltContextOwner [ 	self setName:aString.	self setConstants:aListOfPltConstantDefinition.	self setTypes:aListOfPltDefinedType.	self setEntities:aListOfPltEntityDefinition.	self setAlgorithmes:aListOfPltAlgorithmDeclaration.	self setOwner:aPltContextOwner.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> owner: aPltContextOwner [
  owner := aPltContextOwner


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltContextDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltContextDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self contextDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltContextDefinition >> pltLocalCopyTo: another [
  self contextDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setAlgorithmes: aListOfPltAlgorithmDeclaration [
  self algorithmes: aListOfPltAlgorithmDeclaration


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setConstants: aListOfPltConstantDefinition [
  self constants: aListOfPltConstantDefinition


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setEntities: aListOfPltEntityDefinition [
  self entities: aListOfPltEntityDefinition


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setOwner: aPltContextOwner [
  self owner: aPltContextOwner


]

{ #category : #'platypus-generated-set-accessing' }
PltContextDefinition >> setTypes: aListOfPltDefinedType [
  self types: aListOfPltDefinedType


]

{ #category : #'platypus-generated-initializing' }
PltContextDefinition >> stepInitialize [
  super stepInitialize.
  name := ''.
  constants := OrderedCollection new.
  types := OrderedCollection new.
  entities := OrderedCollection new.
  algorithmes := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltContextDefinition >> toValues: values [
  ^self contextDefinitionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> types [
  ^types


]

{ #category : #'platypus-generated-accessing' }
PltContextDefinition >> types: aListOfPltDefinedType [
  types := aListOfPltDefinedType ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltDefinedType as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltContextDefinition >> typesUsingContext: aContext [
  ^self types


]
