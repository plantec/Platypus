"
<ISO10303-11-EXPRESS>
ENTITY range_type 
	SUBTYPE OF ( defined_type );
	lower : STRING;
	upper : STRING;
	lower_constant : OPTIONAL STRING;
	upper_constant : OPTIONAL STRING;
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := name;
	ada_ref_ident : STRING := SELF.ada_ident;
	ads_code : STRING := range_type_ads_code ( SELF );
	adb_code : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdRangeType,
	#superclass : #PltDefinedType,
	#instVars : [
		'lower',
		'lowerConstant',
		'upper',
		'upperConstant'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdRangeType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRangeType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRangeType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRangeType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRangeType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdRangeType >> accept: aVisitor [
	^ aVisitor acceptRangeType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver name


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdRangeTypeAdsCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdRangeType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdRangeType >> fastSetLower: aString [
	lower := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdRangeType >> fastSetLowerConstant: aString [
	lowerConstant := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdRangeType >> fastSetUpper: aString [
	upper := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdRangeType >> fastSetUpperConstant: aString [
	upperConstant := aString


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> fromValues: values [
	^ self rangeTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdRangeType >> isExChdRangeType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> localFromValues: values [
	^ self rangeTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> localToValues: values [
	^ self rangeTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> lower [
	^ lower


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> lower: aString [
	lower := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> lowerConstant [
	^ lowerConstant


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> lowerConstant: aString [
	lowerConstant := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdRangeType >> lowerConstantUsingContext: aContext [
	^ self lowerConstant


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdRangeType >> lowerUsingContext: aContext [
	^ self lower


]

{ #category : #'platypus-generated-copying' }
ExChdRangeType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdRangeType >> pltCopyTo: another [
	super pltCopyTo: another.
	self rangeTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdRangeType >> pltLocalCopyTo: another [
	self rangeTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdRangeType >> rangeTypeCopyTo: another [
	another fastSetLower: self lower.
	another fastSetUpper: self upper.
	another fastSetLowerConstant: self lowerConstant.
	another fastSetUpperConstant: self upperConstant


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> rangeTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setLower: valuesloc removeFirst.
	self setUpper: valuesloc removeFirst.
	self setLowerConstant: valuesloc removeFirst.
	self setUpperConstant: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> rangeTypeToValues: values [
	values add: self lower.
	values add: self upper.
	values add: self lowerConstant.
	values add: self upperConstant.
	^ values


]

{ #category : #'platypus-generated-set-accessing' }
ExChdRangeType >> setLower: aString [
	self lower: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdRangeType >> setLowerConstant: aString [
	self lowerConstant: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdRangeType >> setUpper: aString [
	self upper: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdRangeType >> setUpperConstant: aString [
	self upperConstant: aString


]

{ #category : #'platypus-generated-initializing' }
ExChdRangeType >> stepInitialize [
	super stepInitialize.
	lower := ''.
	upper := ''.
	lowerConstant := nil.
	upperConstant := nil


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRangeType >> toValues: values [
	^ self rangeTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> upper [
	^ upper


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> upper: aString [
	upper := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> upperConstant [
	^ upperConstant


]

{ #category : #'platypus-generated-accessing' }
ExChdRangeType >> upperConstant: aString [
	upperConstant := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdRangeType >> upperConstantUsingContext: aContext [
	^ self upperConstant


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdRangeType >> upperUsingContext: aContext [
	^ self upper


]
