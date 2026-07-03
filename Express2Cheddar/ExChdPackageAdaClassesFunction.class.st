"
<ISO10303-11-EXPRESS>
FUNCTION package_ada_classes ( pkg : ada_package ) : LIST OF ada_class;
	LOCAL 
		cls_list : LIST OF ada_class := [ ];
	END_LOCAL;

	ALIAS entities FOR pkg.entities;

		REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
			IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( entities [ noi] ) ) THEN
				cls_list := cls_list + entities [ noi];
			END_IF;
		END_REPEAT;
	END_ALIAS;
	RETURN ( cls_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageAdaClassesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkg',
		'clsList'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAdaClassesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageAdaClassesFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAdaClassesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageAdaClassesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAdaClassesFunction >> clsList [
	^ clsList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAdaClassesFunction >> clsList: aListOfExChdAdaClass [
	clsList := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAdaClassesFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdPackageAdaClassesFunction >> invoke [
	" ---------- locals assignments ----------"

	self clsList: Array new.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: (self pkg entitiesUsingContext: self class context)
		statementsBlock: [ :entities2552 | 
			PlatypusCoreRepeatStatement
				repeat: [ :noi2680 | 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (entities2552 pltAt: noi2680);
								yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
						ifTrue: [ self clsList: (self clsList pltPlus: (entities2552 pltAt: noi2680)) ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities2552;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities2552;
								yourself)) ].
	^ self return: self clsList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAdaClassesFunction >> pkg [
	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageAdaClassesFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]
