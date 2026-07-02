"
<ISO10303-11-EXPRESS>
ENTITY ada_class_reference 
	SUBTYPE OF ( ada_named_type_reference );
DERIVE
	SELF\entity_definition_reference.accepted : entity_instance := SELF.accept_ada_class_reference;
	SELF\ada_named_type_reference.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.ref.owner.name, ?, true, true ) ];
	SELF\ada_named_type_reference.ada_ident : STRING := SELF.ref.name + '_Ptr';
	init_value : STRING := 'initialize';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaClassReference,
	#superclass : #ExChdAdaNamedTypeReference,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassReference class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassReference class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassReference class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassReference class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassReference class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaClassReference >> accept: aVisitor [
	^ aVisitor acceptAdaClassReference: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> accepted [
	^ self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> acceptedUsingContext: aContext [
	^ self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> acceptedUsingContext: aContext receiver: aReceiver [
	^ aReceiver acceptAdaClassReferenceUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
ExChdAdaClassReference >> adaClassReferenceCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> adaClassReferenceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> adaClassReferenceToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ ((aReceiver refUsingContext: aContext) nameUsingContext: aContext) pltPlus: '_Ptr'


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add:
														(((aReceiver refUsingContext: self class context) ownerUsingContext: self class context)
																nameUsingContext: self class context);
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> fromValues: values [
	^ self adaClassReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaClassReference >> initValueUsingContext: aContext receiver: aReceiver [
	^ 'initialize'


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaClassReference >> isExChdAdaClassReference [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> localFromValues: values [
	^ self adaClassReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> localToValues: values [
	^ self adaClassReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaClassReference >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaClassReference >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaClassReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaClassReference >> pltLocalCopyTo: another [
	self adaClassReferenceCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaClassReference >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaClassReference >> toValues: values [
	^ self adaClassReferenceToValues: (super toValues: values)


]
