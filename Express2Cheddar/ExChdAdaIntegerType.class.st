"
<ISO10303-11-EXPRESS>
ENTITY ada_integer_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'integer_io', false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Integer';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := '0';
	SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.integer_io.';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaIntegerType',
	#superclass : 'ExChdAdaPrimitiveType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaIntegerType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaIntegerType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaIntegerType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaIntegerType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaIntegerType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaIntegerType >> accept: aVisitor [

	^ aVisitor acceptAdaIntegerType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ 'Integer'


]

{ #category : 'platypus-generated-copying' }
ExChdAdaIntegerType >> adaIntegerTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> adaIntegerTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> adaIntegerTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

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
ExChdAdaIntegerType >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

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
								      add: 'standards_io';
								      add: 'integer_io';
								      add: false;
								      add: true;
								      yourself);
						     yourself);
				    yourself))


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> fromValues: values [

	^ self adaIntegerTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> initValueUsingContext: aContext receiver: aReceiver [

	^ '0'


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaIntegerType >> isExChdAdaIntegerType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> localFromValues: values [

	^ self adaIntegerTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> localToValues: values [

	^ self adaIntegerTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaIntegerType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaIntegerType >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaIntegerTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaIntegerType >> pltLocalCopyTo: another [

	self adaIntegerTypeCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> putPrefix [

	^ self putPrefixUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> putPrefixUsingContext: aContext [

	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaIntegerType >> putPrefixUsingContext: aContext receiver: aReceiver [

	^ 'standards_io.integer_io.'


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaIntegerType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaIntegerType >> toValues: values [

	^ self adaIntegerTypeToValues: (super toValues: values)


]
