"
<ISO10303-11-EXPRESS>
ENTITY package_alias;
	package_name : STRING;
	attribute_name : STRING;
DERIVE
	ptr_type : STRING := SELF.name + '_Ptr';
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.owner.name, ?, true, true ) ];
	ads_code : STRING := 'subtype ' + SELF.name + ' is ' + package_name + '.' + attribute_name + ';\n' 
	+ 'subtype ' + SELF.ptr_type + ' is  ' + package_name + '.' + attribute_name + '_Ptr;\n';
	adb_code : STRING := '';
	init_value : STRING := ?;
	dependencies : LIST OF dictionary_instance := [ SELF ];
	ada_ref_ident : STRING := SELF.ptr_type;
	refed_by_pointer : BOOLEAN := true;
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageAlias',
	#superclass : 'ExChdCoreEntity',
	#instVars : [
		'attributeName',
		'packageName'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAlias class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageAlias class >> schemaDefinition [

	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageAlias class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAlias class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAlias class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdPackageAlias >> accept: aVisitor [

	^ aVisitor acceptPackageAlias: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver ptrTypeUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbInterfacesList [

	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbInterfacesListUsingContext: aContext [

	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adbInterfacesListUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: (ExChdAdaInterface new
					    adaInterfaceFromValues: (OrderedCollection new
							     add:
								     ((aReceiver ownerUsingContext: self class context)
									      nameUsingContext: self class context);
							     add: nil;
							     add: true;
							     add: true;
							     yourself);
					    yourself);
			   yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ (((((((((((('subtype ' pltPlus:
		              (aReceiver nameUsingContext: aContext)) pltPlus:
		             ' is ') pltPlus: aReceiver packageName) pltPlus: '.')
		          pltPlus: aReceiver attributeName) pltPlus: ';\n')
		        pltPlus: 'subtype ') pltPlus:
		       (aReceiver ptrTypeUsingContext: aContext)) pltPlus: ' is  ')
		     pltPlus: aReceiver packageName) pltPlus: '.') pltPlus:
		   aReceiver attributeName) pltPlus: '_Ptr;\n'


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsInterfacesList [

	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsInterfacesListUsingContext: aContext [

	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsInterfacesListUsingContext: aContext receiver: aReceiver [

	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAlias >> attributeName [

	^ attributeName


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAlias >> attributeName: aString [

	attributeName := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdPackageAlias >> attributeNameUsingContext: aContext [

	^ self attributeName


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> dependencies [

	^ self dependenciesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> dependenciesUsingContext: aContext [

	^ self dependenciesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> dependenciesUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdPackageAlias >> fastSetAttributeName: aString [

	attributeName := aString


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdPackageAlias >> fastSetPackageName: aString [

	packageName := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> fromValues: values [

	^ self packageAliasFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> initValueUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdPackageAlias >> isExChdPackageAlias [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> localFromValues: values [

	^ self packageAliasFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> localToValues: values [

	^ self packageAliasToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdPackageAlias >> packageAliasCopyTo: another [

	another fastSetPackageName: self packageName.
	another fastSetAttributeName: self attributeName


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> packageAliasFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setPackageName: valuesloc removeFirst.
	self setAttributeName: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> packageAliasToValues: values [

	values add: self packageName.
	values add: self attributeName.
	^ values


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAlias >> packageName [

	^ packageName


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAlias >> packageName: aString [

	packageName := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdPackageAlias >> packageNameUsingContext: aContext [

	^ self packageName


]

{ #category : 'platypus-generated-copying' }
ExChdPackageAlias >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdPackageAlias >> pltCopyTo: another [

	super pltCopyTo: another.
	self packageAliasCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdPackageAlias >> pltLocalCopyTo: another [

	self packageAliasCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> ptrType [

	^ self ptrTypeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> ptrTypeUsingContext: aContext [

	^ self ptrTypeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> ptrTypeUsingContext: aContext receiver: aReceiver [

	^ (aReceiver nameUsingContext: aContext) pltPlus: '_Ptr'


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageAlias >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ true


]

{ #category : 'platypus-generated-set-accessing' }
ExChdPackageAlias >> setAttributeName: aString [

	self attributeName: aString


]

{ #category : 'platypus-generated-set-accessing' }
ExChdPackageAlias >> setPackageName: aString [

	self packageName: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdPackageAlias >> stepInitialize [

	super stepInitialize.
	packageName := ''.
	attributeName := ''


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageAlias >> toValues: values [

	^ self packageAliasToValues: (super toValues: values)


]
