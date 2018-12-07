"
<ISO10303-11-EXPRESS>
ENTITY defined_type_reference 
	SUBTYPE OF ( named_type_reference );
	SELF\named_type_reference.ref : defined_type;
DERIVE
	SELF\named_type_reference.accepted : entity_instance := SELF.accept_defined_type_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDefinedTypeReference,
	#superclass : #PltNamedTypeReference,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDefinedTypeReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedTypeReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedTypeReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedTypeReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedTypeReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedTypeReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedTypeReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDefinedTypeReference >> accept: aVisitor [
  ^aVisitor acceptDefinedTypeReference: self


]

{ #category : #'platypus-generated-deriving' }
PltDefinedTypeReference >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDefinedTypeReference >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDefinedTypeReference >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptDefinedTypeReferenceUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltDefinedTypeReference >> definedTypeReferenceCopyTo: another [
  another fastSetRef: self ref


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> definedTypeReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> definedTypeReferenceToValues: values [
  values add: self ref.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDefinedTypeReference >> fastSetRef: aPltDefinedType [
  ref := aPltDefinedType


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> fromValues: values [
  ^self definedTypeReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltDefinedTypeReference >> isPltDefinedTypeReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> localFromValues: values [
  ^self definedTypeReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> localToValues: values [
  ^self definedTypeReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltDefinedTypeReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDefinedTypeReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self definedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDefinedTypeReference >> pltLocalCopyTo: another [
  self definedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltDefinedTypeReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltDefinedTypeReference >> ref: aPltDefinedType [
  ref := aPltDefinedType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDefinedTypeReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltDefinedTypeReference >> setRef: aPltDefinedType [
  self ref: aPltDefinedType


]

{ #category : #'platypus-generated-initializing' }
PltDefinedTypeReference >> stepInitialize [
  super stepInitialize.
  ref := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedTypeReference >> toValues: values [
  ^self definedTypeReferenceToValues: (super toValues: values)


]
