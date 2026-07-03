"
<ISO10303-11-EXPRESS>
FUNCTION package_records ( pkg : ada_package ) : LIST OF record;
	LOCAL 
		rec_list : LIST OF record := [ ];
	END_LOCAL;

	ALIAS entities FOR pkg.entities;

		REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
			IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( entities [ noi] ) ) THEN
				rec_list := rec_list + entities [ noi];
			END_IF;
		END_REPEAT;
	END_ALIAS;
	RETURN ( rec_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageRecordsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkg',
		'recList'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageRecordsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageRecordsFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageRecordsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageRecordsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageRecordsFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdPackageRecordsFunction >> invoke [
	" ---------- locals assignments ----------"

	self recList: Array new.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: (self pkg entitiesUsingContext: self class context)
		statementsBlock: [ :entities1220 | 
			PlatypusCoreRepeatStatement
				repeat: [ :noi1345 | 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (entities1220 pltAt: noi1345);
								yourself)) includes: 'RECORD_AND_CLASS.RECORD')
						ifTrue: [ self recList: (self recList pltPlus: (entities1220 pltAt: noi1345)) ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities1220;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: entities1220;
								yourself)) ].
	^ self return: self recList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageRecordsFunction >> pkg [
	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageRecordsFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageRecordsFunction >> recList [
	^ recList


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageRecordsFunction >> recList: aListOfExChdRecord [
	recList := aListOfExChdRecord ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfExChdRecord as: OrderedCollection ]


]
