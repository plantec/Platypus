"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_concepts_list_code ( p : ada_package; concepts : LIST OF dictionary_instance; ads : BOOLEAN ) : STRING;
	LOCAL 
		result : STRING := '';
		code : STRING := '';
		tmp : STRING;
	END_LOCAL;

	IF ads THEN

		REPEAT no := LOINDEX ( concepts ) TO HIINDEX ( concepts );
			ALIAS c FOR concepts [ no];
				IF is_of_generated_concept_kind ( c ) THEN
					tmp := c.ads_pre_def;
					IF ( tmp > '' ) THEN
						code := code + tmp + '\n';
					END_IF;
				END_IF;
			END_ALIAS;
		END_REPEAT;
	END_IF;

	IF ( code > '' ) THEN
		result := code + '\n\n';
	END_IF;

	REPEAT no := LOINDEX ( concepts ) TO HIINDEX ( concepts );

		ALIAS c FOR concepts [ no];
			IF is_of_generated_concept_kind ( c ) THEN
				IF ads THEN
					code := c.ads_code;
				ELSE
					code := c.adb_code;
				END_IF;
				result := result + code;
				IF ( code > '' ) THEN
					result := result + '\n';
				END_IF;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaPackageConceptsListCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p',
		'concepts',
		'ads',
		'result',
		'code',
		'tmp'
	],
	#category : #'Express2Cheddar-PackageSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageConceptsListCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaPackageConceptsListCodeFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageConceptsListCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaPackageConceptsListCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> ads [
	^ ads


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> code: aString1 [
	code := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> concepts [
	^ concepts


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> concepts: aListOfExChdDictionaryInstance [
	concepts := aListOfExChdDictionaryInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> contents [
	^ contents


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> contents: aListOfExChdDictionaryInstance [
	contents := aListOfExChdDictionaryInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> fromValues: values [
	self p: (values at: 1).
	self concepts: (values at: 2).
	self ads: (values at: 3)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaPackageConceptsListCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: ''.
	self code: ''.	" ---------- statements ----------"
	self ads
		ifTrue: [ 
			PlatypusCoreRepeatStatement
				repeat: [ :no507 | 
					PlatypusCoreAliasStatement
						alias: (self concepts pltAt: no507)
						statementsBlock: [ :c1747 | 
							(ExChdIsOfGeneratedConceptKindFunction
								invokeFromValues:
									(OrderedCollection new
										add: c1747;
										yourself))
								ifTrue: [ 
									self tmp: (c1747 adsPreDefUsingContext: self class context).
									self tmp > ''
										ifTrue: [ self code: ((self code pltPlus: self tmp) pltPlus: '\n') ] ] ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self concepts;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self concepts;
								yourself)) ].
	self code > ''
		ifTrue: [ self result: (self code pltPlus: '\n\n') ].
	PlatypusCoreRepeatStatement
		repeat: [ :no4020 | 
			PlatypusCoreAliasStatement
				alias: (self concepts pltAt: no4020)
				statementsBlock: [ :c1034 | 
					(ExChdIsOfGeneratedConceptKindFunction
						invokeFromValues:
							(OrderedCollection new
								add: c1034;
								yourself))
						ifTrue: [ 
							self ads
								ifTrue: [ self code: (c1034 adsCodeUsingContext: self class context) ]
								ifFalse: [ self code: (c1034 adbCodeUsingContext: self class context) ].
							self result: (self result pltPlus: self code).
							self code > ''
								ifTrue: [ self result: (self result pltPlus: '\n') ] ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self concepts;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self concepts;
						yourself)).
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> p [
	^ p


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> p: aExChdAdaPackage [
	p := aExChdAdaPackage


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> p: aExChdAdaPackage concepts: aListOfExChdDictionaryInstance ads: aBoolean [
	self p: aExChdAdaPackage.
	self concepts: aListOfExChdDictionaryInstance.
	self ads: aBoolean


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> result: aString [
	result := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> tmp [
	^ tmp


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaPackageConceptsListCodeFunction >> tmp: aString2 [
	tmp := aString2


]
