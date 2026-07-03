"
<ISO10303-11-EXPRESS>
ENTITY cheddar_mode_range 
	SUBTYPE OF ( cheddar_defined_type );
DERIVE
	ads_code : STRING := '
Type Mode_Range is new Natural range 0 .. 2;
package Mode_Range_Io is new Text_IO.Integer_IO (Mode_Range);
use Mode_Range_Io;
';
	adb_code : STRING := '';
	ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Framework_Config', ?, true, true ), ada_interface ( 'Framework_Config', 'Mode_Range_Io', false, true ) ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	SELF\ada_type.ada_ident : STRING := 'Mode_Range';
	SELF\ada_type.ada_ref_ident : STRING := SELF.ada_ident;
	SELF\ada_type.init_value : STRING := '0';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarModeRange',
	#superclass : 'ExChdCheddarDefinedType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarModeRange class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarModeRange class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarModeRange class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarModeRange class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarModeRange class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarModeRange >> accept: aVisitor [

	^ aVisitor acceptCheddarModeRange: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ 'Mode_Range'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ '
Type Mode_Range is new Natural range 0 .. 2;
package Mode_Range_Io is new Text_IO.Integer_IO (Mode_Range);
use Mode_Range_Io;
'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'Framework_Config';
							     add: nil;
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'Framework_Config';
							     add: 'Mode_Range_Io';
							     add: false;
							     add: true;
							     yourself);
					    yourself);
			   yourself)


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarModeRange >> cheddarModeRangeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> cheddarModeRangeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> cheddarModeRangeToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> fromValues: values [

	^ self cheddarModeRangeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarModeRange >> initValueUsingContext: aContext receiver: aReceiver [

	^ '0'


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarModeRange >> isExChdCheddarModeRange [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> localFromValues: values [

	^ self cheddarModeRangeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> localToValues: values [

	^ self cheddarModeRangeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarModeRange >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarModeRange >> pltCopyTo: another [

	super pltCopyTo: another.
	self cheddarModeRangeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarModeRange >> pltLocalCopyTo: another [

	self cheddarModeRangeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarModeRange >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarModeRange >> toValues: values [

	^ self cheddarModeRangeToValues: (super toValues: values)


]
