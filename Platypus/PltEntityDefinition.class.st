"
<ISO10303-11-EXPRESS>
ENTITY entity_definition 
	SUBTYPE OF ( named_type );
	supertype_constraint : OPTIONAL supertype_constraint;
	supertypes : LIST OF UNIQUE entity_definition_reference;
	attributes : LIST OF UNIQUE attribute;
	uniqueness_rules : LIST OF UNIQUE uniqueness_rule;
	complex : BOOLEAN;
	instantiable : BOOLEAN;
	independent : BOOLEAN;
DERIVE
	accepted : entity_instance := SELF.accept_entity_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityDefinition,
	#superclass : #PltNamedType,
	#instVars : [
		'uniquenessRules',
		'instantiable',
		'complex',
		'supertypeConstraint',
		'subtypes',
		'independent',
		'supertypes',
		'attributes'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityDefinition >> accept: aVisitor [
  ^aVisitor acceptEntityDefinition: self


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinition >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinition >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinition >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptEntityDefinitionUsingContext: aContext


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> attributes [
  ^attributes


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> attributes: aListOfPltAttribute [
  attributes := aListOfPltAttribute ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> attributesUsingContext: aContext [
  ^self attributes


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> complex [
  ^complex


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> complex: aBoolean [
  complex := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> complexUsingContext: aContext [
  ^self complex


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinition >> entityDefinitionCopyTo: another [
  another fastSetSupertypeConstraint: self supertypeConstraint.
  another fastSetSupertypes: self supertypes.
  another fastSetAttributes: self attributes.
  another fastSetUniquenessRules: self uniquenessRules.
  another fastSetComplex: self complex.
  another fastSetInstantiable: self instantiable.
  another fastSetIndependent: self independent


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> entityDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSupertypeConstraint: valuesloc removeFirst.
  self setSupertypes: valuesloc removeFirst.
  self setAttributes: valuesloc removeFirst.
  self setUniquenessRules: valuesloc removeFirst.
  self setComplex: valuesloc removeFirst.
  self setInstantiable: valuesloc removeFirst.
  self setIndependent: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> entityDefinitionToValues: values [
  values add: self supertypeConstraint.
  values add: self supertypes.
  values add: self attributes.
  values add: self uniquenessRules.
  values add: self complex.
  values add: self instantiable.
  values add: self independent.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetAttributes: aListOfPltAttribute [
  attributes := aListOfPltAttribute


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetComplex: aBoolean [
  complex := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetIndependent: aBoolean [
  independent := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetInstantiable: aBoolean [
  instantiable := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetSupertypeConstraint: aPltSupertypeConstraint [
  supertypeConstraint := aPltSupertypeConstraint


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetSupertypes: aListOfPltEntityDefinitionReference [
  supertypes := aListOfPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinition >> fastSetUniquenessRules: aListOfPltUniquenessRule [
  uniquenessRules := aListOfPltUniquenessRule


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> fromValues: values [
  ^self entityDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> independent [
  ^independent


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> independent: aBoolean [
  independent := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> independentUsingContext: aContext [
  ^self independent


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> instantiable [
  ^instantiable


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> instantiable: aBoolean [
  instantiable := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> instantiableUsingContext: aContext [
  ^self instantiable


]

{ #category : #'platypus-generated-classifying' }
PltEntityDefinition >> isPltEntityDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> localFromValues: values [
  ^self entityDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> localToValues: values [
  ^self entityDefinitionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinition >> pltLocalCopyTo: another [
  self entityDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setAttributes: aListOfPltAttribute [
  self attributes: aListOfPltAttribute


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setComplex: aBoolean [
  self complex: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setIndependent: aBoolean [
  self independent: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setInstantiable: aBoolean [
  self instantiable: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setSupertypeConstraint: aPltSupertypeConstraint [
  self supertypeConstraint: aPltSupertypeConstraint


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setSupertypes: aListOfPltEntityDefinitionReference [
  self supertypes: aListOfPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinition >> setUniquenessRules: aListOfPltUniquenessRule [
  self uniquenessRules: aListOfPltUniquenessRule


]

{ #category : #'platypus-generated-initializing' }
PltEntityDefinition >> stepInitialize [
  super stepInitialize.
  supertypeConstraint := nil.
  supertypes := OrderedCollection new.
  attributes := OrderedCollection new.
  uniquenessRules := OrderedCollection new.
  complex := false.
  instantiable := false.
  independent := false


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> supertypeConstraint [
  ^supertypeConstraint


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> supertypeConstraint: aPltSupertypeConstraint [
  supertypeConstraint := aPltSupertypeConstraint


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> supertypeConstraint: aPltSupertypeConstraint supertypes: aListOfPltEntityDefinitionReference attributes: aListOfPltAttribute uniquenessRules: aListOfPltUniquenessRule complex: aBoolean instantiable: aBoolean1 independent: aBoolean2 [ 	self setSupertypeConstraint:aPltSupertypeConstraint.	self setSupertypes:aListOfPltEntityDefinitionReference.	self setAttributes:aListOfPltAttribute.	self setUniquenessRules:aListOfPltUniquenessRule.	self setComplex:aBoolean.	self setInstantiable:aBoolean1.	self setIndependent:aBoolean2.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> supertypeConstraintUsingContext: aContext [
  ^self supertypeConstraint


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> supertypes [
  ^supertypes


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> supertypes: aListOfPltEntityDefinitionReference [
  supertypes := aListOfPltEntityDefinitionReference ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltEntityDefinitionReference as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> supertypesUsingContext: aContext [
  ^self supertypes


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinition >> toValues: values [
  ^self entityDefinitionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> uniquenessRules [
  ^uniquenessRules


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinition >> uniquenessRules: aListOfPltUniquenessRule [
  uniquenessRules := aListOfPltUniquenessRule ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltUniquenessRule as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinition >> uniquenessRulesUsingContext: aContext [
  ^self uniquenessRules


]
