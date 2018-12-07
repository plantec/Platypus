"
<ISO10303-11-EXPRESS>
ENTITY entity_instance 
	ABSTRACT SUPERTYPE;
	owner : OPTIONAL entity_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityInstance,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityInstance class >> context [
  ^self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> platypusMetaData [
  ^self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityInstance >> accept: aVisitor [
  ^aVisitor acceptEntityInstance: self


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> entityInstanceCopyTo: another [
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceToValues: values [
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstance >> fastSetOwner: aPltEntityInstance [
  owner := aPltEntityInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> fromValues: values [
  ^self entityInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> localFromValues: values [
  ^self entityInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> localToValues: values [
  ^self entityInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstance >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstance >> owner: aPltEntityInstance [
  owner := aPltEntityInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstance >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance >> platypusMetaData [
  ^self class platypusMetaData


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltLocalCopyTo: another [
  self entityInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstance >> setOwner: aPltEntityInstance [
  self owner: aPltEntityInstance


]

{ #category : #'platypus-generated-initializing' }
PltEntityInstance >> stepInitialize [
  super stepInitialize.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> toValues: values [
  ^self entityInstanceToValues: (super toValues: values)


]
