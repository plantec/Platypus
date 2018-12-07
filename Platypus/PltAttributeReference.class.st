"
<ISO10303-11-EXPRESS>
ENTITY attribute_reference 
	SUBTYPE OF ( dictionary_instance_reference );
	SELF\dictionary_instance_reference.ref : attribute;
	entity_ref : entity_definition_reference;
DERIVE
	SELF\named_type_reference.accepted : entity_instance := SELF.accept_attribute_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAttributeReference,
	#superclass : #PltDictionaryInstanceReference,
	#instVars : [
		'entityRef'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAttributeReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAttributeReference >> accept: aVisitor [
  ^aVisitor acceptAttributeReference: self


]

{ #category : #'platypus-generated-deriving' }
PltAttributeReference >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltAttributeReference >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltAttributeReference >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptAttributeReferenceUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltAttributeReference >> attributeReferenceCopyTo: another [
  another fastSetRef: self ref.
  another fastSetEntityRef: self entityRef


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> attributeReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRef: valuesloc removeFirst.
  self setEntityRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> attributeReferenceToValues: values [
  values add: self ref.
  values add: self entityRef.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltAttributeReference >> entityRef [
  ^entityRef


]

{ #category : #'platypus-generated-accessing' }
PltAttributeReference >> entityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttributeReference >> entityRefUsingContext: aContext [
  ^self entityRef


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttributeReference >> fastSetEntityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttributeReference >> fastSetRef: aPltAttribute [
  ref := aPltAttribute


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> fromValues: values [
  ^self attributeReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAttributeReference >> isPltAttributeReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> localFromValues: values [
  ^self attributeReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> localToValues: values [
  ^self attributeReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAttributeReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAttributeReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self attributeReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAttributeReference >> pltLocalCopyTo: another [
  self attributeReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAttributeReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltAttributeReference >> ref: aPltAttribute [
  ref := aPltAttribute


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> ref: aPltAttribute entityRef: aPltEntityDefinitionReference [ 	self setRef:aPltAttribute.	self setEntityRef:aPltEntityDefinitionReference.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttributeReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltAttributeReference >> setEntityRef: aPltEntityDefinitionReference [
  self entityRef: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltAttributeReference >> setRef: aPltAttribute [
  self ref: aPltAttribute


]

{ #category : #'platypus-generated-initializing' }
PltAttributeReference >> stepInitialize [
  super stepInitialize.
  ref := nil.
  entityRef := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeReference >> toValues: values [
  ^self attributeReferenceToValues: (super toValues: values)


]
