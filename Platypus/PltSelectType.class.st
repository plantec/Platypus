"
<ISO10303-11-EXPRESS>
ENTITY select_type 
	SUBTYPE OF ( dictionary_instance );
	selections : LIST [ 1 : ? ] OF named_type_reference;
	SELF\entity_instance.owner : defined_type;
DERIVE
	accepted : entity_instance := SELF.accept_select_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSelectType,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'selections'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSelectType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelectType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelectType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelectType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelectType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelectType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelectType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSelectType >> accept: aVisitor [
  ^aVisitor acceptSelectType: self


]

{ #category : #'platypus-generated-deriving' }
PltSelectType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltSelectType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltSelectType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptSelectTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSelectType >> fastSetOwner: aPltDefinedType [
  owner := aPltDefinedType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSelectType >> fastSetSelections: aListOfPltNamedTypeReference [
  selections := aListOfPltNamedTypeReference


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> fromValues: values [
  ^self selectTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSelectType >> isPltSelectType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> localFromValues: values [
  ^self selectTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> localToValues: values [
  ^self selectTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltSelectType >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltSelectType >> owner: aPltDefinedType [
  owner := aPltDefinedType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSelectType >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltSelectType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSelectType >> pltCopyTo: another [
  super pltCopyTo: another.
  self selectTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSelectType >> pltLocalCopyTo: another [
  self selectTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSelectType >> selectTypeCopyTo: another [
  another fastSetSelections: self selections.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> selectTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSelections: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> selectTypeToValues: values [
  values add: self selections.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltSelectType >> selections [
  ^selections


]

{ #category : #'platypus-generated-accessing' }
PltSelectType >> selections: aListOfPltNamedTypeReference [
  selections := aListOfPltNamedTypeReference ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltNamedTypeReference as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> selections: aListOfPltNamedTypeReference owner: aPltDefinedType [ 	self setSelections:aListOfPltNamedTypeReference.	self setOwner:aPltDefinedType.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSelectType >> selectionsUsingContext: aContext [
  ^self selections


]

{ #category : #'platypus-generated-set-accessing' }
PltSelectType >> setOwner: aPltDefinedType [
  self owner: aPltDefinedType


]

{ #category : #'platypus-generated-set-accessing' }
PltSelectType >> setSelections: aListOfPltNamedTypeReference [
  self selections: aListOfPltNamedTypeReference


]

{ #category : #'platypus-generated-initializing' }
PltSelectType >> stepInitialize [
  super stepInitialize.
  selections := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltSelectType >> toValues: values [
  ^self selectTypeToValues: (super toValues: values)


]
