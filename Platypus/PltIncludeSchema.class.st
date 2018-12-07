"
<ISO10303-11-EXPRESS>
ENTITY include_schema 
	SUBTYPE OF ( external_schema );
	native_schema : schema_definition;
	explicitly_imported_items : LIST OF domain_equivalent_item;
	implicitly_imported_items : LIST OF domain_equivalent_item;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIncludeSchema,
	#superclass : #PltExternalSchema,
	#instVars : [
		'explicitlyImportedItems',
		'nativeSchema',
		'implicitlyImportedItems'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIncludeSchema class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncludeSchema class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncludeSchema class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncludeSchema class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncludeSchema class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncludeSchema class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncludeSchema class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIncludeSchema >> accept: aVisitor [
  ^aVisitor acceptIncludeSchema: self


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> explicitlyImportedItems [
  ^explicitlyImportedItems


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> explicitlyImportedItems: aListOfPltDomainEquivalentItem [
  explicitlyImportedItems := aListOfPltDomainEquivalentItem ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltDomainEquivalentItem as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncludeSchema >> explicitlyImportedItemsUsingContext: aContext [
  ^self explicitlyImportedItems


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncludeSchema >> fastSetExplicitlyImportedItems: aListOfPltDomainEquivalentItem [
  explicitlyImportedItems := aListOfPltDomainEquivalentItem


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncludeSchema >> fastSetImplicitlyImportedItems: aListOfPltDomainEquivalentItem [
  implicitlyImportedItems := aListOfPltDomainEquivalentItem


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncludeSchema >> fastSetNativeSchema: aPltSchemaDefinition [
  nativeSchema := aPltSchemaDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> fromValues: values [
  ^self includeSchemaFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> implicitlyImportedItems [
  ^implicitlyImportedItems


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> implicitlyImportedItems: aListOfPltDomainEquivalentItem [
  implicitlyImportedItems := aListOfPltDomainEquivalentItem ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltDomainEquivalentItem as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncludeSchema >> implicitlyImportedItemsUsingContext: aContext [
  ^self implicitlyImportedItems


]

{ #category : #'platypus-generated-copying' }
PltIncludeSchema >> includeSchemaCopyTo: another [
  another fastSetNativeSchema: self nativeSchema.
  another fastSetExplicitlyImportedItems: self explicitlyImportedItems.
  another fastSetImplicitlyImportedItems: self implicitlyImportedItems


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> includeSchemaFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setNativeSchema: valuesloc removeFirst.
  self setExplicitlyImportedItems: valuesloc removeFirst.
  self setImplicitlyImportedItems: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> includeSchemaToValues: values [
  values add: self nativeSchema.
  values add: self explicitlyImportedItems.
  values add: self implicitlyImportedItems.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIncludeSchema >> isPltIncludeSchema [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> localFromValues: values [
  ^self includeSchemaFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> localToValues: values [
  ^self includeSchemaToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> nativeSchema [
  ^nativeSchema


]

{ #category : #'platypus-generated-accessing' }
PltIncludeSchema >> nativeSchema: aPltSchemaDefinition [
  nativeSchema := aPltSchemaDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> nativeSchema: aPltSchemaDefinition explicitlyImportedItems: aListOfPltDomainEquivalentItem implicitlyImportedItems: aListOfPltDomainEquivalentItem1 [ 	self setNativeSchema:aPltSchemaDefinition.	self setExplicitlyImportedItems:aListOfPltDomainEquivalentItem.	self setImplicitlyImportedItems:aListOfPltDomainEquivalentItem1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncludeSchema >> nativeSchemaUsingContext: aContext [
  ^self nativeSchema


]

{ #category : #'platypus-generated-copying' }
PltIncludeSchema >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIncludeSchema >> pltCopyTo: another [
  super pltCopyTo: another.
  self includeSchemaCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIncludeSchema >> pltLocalCopyTo: another [
  self includeSchemaCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltIncludeSchema >> setExplicitlyImportedItems: aListOfPltDomainEquivalentItem [
  self explicitlyImportedItems: aListOfPltDomainEquivalentItem


]

{ #category : #'platypus-generated-set-accessing' }
PltIncludeSchema >> setImplicitlyImportedItems: aListOfPltDomainEquivalentItem [
  self implicitlyImportedItems: aListOfPltDomainEquivalentItem


]

{ #category : #'platypus-generated-set-accessing' }
PltIncludeSchema >> setNativeSchema: aPltSchemaDefinition [
  self nativeSchema: aPltSchemaDefinition


]

{ #category : #'platypus-generated-initializing' }
PltIncludeSchema >> stepInitialize [
  super stepInitialize.
  nativeSchema := nil.
  explicitlyImportedItems := OrderedCollection new.
  implicitlyImportedItems := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltIncludeSchema >> toValues: values [
  ^self includeSchemaToValues: (super toValues: values)


]
