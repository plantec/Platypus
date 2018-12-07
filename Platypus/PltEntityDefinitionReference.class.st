"
<ISO10303-11-EXPRESS>
ENTITY entity_definition_reference 
	SUBTYPE OF ( named_type_reference );
	SELF\named_type_reference.ref : entity_definition;
DERIVE
	SELF\named_type_reference.accepted : entity_instance := SELF.accept_entity_definition_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityDefinitionReference,
	#superclass : #PltNamedTypeReference,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityDefinitionReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinitionReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinitionReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinitionReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityDefinitionReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinitionReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityDefinitionReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityDefinitionReference >> accept: aVisitor [
  ^aVisitor acceptEntityDefinitionReference: self


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinitionReference >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinitionReference >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltEntityDefinitionReference >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptEntityDefinitionReferenceUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinitionReference >> entityDefinitionReferenceCopyTo: another [
  another fastSetRef: self ref


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> entityDefinitionReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> entityDefinitionReferenceToValues: values [
  values add: self ref.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityDefinitionReference >> fastSetRef: aPltEntityDefinition [
  ref := aPltEntityDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> fromValues: values [
  ^self entityDefinitionReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEntityDefinitionReference >> isPltEntityDefinitionReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> localFromValues: values [
  ^self entityDefinitionReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> localToValues: values [
  ^self entityDefinitionReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinitionReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinitionReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityDefinitionReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityDefinitionReference >> pltLocalCopyTo: another [
  self entityDefinitionReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinitionReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltEntityDefinitionReference >> ref: aPltEntityDefinition [
  ref := aPltEntityDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityDefinitionReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityDefinitionReference >> setRef: aPltEntityDefinition [
  self ref: aPltEntityDefinition


]

{ #category : #'platypus-generated-initializing' }
PltEntityDefinitionReference >> stepInitialize [
  super stepInitialize.
  ref := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityDefinitionReference >> toValues: values [
  ^self entityDefinitionReferenceToValues: (super toValues: values)


]
