"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_ads_code ( pkg : ada_package ) : STRING;
	LOCAL 
		result : STRING;
		classes : LIST OF ada_class := QUERY ( e <* pkg.entities | 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) );
		const_list : LIST OF ada_constant := QUERY ( e <* pkg.constants | 'CHEDDAR_CONSTANTS.ADA_CONSTANT' IN TYPEOF ( e ) );
		private_classes : LIST OF ada_class := QUERY ( e <* classes | e.is_private );
		constrained_arrays : LIST OF defined_type;
		entities : LIST OF dictionary_instance := pkg.entities;
	END_LOCAL;
	constrained_arrays := QUERY ( t <* pkg.types | 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE' IN TYPEOF ( t ) );
	result := ada_package_concepts_list_code ( pkg, ( ( pkg.types - constrained_arrays ) + entities ) + constrained_arrays, true );

	REPEAT no := LOINDEX ( const_list ) TO HIINDEX ( const_list );
		result := result + const_list [ no].ads_code + '\n';
	END_REPEAT;

	IF SIZEOF ( private_classes ) > 0 THEN
		result := result + '\n\nprivate\n \n';

		REPEAT no := LOINDEX ( private_classes ) TO HIINDEX ( private_classes );
			ALIAS supref FOR private_classes [ no].supertypes [ 1 ].ref;
				result := result + '\ntype ' + private_classes [ no].name + ' is new ' + supref.ada_ident + ' with\n' 
				+ ada_class_attributes_ads_code ( private_classes [ no] );
			END_ALIAS;
		END_REPEAT;
	END_IF;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPackageAdsCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'pkg',
		'result',
		'classes',
		'constList',
		'privateClasses',
		'constrainedArrays',
		'entities',
		'genericPackages',
		'headGenericPackages',
		'tailGenericPackages'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPackageAdsCodeFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> classes [
	^ classes


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> classes: aListOfExChdAdaClass [
	classes := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> constList [
	^ constList


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> constList: aListOfExChdAdaConstant [
	constList := aListOfExChdAdaConstant
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaConstant as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> constrainedArrays [
	^ constrainedArrays


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> constrainedArrays: aListOfExChdDefinedType [
	constrainedArrays := aListOfExChdDefinedType
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDefinedType as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> entities [
	^ entities


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> entities: aListOfExChdDictionaryInstance [
	entities := aListOfExChdDictionaryInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> genericPackages [

	^ genericPackages


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> genericPackages: aListOfExChdGenericPackageInstanciation [
	genericPackages := aListOfExChdGenericPackageInstanciation
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdGenericPackageInstanciation as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> headGenericPackages [

	^ headGenericPackages


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> headGenericPackages: aListOfExChdGenericPackageInstanciation1 [
	headGenericPackages := aListOfExChdGenericPackageInstanciation1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdGenericPackageInstanciation1 as: OrderedCollection ]


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaPackageAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		classes:
			((self pkg entitiesUsingContext: self class context)
				select: [ :e2800 | 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: e2800;
								yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS' ]).
	self
		constList:
			((self pkg constantsUsingContext: self class context)
				select: [ :e3840 | 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: e3840;
								yourself)) includes: 'CHEDDAR_CONSTANTS.ADA_CONSTANT' ]).
	self privateClasses: (self classes select: [ :e595 | e595 isPrivateUsingContext: self class context ]).
	self entities: (self pkg entitiesUsingContext: self class context).	" ---------- statements ----------"
	self
		constrainedArrays:
			((self pkg typesUsingContext: self class context)
				select: [ :t590 | 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: t590;
								yourself)) includes: 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE' ]).
	self
		result:
			(ExChdAdaPackageConceptsListCodeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkg;
						add:
								((((self pkg typesUsingContext: self class context) pltMinus: self constrainedArrays) pltPlus: self entities)
										pltPlus: self constrainedArrays);
						add: true;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no2111 | 
			self
				result:
					((self result pltPlus: ((self constList pltAt: no2111) adsCodeUsingContext: self class context)) pltPlus: '\n') ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self constList;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self constList;
						yourself)).
	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self privateClasses;
				yourself)) > 0
		ifTrue: [ 
			self result: (self result pltPlus: '\n\nprivate\n \n').
			PlatypusCoreRepeatStatement
				repeat: [ :no541 | 
					PlatypusCoreAliasStatement
						alias:
							((((self privateClasses pltAt: no541) supertypesUsingContext: self class context) pltAt: 1)
								refUsingContext: self class context)
						statementsBlock: [ :supref912 | 
							self
								result:
									((((((self result pltPlus: '\ntype ') pltPlus: ((self privateClasses pltAt: no541) nameUsingContext: self class context))
										pltPlus: ' is new ') pltPlus: (supref912 adaIdentUsingContext: self class context)) pltPlus: ' with\n')
										pltPlus:
											(ExChdAdaClassAttributesAdsCodeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (self privateClasses pltAt: no541);
														yourself))) ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self privateClasses;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self privateClasses;
								yourself)) ].
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> pkg [
	^ pkg


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> privateClasses [
	^ privateClasses


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> privateClasses: aListOfExChdAdaClass1 [
	privateClasses := aListOfExChdAdaClass1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass1 as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> result: aString [
	result := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> tailGenericPackages [

	^ tailGenericPackages


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdsCodeFunction >> tailGenericPackages: aListOfExChdGenericPackageInstanciation2 [
	tailGenericPackages := aListOfExChdGenericPackageInstanciation2
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdGenericPackageInstanciation2 as: OrderedCollection ]


]
