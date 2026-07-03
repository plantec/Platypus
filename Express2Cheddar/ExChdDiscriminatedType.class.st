"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type 
	SUBTYPE OF ( ada_entity );
DERIVE
	SELF\ada_entity.refed_by_pointer : BOOLEAN := false;
	discriminant : attribute := QUERY ( attr <* attributes | 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_DISCRIMINANT' IN TYPEOF ( attr ) ) [ 1 ];
	union_attr : attribute := QUERY ( attr <* attributes | 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_UNION' IN TYPEOF ( attr ) ) [ 1 ];
	ads_interfaces_list : LIST OF ada_interface := discriminated_Type_interfaces_list ( SELF, true );
	adb_interfaces_list : LIST OF ada_interface := discriminated_Type_interfaces_list ( SELF, false );
	translated_attributes : LIST OF explicit_attribute := explicit_attributes - discriminant - union_attr;
	SELF\ada_entity.ada_ident : STRING := name;
	SELF\ada_entity.ada_ref_ident : STRING := SELF.ada_ident + '_Ptr';
	SELF\ada_entity.xml_io_record_code : STRING := discriminated_type_xml_io_record_code ( SELF );
	tail_attributes : LIST OF attribute := discriminated_type_tails_attributes ( SELF );
	ads_code : STRING := discriminated_type_ads_code ( SELF );
	adb_code : STRING := discriminated_type_adb_code ( SELF );
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedType',
	#superclass : 'ExChdAdaEntity',
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedType class >> schemaDefinition [

	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdDiscriminatedType >> accept: aVisitor [

	^ aVisitor acceptDiscriminatedType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver name


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ (aReceiver adaIdentUsingContext: aContext) pltPlus: '_Ptr'


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeAdbCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: false;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeAdsCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: true;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> discriminant [

	^ self discriminantUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> discriminantUsingContext: aContext [

	^ self discriminantUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> discriminantUsingContext: aContext receiver: aReceiver [

	^ (aReceiver attributes select: [ :attr1486535 |
			   (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
					     add: attr1486535;
					     yourself)) includes:
				   'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_DISCRIMINANT' ]) pltAt:
		  1


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedType >> discriminatedTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> discriminatedTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> discriminatedTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> fromValues: values [

	^ self discriminatedTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdDiscriminatedType >> isExChdDiscriminatedType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> localFromValues: values [

	^ self discriminatedTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> localToValues: values [

	^ self discriminatedTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedType >> pltCopyTo: another [

	super pltCopyTo: another.
	self discriminatedTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedType >> pltLocalCopyTo: another [

	self discriminatedTypeCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ false


]

{ #category : 'platypus-generated-initializing' }
ExChdDiscriminatedType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> tailAttributes [

	^ self tailAttributesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> tailAttributesUsingContext: aContext [

	^ self tailAttributesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> tailAttributesUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeTailsAttributesFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedType >> toValues: values [

	^ self discriminatedTypeToValues: (super toValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> translatedAttributes [

	^ self translatedAttributesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> translatedAttributesUsingContext: aContext [

	^ self translatedAttributesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> translatedAttributesUsingContext: aContext receiver: aReceiver [

	^ ((aReceiver explicitAttributesUsingContext: aContext) pltMinus:
		   (aReceiver discriminantUsingContext: aContext)) pltMinus:
		  (aReceiver unionAttrUsingContext: aContext)


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> unionAttr [

	^ self unionAttrUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> unionAttrUsingContext: aContext [

	^ self unionAttrUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> unionAttrUsingContext: aContext receiver: aReceiver [

	^ (aReceiver attributes select: [ :attr708451 |
			   (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
					     add: attr708451;
					     yourself)) includes:
				   'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_UNION' ]) pltAt: 1


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> xmlIoRecordCode [

	^ self xmlIoRecordCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> xmlIoRecordCodeUsingContext: aContext [

	^ self xmlIoRecordCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedType >> xmlIoRecordCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdDiscriminatedTypeXmlIoRecordCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]
