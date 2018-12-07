"
<ISO10303-11-EXPRESS>
ENTITY parameter_definition 
	SUBTYPE OF ( dictionary_instance );
	SELF\entity_instance.owner : algorithm_declaration;
	name : STRING;
	by_copy : BOOLEAN;
	domain : parameter_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltParameterDefinition,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'domain',
		'byCopy',
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltParameterDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltParameterDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltParameterDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltParameterDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltParameterDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltParameterDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltParameterDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltParameterDefinition >> accept: aVisitor [
  ^aVisitor acceptParameterDefinition: self


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> byCopy [
  ^byCopy


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> byCopy: aBoolean [
  byCopy := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltParameterDefinition >> byCopyUsingContext: aContext [
  ^self byCopy


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> domain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltParameterDefinition >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltParameterDefinition >> fastSetByCopy: aBoolean [
  byCopy := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltParameterDefinition >> fastSetDomain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltParameterDefinition >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltParameterDefinition >> fastSetOwner: aPltAlgorithmDeclaration [
  owner := aPltAlgorithmDeclaration


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> fromValues: values [
  ^self parameterDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltParameterDefinition >> isPltParameterDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> localFromValues: values [
  ^self parameterDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> localToValues: values [
  ^self parameterDefinitionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltParameterDefinition >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltParameterDefinition >> owner: aPltAlgorithmDeclaration [
  owner := aPltAlgorithmDeclaration


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> owner: aPltAlgorithmDeclaration name: aString byCopy: aBoolean domain: aPltParameterType [ 	self setOwner:aPltAlgorithmDeclaration.	self setName:aString.	self setByCopy:aBoolean.	self setDomain:aPltParameterType.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltParameterDefinition >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltParameterDefinition >> parameterDefinitionCopyTo: another [
  another fastSetOwner: self owner.
  another fastSetName: self name.
  another fastSetByCopy: self byCopy.
  another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> parameterDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwner: valuesloc removeFirst.
  self setName: valuesloc removeFirst.
  self setByCopy: valuesloc removeFirst.
  self setDomain: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> parameterDefinitionToValues: values [
  values add: self owner.
  values add: self name.
  values add: self byCopy.
  values add: self domain.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltParameterDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltParameterDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self parameterDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltParameterDefinition >> pltLocalCopyTo: another [
  self parameterDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltParameterDefinition >> setByCopy: aBoolean [
  self byCopy: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltParameterDefinition >> setDomain: aPltParameterType [
  self domain: aPltParameterType


]

{ #category : #'platypus-generated-set-accessing' }
PltParameterDefinition >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltParameterDefinition >> setOwner: aPltAlgorithmDeclaration [
  self owner: aPltAlgorithmDeclaration


]

{ #category : #'platypus-generated-initializing' }
PltParameterDefinition >> stepInitialize [
  super stepInitialize.
  owner := nil.
  name := ''.
  byCopy := false.
  domain := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltParameterDefinition >> toValues: values [
  ^self parameterDefinitionToValues: (super toValues: values)


]
