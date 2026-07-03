"
<ISO10303-11-EXPRESS>
ENTITY ada_bag_type 
	SUBTYPE OF ( bag_type );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := 'bag';
	ada_ref_ident : STRING := SELF.ada_ident;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaBagType',
	#superclass : 'PltBagType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaBagType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaBagType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaBagType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaBagType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaBagType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaBagType >> accept: aVisitor [
	^ aVisitor acceptAdaBagType: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaBagType >> adaBagTypeCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> adaBagTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> adaBagTypeToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'bag'


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaBagType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'standards_io';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> fromValues: values [
	^ self adaBagTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaBagType >> isExChdAdaBagType [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> localFromValues: values [
	^ self adaBagTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> localToValues: values [
	^ self adaBagTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaBagType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaBagType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaBagTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaBagType >> pltLocalCopyTo: another [
	self adaBagTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaBagType >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaBagType >> toValues: values [
	^ self adaBagTypeToValues: (super toValues: values)


]
