"
<ISO10303-11-EXPRESS>
ENTITY record 
	SUBTYPE OF ( ada_entity );
DERIVE
	ads_code : STRING := record_ads_code ( SELF );
	adb_code : STRING := record_adb_code ( SELF );
	ads_pre_def : STRING := 'type ' + SELF.name + '; type ' + SELF.ptr_type + ' is access all ' + SELF.name + ';';
	ads_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, true );
	adb_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, false );
	SELF\ada_entity.xml_writer_code : STRING := record_xml_writer_code ( SELF );
	SELF\ada_entity.xml_io_record_code : STRING := record_xml_io_record_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecord',
	#superclass : 'ExChdAdaEntity',
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecord class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecord class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecord class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecord class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecord class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdRecord >> accept: aVisitor [

	^ aVisitor acceptRecord: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdRecordAdbCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaEntityInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: false;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdRecordAdsCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaEntityInterfacesListFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   add: true;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ((((('type ' pltPlus: (aReceiver nameUsingContext: aContext))
		      pltPlus: '; type ') pltPlus:
		     (aReceiver ptrTypeUsingContext: aContext)) pltPlus:
		    ' is access all ') pltPlus:
		   (aReceiver nameUsingContext: aContext)) pltPlus: ';'


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> fromValues: values [

	^ self recordFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdRecord >> isExChdRecord [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> localFromValues: values [

	^ self recordFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> localToValues: values [

	^ self recordToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdRecord >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdRecord >> pltCopyTo: another [

	super pltCopyTo: another.
	self recordCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdRecord >> pltLocalCopyTo: another [

	self recordCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdRecord >> recordCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> recordFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> recordToValues: values [

	^ values


]

{ #category : 'platypus-generated-initializing' }
ExChdRecord >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecord >> toValues: values [

	^ self recordToValues: (super toValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlIoRecordCode [

	^ self xmlIoRecordCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlIoRecordCodeUsingContext: aContext [

	^ self xmlIoRecordCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlIoRecordCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdRecordXmlIoRecordCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlWriterCode [

	^ self xmlWriterCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlWriterCodeUsingContext: aContext [

	^ self xmlWriterCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecord >> xmlWriterCodeUsingContext: aContext receiver: aReceiver [

	^ ExChdRecordXmlWriterCodeFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]
