"
<ISO10303-11-EXPRESS>
ENTITY attribute 
	ABSTRACT SUPERTYPE OF ( ONEOF ( derived_attribute, explicit_attribute, inverse_attribute ) ) 
	SUBTYPE OF ( dictionary_instance );
	name : STRING;
	SELF\entity_instance.owner : entity_definition;
	domain : base_type;
	redeclaring : OPTIONAL attribute_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAttribute,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'domain',
		'name',
		'redeclaring'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAttribute class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttribute class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttribute class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttribute class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttribute class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttribute class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttribute class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAttribute >> accept: aVisitor [
  ^aVisitor acceptAttribute: self


]

{ #category : #'platypus-generated-copying' }
PltAttribute >> attributeCopyTo: another [
  another fastSetName: self name.
  another fastSetOwner: self owner.
  another fastSetDomain: self domain.
  another fastSetRedeclaring: self redeclaring


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> attributeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  self setDomain: valuesloc removeFirst.
  self setRedeclaring: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> attributeToValues: values [
  values add: self name.
  values add: self owner.
  values add: self domain.
  values add: self redeclaring.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> domain: aPltBaseType [
  domain := aPltBaseType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttribute >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttribute >> fastSetDomain: aPltBaseType [
  domain := aPltBaseType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttribute >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttribute >> fastSetOwner: aPltEntityDefinition [
  owner := aPltEntityDefinition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttribute >> fastSetRedeclaring: aPltAttributeReference [
  redeclaring := aPltAttributeReference


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> fromValues: values [
  ^self attributeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAttribute >> isPltAttribute [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> localFromValues: values [
  ^self attributeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> localToValues: values [
  ^self attributeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> name: aString owner: aPltEntityDefinition domain: aPltBaseType redeclaring: aPltAttributeReference [ 	self setName:aString.	self setOwner:aPltEntityDefinition.	self setDomain:aPltBaseType.	self setRedeclaring:aPltAttributeReference.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttribute >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> owner: aPltEntityDefinition [
  owner := aPltEntityDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttribute >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltAttribute >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAttribute >> pltCopyTo: another [
  super pltCopyTo: another.
  self attributeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAttribute >> pltLocalCopyTo: another [
  self attributeCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> redeclaring [
  ^redeclaring


]

{ #category : #'platypus-generated-accessing' }
PltAttribute >> redeclaring: aPltAttributeReference [
  redeclaring := aPltAttributeReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttribute >> redeclaringUsingContext: aContext [
  ^self redeclaring


]

{ #category : #'platypus-generated-set-accessing' }
PltAttribute >> setDomain: aPltBaseType [
  self domain: aPltBaseType


]

{ #category : #'platypus-generated-set-accessing' }
PltAttribute >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltAttribute >> setOwner: aPltEntityDefinition [
  self owner: aPltEntityDefinition


]

{ #category : #'platypus-generated-set-accessing' }
PltAttribute >> setRedeclaring: aPltAttributeReference [
  self redeclaring: aPltAttributeReference


]

{ #category : #'platypus-generated-initializing' }
PltAttribute >> stepInitialize [
  super stepInitialize.
  name := ''.
  owner := nil.
  domain := nil.
  redeclaring := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAttribute >> toValues: values [
  ^self attributeToValues: (super toValues: values)


]
