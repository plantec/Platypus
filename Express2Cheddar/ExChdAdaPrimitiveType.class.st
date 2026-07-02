"
<ISO10303-11-EXPRESS>
ENTITY ada_primitive_type 
	SUBTYPE OF ( entity_definition );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ads_code : STRING := '';
	adb_code : STRING := '';
	put_prefix : STRING := '';
	refed_by_pointer : BOOLEAN := false;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPrimitiveType,
	#superclass : #PltEntityDefinition,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPrimitiveType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPrimitiveType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPrimitiveType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaPrimitiveType >> accept: aVisitor [
	^ aVisitor acceptAdaPrimitiveType: self


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveType >> adaPrimitiveTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> adaPrimitiveTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> adaPrimitiveTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> fromValues: values [
	^ self adaPrimitiveTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaPrimitiveType >> isExChdAdaPrimitiveType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> localFromValues: values [
	^ self adaPrimitiveTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> localToValues: values [
	^ self adaPrimitiveTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaPrimitiveTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaPrimitiveType >> pltLocalCopyTo: another [
	self adaPrimitiveTypeCopyTo: another


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> refedByPointer [
	^ self refedByPointerUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> refedByPointerUsingContext: aContext [
	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaPrimitiveType >> refedByPointerUsingContext: aContext receiver: aReceiver [
	^ false


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaPrimitiveType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaPrimitiveType >> toValues: values [
	^ self adaPrimitiveTypeToValues: (super toValues: values)


]
