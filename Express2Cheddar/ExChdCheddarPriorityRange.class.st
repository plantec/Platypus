"
<ISO10303-11-EXPRESS>
ENTITY cheddar_priority_range 
	SUBTYPE OF ( cheddar_defined_type );
DERIVE
	ads_code : STRING := '
-- Definition of priority range. We choose the most current value :
-- 256 priority levels (from 0 to 255)
-- Zero is the lowest priority level
Type Priority_Range is new Natural range 0 .. 255;
package Priority_Io is new Text_IO.Integer_IO (Priority_Range);
use Priority_Io;
';
	adb_code : STRING := '';
	ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Framework_Config', ?, true, true ), ada_interface ( 'Framework_Config', 'Priority_Io', false, true ) ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	SELF\ada_type.ada_ident : STRING := 'Priority_Range';
	SELF\ada_type.ada_ref_ident : STRING := SELF.ada_ident;
	SELF\ada_type.init_value : STRING := '0';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarPriorityRange',
	#superclass : 'ExChdCheddarDefinedType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPriorityRange class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarPriorityRange class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarPriorityRange class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPriorityRange class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPriorityRange class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarPriorityRange >> accept: aVisitor [
	^ aVisitor acceptCheddarPriorityRange: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'Priority_Range'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ '
-- Definition of priority range. We choose the most current value :
-- 256 priority levels (from 0 to 255)
-- Zero is the lowest priority level
Type Priority_Range is new Natural range 0 .. 255;
package Priority_Io is new Text_IO.Integer_IO (Priority_Range);
use Priority_Io;
'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Framework_Config';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Framework_Config';
												add: 'Priority_Io';
												add: false;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPriorityRange >> cheddarPriorityRangeCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> cheddarPriorityRangeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> cheddarPriorityRangeToValues: values [
	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> fromValues: values [
	^ self cheddarPriorityRangeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarPriorityRange >> initValueUsingContext: aContext receiver: aReceiver [
	^ '0'


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarPriorityRange >> isExChdCheddarPriorityRange [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> localFromValues: values [
	^ self cheddarPriorityRangeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> localToValues: values [
	^ self cheddarPriorityRangeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPriorityRange >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPriorityRange >> pltCopyTo: another [
	super pltCopyTo: another.
	self cheddarPriorityRangeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPriorityRange >> pltLocalCopyTo: another [
	self cheddarPriorityRangeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarPriorityRange >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPriorityRange >> toValues: values [
	^ self cheddarPriorityRangeToValues: (super toValues: values)


]
