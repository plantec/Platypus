"
<ISO10303-11-EXPRESS>
ENTITY ada_real_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'Ada', 'Numerics.Aux', true, true ), ada_interface ( 'standards_io', 'float_io', false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Float';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := '0.0';
	SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.float_io.';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaRealType,
	#superclass : #ExChdAdaPrimitiveType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaRealType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaRealType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaRealType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaRealType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaRealType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaRealType >> accept: aVisitor [
	^ aVisitor acceptAdaRealType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'Float'


]

{ #category : #'platypus-generated-copying' }
ExChdAdaRealType >> adaRealTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> adaRealTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> adaRealTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'primitive_xml_strings';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ (PlatypusCoreAggregateInitializer
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
				yourself))
		pltPlus:
			(PlatypusCoreAggregateInitializer
				collectionFrom:
					(OrderedCollection new
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Ada';
														add: 'Numerics.Aux';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'standards_io';
														add: 'float_io';
														add: false;
														add: true;
														yourself);
										yourself);
						yourself))


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> fromValues: values [
	^ self adaRealTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> initValueUsingContext: aContext receiver: aReceiver [
	^ '0.0'


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaRealType >> isExChdAdaRealType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> localFromValues: values [
	^ self adaRealTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> localToValues: values [
	^ self adaRealTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaRealType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaRealType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaRealTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaRealType >> pltLocalCopyTo: another [
	self adaRealTypeCopyTo: another


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaRealType >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ 'standards_io.float_io.'


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaRealType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaRealType >> toValues: values [
	^ self adaRealTypeToValues: (super toValues: values)


]
