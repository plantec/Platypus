"
<ISO10303-11-EXPRESS>
ENTITY domain_equivalent_item 
	SUBTYPE OF ( dictionary_instance );
	name : STRING;
	external_item_id : STRING;
	native_item : declaration;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDomainEquivalentItem,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'externalItemId',
		'name',
		'nativeItem'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDomainEquivalentItem class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDomainEquivalentItem class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDomainEquivalentItem class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDomainEquivalentItem class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDomainEquivalentItem class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDomainEquivalentItem class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDomainEquivalentItem class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDomainEquivalentItem >> accept: aVisitor [
  ^aVisitor acceptDomainEquivalentItem: self


]

{ #category : #'platypus-generated-copying' }
PltDomainEquivalentItem >> domainEquivalentItemCopyTo: another [
  another fastSetName: self name.
  another fastSetExternalItemId: self externalItemId.
  another fastSetNativeItem: self nativeItem


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> domainEquivalentItemFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setExternalItemId: valuesloc removeFirst.
  self setNativeItem: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> domainEquivalentItemToValues: values [
  values add: self name.
  values add: self externalItemId.
  values add: self nativeItem.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> externalItemId [
  ^externalItemId


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> externalItemId: aString [
  externalItemId := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDomainEquivalentItem >> externalItemIdUsingContext: aContext [
  ^self externalItemId


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDomainEquivalentItem >> fastSetExternalItemId: aString [
  externalItemId := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDomainEquivalentItem >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDomainEquivalentItem >> fastSetNativeItem: aPltDeclaration [
  nativeItem := aPltDeclaration


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> fromValues: values [
  ^self domainEquivalentItemFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltDomainEquivalentItem >> isPltDomainEquivalentItem [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> localFromValues: values [
  ^self domainEquivalentItemFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> localToValues: values [
  ^self domainEquivalentItemToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> name: aString externalItemId: aString1 nativeItem: aPltDeclaration [ 	self setName:aString.	self setExternalItemId:aString1.	self setNativeItem:aPltDeclaration.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDomainEquivalentItem >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> nativeItem [
  ^nativeItem


]

{ #category : #'platypus-generated-accessing' }
PltDomainEquivalentItem >> nativeItem: aPltDeclaration [
  nativeItem := aPltDeclaration


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDomainEquivalentItem >> nativeItemUsingContext: aContext [
  ^self nativeItem


]

{ #category : #'platypus-generated-copying' }
PltDomainEquivalentItem >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDomainEquivalentItem >> pltCopyTo: another [
  super pltCopyTo: another.
  self domainEquivalentItemCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDomainEquivalentItem >> pltLocalCopyTo: another [
  self domainEquivalentItemCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltDomainEquivalentItem >> setExternalItemId: aString [
  self externalItemId: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltDomainEquivalentItem >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltDomainEquivalentItem >> setNativeItem: aPltDeclaration [
  self nativeItem: aPltDeclaration


]

{ #category : #'platypus-generated-initializing' }
PltDomainEquivalentItem >> stepInitialize [
  super stepInitialize.
  name := ''.
  externalItemId := ''.
  nativeItem := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltDomainEquivalentItem >> toValues: values [
  ^self domainEquivalentItemToValues: (super toValues: values)


]
