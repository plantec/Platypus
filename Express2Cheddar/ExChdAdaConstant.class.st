"
<ISO10303-11-EXPRESS>
ENTITY ada_constant 
	SUBTYPE OF ( constant_definition );
	final : BOOLEAN;
	other_initializer : OPTIONAL STRING;
DERIVE
	ads_code : STRING := ada_constant_ads_code ( SELF );
	adb_code : STRING := '';
	ads_interfaces_list : LIST OF ada_interface := ada_constant_interfaces_list ( SELF, true );
	adb_interfaces_list : LIST OF ada_interface := [ ];
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaConstant',
	#superclass : 'PltConstantDefinition',
	#instVars : [
		'final',
		'otherInitializer'
	],
	#category : 'Express2Cheddar-CheddarConstantsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarConstantsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstant class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaConstant class >> schemaDefinition [
	^ ExChdCheddarConstantsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaConstant class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstant class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstant class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaConstant >> accept: aVisitor [
	^ aVisitor acceptAdaConstant: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaConstant >> adaConstantCopyTo: another [
	another fastSetFinal: self final.
	another fastSetOtherInitializer: self otherInitializer


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> adaConstantFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setFinal: valuesloc removeFirst.
	self setOtherInitializer: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> adaConstantToValues: values [
	values add: self final.
	values add: self otherInitializer.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdAdaConstantAdsCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaConstant >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ ExChdAdaConstantInterfacesListFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				add: true;
				yourself)


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaConstant >> fastSetFinal: aBoolean [
	final := aBoolean


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaConstant >> fastSetOtherInitializer: aString [
	otherInitializer := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstant >> final [
	^ final


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstant >> final: aBoolean [
	final := aBoolean


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaConstant >> finalUsingContext: aContext [
	^ self final


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> fromValues: values [
	^ self adaConstantFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaConstant >> isExChdAdaConstant [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> localFromValues: values [
	^ self adaConstantFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> localToValues: values [
	^ self adaConstantToValues: values


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstant >> otherInitializer [
	^ otherInitializer


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstant >> otherInitializer: aString [
	otherInitializer := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaConstant >> otherInitializerUsingContext: aContext [
	^ self otherInitializer


]

{ #category : 'platypus-generated-copying' }
ExChdAdaConstant >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaConstant >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaConstantCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaConstant >> pltLocalCopyTo: another [
	self adaConstantCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaConstant >> setFinal: aBoolean [
	self final: aBoolean


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaConstant >> setOtherInitializer: aString [
	self otherInitializer: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaConstant >> stepInitialize [
	super stepInitialize.
	final := false.
	otherInitializer := nil


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaConstant >> toValues: values [
	^ self adaConstantToValues: (super toValues: values)


]
