"
<ISO10303-11-EXPRESS>
FUNCTION package_discriminated_types ( pkg : ada_package ) : LIST OF discriminated_type;
	LOCAL 
		dt_list : LIST OF discriminated_type := [ ];
	END_LOCAL;

	ALIAS entities FOR pkg.entities;

		REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
			IF ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( entities [ noi] ) ) THEN
				dt_list := dt_list + entities [ noi];
			END_IF;
		END_REPEAT;
	END_ALIAS;
	RETURN ( dt_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageDiscriminatedTypesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkg',
		'dtList'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDiscriminatedTypesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageDiscriminatedTypesFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDiscriminatedTypesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDiscriminatedTypesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDiscriminatedTypesFunction >> dtList [
	^ dtList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDiscriminatedTypesFunction >> dtList: aListOfExChdDiscriminatedType [
	dtList := aListOfExChdDiscriminatedType
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDiscriminatedType as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDiscriminatedTypesFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdPackageDiscriminatedTypesFunction >> invoke [
	" ---------- locals assignments ----------"

	self dtList: Array new.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: (self pkg entitiesUsingContext: self class context)
		statementsBlock: [ :entities77 | 
			PlatypusCoreRepeatStatement
				repeat: [ :noi202 | 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (entities77 pltAt: noi202);
								yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE')
						ifTrue: [ self dtList: (self dtList pltPlus: (entities77 pltAt: noi202)) ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities77;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities77;
								yourself)) ].
	^ self return: self dtList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDiscriminatedTypesFunction >> pkg [
	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDiscriminatedTypesFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]
