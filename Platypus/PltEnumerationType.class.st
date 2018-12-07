"
<ISO10303-11-EXPRESS>
ENTITY enumeration_type 
	SUBTYPE OF ( dictionary_instance );
	elements : LIST [ 1 : ? ] OF UNIQUE STRING;
	SELF\entity_instance.owner : defined_type;
DERIVE
	accepted : entity_instance := SELF.accept_enumeration_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEnumerationType,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'elements'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEnumerationType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEnumerationType >> accept: aVisitor [
  ^aVisitor acceptEnumerationType: self


]

{ #category : #'platypus-generated-deriving' }
PltEnumerationType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltEnumerationType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltEnumerationType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptEnumerationTypeUsingContext: aContext


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationType >> elements [
  ^elements


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationType >> elements: aListOfString [
  elements := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> elements: aListOfString owner: aPltDefinedType [ 	self setElements:aListOfString.	self setOwner:aPltDefinedType.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEnumerationType >> elementsUsingContext: aContext [
  ^self elements


]

{ #category : #'platypus-generated-copying' }
PltEnumerationType >> enumerationTypeCopyTo: another [
  another fastSetElements: self elements.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> enumerationTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setElements: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> enumerationTypeToValues: values [
  values add: self elements.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEnumerationType >> fastSetElements: aListOfString [
  elements := aListOfString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEnumerationType >> fastSetOwner: aPltDefinedType [
  owner := aPltDefinedType


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> fromValues: values [
  ^self enumerationTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEnumerationType >> isPltEnumerationType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> localFromValues: values [
  ^self enumerationTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> localToValues: values [
  ^self enumerationTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationType >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationType >> owner: aPltDefinedType [
  owner := aPltDefinedType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEnumerationType >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltEnumerationType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEnumerationType >> pltCopyTo: another [
  super pltCopyTo: another.
  self enumerationTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEnumerationType >> pltLocalCopyTo: another [
  self enumerationTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEnumerationType >> setElements: aListOfString [
  self elements: aListOfString


]

{ #category : #'platypus-generated-set-accessing' }
PltEnumerationType >> setOwner: aPltDefinedType [
  self owner: aPltDefinedType


]

{ #category : #'platypus-generated-initializing' }
PltEnumerationType >> stepInitialize [
  super stepInitialize.
  elements := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationType >> toValues: values [
  ^self enumerationTypeToValues: (super toValues: values)


]
