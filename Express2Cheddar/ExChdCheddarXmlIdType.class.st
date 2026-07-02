"
<ISO10303-11-EXPRESS>
ENTITY cheddar_xml_id_type 
	SUBTYPE OF ( string_type );
DERIVE
	SELF\ada_unbounded_string_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'ada.strings', 'unbounded.text_io', true, true ), ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'Unbounded_Strings', ?, true, true ), ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ), ada_interface ( 'id_generators', ?, true, true ) ];
	adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'call_framework', ?, true, true ), ada_interface ( 'id_generators', ?, true, true ) ];
	ads_code : STRING := '';
	adb_code : STRING := '';
	put_prefix : STRING := '';
	refed_by_pointer : BOOLEAN := false;
	SELF\ada_unbounded_string_type.init_value : STRING := 'generate_id';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdCheddarXmlIdType,
	#superclass : #PltStringType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdCheddarXmlIdType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdCheddarXmlIdType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdCheddarXmlIdType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdCheddarXmlIdType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdCheddarXmlIdType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdCheddarXmlIdType >> accept: aVisitor [
	^ aVisitor acceptCheddarXmlIdType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'call_framework';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'id_generators';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'ada.strings';
												add: 'unbounded.text_io';
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Text_io';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Unbounded_Strings';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Convert_Strings';
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Convert_Unbounded_Strings';
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'id_generators';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-copying' }
ExChdCheddarXmlIdType >> cheddarXmlIdTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> cheddarXmlIdTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> cheddarXmlIdTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> fromValues: values [
	^ self cheddarXmlIdTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> initValueUsingContext: aContext receiver: aReceiver [
	^ 'generate_id'


]

{ #category : #'platypus-generated-classifying' }
ExChdCheddarXmlIdType >> isExChdCheddarXmlIdType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> localFromValues: values [
	^ self cheddarXmlIdTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> localToValues: values [
	^ self cheddarXmlIdTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdCheddarXmlIdType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdCheddarXmlIdType >> pltCopyTo: another [
	super pltCopyTo: another.
	self cheddarXmlIdTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdCheddarXmlIdType >> pltLocalCopyTo: another [
	self cheddarXmlIdTypeCopyTo: another


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> refedByPointer [
	^ self refedByPointerUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> refedByPointerUsingContext: aContext [
	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdCheddarXmlIdType >> refedByPointerUsingContext: aContext receiver: aReceiver [
	^ false


]

{ #category : #'platypus-generated-initializing' }
ExChdCheddarXmlIdType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdCheddarXmlIdType >> toValues: values [
	^ self cheddarXmlIdTypeToValues: (super toValues: values)


]
