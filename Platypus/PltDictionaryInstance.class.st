"
<ISO10303-11-EXPRESS>
ENTITY dictionary_instance 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( sdai_instance );
DERIVE
	handled : dictionary_instance := SELF;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDictionaryInstance,
	#superclass : #PltSdaiInstance,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDictionaryInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstance class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDictionaryInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDictionaryInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDictionaryInstance >> accept: aVisitor [
  ^aVisitor acceptDictionaryInstance: self


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstance >> dictionaryInstanceCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> dictionaryInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> dictionaryInstanceToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> fromValues: values [
  ^self dictionaryInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstance >> handled [
  ^self handledUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstance >> handledUsingContext: aContext [
  ^self handledUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDictionaryInstance >> handledUsingContext: aContext receiver: aReceiver [
  ^aReceiver


]

{ #category : #'platypus-generated-classifying' }
PltDictionaryInstance >> isPltDictionaryInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> localFromValues: values [
  ^self dictionaryInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> localToValues: values [
  ^self dictionaryInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self dictionaryInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDictionaryInstance >> pltLocalCopyTo: another [
  self dictionaryInstanceCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltDictionaryInstance >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltDictionaryInstance >> toValues: values [
  ^self dictionaryInstanceToValues: (super toValues: values)


]
