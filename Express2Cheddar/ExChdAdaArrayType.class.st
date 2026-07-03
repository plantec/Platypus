"
<ISO10303-11-EXPRESS>
ENTITY ada_array_type 
	SUBTYPE OF ( array_type );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := ?;
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := ?;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaArrayType',
	#superclass : 'PltArrayType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaArrayType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaArrayType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaArrayType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaArrayType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaArrayType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaArrayType >> accept: aVisitor [

	^ aVisitor acceptAdaArrayType: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaArrayType >> adaArrayTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> adaArrayTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> adaArrayTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add: 'standards_io';
							     add: nil;
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> fromValues: values [

	^ self adaArrayTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaArrayType >> initValueUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaArrayType >> isExChdAdaArrayType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> localFromValues: values [

	^ self adaArrayTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> localToValues: values [

	^ self adaArrayTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaArrayType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaArrayType >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaArrayTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaArrayType >> pltLocalCopyTo: another [

	self adaArrayTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaArrayType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaArrayType >> toValues: values [

	^ self adaArrayTypeToValues: (super toValues: values)


]
