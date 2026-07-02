"
<ISO10303-11-EXPRESS>
ENTITY ada_natural_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'natural_io', false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Natural';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := '0';
	SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.natural_io.';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaNaturalType,
	#superclass : #ExChdAdaPrimitiveType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNaturalType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaNaturalType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaNaturalType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNaturalType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNaturalType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaNaturalType >> accept: aVisitor [
	^ aVisitor acceptAdaNaturalType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'Natural'


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNaturalType >> adaNaturalTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> adaNaturalTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> adaNaturalTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
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
ExChdAdaNaturalType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
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
														add: 'standards_io';
														add: 'natural_io';
														add: false;
														add: true;
														yourself);
										yourself);
						yourself))


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> fromValues: values [
	^ self adaNaturalTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> initValueUsingContext: aContext receiver: aReceiver [
	^ '0'


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaNaturalType >> isExChdAdaNaturalType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> localFromValues: values [
	^ self adaNaturalTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> localToValues: values [
	^ self adaNaturalTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNaturalType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNaturalType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaNaturalTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNaturalType >> pltLocalCopyTo: another [
	self adaNaturalTypeCopyTo: another


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNaturalType >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ 'standards_io.natural_io.'


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaNaturalType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNaturalType >> toValues: values [
	^ self adaNaturalTypeToValues: (super toValues: values)


]
