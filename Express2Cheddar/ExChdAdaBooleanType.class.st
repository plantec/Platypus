"
<ISO10303-11-EXPRESS>
ENTITY ada_boolean_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'boolean_io', false, true ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Boolean';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := 'false';
	SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.boolean_io.';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaBooleanType,
	#superclass : #ExChdAdaPrimitiveType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaBooleanType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaBooleanType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaBooleanType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaBooleanType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaBooleanType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaBooleanType >> accept: aVisitor [
	^ aVisitor acceptAdaBooleanType: self


]

{ #category : #'platypus-generated-copying' }
ExChdAdaBooleanType >> adaBooleanTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> adaBooleanTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> adaBooleanTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'Boolean'


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
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
ExChdAdaBooleanType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
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
														add: 'boolean_io';
														add: false;
														add: true;
														yourself);
										yourself);
						yourself))


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> fromValues: values [
	^ self adaBooleanTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> initValueUsingContext: aContext receiver: aReceiver [
	^ 'false'


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaBooleanType >> isExChdAdaBooleanType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> localFromValues: values [
	^ self adaBooleanTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> localToValues: values [
	^ self adaBooleanTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaBooleanType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaBooleanType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaBooleanTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaBooleanType >> pltLocalCopyTo: another [
	self adaBooleanTypeCopyTo: another


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaBooleanType >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ 'standards_io.boolean_io.'


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaBooleanType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaBooleanType >> toValues: values [
	^ self adaBooleanTypeToValues: (super toValues: values)


]
