"
<ISO10303-11-EXPRESS>
ENTITY ada_class 
	SUBTYPE OF ( ada_entity );
	is_private : BOOLEAN;
DERIVE
	SELF\ada_entity.refed_by_pointer : BOOLEAN := true;
	ads_pre_def : STRING := 'type ' + SELF.name + '; type ' + SELF.ptr_type + ' is access all ' + SELF.name + '''Class;';
	ads_code : STRING := ada_class_ads_code ( SELF, is_private );
	adb_code : STRING := ada_class_adb_code ( SELF );
	init_value : STRING := ?;
	ads_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, true );
	adb_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, false );
	SELF\ada_entity.ada_ref_ident : STRING := SELF.ptr_type;
	SELF\ada_entity.xml_writer_code : STRING := ada_class_xml_writer_code ( SELF );
	SELF\ada_entity.xml_io_record_code : STRING := ada_class_xml_io_record_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClass',
	#superclass : 'ExChdAdaEntity',
	#instVars : [
		'isPrivate'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClass class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClass class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClass class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClass class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClass class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaClass >> accept: aVisitor [

	^ aVisitor acceptAdaClass: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClass >> adaClassCopyTo: another [

	another fastSetIsPrivate: self isPrivate


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> adaClassFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setIsPrivate: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> adaClassToValues: values [

	values add: self isPrivate.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver ptrTypeUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaClassAdbCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaEntityInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: false;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaClassAdsCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: aReceiver isPrivate;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaEntityInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: true;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ((((('type ' pltPlus: (aReceiver nameUsingContext: aContext))
		      pltPlus: '; type ') pltPlus:
		     (aReceiver ptrTypeUsingContext: aContext)) pltPlus:
		    ' is access all ') pltPlus:
		   (aReceiver nameUsingContext: aContext)) pltPlus: '''Class;'


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaClass >> fastSetIsPrivate: aBoolean [

	isPrivate := aBoolean


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> fromValues: values [

	^ self adaClassFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> initValueUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaClass >> isExChdAdaClass [

	^ true


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClass >> isPrivate [

	^ isPrivate


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClass >> isPrivate: aBoolean [

	isPrivate := aBoolean


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaClass >> isPrivateUsingContext: aContext [

	^ self isPrivate


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> localFromValues: values [

	^ self adaClassFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> localToValues: values [

	^ self adaClassToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClass >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClass >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaClassCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClass >> pltLocalCopyTo: another [

	self adaClassCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ true


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaClass >> setIsPrivate: aBoolean [

	self isPrivate: aBoolean


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaClass >> stepInitialize [

	super stepInitialize.
	isPrivate := false


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClass >> toValues: values [

	^ self adaClassToValues: (super toValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlIoRecordCode [

	^ self xmlIoRecordCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlIoRecordCodeUsingContext: aContext [

	^ self xmlIoRecordCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlIoRecordCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaClassXmlIoRecordCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlWriterCode [

	^ self xmlWriterCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlWriterCodeUsingContext: aContext [

	^ self xmlWriterCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClass >> xmlWriterCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaClassXmlWriterCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]
