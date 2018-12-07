"
<ISO10303-11-EXPRESS>
ENTITY attribute_identifier 
	SUBTYPE OF ( identifier );
	selfInstance : generic_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAttributeIdentifier,
	#superclass : #PltIdentifier,
	#instVars : [
		'selfInstance'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAttributeIdentifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeIdentifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeIdentifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeIdentifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeIdentifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeIdentifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeIdentifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAttributeIdentifier >> accept: aVisitor [
  ^aVisitor acceptAttributeIdentifier: self


]

{ #category : #'platypus-generated-copying' }
PltAttributeIdentifier >> attributeIdentifierCopyTo: another [
  another fastSetSelfInstance: self selfInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> attributeIdentifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSelfInstance: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> attributeIdentifierToValues: values [
  values add: self selfInstance.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttributeIdentifier >> fastSetSelfInstance: aPltGenericInstance [
  selfInstance := aPltGenericInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> fromValues: values [
  ^self attributeIdentifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAttributeIdentifier >> isPltAttributeIdentifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> localFromValues: values [
  ^self attributeIdentifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> localToValues: values [
  ^self attributeIdentifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAttributeIdentifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAttributeIdentifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self attributeIdentifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAttributeIdentifier >> pltLocalCopyTo: another [
  self attributeIdentifierCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAttributeIdentifier >> selfInstance [
  ^selfInstance


]

{ #category : #'platypus-generated-accessing' }
PltAttributeIdentifier >> selfInstance: aPltGenericInstance [
  selfInstance := aPltGenericInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttributeIdentifier >> selfInstanceUsingContext: aContext [
  ^self selfInstance


]

{ #category : #'platypus-generated-set-accessing' }
PltAttributeIdentifier >> setSelfInstance: aPltGenericInstance [
  self selfInstance: aPltGenericInstance


]

{ #category : #'platypus-generated-initializing' }
PltAttributeIdentifier >> stepInitialize [
  super stepInitialize.
  selfInstance := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeIdentifier >> toValues: values [
  ^self attributeIdentifierToValues: (super toValues: values)


]
