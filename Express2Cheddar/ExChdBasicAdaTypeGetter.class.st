"
<ISO10303-11-EXPRESS>
ENTITY basic_ada_type_getter;
DERIVE
	accept_string_type : dictionary_instance := ( ada_unbounded_string_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
	accept_integer_type : dictionary_instance := ( ada_natural_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
	accept_real_type : dictionary_instance := ( ada_double_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
	accept_boolean_type : dictionary_instance := ( ada_boolean_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
	accept_enumeration_type : dictionary_instance := SELF\enumeration_type;
	accept_ada_enumeration : dictionary_instance := SELF;
	accept_attribute_reference : dictionary_instance := ( ada_attribute_reference ( ) || ada_named_type_reference ( ) || SELF\attribute_reference );
	accept_defined_type_reference : dictionary_instance := basic_ada_domain ( SELF\defined_type_reference.ref );
	accept_defined_type : dictionary_instance := unmapped_type_reference ( SELF.domain ) || SELF;
	accept_ada_range : dictionary_instance := SELF;
	accept_ada_class_reference : dictionary_instance := SELF;
	accept_ada_record_reference : dictionary_instance := SELF;
	accept_entity_definition_reference : dictionary_instance := ( unmapped_type_reference ( SELF.ref ) || SELF\entity_definition_reference );
	accept_entity_definition : dictionary_instance := ( unmapped_entity_definition ( ) || SELF\entity_definition );
	accept_cheddar_defined_type : dictionary_instance := SELF;
	accept_list_type : dictionary_instance := ( ada_list_type ( ) || SELF\list_type );
	accept_array_type : dictionary_instance := ( ada_array_type ( ) || SELF\array_type );
	accept_set_type : dictionary_instance := ( ada_set_type ( ) || SELF\set_type );
	accept_bag_type : dictionary_instance := ( ada_bag_type ( ) || SELF\bag_type );
	accept_explicit_type_reference : dictionary_instance := SELF;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdBasicAdaTypeGetter,
	#superclass : #ExChdCoreEntity,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeGetter class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdBasicAdaTypeGetter class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdBasicAdaTypeGetter class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeGetter class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeGetter class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdBasicAdaTypeGetter >> accept: aVisitor [
	^ aVisitor acceptBasicAdaTypeGetter: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaClassReference [
	^ self acceptAdaClassReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaClassReferenceUsingContext: aContext [
	^ self acceptAdaClassReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaClassReferenceUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaEnumeration [
	^ self acceptAdaEnumerationUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaEnumerationUsingContext: aContext [
	^ self acceptAdaEnumerationUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaEnumerationUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRange [
	^ self acceptAdaRangeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRangeUsingContext: aContext [
	^ self acceptAdaRangeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRangeUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRecordReference [
	^ self acceptAdaRecordReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRecordReferenceUsingContext: aContext [
	^ self acceptAdaRecordReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAdaRecordReferenceUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptArrayType [
	^ self acceptArrayTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptArrayTypeUsingContext: aContext [
	^ self acceptArrayTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptArrayTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add: ExChdAdaArrayType new;
				add: (aReceiver asPlatypusComplexInstance \ #PltArrayType) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAttributeReference [
	^ self acceptAttributeReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAttributeReferenceUsingContext: aContext [
	^ self acceptAttributeReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptAttributeReferenceUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add: ExChdAdaAttributeReference new;
										add: ExChdAdaNamedTypeReference new;
										yourself)) pltAsObject;
				add: (aReceiver asPlatypusComplexInstance \ #PltAttributeReference) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBagType [
	^ self acceptBagTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBagTypeUsingContext: aContext [
	^ self acceptBagTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBagTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add: ExChdAdaBagType new;
				add: (aReceiver asPlatypusComplexInstance \ #PltBagType) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBooleanType [
	^ self acceptBooleanTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBooleanTypeUsingContext: aContext [
	^ self acceptBooleanTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptBooleanTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add: ExChdAdaBooleanType new;
										add: ExChdAdaPrimitiveType new;
										yourself)) pltAsObject;
				add: PltDictionaryInstance new;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptCheddarDefinedType [
	^ self acceptCheddarDefinedTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptCheddarDefinedTypeUsingContext: aContext [
	^ self acceptCheddarDefinedTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptCheddarDefinedTypeUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedType [
	^ self acceptDefinedTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedTypeReference [
	^ self acceptDefinedTypeReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedTypeReferenceUsingContext: aContext [
	^ self acceptDefinedTypeReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedTypeReferenceUsingContext: aContext receiver: aReceiver [
	^ ExChdBasicAdaDomainFunction
		invokeFromValues:
			(OrderedCollection new
				add:
						((aReceiver asPlatypusComplexInstance \ #PltDefinedTypeReference) pltAsObject refUsingContext: self class context);
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedTypeUsingContext: aContext [
	^ self acceptDefinedTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptDefinedTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(ExChdUnmappedTypeReference new
								unmappedTypeReferenceFromValues:
										(OrderedCollection new
												add: (aReceiver domainUsingContext: self class context);
												yourself);
								yourself);
				add: aReceiver;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinition [
	^ self acceptEntityDefinitionUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinitionReference [
	^ self acceptEntityDefinitionReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinitionReferenceUsingContext: aContext [
	^ self acceptEntityDefinitionReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinitionReferenceUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(ExChdUnmappedTypeReference new
								unmappedTypeReferenceFromValues:
										(OrderedCollection new
												add: (aReceiver refUsingContext: self class context);
												yourself);
								yourself);
				add: (aReceiver asPlatypusComplexInstance \ #PltEntityDefinitionReference) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinitionUsingContext: aContext [
	^ self acceptEntityDefinitionUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEntityDefinitionUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add: ExChdUnmappedEntityDefinition new;
				add: (aReceiver asPlatypusComplexInstance \ #PltEntityDefinition) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEnumerationType [
	^ self acceptEnumerationTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEnumerationTypeUsingContext: aContext [
	^ self acceptEnumerationTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptEnumerationTypeUsingContext: aContext receiver: aReceiver [
	^ (aReceiver asPlatypusComplexInstance \ #PltEnumerationType) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptExplicitTypeReference [
	^ self acceptExplicitTypeReferenceUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptExplicitTypeReferenceUsingContext: aContext [
	^ self acceptExplicitTypeReferenceUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptExplicitTypeReferenceUsingContext: aContext receiver: aReceiver [
	^ aReceiver


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptIntegerType [
	^ self acceptIntegerTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptIntegerTypeUsingContext: aContext [
	^ self acceptIntegerTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptIntegerTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add: ExChdAdaNaturalType new;
										add: ExChdAdaPrimitiveType new;
										yourself)) pltAsObject;
				add: PltDictionaryInstance new;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptListType [
	^ self acceptListTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptListTypeUsingContext: aContext [
	^ self acceptListTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptListTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add: ExChdAdaListType new;
				add: (aReceiver asPlatypusComplexInstance \ #PltListType) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptRealType [
	^ self acceptRealTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptRealTypeUsingContext: aContext [
	^ self acceptRealTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptRealTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add: ExChdAdaDoubleType new;
										add: ExChdAdaPrimitiveType new;
										yourself)) pltAsObject;
				add: PltDictionaryInstance new;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptSetType [
	^ self acceptSetTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptSetTypeUsingContext: aContext [
	^ self acceptSetTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptSetTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add: ExChdAdaSetType new;
				add: (aReceiver asPlatypusComplexInstance \ #PltSetType) pltAsObject;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptStringType [
	^ self acceptStringTypeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptStringTypeUsingContext: aContext [
	^ self acceptStringTypeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdBasicAdaTypeGetter >> acceptStringTypeUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add: ExChdAdaUnboundedStringType new;
										add: ExChdAdaPrimitiveType new;
										yourself)) pltAsObject;
				add: PltDictionaryInstance new;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-copying' }
ExChdBasicAdaTypeGetter >> basicAdaTypeGetterCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> basicAdaTypeGetterFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> basicAdaTypeGetterToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> fromValues: values [
	^ self basicAdaTypeGetterFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdBasicAdaTypeGetter >> isExChdBasicAdaTypeGetter [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> localFromValues: values [
	^ self basicAdaTypeGetterFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> localToValues: values [
	^ self basicAdaTypeGetterToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdBasicAdaTypeGetter >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdBasicAdaTypeGetter >> pltCopyTo: another [
	super pltCopyTo: another.
	self basicAdaTypeGetterCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdBasicAdaTypeGetter >> pltLocalCopyTo: another [
	self basicAdaTypeGetterCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdBasicAdaTypeGetter >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdBasicAdaTypeGetter >> toValues: values [
	^ self basicAdaTypeGetterToValues: (super toValues: values)


]
