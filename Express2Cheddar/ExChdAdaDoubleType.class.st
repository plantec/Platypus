"
<ISO10303-11-EXPRESS>
ENTITY ada_double_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'doubles', ?, true, true ), ada_interface ( 'standards_io', 'double_io', false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Double';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := '0.0';
	SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.double_io.';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaDoubleType',
	#superclass : 'ExChdAdaPrimitiveType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaDoubleType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaDoubleType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaDoubleType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaDoubleType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaDoubleType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaDoubleType >> accept: aVisitor [

	^ aVisitor acceptAdaDoubleType: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaDoubleType >> adaDoubleTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> adaDoubleTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> adaDoubleTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ 'Double'


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

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
ExChdAdaDoubleType >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ (PlatypusCoreAggregateInitializer collectionFrom:
		   (OrderedCollection new
			    add: (ExChdAdaInterface new
					     adaInterfaceFromValues: (OrderedCollection new
							      add: 'standards_io';
							      add: nil;
							      add: true;
							      add: true;
							      yourself);
					     yourself);
			    yourself)) pltPlus:
		  (PlatypusCoreAggregateInitializer collectionFrom:
			   (OrderedCollection new
				    add: (ExChdAdaInterface new
						     adaInterfaceFromValues: (OrderedCollection new
								      add: 'doubles';
								      add: nil;
								      add: true;
								      add: true;
								      yourself);
						     yourself);
				    add: (ExChdAdaInterface new
						     adaInterfaceFromValues: (OrderedCollection new
								      add: 'standards_io';
								      add: 'double_io';
								      add: false;
								      add: true;
								      yourself);
						     yourself);
				    yourself))


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> fromValues: values [

	^ self adaDoubleTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> initValueUsingContext: aContext receiver: aReceiver [

	^ '0.0'


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaDoubleType >> isExChdAdaDoubleType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> localFromValues: values [

	^ self adaDoubleTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> localToValues: values [

	^ self adaDoubleTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaDoubleType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaDoubleType >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaDoubleTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaDoubleType >> pltLocalCopyTo: another [

	self adaDoubleTypeCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> putPrefix [

	^ self putPrefixUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> putPrefixUsingContext: aContext [

	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaDoubleType >> putPrefixUsingContext: aContext receiver: aReceiver [

	^ 'standards_io.double_io.'


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaDoubleType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaDoubleType >> toValues: values [

	^ self adaDoubleTypeToValues: (super toValues: values)


]
