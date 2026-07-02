"
<ISO10303-11-EXPRESS>
ENTITY constrained_array_type 
	SUBTYPE OF ( cheddar_defined_type );
	min_idx : STRING;
	max_idx : OPTIONAL STRING;
	interfaces : LIST OF ada_interface;
DERIVE
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ads_interfaces_list : LIST OF ada_interface := interfaces;
	adb_code : STRING := '';
	ads_code : STRING := constrained_array_type_ads_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdConstrainedArrayType,
	#superclass : #ExChdCheddarDefinedType,
	#instVars : [
		'maxIdx',
		'interfaces',
		'minIdx'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdConstrainedArrayType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdConstrainedArrayType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdConstrainedArrayType >> accept: aVisitor [
	^ aVisitor acceptConstrainedArrayType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdConstrainedArrayTypeAdsCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdConstrainedArrayType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ aReceiver interfaces


]

{ #category : #'platypus-generated-copying' }
ExChdConstrainedArrayType >> constrainedArrayTypeCopyTo: another [
	another fastSetMinIdx: self minIdx.
	another fastSetMaxIdx: self maxIdx.
	another fastSetInterfaces: self interfaces


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> constrainedArrayTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setMinIdx: valuesloc removeFirst.
	self setMaxIdx: valuesloc removeFirst.
	self setInterfaces: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> constrainedArrayTypeToValues: values [
	values add: self minIdx.
	values add: self maxIdx.
	values add: self interfaces.
	^ values


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdConstrainedArrayType >> fastSetInterfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdConstrainedArrayType >> fastSetMaxIdx: aString [
	maxIdx := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdConstrainedArrayType >> fastSetMinIdx: aString [
	minIdx := aString


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> fromValues: values [
	^ self constrainedArrayTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> interfaces [
	^ interfaces


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> interfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdConstrainedArrayType >> interfacesUsingContext: aContext [
	^ self interfaces


]

{ #category : #'platypus-generated-classifying' }
ExChdConstrainedArrayType >> isExChdConstrainedArrayType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> localFromValues: values [
	^ self constrainedArrayTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> localToValues: values [
	^ self constrainedArrayTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> maxIdx [
	^ maxIdx


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> maxIdx: aString [
	maxIdx := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdConstrainedArrayType >> maxIdxUsingContext: aContext [
	^ self maxIdx


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> minIdx [
	^ minIdx


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayType >> minIdx: aString [
	minIdx := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdConstrainedArrayType >> minIdxUsingContext: aContext [
	^ self minIdx


]

{ #category : #'platypus-generated-copying' }
ExChdConstrainedArrayType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdConstrainedArrayType >> pltCopyTo: another [
	super pltCopyTo: another.
	self constrainedArrayTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdConstrainedArrayType >> pltLocalCopyTo: another [
	self constrainedArrayTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
ExChdConstrainedArrayType >> setInterfaces: aListOfExChdAdaInterface [
	self interfaces: aListOfExChdAdaInterface


]

{ #category : #'platypus-generated-set-accessing' }
ExChdConstrainedArrayType >> setMaxIdx: aString [
	self maxIdx: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdConstrainedArrayType >> setMinIdx: aString [
	self minIdx: aString


]

{ #category : #'platypus-generated-initializing' }
ExChdConstrainedArrayType >> stepInitialize [
	super stepInitialize.
	minIdx := ''.
	maxIdx := nil.
	interfaces := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
ExChdConstrainedArrayType >> toValues: values [
	^ self constrainedArrayTypeToValues: (super toValues: values)


]
