"
<ISO10303-11-EXPRESS>
ENTITY cheddar_defined_type 
	SUBTYPE OF ( ada_type );
DERIVE
	ads_interface_list : LIST OF ada_interface := cheddar_defined_type_interfaces_list ( SELF, true );
	adb_interface_list : LIST OF ada_interface := cheddar_defined_type_interfaces_list ( SELF, false );
	SELF\defined_type.accepted : entity_instance := SELF.accept_cheddar_defined_type;
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarDefinedType',
	#superclass : 'ExChdAdaType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarDefinedType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarDefinedType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarDefinedType >> accept: aVisitor [

	^ aVisitor acceptCheddarDefinedType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> accepted [

	^ self acceptedUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> acceptedUsingContext: aContext [

	^ self acceptedUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> acceptedUsingContext: aContext receiver: aReceiver [

	^ aReceiver acceptCheddarDefinedTypeUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adbInterfaceList [

	^ self adbInterfaceListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adbInterfaceListUsingContext: aContext [

	^ self adbInterfaceListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adbInterfaceListUsingContext: aContext receiver: aReceiver [

	^ ExChdCheddarDefinedTypeInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: false;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsInterfaceList [

	^ self adsInterfaceListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsInterfaceListUsingContext: aContext [

	^ self adsInterfaceListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsInterfaceListUsingContext: aContext receiver: aReceiver [

	^ ExChdCheddarDefinedTypeInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: true;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarDefinedType >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarDefinedType >> cheddarDefinedTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> cheddarDefinedTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> cheddarDefinedTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> fromValues: values [

	^ self cheddarDefinedTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarDefinedType >> isExChdCheddarDefinedType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> localFromValues: values [

	^ self cheddarDefinedTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> localToValues: values [

	^ self cheddarDefinedTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarDefinedType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarDefinedType >> pltCopyTo: another [

	super pltCopyTo: another.
	self cheddarDefinedTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarDefinedType >> pltLocalCopyTo: another [

	self cheddarDefinedTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarDefinedType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarDefinedType >> toValues: values [

	^ self cheddarDefinedTypeToValues: (super toValues: values)


]
