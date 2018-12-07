"
<ISO10303-11-EXPRESS>
ENTITY named_type_reference 
	SUBTYPE OF ( dictionary_instance_reference );
	SELF\dictionary_instance_reference.ref : named_type;
DERIVE
	accepted : entity_instance := SELF.accept_named_type_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNamedTypeReference,
	#superclass : #PltDictionaryInstanceReference,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNamedTypeReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedTypeReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedTypeReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedTypeReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNamedTypeReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedTypeReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNamedTypeReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNamedTypeReference >> accept: aVisitor [
  ^aVisitor acceptNamedTypeReference: self


]

{ #category : #'platypus-generated-deriving' }
PltNamedTypeReference >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltNamedTypeReference >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltNamedTypeReference >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptNamedTypeReferenceUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNamedTypeReference >> fastSetRef: aPltNamedType [
  ref := aPltNamedType


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> fromValues: values [
  ^self namedTypeReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNamedTypeReference >> isPltNamedTypeReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> localFromValues: values [
  ^self namedTypeReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> localToValues: values [
  ^self namedTypeReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNamedTypeReference >> namedTypeReferenceCopyTo: another [
  another fastSetRef: self ref


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> namedTypeReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> namedTypeReferenceToValues: values [
  values add: self ref.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNamedTypeReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNamedTypeReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self namedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNamedTypeReference >> pltLocalCopyTo: another [
  self namedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltNamedTypeReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltNamedTypeReference >> ref: aPltNamedType [
  ref := aPltNamedType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNamedTypeReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltNamedTypeReference >> setRef: aPltNamedType [
  self ref: aPltNamedType


]

{ #category : #'platypus-generated-initializing' }
PltNamedTypeReference >> stepInitialize [
  super stepInitialize.
  ref := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltNamedTypeReference >> toValues: values [
  ^self namedTypeReferenceToValues: (super toValues: values)


]
