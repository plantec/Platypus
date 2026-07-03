"
<ISO10303-11-EXPRESS>
PROCEDURE generate_all_into ( dir : STRING );
	prepare_root_ada_classes;
	all_packages_code_into ( true, dir, 'Platypus2Cheddar' );
	all_packages_code_into ( false, dir, 'Platypus2Cheddar' );
	dtds_into ( dir );
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGenerateAllIntoProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'dir'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllIntoProcedure class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGenerateAllIntoProcedure class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllIntoProcedure class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllIntoProcedure class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdGenerateAllIntoProcedure >> dir [

	^ dir


]

{ #category : 'platypus-generated-accessing' }
ExChdGenerateAllIntoProcedure >> dir: aString [

	dir := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdGenerateAllIntoProcedure >> fromValues: values [

	self dir: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdGenerateAllIntoProcedure >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------"

	ExChdPrepareRootAdaClassesProcedure invoke.
	ExChdAllPackagesCodeIntoFunction invokeFromValues:
		(OrderedCollection new
			 add: true;
			 add: self dir;
			 add: 'Platypus2Cheddar';
			 yourself).
	ExChdAllPackagesCodeIntoFunction invokeFromValues:
		(OrderedCollection new
			 add: false;
			 add: self dir;
			 add: 'Platypus2Cheddar';
			 yourself).
	ExChdDtdsIntoProcedure invokeFromValues: (OrderedCollection new
			 add: self dir;
			 yourself)


]
