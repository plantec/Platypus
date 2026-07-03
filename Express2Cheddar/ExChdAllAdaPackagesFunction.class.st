"
<ISO10303-11-EXPRESS>
FUNCTION all_ada_packages : SET OF ada_package;
	LOCAL 
		insts : SET OF GENERIC := allModelInstances ( );
	END_LOCAL;
	RETURN ( QUERY ( i <* insts | 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( i ) ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAllAdaPackagesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'insts'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaPackagesFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAllAdaPackagesFunction class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaPackagesFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaPackagesFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaPackagesFunction >> insts [

	^ insts


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaPackagesFunction >> insts: aSetOfObject [

	insts := aSetOfObject
		         ifNil: [ Set new ]
		         ifNotNil: [ aSetOfObject as: Set ]


]

{ #category : 'platypus-generated-invoking' }
ExChdAllAdaPackagesFunction >> invoke [
	" ---------- locals assignments ----------"

	self insts: PTsAllModelInstancesFunction invoke. " ---------- statements ----------"
	^ self return: (self insts select: [ :i487031 |
				   (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
						     add: i487031;
						     yourself)) includes: 'PACKAGE.ADA_PACKAGE' ])


]
