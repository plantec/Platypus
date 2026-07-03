"
<ISO10303-11-EXPRESS>
FUNCTION all_ada_classes : LIST OF ada_entity;
	LOCAL 
		cls_list : LIST OF ada_class := [ ];
		all_pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
	END_LOCAL;

	REPEAT no := LOINDEX ( all_pkgs ) TO HIINDEX ( all_pkgs );
		cls_list := cls_list + package_ada_classes ( all_pkgs [ no] );
	END_REPEAT;
	RETURN ( cls_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAllAdaClassesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'clsList',
		'allPkgs'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaClassesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAllAdaClassesFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaClassesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaClassesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaClassesFunction >> allPkgs [
	^ allPkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaClassesFunction >> allPkgs: aListOfExChdAdaPackage [
	allPkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaClassesFunction >> clsList [
	^ clsList


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaClassesFunction >> clsList: aListOfExChdAdaClass [
	clsList := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : 'platypus-generated-invoking' }
ExChdAllAdaClassesFunction >> invoke [
	" ---------- locals assignments ----------"

	self clsList: Array new.
	self
		allPkgs:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1203 | 
			self
				clsList:
					(self clsList
						pltPlus:
							(ExChdPackageAdaClassesFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allPkgs pltAt: no1203);
										yourself))) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allPkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allPkgs;
						yourself)).
	^ self return: self clsList


]
