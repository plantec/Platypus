"
<ISO10303-11-EXPRESS>
ENTITY constant_definition 
	SUBTYPE OF ( dictionary_instance );
	name : STRING;
	domain : base_type;
	initializer : expression;
	SELF\entity_instance.owner : context_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltConstantDefinition,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'domain',
		'initializer',
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltConstantDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltConstantDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltConstantDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltConstantDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltConstantDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltConstantDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltConstantDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltConstantDefinition >> accept: aVisitor [
  ^aVisitor acceptConstantDefinition: self


]

{ #category : #'platypus-generated-copying' }
PltConstantDefinition >> constantDefinitionCopyTo: another [
  another fastSetName: self name.
  another fastSetDomain: self domain.
  another fastSetInitializer: self initializer.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> constantDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setDomain: valuesloc removeFirst.
  self setInitializer: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> constantDefinitionToValues: values [
  values add: self name.
  values add: self domain.
  values add: self initializer.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> domain: aPltBaseType [
  domain := aPltBaseType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltConstantDefinition >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltConstantDefinition >> fastSetDomain: aPltBaseType [
  domain := aPltBaseType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltConstantDefinition >> fastSetInitializer: aPltExpression [
  initializer := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltConstantDefinition >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltConstantDefinition >> fastSetOwner: aPltContextDefinition [
  owner := aPltContextDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> fromValues: values [
  ^self constantDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> initializer [
  ^initializer


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> initializer: aPltExpression [
  initializer := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltConstantDefinition >> initializerUsingContext: aContext [
  ^self initializer


]

{ #category : #'platypus-generated-classifying' }
PltConstantDefinition >> isPltConstantDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> localFromValues: values [
  ^self constantDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> localToValues: values [
  ^self constantDefinitionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> name: aString domain: aPltBaseType initializer: aPltExpression owner: aPltContextDefinition [ 	self setName:aString.	self setDomain:aPltBaseType.	self setInitializer:aPltExpression.	self setOwner:aPltContextDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltConstantDefinition >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltConstantDefinition >> owner: aPltContextDefinition [
  owner := aPltContextDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltConstantDefinition >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltConstantDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltConstantDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self constantDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltConstantDefinition >> pltLocalCopyTo: another [
  self constantDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltConstantDefinition >> setDomain: aPltBaseType [
  self domain: aPltBaseType


]

{ #category : #'platypus-generated-set-accessing' }
PltConstantDefinition >> setInitializer: aPltExpression [
  self initializer: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltConstantDefinition >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltConstantDefinition >> setOwner: aPltContextDefinition [
  self owner: aPltContextDefinition


]

{ #category : #'platypus-generated-initializing' }
PltConstantDefinition >> stepInitialize [
  super stepInitialize.
  name := ''.
  domain := nil.
  initializer := nil.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltConstantDefinition >> toValues: values [
  ^self constantDefinitionToValues: (super toValues: values)


]
