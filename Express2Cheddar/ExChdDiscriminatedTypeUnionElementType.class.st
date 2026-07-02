"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_union_element_type 
	SUBTYPE OF ( ada_entity );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ads_code : STRING := '';
	adb_code : STRING := '';
	union_ads_code : STRING := discriminated_type_union_element_case_code ( SELF );
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeUnionElementType,
	#superclass : #ExChdAdaEntity,
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionElementType class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionElementType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdDiscriminatedTypeUnionElementType >> accept: aVisitor [
	^ aVisitor acceptDiscriminatedTypeUnionElementType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsPreDef [
	^ self adsPreDefUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsPreDefUsingContext: aContext [
	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> adsPreDefUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionElementType >> discriminatedTypeUnionElementTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> discriminatedTypeUnionElementTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> discriminatedTypeUnionElementTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> fromValues: values [
	^ self discriminatedTypeUnionElementTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdDiscriminatedTypeUnionElementType >> isExChdDiscriminatedTypeUnionElementType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> localFromValues: values [
	^ self discriminatedTypeUnionElementTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> localToValues: values [
	^ self discriminatedTypeUnionElementTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionElementType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionElementType >> pltCopyTo: another [
	super pltCopyTo: another.
	self discriminatedTypeUnionElementTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionElementType >> pltLocalCopyTo: another [
	self discriminatedTypeUnionElementTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdDiscriminatedTypeUnionElementType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionElementType >> toValues: values [
	^ self discriminatedTypeUnionElementTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> unionAdsCode [
	^ self unionAdsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> unionAdsCodeUsingContext: aContext [
	^ self unionAdsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionElementType >> unionAdsCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdDiscriminatedTypeUnionElementCaseCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]
