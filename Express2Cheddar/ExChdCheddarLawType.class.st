"
<ISO10303-11-EXPRESS>
ENTITY cheddar_law_type 
	SUBTYPE OF ( cheddar_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Expression', ?, true, true ), ada_interface ( 'Expression', ?, false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := 'law_type';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := ?;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarLawType',
	#superclass : 'ExChdCheddarPrimitiveType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarLawType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarLawType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarLawType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarLawType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarLawType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarLawType >> accept: aVisitor [
	^ aVisitor acceptCheddarLawType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'law_type'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Expression';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Expression';
												add: nil;
												add: false;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarLawType >> cheddarLawTypeCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> cheddarLawTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> cheddarLawTypeToValues: values [
	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> fromValues: values [
	^ self cheddarLawTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarLawType >> initValueUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarLawType >> isExChdCheddarLawType [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> localFromValues: values [
	^ self cheddarLawTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> localToValues: values [
	^ self cheddarLawTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarLawType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarLawType >> pltCopyTo: another [
	super pltCopyTo: another.
	self cheddarLawTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarLawType >> pltLocalCopyTo: another [
	self cheddarLawTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarLawType >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarLawType >> toValues: values [
	^ self cheddarLawTypeToValues: (super toValues: values)


]
