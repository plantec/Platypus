"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_union_type 
	SUBTYPE OF ( ada_entity );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := discriminated_type_union_type_interfaces_list ( SELF, true );
	adb_interfaces_list : LIST OF ada_interface := discriminated_type_union_type_interfaces_list ( SELF, false );
	ads_code : STRING := '';
	adb_code : STRING := '';
	union_ads_code : STRING := discriminated_type_union_case_code ( SELF );
	all_attributes : LIST OF attribute := inherited_explicit_attributes ( SELF );
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeUnionType,
	#superclass : #ExChdAdaEntity,
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionType class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdDiscriminatedTypeUnionType >> accept: aVisitor [
	^ aVisitor acceptDiscriminatedTypeUnionType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ ExChdDiscriminatedTypeUnionTypeInterfacesListFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				add: false;
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ ExChdDiscriminatedTypeUnionTypeInterfacesListFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				add: true;
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsPreDef [
	^ self adsPreDefUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsPreDefUsingContext: aContext [
	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> adsPreDefUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> allAttributes [
	^ self allAttributesUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> allAttributesUsingContext: aContext [
	^ self allAttributesUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> allAttributesUsingContext: aContext receiver: aReceiver [
	^ PTsInheritedExplicitAttributesFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionType >> discriminatedTypeUnionTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> discriminatedTypeUnionTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> discriminatedTypeUnionTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> fromValues: values [
	^ self discriminatedTypeUnionTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdDiscriminatedTypeUnionType >> isExChdDiscriminatedTypeUnionType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> localFromValues: values [
	^ self discriminatedTypeUnionTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> localToValues: values [
	^ self discriminatedTypeUnionTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionType >> pltCopyTo: another [
	super pltCopyTo: another.
	self discriminatedTypeUnionTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeUnionType >> pltLocalCopyTo: another [
	self discriminatedTypeUnionTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdDiscriminatedTypeUnionType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnionType >> toValues: values [
	^ self discriminatedTypeUnionTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> unionAdsCode [
	^ self unionAdsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> unionAdsCodeUsingContext: aContext [
	^ self unionAdsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeUnionType >> unionAdsCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdDiscriminatedTypeUnionCaseCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]
