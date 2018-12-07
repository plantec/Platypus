"
<ISO10303-11-EXPRESS>
ENTITY named_type 
	ABSTRACT SUPERTYPE OF ( ONEOF ( entity_definition, defined_type ) ) 
	SUBTYPE OF ( dictionary_instance );
	name : STRING;
	where_rules : LIST [ 0 : ? ] OF where_rule;
	SELF\entity_instance.owner : context_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNamedType,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'identifiersCache',
		'whereRules',
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNamedType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNamedType >> accept: aVisitor [
  ^aVisitor acceptNamedType: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNamedType >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNamedType >> fastSetOwner: aPltContextDefinition [
  owner := aPltContextDefinition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNamedType >> fastSetWhereRules: aListOfPltWhereRule [
  whereRules := aListOfPltWhereRule


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> fromValues: values [
  ^self namedTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNamedType >> isPltNamedType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> localFromValues: values [
  ^self namedTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> localToValues: values [
  ^self namedTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> name: aString whereRules: aListOfPltWhereRule owner: aPltContextDefinition [ 	self setName:aString.	self setWhereRules:aListOfPltWhereRule.	self setOwner:aPltContextDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNamedType >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-copying' }
PltNamedType >> namedTypeCopyTo: another [
  another fastSetName: self name.
  another fastSetWhereRules: self whereRules.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> namedTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setWhereRules: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> namedTypeToValues: values [
  values add: self name.
  values add: self whereRules.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> owner: aPltContextDefinition [
  owner := aPltContextDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNamedType >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltNamedType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNamedType >> pltCopyTo: another [
  super pltCopyTo: another.
  self namedTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNamedType >> pltLocalCopyTo: another [
  self namedTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltNamedType >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltNamedType >> setOwner: aPltContextDefinition [
  self owner: aPltContextDefinition


]

{ #category : #'platypus-generated-set-accessing' }
PltNamedType >> setWhereRules: aListOfPltWhereRule [
  self whereRules: aListOfPltWhereRule


]

{ #category : #'platypus-generated-initializing' }
PltNamedType >> stepInitialize [
  super stepInitialize.
  name := ''.
  whereRules := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedType >> toValues: values [
  ^self namedTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> whereRules [
  ^whereRules


]

{ #category : #'platypus-generated-accessing' }
PltNamedType >> whereRules: aListOfPltWhereRule [
  whereRules := aListOfPltWhereRule ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltWhereRule as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNamedType >> whereRulesUsingContext: aContext [
  ^self whereRules


]
