"
<ISO10303-11-EXPRESS>
ENTITY ada_enumeration 
	SUBTYPE OF ( ada_type );
	convertion : OPTIONAL STRING;
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ), ada_interface ( 'text_io', ?, true, true ), ada_interface ( 'ada.strings', 'unbounded', true, true ) ];
	adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ads_code : STRING := enumeration_ads_code ( SELF );
	adb_code : STRING := enumeration_adb_code ( SELF );
	SELF\ada_type.ada_ident : STRING := name;
	SELF\ada_type.ada_ref_ident : STRING := SELF.ada_ident;
	SELF\ada_type.init_value : STRING := NVL ( convertion, domain.elements [ 1 ] );
	io_type_name : STRING := SELF.ada_ident + '_io';
	full_io_type_name : STRING := SELF.owner.name + '.' + SELF.io_type_name;
	SELF\defined_type.accepted : entity_instance := SELF.accept_ada_enumeration;
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEnumeration',
	#superclass : 'ExChdAdaType',
	#instVars : [
		'convertion'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEnumeration class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEnumeration class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEnumeration class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEnumeration class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEnumeration class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaEnumeration >> accept: aVisitor [

	^ aVisitor acceptAdaEnumeration: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> accepted [

	^ self acceptedUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> acceptedUsingContext: aContext [

	^ self acceptedUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> acceptedUsingContext: aContext receiver: aReceiver [

	^ aReceiver acceptAdaEnumerationUsingContext: aContext


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEnumeration >> adaEnumerationCopyTo: another [

	another fastSetConvertion: self convertion


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> adaEnumerationFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setConvertion: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> adaEnumerationToValues: values [

	values add: self convertion.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver name


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdEnumerationAdbCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'primitive_xml_strings';
							     add: nil;
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdEnumerationAdsCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'Convert_Strings';
							     add: nil;
							     add: true;
							     add: false;
							     yourself);
					    yourself);
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'Convert_Unbounded_Strings';
							     add: nil;
							     add: true;
							     add: false;
							     yourself);
					    yourself);
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'text_io';
							     add: nil;
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'ada.strings';
							     add: 'unbounded';
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEnumeration >> convertion [

	^ convertion


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEnumeration >> convertion: aString [

	convertion := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaEnumeration >> convertionUsingContext: aContext [

	^ self convertion


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaEnumeration >> fastSetConvertion: aString [

	convertion := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> fromValues: values [

	^ self adaEnumerationFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> fullIoTypeName [

	^ self fullIoTypeNameUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> fullIoTypeNameUsingContext: aContext [

	^ self fullIoTypeNameUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> fullIoTypeNameUsingContext: aContext receiver: aReceiver [

	^ (((aReceiver ownerUsingContext: aContext) nameUsingContext:
		    aContext) pltPlus: '.') pltPlus:
		  (aReceiver ioTypeNameUsingContext: aContext)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> initValueUsingContext: aContext receiver: aReceiver [

	^ PltNVLFunction invokeFromValues: (OrderedCollection new
			   add: aReceiver convertion;
			   add:
				   ((aReceiver domain elementsUsingContext: self class context)
					    pltAt: 1);
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> ioTypeName [

	^ self ioTypeNameUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> ioTypeNameUsingContext: aContext [

	^ self ioTypeNameUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEnumeration >> ioTypeNameUsingContext: aContext receiver: aReceiver [

	^ (aReceiver adaIdentUsingContext: aContext) pltPlus: '_io'


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaEnumeration >> isExChdAdaEnumeration [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> localFromValues: values [

	^ self adaEnumerationFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> localToValues: values [

	^ self adaEnumerationToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEnumeration >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEnumeration >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaEnumerationCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEnumeration >> pltLocalCopyTo: another [

	self adaEnumerationCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaEnumeration >> setConvertion: aString [

	self convertion: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaEnumeration >> stepInitialize [

	super stepInitialize.
	convertion := nil


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEnumeration >> toValues: values [

	^ self adaEnumerationToValues: (super toValues: values)


]
