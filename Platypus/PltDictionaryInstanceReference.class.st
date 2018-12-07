"
<ISO10303-11-EXPRESS>
ENTITY dictionary_instance_reference 
	SUBTYPE OF ( dictionary_instance );
	ref : dictionary_instance;
	name : STRING;
DERIVE
	SELF\dictionary_instance.handled : dictionary_instance := SELF.ref;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDictionaryInstanceReference,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'ref',
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDictionaryInstanceReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstanceReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstanceReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstanceReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstanceReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstanceReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstanceReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDictionaryInstanceReference >> accept: aVisitor [
  ^aVisitor acceptDictionaryInstanceReference: self


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstanceReference >> dictionaryInstanceReferenceCopyTo: another [
  another fastSetRef: self ref.
  another fastSetName: self name


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> dictionaryInstanceReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setRef: valuesloc removeFirst.
  self setName: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> dictionaryInstanceReferenceToValues: values [
  values add: self ref.
  values add: self name.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDictionaryInstanceReference >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDictionaryInstanceReference >> fastSetRef: aPltDictionaryInstance [
  ref := aPltDictionaryInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> fromValues: values [
  ^self dictionaryInstanceReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstanceReference >> handled [
  ^self handledUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstanceReference >> handledUsingContext: aContext [
  ^self handledUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstanceReference >> handledUsingContext: aContext receiver: aReceiver [
  ^aReceiver refUsingContext: aContext


]

{ #category : #'platypus-generated-classifying' }
PltDictionaryInstanceReference >> isPltDictionaryInstanceReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> localFromValues: values [
  ^self dictionaryInstanceReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> localToValues: values [
  ^self dictionaryInstanceReferenceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltDictionaryInstanceReference >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltDictionaryInstanceReference >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDictionaryInstanceReference >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstanceReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstanceReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self dictionaryInstanceReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstanceReference >> pltLocalCopyTo: another [
  self dictionaryInstanceReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltDictionaryInstanceReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltDictionaryInstanceReference >> ref: aPltDictionaryInstance [
  ref := aPltDictionaryInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> ref: aPltDictionaryInstance name: aString [ 	self setRef:aPltDictionaryInstance.	self setName:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDictionaryInstanceReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltDictionaryInstanceReference >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltDictionaryInstanceReference >> setRef: aPltDictionaryInstance [
  self ref: aPltDictionaryInstance


]

{ #category : #'platypus-generated-initializing' }
PltDictionaryInstanceReference >> stepInitialize [
  super stepInitialize.
  ref := nil.
  name := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstanceReference >> toValues: values [
  ^self dictionaryInstanceReferenceToValues: (super toValues: values)


]
