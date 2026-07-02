"
<ISO10303-11-EXPRESS>
ENTITY ada_primitive_class_reference 
	SUBTYPE OF ( ada_class_reference );
	pointed_type_name : STRING;
	package_name : STRING;
DERIVE
	SELF\ada_class_reference.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( package_name, ?, true, true ) ];
	SELF\ada_class_reference.ada_ident : STRING := pointed_type_name + '_Ptr';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPrimitiveClassReference,
	#superclass : #ExChdAdaClassReference,
	#instVars : [
		'packageName',
		'pointedTypeName'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveClassReference class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPrimitiveClassReference class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPrimitiveClassReference class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveClassReference class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveClassReference class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaPrimitiveClassReference >> accept: aVisitor [
	^ aVisitor acceptAdaPrimitiveClassReference: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver pointedTypeName pltPlus: '_Ptr'


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveClassReference >> adaPrimitiveClassReferenceCopyTo: another [
	another fastSetPointedTypeName: self pointedTypeName.
	another fastSetPackageName: self packageName


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> adaPrimitiveClassReferenceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setPointedTypeName: valuesloc removeFirst.
	self setPackageName: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> adaPrimitiveClassReferenceToValues: values [
	values add: self pointedTypeName.
	values add: self packageName.
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveClassReference >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: aReceiver packageName;
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdAdaPrimitiveClassReference >> fastSetPackageName: aString [
	packageName := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdAdaPrimitiveClassReference >> fastSetPointedTypeName: aString [
	pointedTypeName := aString


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> fromValues: values [
	^ self adaPrimitiveClassReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaPrimitiveClassReference >> isExChdAdaPrimitiveClassReference [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> localFromValues: values [
	^ self adaPrimitiveClassReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> localToValues: values [
	^ self adaPrimitiveClassReferenceToValues: values


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPrimitiveClassReference >> packageName [
	^ packageName


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPrimitiveClassReference >> packageName: aString [
	packageName := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdAdaPrimitiveClassReference >> packageNameUsingContext: aContext [
	^ self packageName


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveClassReference >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveClassReference >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaPrimitiveClassReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveClassReference >> pltLocalCopyTo: another [
	self adaPrimitiveClassReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPrimitiveClassReference >> pointedTypeName [
	^ pointedTypeName


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPrimitiveClassReference >> pointedTypeName: aString [
	pointedTypeName := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdAdaPrimitiveClassReference >> pointedTypeNameUsingContext: aContext [
	^ self pointedTypeName


]

{ #category : #'platypus-generated-set-accessing' }
ExChdAdaPrimitiveClassReference >> setPackageName: aString [
	self packageName: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdAdaPrimitiveClassReference >> setPointedTypeName: aString [
	self pointedTypeName: aString


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaPrimitiveClassReference >> stepInitialize [
	super stepInitialize.
	pointedTypeName := ''.
	packageName := ''


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveClassReference >> toValues: values [
	^ self adaPrimitiveClassReferenceToValues: (super toValues: values)


]
