"
<ISO10303-11-EXPRESS>
FUNCTION all_packages_code_into ( ads : BOOLEAN; dir : STRING; targetName : STRING ) : STRING;
	LOCAL 
		code : STRING := '';
		body : STRING;
		pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
		targetPath : STRING;
	END_LOCAL;

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );

		IF ads THEN
			body := pkgs [ no].ads_code;
		ELSE
			body := pkgs [ no].adb_code;
		END_IF;

		IF ( body > '' ) THEN
			code := code + body + '\n\n';
		END_IF;
	END_REPEAT;

	IF ads THEN
		code := code + xml_architecture_io_ads_package_code ( );
	ELSE
		code := code + xml_architecture_io_adb_package_code ( );
	END_IF;

	IF EXISTS ( dir ) THEN
		targetPath := dir;
	ELSE
		targetPath := '.';
	END_IF;

	IF EXISTS ( targetName ) THEN
		targetPath := targetPath + '/' + targetName;
	ELSE
		targetPath := targetPath + '/' + 'Platypus2Cheddar';
	END_IF;

	IF ads THEN
		WriteFile ( targetPath + '.ads', code );
	ELSE
		WriteFile ( targetPath + '.adb', code );
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAllPackagesCodeIntoFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'ads',
		'dir',
		'targetName',
		'code',
		'body',
		'pkgs',
		'targetPath'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeIntoFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAllPackagesCodeIntoFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeIntoFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAllPackagesCodeIntoFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> ads [
	^ ads


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> ads: aBoolean dir: aString targetName: aString1 [
	self ads: aBoolean.
	self dir: aString.
	self targetName: aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> body [
	^ body


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> body: aString1 [
	body := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> dir [
	^ dir


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> dir: aString [
	dir := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> fromValues: values [
	self ads: (values at: 1).
	self dir: (values at: 2).
	self targetName: (values at: 3)


]

{ #category : #'platypus-generated-invoking' }
ExChdAllPackagesCodeIntoFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self
		pkgs:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1700 | 
			self ads
				ifTrue: [ self body: ((self pkgs pltAt: no1700) adsCodeUsingContext: self class context) ]
				ifFalse: [ self body: ((self pkgs pltAt: no1700) adbCodeUsingContext: self class context) ].
			self body > ''
				ifTrue: [ self code: ((self code pltPlus: self body) pltPlus: '\n\n') ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself)).
	self ads
		ifTrue: [ self code: (self code pltPlus: ExChdXmlArchitectureIoAdsPackageCodeFunction invoke) ]
		ifFalse: [ self code: (self code pltPlus: ExChdXmlArchitectureIoAdbPackageCodeFunction invoke) ].
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: self dir;
				yourself))
		ifTrue: [ self targetPath: self dir ]
		ifFalse: [ self targetPath: '.' ].
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: self targetName;
				yourself))
		ifTrue: [ self targetPath: ((self targetPath pltPlus: '/') pltPlus: self targetName) ]
		ifFalse: [ self targetPath: ((self targetPath pltPlus: '/') pltPlus: 'Platypus2Cheddar') ].
	self ads
		ifTrue: [ 
			PTsWriteFileProcedure
				invokeFromValues:
					(OrderedCollection new
						add: (self targetPath pltPlus: '.ads');
						add: self code;
						yourself) ]
		ifFalse: [ 
			PTsWriteFileProcedure
				invokeFromValues:
					(OrderedCollection new
						add: (self targetPath pltPlus: '.adb');
						add: self code;
						yourself) ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> pkgs [
	^ pkgs


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> pkgs: aListOfExChdAdaPackage [
	pkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> targetName [
	^ targetName


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> targetName: aString1 [
	targetName := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> targetPath [
	^ targetPath


]

{ #category : #'platypus-generated-accessing' }
ExChdAllPackagesCodeIntoFunction >> targetPath: aString2 [
	targetPath := aString2


]
