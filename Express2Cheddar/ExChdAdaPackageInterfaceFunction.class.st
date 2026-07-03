"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_interface ( pkg : ada_package; ads : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		ads_list : LIST OF ada_interface := [ ada_interface ( 'Ada.Strings.Unbounded', ?, true, true ), ada_interface ( 'Framework_Config', ?, true, true ), ada_interface ( 'id_generators', ?, true, true ) ];
		adb_list : LIST OF ada_interface := [ ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'unbounded_strings', ?, true, true ) ];
		wul : LIST OF ada_interface;
		result : LIST OF ada_interface := [ ];
		defs : LIST OF dictionary_instance := pkg.entities + pkg.types + pkg.constants;
		pkgKey : STRING := upperize ( pkg.name );
	END_LOCAL;

	REPEAT no := LOINDEX ( pkg.interface ) TO HIINDEX ( pkg.interface );

		ALIAS curr FOR pkg.interface [ no];
			IF ( 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( curr.native_schema ) ) THEN
				ads_list := ads_list + ADA_INTERFACE ( curr.native_schema.name, ?, true, true );
			END_IF;
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( defs ) TO HIINDEX ( defs );

		ALIAS e FOR defs [ no];
			IF ( 'CHEDDAR_DOMAINS.CHEDDAR_DEFINED_TYPE' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'CHEDDAR_DOMAINS.EXPLICIT_TYPE_REFERENCE' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'CHEDDAR_CONSTANTS.ADA_CONSTANT' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'RECORD_AND_CLASS.ADA_ENTITY' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
			IF ( 'PACKAGE.GENERIC_PACKAGE_INSTANCIATION' IN TYPEOF ( e ) ) THEN
				ads_list := ads_list + e.ads_interfaces_list;
				adb_list := adb_list + e.adb_interfaces_list;
			END_IF;
		END_ALIAS;
	END_REPEAT;

	IF ads THEN
		wul := ads_list + pkg.ads_interface;
	ELSE
		wul := adb_list + pkg.adb_interface;
	END_IF;

	REPEAT no := LOINDEX ( wul ) TO HIINDEX ( wul );

		ALIAS curr FOR wul [ no];
			IF ( upperize ( curr.prefix ) <> pkgKey ) THEN
				result := result + curr;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaPackageInterfaceFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkg',
		'ads',
		'adsList',
		'adbList',
		'wul',
		'result',
		'defs',
		'pkgKey'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageInterfaceFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaPackageInterfaceFunction class >> schemaDefinition [

	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageInterfaceFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageInterfaceFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> adbList [

	^ adbList


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> adbList: aListOfExChdAdaInterface1 [

	adbList := aListOfExChdAdaInterface1
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [
		           aListOfExChdAdaInterface1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> ads [

	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> ads: aBoolean [

	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> adsList [

	^ adsList


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> adsList: aListOfExChdAdaInterface [

	adsList := aListOfExChdAdaInterface
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [
		           aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> defs [

	^ defs


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> defs: aListOfExChdDictionaryInstance [

	defs := aListOfExChdDictionaryInstance
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [
		        aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> fromValues: values [

	self pkg: (values at: 1).
	self ads: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaPackageInterfaceFunction >> invoke [
	" ---------- locals assignments ----------"

	self adsList: (PlatypusCoreAggregateInitializer collectionFrom:
			 (OrderedCollection new
				  add: (ExChdAdaInterface new
						   adaInterfaceFromValues: (OrderedCollection new
								    add: 'Ada.Strings.Unbounded';
								    add: nil;
								    add: true;
								    add: true;
								    yourself);
						   yourself);
				  add: (ExChdAdaInterface new
						   adaInterfaceFromValues: (OrderedCollection new
								    add: 'Framework_Config';
								    add: nil;
								    add: true;
								    add: true;
								    yourself);
						   yourself);
				  add: (ExChdAdaInterface new
						   adaInterfaceFromValues: (OrderedCollection new
								    add: 'id_generators';
								    add: nil;
								    add: true;
								    add: true;
								    yourself);
						   yourself);
				  yourself)).
	self adbList: (PlatypusCoreAggregateInitializer collectionFrom:
			 (OrderedCollection new
				  add: (ExChdAdaInterface new
						   adaInterfaceFromValues: (OrderedCollection new
								    add: 'Text_io';
								    add: nil;
								    add: true;
								    add: true;
								    yourself);
						   yourself);
				  add: (ExChdAdaInterface new
						   adaInterfaceFromValues: (OrderedCollection new
								    add: 'unbounded_strings';
								    add: nil;
								    add: true;
								    add: true;
								    yourself);
						   yourself);
				  yourself)).
	self result: Array new.
	self defs:
		(((self pkg entitiesUsingContext: self class context) pltPlus:
			  (self pkg typesUsingContext: self class context)) pltPlus:
			 (self pkg constantsUsingContext: self class context)).
	self pkgKey:
		(PTsUpperizeFunction invokeFromValues: (OrderedCollection new
				  add: (self pkg nameUsingContext: self class context);
				  yourself)). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no494071 |
				PlatypusCoreAliasStatement
					alias:
					((self pkg interfaceUsingContext: self class context) pltAt:
						 no494071)
					statementsBlock: [ :curr3334185 |
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add:
										   (curr3334185 nativeSchemaUsingContext: self class context);
									   yourself)) includes: 'PACKAGE.ADA_PACKAGE') ifTrue: [
									self adsList: (self adsList pltPlus: (ExChdAdaInterface new
												  adaInterfaceFromValues: (OrderedCollection new
														   add:
															   ((curr3334185 nativeSchemaUsingContext:
																	     self class context) nameUsingContext:
																	    self class context);
														   add: nil;
														   add: true;
														   add: true;
														   yourself);
												  yourself)) ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: (self pkg interfaceUsingContext: self class context);
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: (self pkg interfaceUsingContext: self class context);
					  yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no304819 |
				PlatypusCoreAliasStatement
					alias: (self defs pltAt: no304819)
					statementsBlock: [ :e1854051 |
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes:
								 'CHEDDAR_DOMAINS.CHEDDAR_DEFINED_TYPE') ifTrue: [
									self adsList: (self adsList pltPlus:
											 (e1854051 adsInterfacesListUsingContext:
												  self class context)).
									self adbList: (self adbList pltPlus:
											 (e1854051 adbInterfacesListUsingContext:
												  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes:
								 'CHEDDAR_DOMAINS.EXPLICIT_TYPE_REFERENCE') ifTrue: [
									self adsList: (self adsList pltPlus:
											 (e1854051 adsInterfacesListUsingContext:
												  self class context)).
									self adbList: (self adbList pltPlus:
											 (e1854051 adbInterfacesListUsingContext:
												  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes: 'CHEDDAR_CONSTANTS.ADA_CONSTANT')
								ifTrue: [
										self adsList: (self adsList pltPlus:
												 (e1854051 adsInterfacesListUsingContext:
													  self class context)).
										self adbList: (self adbList pltPlus:
												 (e1854051 adbInterfacesListUsingContext:
													  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes: 'RECORD_AND_CLASS.ADA_ENTITY')
								ifTrue: [
										self adsList: (self adsList pltPlus:
												 (e1854051 adsInterfacesListUsingContext:
													  self class context)).
										self adbList: (self adbList pltPlus:
												 (e1854051 adbInterfacesListUsingContext:
													  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
								ifTrue: [
										self adsList: (self adsList pltPlus:
												 (e1854051 adsInterfacesListUsingContext:
													  self class context)).
										self adbList: (self adbList pltPlus:
												 (e1854051 adbInterfacesListUsingContext:
													  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes:
								 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE') ifTrue: [
									self adsList: (self adsList pltPlus:
											 (e1854051 adsInterfacesListUsingContext:
												  self class context)).
									self adbList: (self adbList pltPlus:
											 (e1854051 adbInterfacesListUsingContext:
												  self class context)) ].
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: e1854051;
									   yourself)) includes:
								 'PACKAGE.GENERIC_PACKAGE_INSTANCIATION') ifTrue: [
									self adsList: (self adsList pltPlus:
											 (e1854051 adsInterfacesListUsingContext:
												  self class context)).
									self adbList: (self adbList pltPlus:
											 (e1854051 adbInterfacesListUsingContext:
												  self class context)) ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self defs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self defs;
					  yourself)).
	self ads
		ifTrue: [
				self wul: (self adsList pltPlus:
						 (self pkg adsInterfaceUsingContext: self class context)) ]
		ifFalse: [
				self wul: (self adbList pltPlus:
						 (self pkg adbInterfaceUsingContext: self class context)) ].
	PlatypusCoreRepeatStatement
		repeat: [ :no3354087 |
				PlatypusCoreAliasStatement
					alias: (self wul pltAt: no3354087)
					statementsBlock: [ :curr700751 |
							(PTsUpperizeFunction invokeFromValues: (OrderedCollection new
									  add: (curr700751 prefixUsingContext: self class context);
									  yourself)) ~= self pkgKey ifTrue: [
								self result: (self result pltPlus: curr700751) ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self wul;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self wul;
					  yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> pkg [

	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> pkg: aExChdAdaPackage [

	pkg := aExChdAdaPackage


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> pkg: aExChdAdaPackage ads: aBoolean [

	self pkg: aExChdAdaPackage.
	self ads: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> pkgKey [

	^ pkgKey


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> pkgKey: aString [

	pkgKey := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> result: aListOfExChdAdaInterface3 [

	result := aListOfExChdAdaInterface3
		          ifNil: [ OrderedCollection new ]
		          ifNotNil: [
		          aListOfExChdAdaInterface3 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> wul [

	^ wul


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageInterfaceFunction >> wul: aListOfExChdAdaInterface2 [

	wul := aListOfExChdAdaInterface2
		       ifNil: [ OrderedCollection new ]
		       ifNotNil: [ aListOfExChdAdaInterface2 as: OrderedCollection ]


]
