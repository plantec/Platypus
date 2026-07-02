"
<ISO10303-11-EXPRESS>
FUNCTION all_ada_discriminated_types : LIST OF ada_entity;
	LOCAL 
		dt_list : LIST OF discriminated_type := [ ];
		all_pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
	END_LOCAL;

	REPEAT no := LOINDEX ( all_pkgs ) TO HIINDEX ( all_pkgs );

		ALIAS entities FOR all_pkgs [ no].entities;
			REPEAT noi := LOINDEX ( entities ) TO HIINDEX ( entities );
				IF ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( entities [ noi] ) ) THEN
					dt_list := dt_list + entities [ noi];
				END_IF;
			END_REPEAT;
		END_ALIAS;
	END_REPEAT;
	RETURN ( dt_list );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAllAdaDiscriminatedTypesFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'dtList',
		'allPkgs'
	],
	#category : #'Express2Cheddar-Express2cheddarFacadeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaDiscriminatedTypesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAllAdaDiscriminatedTypesFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaDiscriminatedTypesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllAdaDiscriminatedTypesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaDiscriminatedTypesFunction >> allPkgs [
	^ allPkgs


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaDiscriminatedTypesFunction >> allPkgs: aListOfExChdAdaPackage [
	allPkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaDiscriminatedTypesFunction >> dtList [
	^ dtList


]

{ #category : #'platypus-generated-accessing' }
ExChdAllAdaDiscriminatedTypesFunction >> dtList: aListOfExChdDiscriminatedType [
	dtList := aListOfExChdDiscriminatedType
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDiscriminatedType as: OrderedCollection ]


]

{ #category : #'platypus-generated-invoking' }
ExChdAllAdaDiscriminatedTypesFunction >> invoke [
	" ---------- locals assignments ----------"

	self dtList: Array new.
	self
		allPkgs:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no180 | 
			PlatypusCoreAliasStatement
				alias: ((self allPkgs pltAt: no180) entitiesUsingContext: self class context)
				statementsBlock: [ :entities2134 | 
					PlatypusCoreRepeatStatement
						repeat: [ :noi2389 | 
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (entities2134 pltAt: noi2389);
										yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE')
								ifTrue: [ self dtList: (self dtList pltPlus: (entities2134 pltAt: noi2389)) ] ]
						from:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities2134;
										yourself))
						to:
							(PltHIINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: entities2134;
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
	^ self return: self dtList


]
