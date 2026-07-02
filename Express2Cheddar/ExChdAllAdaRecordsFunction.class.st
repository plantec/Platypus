"
<ISO10303-11-EXPRESS>
FUNCTION all_ada_records : LIST OF ada_entity;
	LOCAL 
		cls_list : LIST OF ada_class := [ ];
		all_pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
	END_LOCAL;

	REPEAT no := LOINDEX ( all_pkgs ) TO HIINDEX ( all_pkgs );

		ALIAS entities FOR all_pkgs [ no].entities;
			REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
				IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( entities [ noi] ) ) THEN
					cls_list := cls_list + entities [ noi];
				END_IF;
			END_REPEAT;
		END_ALIAS;
	END_REPEAT;
	RETURN ( cls_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAllAdaRecordsFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'clsList',
		'allPkgs'
	],
	#category : #'Express2Cheddar-Express2cheddarFacadeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaRecordsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAllAdaRecordsFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaRecordsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaRecordsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaRecordsFunction >> allPkgs [
	^ allPkgs


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaRecordsFunction >> allPkgs: aListOfExChdAdaPackage [
	allPkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaRecordsFunction >> clsList [
	^ clsList


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaRecordsFunction >> clsList: aListOfExChdAdaClass [
	clsList := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : #'platypus-generated-invoking' }
ExChdAllAdaRecordsFunction >> invoke [
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
		repeat: [ :no3386 | 
			PlatypusCoreAliasStatement
				alias: ((self allPkgs pltAt: no3386) entitiesUsingContext: self class context)
				statementsBlock: [ :entities1244 | 
					PlatypusCoreRepeatStatement
						repeat: [ :noi1502 | 
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (entities1244 pltAt: noi1502);
										yourself)) includes: 'RECORD_AND_CLASS.RECORD')
								ifTrue: [ self clsList: (self clsList pltPlus: (entities1244 pltAt: noi1502)) ] ]
						from:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities1244;
										yourself))
						to:
							(PltHIINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities1244;
										yourself)) ] ]
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
