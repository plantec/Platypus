"
<ISO10303-11-EXPRESS>
ENTITY ada_list_type 
	SUBTYPE OF ( list_type );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := 'list';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := ?;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaListType',
	#superclass : 'PltListType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaListType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaListType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaListType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaListType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaListType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaListType >> accept: aVisitor [
	^ aVisitor acceptAdaListType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'list'


]

{ #category : 'platypus-generated-copying' }
ExChdAdaListType >> adaListTypeCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaListType >> adaListTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaListType >> adaListTypeToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
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
ExChdAdaListType >> fromValues: values [
	^ self adaListTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaListType >> initValueUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaListType >> isExChdAdaListType [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaListType >> localFromValues: values [
	^ self adaListTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaListType >> localToValues: values [
	^ self adaListTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaListType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaListType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaListTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaListType >> pltLocalCopyTo: another [
	self adaListTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaListType >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaListType >> toValues: values [
	^ self adaListTypeToValues: (super toValues: values)


]
