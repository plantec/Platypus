"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_named ( name : STRING ) : ada_package;
	LOCAL 
		packages : SET OF ada_package := all_ada_packages ( );
		key : STRING := Lowerize ( name );
	END_LOCAL;

	REPEAT no := LOINDEX ( packages ) TO HIINDEX ( packages );

		ALIAS curr FOR packages [ no];
			IF ( Lowerize ( curr.name ) = key ) THEN
				RETURN ( curr );
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( ? );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPackageNamedFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'name',
		'packages',
		'key'
	],
	#category : #'Express2Cheddar-Express2cheddarFacadeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageNamedFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPackageNamedFunction class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageNamedFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageNamedFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> fromValues: values [
	self name: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaPackageNamedFunction >> invoke [
	" ---------- locals assignments ----------"

	self packages: ExChdAllAdaPackagesFunction invoke.
	self
		key:
			(PTsLowerizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self name;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2095 | 
			PlatypusCoreAliasStatement
				alias: (self packages pltAt: no2095)
				statementsBlock: [ :curr3205 | 
					(PTsLowerizeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (curr3205 nameUsingContext: self class context);
								yourself)) = self key
						ifTrue: [ ^ self return: curr3205 ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self packages;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self packages;
						yourself)).
	^ self return: nil


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> key [
	^ key


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> key: aString [
	key := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> name [
	^ name


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> name: aString [
	name := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> packages [
	^ packages


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageNamedFunction >> packages: aSetOfExChdAdaPackage [
	packages := aSetOfExChdAdaPackage ifNil: [ Set new ] ifNotNil: [ aSetOfExChdAdaPackage as: Set ]


]
