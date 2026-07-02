"
<ISO10303-11-EXPRESS>
ENTITY generic_package_instanciation 
	SUBTYPE OF ( ada_entity );
	generic_package_name : STRING;
	parameters : LIST OF STRING;
	interfaces : LIST OF ada_interface;
	before_entities : BOOLEAN;
DERIVE
	aliases : LIST OF cheddar_defined_type := generic_package_aliases ( SELF );
	ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.generic_package_name, ?, true, false ), ada_interface ( SELF.owner.name, SELF.name, false, true ), ada_interface ( 'Unchecked_Deallocation', ?, true, false ) ] + interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ads_code : STRING := 'package ' + ada_ident + ' is new ' + generic_package_name + '(' + StringAggregateConcatSeparatedBy ( parameters, ', ' ) + ');\n' 
	+ 'use ' + ada_ident + ';\n' 
	+ generic_package_instanciation_attributes_ads_code ( SELF );
	adb_code : STRING := '';
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdGenericPackageInstanciation,
	#superclass : #ExChdAdaEntity,
	#instVars : [
		'genericPackageName',
		'beforeEntities',
		'parameters',
		'interfaces'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciation class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdGenericPackageInstanciation class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdGenericPackageInstanciation class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciation class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciation class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdGenericPackageInstanciation >> accept: aVisitor [
	^ aVisitor acceptGenericPackageInstanciation: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ((((((((('package ' pltPlus: (aReceiver adaIdentUsingContext: aContext)) pltPlus: ' is new ')
		pltPlus: aReceiver genericPackageName) pltPlus: '(')
		pltPlus:
			(PTsStringAggregateConcatSeparatedByFunction
				invokeFromValues:
					(OrderedCollection new
						add: aReceiver parameters;
						add: ', ';
						yourself))) pltPlus: ');\n') pltPlus: 'use ') pltPlus: (aReceiver adaIdentUsingContext: aContext)) pltPlus: ';\n')
		pltPlus:
			(ExChdGenericPackageInstanciationAttributesAdsCodeFunction
				invokeFromValues:
					(OrderedCollection new
						add: aReceiver;
						yourself))


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ (PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: (aReceiver genericPackageNameUsingContext: self class context);
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: ((aReceiver ownerUsingContext: self class context) nameUsingContext: self class context);
												add: (aReceiver nameUsingContext: self class context);
												add: false;
												add: true;
												yourself);
								yourself);
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Unchecked_Deallocation';
												add: nil;
												add: true;
												add: false;
												yourself);
								yourself);
				yourself)) pltPlus: aReceiver interfaces


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsPreDef [
	^ self adsPreDefUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsPreDefUsingContext: aContext [
	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> adsPreDefUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> aliases [
	^ self aliasesUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> aliasesUsingContext: aContext [
	^ self aliasesUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdGenericPackageInstanciation >> aliasesUsingContext: aContext receiver: aReceiver [
	^ ExChdGenericPackageAliasesFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> beforeEntities [
	^ beforeEntities


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> beforeEntities: aBoolean [
	beforeEntities := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdGenericPackageInstanciation >> beforeEntitiesUsingContext: aContext [
	^ self beforeEntities


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdGenericPackageInstanciation >> fastSetBeforeEntities: aBoolean [
	beforeEntities := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdGenericPackageInstanciation >> fastSetGenericPackageName: aString [
	genericPackageName := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdGenericPackageInstanciation >> fastSetInterfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdGenericPackageInstanciation >> fastSetParameters: aListOfString [
	parameters := aListOfString


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> fromValues: values [
	^ self genericPackageInstanciationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
ExChdGenericPackageInstanciation >> genericPackageInstanciationCopyTo: another [
	another fastSetGenericPackageName: self genericPackageName.
	another fastSetParameters: self parameters.
	another fastSetInterfaces: self interfaces.
	another fastSetBeforeEntities: self beforeEntities


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> genericPackageInstanciationFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setGenericPackageName: valuesloc removeFirst.
	self setParameters: valuesloc removeFirst.
	self setInterfaces: valuesloc removeFirst.
	self setBeforeEntities: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> genericPackageInstanciationToValues: values [
	values add: self genericPackageName.
	values add: self parameters.
	values add: self interfaces.
	values add: self beforeEntities.
	^ values


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> genericPackageName [
	^ genericPackageName


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> genericPackageName: aString [
	genericPackageName := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdGenericPackageInstanciation >> genericPackageNameUsingContext: aContext [
	^ self genericPackageName


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> interfaces [
	^ interfaces


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> interfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdGenericPackageInstanciation >> interfacesUsingContext: aContext [
	^ self interfaces


]

{ #category : #'platypus-generated-classifying' }
ExChdGenericPackageInstanciation >> isExChdGenericPackageInstanciation [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> localFromValues: values [
	^ self genericPackageInstanciationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> localToValues: values [
	^ self genericPackageInstanciationToValues: values


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> parameters [
	^ parameters


]

{ #category : #'platypus-generated-accessing' }
ExChdGenericPackageInstanciation >> parameters: aListOfString [
	parameters := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdGenericPackageInstanciation >> parametersUsingContext: aContext [
	^ self parameters


]

{ #category : #'platypus-generated-copying' }
ExChdGenericPackageInstanciation >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdGenericPackageInstanciation >> pltCopyTo: another [
	super pltCopyTo: another.
	self genericPackageInstanciationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdGenericPackageInstanciation >> pltLocalCopyTo: another [
	self genericPackageInstanciationCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
ExChdGenericPackageInstanciation >> setBeforeEntities: aBoolean [
	self beforeEntities: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
ExChdGenericPackageInstanciation >> setGenericPackageName: aString [
	self genericPackageName: aString


]

{ #category : #'platypus-generated-set-accessing' }
ExChdGenericPackageInstanciation >> setInterfaces: aListOfExChdAdaInterface [
	self interfaces: aListOfExChdAdaInterface


]

{ #category : #'platypus-generated-set-accessing' }
ExChdGenericPackageInstanciation >> setParameters: aListOfString [
	self parameters: aListOfString


]

{ #category : #'platypus-generated-initializing' }
ExChdGenericPackageInstanciation >> stepInitialize [
	super stepInitialize.
	genericPackageName := ''.
	parameters := OrderedCollection new.
	interfaces := OrderedCollection new.
	beforeEntities := false


]

{ #category : #'platypus-generated-group-accessing' }
ExChdGenericPackageInstanciation >> toValues: values [
	^ self genericPackageInstanciationToValues: (super toValues: values)


]
