"
<ISO10303-11-EXPRESS>
FUNCTION root_dtds : LIST OF root_dtd_element;
	LOCAL 
		xml_pkgs : LIST OF ada_package := xml_packages ( );
		root_names : LIST OF STRING := [ ];
		result : LIST OF root_dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( xml_pkgs ) TO HIINDEX ( xml_pkgs );

		ALIAS curr_pkg FOR xml_pkgs [ no];
			root_names := root_names + curr_pkg.xml_root_tags;
		END_ALIAS;
	END_REPEAT;
	root_names := SetToList ( ListToSet ( root_names ) );

	REPEAT no := LOINDEX ( root_names ) TO HIINDEX ( root_names );
		result := result + composite_dtd_element ( ) || root_dtd_element ( ) || dtd_element ( ?, root_names [ no] );
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRootDtdsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'xmlPkgs',
		'rootNames',
		'result'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRootDtdsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-invoking' }
ExChdRootDtdsFunction >> invoke [
	" ---------- locals assignments ----------"

	self xmlPkgs: ExChdXmlPackagesFunction invoke.
	self rootNames: Array new.
	self result: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2249 | 
			PlatypusCoreAliasStatement
				alias: (self xmlPkgs pltAt: no2249)
				statementsBlock: [ :currPkg3366 | self rootNames: (self rootNames pltPlus: (currPkg3366 xmlRootTagsUsingContext: self class context)) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self xmlPkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self xmlPkgs;
						yourself)).
	self
		rootNames:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								(PTsListToSetFunction
										invokeFromValues:
											(OrderedCollection new
												add: self rootNames;
												yourself));
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no2013 | 
			self
				result:
					(self result
						pltPlus:
							(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add:
												(PlatypusComplexInstance
														fromRecords:
															(OrderedCollection new
																add: ExChdCompositeDtdElement new;
																add: ExChdRootDtdElement new;
																yourself)) pltAsObject;
										add:
												(ExChdDtdElement new
														dtdElementFromValues:
																(OrderedCollection new
																		add: nil;
																		add: (self rootNames pltAt: no2013);
																		yourself);
														yourself);
										yourself)) pltAsObject) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self rootNames;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self rootNames;
						yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> result: aListOfExChdRootDtdElement [
	result := aListOfExChdRootDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdRootDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> rootNames [
	^ rootNames


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> rootNames: aListOfString [
	rootNames := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> xmlPkgs [
	^ xmlPkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdRootDtdsFunction >> xmlPkgs: aListOfExChdAdaPackage [
	xmlPkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]
