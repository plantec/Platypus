"
<ISO10303-11-EXPRESS>
ENTITY unmapped_type_reference;
	ref : entity_instance;
DERIVE
	ads_interfaces_list : LIST OF ada_interface := basic_ada_domain ( SELF.ref ).ads_interfaces_list;
	adb_interfaces_list : LIST OF ada_interface := basic_ada_domain ( SELF.ref ).adb_interfaces_list;
	ada_ident : STRING := SELF.name;
	ada_ref_ident : STRING := SELF.name;
	init_value : STRING := basic_ada_domain ( SELF.ref ).init_value;
	ads_code : STRING := '';
	adb_code : STRING := '';
	refed_by_pointer : BOOLEAN := false;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdUnmappedTypeReference',
	#superclass : 'ExChdCoreEntity',
	#instVars : [
		'ref'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdUnmappedTypeReference class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdUnmappedTypeReference class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdUnmappedTypeReference class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdUnmappedTypeReference class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdUnmappedTypeReference class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdUnmappedTypeReference >> accept: aVisitor [

	^ aVisitor acceptUnmappedTypeReference: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver nameUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver nameUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ (ExChdBasicAdaDomainFunction invokeFromValues:
		   (OrderedCollection new
			    add: (aReceiver refUsingContext: self class context);
			    yourself)) adbInterfacesListUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ (ExChdBasicAdaDomainFunction invokeFromValues:
		   (OrderedCollection new
			    add: (aReceiver refUsingContext: self class context);
			    yourself)) adsInterfacesListUsingContext: aContext


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdUnmappedTypeReference >> fastSetRef: aExChdEntityInstance [

	ref := aExChdEntityInstance


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> fromValues: values [

	^ self unmappedTypeReferenceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> initValueUsingContext: aContext receiver: aReceiver [

	^ (ExChdBasicAdaDomainFunction invokeFromValues:
		   (OrderedCollection new
			    add: (aReceiver refUsingContext: self class context);
			    yourself)) initValueUsingContext: aContext


]

{ #category : 'platypus-generated-classifying' }
ExChdUnmappedTypeReference >> isExChdUnmappedTypeReference [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> localFromValues: values [

	^ self unmappedTypeReferenceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> localToValues: values [

	^ self unmappedTypeReferenceToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdUnmappedTypeReference >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdUnmappedTypeReference >> pltCopyTo: another [

	super pltCopyTo: another.
	self unmappedTypeReferenceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdUnmappedTypeReference >> pltLocalCopyTo: another [

	self unmappedTypeReferenceCopyTo: another


]

{ #category : 'platypus-generated-accessing' }
ExChdUnmappedTypeReference >> ref [

	^ ref


]

{ #category : 'platypus-generated-accessing' }
ExChdUnmappedTypeReference >> ref: aExChdEntityInstance [

	ref := aExChdEntityInstance


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdUnmappedTypeReference >> refUsingContext: aContext [

	^ self ref


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdUnmappedTypeReference >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ false


]

{ #category : 'platypus-generated-set-accessing' }
ExChdUnmappedTypeReference >> setRef: aExChdEntityInstance [

	self ref: aExChdEntityInstance


]

{ #category : 'platypus-generated-initializing' }
ExChdUnmappedTypeReference >> stepInitialize [

	super stepInitialize.
	ref := nil


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> toValues: values [

	^ self unmappedTypeReferenceToValues: (super toValues: values)


]

{ #category : 'platypus-generated-copying' }
ExChdUnmappedTypeReference >> unmappedTypeReferenceCopyTo: another [

	another fastSetRef: self ref


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> unmappedTypeReferenceFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setRef: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdUnmappedTypeReference >> unmappedTypeReferenceToValues: values [

	values add: self ref.
	^ values


]
