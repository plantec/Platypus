"
<ISO10303-11-EXPRESS>
FUNCTION all_ada_entities : LIST OF ada_entity;
	LOCAL 
		ent_list : LIST OF ada_entity := [ ];
		all_pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
	END_LOCAL;

	REPEAT no := LOINDEX ( all_pkgs ) TO HIINDEX ( all_pkgs );

		ALIAS entities FOR all_pkgs [ no].entities;
			REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
				IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( entities [ noi] ) ) THEN
					ent_list := ent_list + entities [ noi];
				END_IF;
				IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( entities [ noi] ) ) THEN
					ent_list := ent_list + entities [ noi];
				END_IF;
				IF ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( entities [ noi] ) ) THEN
					ent_list := ent_list + entities [ noi];
				END_IF;
			END_REPEAT;
		END_ALIAS;
	END_REPEAT;
	RETURN ( ent_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAllAdaEntitiesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'entList',
		'allPkgs'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaEntitiesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAllAdaEntitiesFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaEntitiesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAllAdaEntitiesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaEntitiesFunction >> allPkgs [
	^ allPkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaEntitiesFunction >> allPkgs: aListOfExChdAdaPackage [
	allPkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaEntitiesFunction >> entList [
	^ entList


]

{ #category : 'platypus-generated-accessing' }
ExChdAllAdaEntitiesFunction >> entList: aListOfExChdAdaEntity [
	entList := aListOfExChdAdaEntity
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaEntity as: OrderedCollection ]


]

{ #category : 'platypus-generated-invoking' }
ExChdAllAdaEntitiesFunction >> invoke [
	" ---------- locals assignments ----------"

	self entList: Array new.
	self
		allPkgs:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no4024 | 
			PlatypusCoreAliasStatement
				alias: ((self allPkgs pltAt: no4024) entitiesUsingContext: self class context)
				statementsBlock: [ :entities1882 | 
					PlatypusCoreRepeatStatement
						repeat: [ :noi2137 | 
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (entities1882 pltAt: noi2137);
										yourself)) includes: 'RECORD_AND_CLASS.RECORD')
								ifTrue: [ self entList: (self entList pltPlus: (entities1882 pltAt: noi2137)) ].
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (entities1882 pltAt: noi2137);
										yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
								ifTrue: [ self entList: (self entList pltPlus: (entities1882 pltAt: noi2137)) ].
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (entities1882 pltAt: noi2137);
										yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE')
								ifTrue: [ self entList: (self entList pltPlus: (entities1882 pltAt: noi2137)) ] ]
						from:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities1882;
										yourself))
						to:
							(PltHIINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities1882;
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
	^ self return: self entList


]
