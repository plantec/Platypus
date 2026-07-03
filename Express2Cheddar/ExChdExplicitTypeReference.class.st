"
<ISO10303-11-EXPRESS>
ENTITY explicit_type_reference 
	SUBTYPE OF ( defined_type );
	used_name : OPTIONAL STRING;
	interfaces : LIST OF ada_interface;
DERIVE
	SELF\defined_type.accepted : entity_instance := SELF.accept_explicit_type_reference;
	ads_interfaces_list : LIST OF ada_interface := SELF.interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.owner.name, ?, true, true ) ] + interfaces;
	ada_ident : STRING := SELF.name;
	ptr_type : STRING := SELF.ada_ident + '_Ptr';
	ada_ref_ident : STRING := NVL ( SELF.used_name, SELF.name );
	init_value : STRING := ?;
	ads_code : STRING := '';
	adb_code : STRING := '';
	refed_by_pointer : BOOLEAN := string_ends_with ( SELF.ada_ref_ident, '_Ptr' );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdExplicitTypeReference',
	#superclass : 'PltDefinedType',
	#instVars : [
		'interfaces',
		'usedName'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitTypeReference class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitTypeReference class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitTypeReference class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitTypeReference class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitTypeReference class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdExplicitTypeReference >> accept: aVisitor [
	^ aVisitor acceptExplicitTypeReference: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> accepted [
	^ self acceptedUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> acceptedUsingContext: aContext [
	^ self acceptedUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> acceptedUsingContext: aContext receiver: aReceiver [
	^ aReceiver acceptExplicitTypeReferenceUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver nameUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ PltNVLFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver usedNameUsingContext: self class context);
				add: (aReceiver nameUsingContext: self class context);
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ (PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: ((aReceiver ownerUsingContext: self class context) nameUsingContext: self class context);
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)) pltPlus: aReceiver interfaces


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ aReceiver interfacesUsingContext: aContext


]

{ #category : 'platypus-generated-copying' }
ExChdExplicitTypeReference >> explicitTypeReferenceCopyTo: another [
	another fastSetUsedName: self usedName.
	another fastSetInterfaces: self interfaces


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> explicitTypeReferenceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setUsedName: valuesloc removeFirst.
	self setInterfaces: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> explicitTypeReferenceToValues: values [
	values add: self usedName.
	values add: self interfaces.
	^ values


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdExplicitTypeReference >> fastSetInterfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdExplicitTypeReference >> fastSetUsedName: aString [
	usedName := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> fromValues: values [
	^ self explicitTypeReferenceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> initValueUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitTypeReference >> interfaces [
	^ interfaces


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitTypeReference >> interfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdExplicitTypeReference >> interfacesUsingContext: aContext [
	^ self interfaces


]

{ #category : 'platypus-generated-classifying' }
ExChdExplicitTypeReference >> isExChdExplicitTypeReference [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> localFromValues: values [
	^ self explicitTypeReferenceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> localToValues: values [
	^ self explicitTypeReferenceToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdExplicitTypeReference >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdExplicitTypeReference >> pltCopyTo: another [
	super pltCopyTo: another.
	self explicitTypeReferenceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdExplicitTypeReference >> pltLocalCopyTo: another [
	self explicitTypeReferenceCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> ptrType [
	^ self ptrTypeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> ptrTypeUsingContext: aContext [
	^ self ptrTypeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> ptrTypeUsingContext: aContext receiver: aReceiver [
	^ (aReceiver adaIdentUsingContext: aContext) pltPlus: '_Ptr'


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> refedByPointer [
	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> refedByPointerUsingContext: aContext [
	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdExplicitTypeReference >> refedByPointerUsingContext: aContext receiver: aReceiver [
	^ PTsStringEndsWithFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver adaRefIdentUsingContext: self class context);
				add: '_Ptr';
				yourself)


]

{ #category : 'platypus-generated-set-accessing' }
ExChdExplicitTypeReference >> setInterfaces: aListOfExChdAdaInterface [
	self interfaces: aListOfExChdAdaInterface


]

{ #category : 'platypus-generated-set-accessing' }
ExChdExplicitTypeReference >> setUsedName: aString [
	self usedName: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdExplicitTypeReference >> stepInitialize [
	super stepInitialize.
	usedName := nil.
	interfaces := OrderedCollection new


]

{ #category : 'platypus-generated-group-accessing' }
ExChdExplicitTypeReference >> toValues: values [
	^ self explicitTypeReferenceToValues: (super toValues: values)


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitTypeReference >> usedName [
	^ usedName


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitTypeReference >> usedName: aString [
	usedName := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdExplicitTypeReference >> usedNameUsingContext: aContext [
	^ self usedName


]
