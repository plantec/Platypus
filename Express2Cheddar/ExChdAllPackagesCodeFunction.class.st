"
<ISO10303-11-EXPRESS>
FUNCTION all_packages_code ( ads : BOOLEAN ) : STRING;
	RETURN ( all_packages_code_into ( ads, ?, ? ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAllPackagesCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'ads'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAllPackagesCodeFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeFunction >> ads [
	^ ads


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeFunction >> fromValues: values [
	self ads: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAllPackagesCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(ExChdAllPackagesCodeIntoFunction
				invokeFromValues:
					(OrderedCollection new
						add: self ads;
						add: nil;
						add: nil;
						yourself))


]
