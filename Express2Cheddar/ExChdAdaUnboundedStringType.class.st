"
<ISO10303-11-EXPRESS>
ENTITY ada_unbounded_string_type 
	SUBTYPE OF ( ada_primitive_type );
DERIVE
	SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'ada.strings', 'unbounded.text_io', true, true ), ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'Unbounded_Strings', ?, true, true ), ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ) ];
	SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
	ada_ident : STRING := 'Unbounded_String';
	ada_ref_ident : STRING := SELF.ada_ident;
	init_value : STRING := 'empty_string';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaUnboundedStringType,
	#superclass : #ExChdAdaPrimitiveType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaUnboundedStringType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaUnboundedStringType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaUnboundedStringType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaUnboundedStringType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaUnboundedStringType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaUnboundedStringType >> accept: aVisitor [
	^ aVisitor acceptAdaUnboundedStringType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'Unbounded_String'


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
ExChdAdaUnboundedStringType >> adaUnboundedStringTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> adaUnboundedStringTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> adaUnboundedStringTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Text_io';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
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
ExChdAdaUnboundedStringType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'ada.strings';
												add: 'unbounded.text_io';
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Text_io';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Unbounded_Strings';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Convert_Strings';
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Convert_Unbounded_Strings';
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> fromValues: values [
	^ self adaUnboundedStringTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaUnboundedStringType >> initValueUsingContext: aContext receiver: aReceiver [
	^ 'empty_string'


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaUnboundedStringType >> isExChdAdaUnboundedStringType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> localFromValues: values [
	^ self adaUnboundedStringTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> localToValues: values [
	^ self adaUnboundedStringTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaUnboundedStringType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaUnboundedStringType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaUnboundedStringTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaUnboundedStringType >> pltLocalCopyTo: another [
	self adaUnboundedStringTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaUnboundedStringType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaUnboundedStringType >> toValues: values [
	^ self adaUnboundedStringTypeToValues: (super toValues: values)


]
