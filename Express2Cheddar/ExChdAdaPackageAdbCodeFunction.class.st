"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_adb_code ( pkg : ada_package ) : STRING;
	LOCAL 
		result : STRING;
	END_LOCAL;
	result := ada_package_concepts_list_code ( pkg, pkg.types, false ) + ada_package_concepts_list_code ( pkg, pkg.entities, false );
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPackageAdbCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'pkg',
		'result'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdbCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPackageAdbCodeFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdbCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageAdbCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdbCodeFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaPackageAdbCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		result:
			((ExChdAdaPackageConceptsListCodeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkg;
						add: (self pkg typesUsingContext: self class context);
						add: false;
						yourself))
				pltPlus:
					(ExChdAdaPackageConceptsListCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self pkg;
								add: (self pkg entitiesUsingContext: self class context);
								add: false;
								yourself))).
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdbCodeFunction >> pkg [
	^ pkg


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdbCodeFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdbCodeFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageAdbCodeFunction >> result: aString [
	result := aString


]
