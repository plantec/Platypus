"
<ISO10303-11-EXPRESS>
FUNCTION generic_package_instanciation_attributes_ads_code ( e : generic_package_instanciation ) : STRING;
	LOCAL 
		result : STRING := '';
		aliases : LIST OF cheddar_defined_type := e.aliases;
	END_LOCAL;

	REPEAT no := LOINDEX ( aliases ) TO HIINDEX ( aliases );

		ALIAS attr FOR e.aliases [ no];
			result := result + attr.ads_code;
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGenericPackageInstanciationAttributesAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'result',
		'aliases'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction class >> schemaDefinition [

	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> aliases [

	^ aliases


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> aliases: aListOfExChdCheddarDefinedType [

	aliases := aListOfExChdCheddarDefinedType
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [
		           aListOfExChdCheddarDefinedType as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> e [

	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> e: aExChdGenericPackageInstanciation [

	e := aExChdGenericPackageInstanciation


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> fromValues: values [

	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: ''.
	self aliases: (self e aliasesUsingContext: self class context). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2669393 |
				PlatypusCoreAliasStatement
					alias:
					((self e aliasesUsingContext: self class context) pltAt:
						 no2669393)
					statementsBlock: [ :attr2223071 |
							self result: (self result pltPlus:
									 (attr2223071 adsCodeUsingContext: self class context)) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self aliases;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self aliases;
					  yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageInstanciationAttributesAdsCodeFunction >> result: aString [

	result := aString


]
