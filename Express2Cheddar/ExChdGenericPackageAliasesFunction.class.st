"
<ISO10303-11-EXPRESS>
FUNCTION generic_package_aliases ( e : generic_package_instanciation ) : LIST OF cheddar_defined_type;
	LOCAL 
		aliases : LIST OF entity_instance := [ ];
		attrname : STRING;
	END_LOCAL;

	REPEAT no := LOINDEX ( e.attributes ) TO HIINDEX ( e.attributes );

		ALIAS attr FOR e.attributes [ no];
			ALIAS an FOR attr.name;
				IF ( an [ LENGTH ( an ) ] = '_' ) THEN
					attrname := an [ 1 : LENGTH ( an ) - 1 ];
				ELSE
					attrname := an;
				END_IF;
			END_ALIAS;
			aliases := aliases + ( ada_type ( ) || attr.domain || package_alias ( e.name, attrname ) );
		END_ALIAS;
	END_REPEAT;
	RETURN ( aliases );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGenericPackageAliasesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'aliases',
		'attrname'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageAliasesFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGenericPackageAliasesFunction class >> schemaDefinition [

	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageAliasesFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenericPackageAliasesFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> aliases [

	^ aliases


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> aliases: aListOfExChdEntityInstance [

	aliases := aListOfExChdEntityInstance
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [
		           aListOfExChdEntityInstance as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> attrname [

	^ attrname


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> attrname: aString [

	attrname := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> e [

	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> e: aExChdGenericPackageInstanciation [

	e := aExChdGenericPackageInstanciation


]

{ #category : 'platypus-generated-accessing' }
ExChdGenericPackageAliasesFunction >> fromValues: values [

	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdGenericPackageAliasesFunction >> invoke [
	" ---------- locals assignments ----------"

	self aliases: Array new. " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2314361 |
				PlatypusCoreAliasStatement
					alias:
					((self e attributesUsingContext: self class context) pltAt:
						 no2314361)
					statementsBlock: [ :attr3694839 |
							PlatypusCoreAliasStatement
								alias: (attr3694839 nameUsingContext: self class context)
								statementsBlock: [ :an1414305 |
										(an1414305 pltAt:
											 (PltLENGTHFunction invokeFromValues:
												  (OrderedCollection new
													   add: an1414305;
													   yourself))) = '_'
											ifTrue: [
													self attrname: (an1414305
															 pltCopyFrom: 1
															 to:
																 ((PltLENGTHFunction invokeFromValues:
																	   (OrderedCollection new
																		    add: an1414305;
																		    yourself)) pltMinus: 1)) ]
											ifFalse: [ self attrname: an1414305 ] ].
							self aliases: (self aliases pltPlus:
									 (PlatypusComplexInstance fromRecords:
										  (OrderedCollection new
											   add:
												   (PlatypusComplexInstance fromRecords:
														    (OrderedCollection new
															     add: ExChdAdaType new;
															     add:
																     (attr3694839 domainUsingContext:
																		      self class context);
															     yourself)) pltAsObject;
											   add: (ExChdPackageAlias new
													    packageAliasFromValues: (OrderedCollection new
															     add: (self e nameUsingContext: self class context);
															     add: self attrname;
															     yourself);
													    yourself);
											   yourself)) pltAsObject) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: (self e attributesUsingContext: self class context);
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: (self e attributesUsingContext: self class context);
					  yourself)).
	^ self return: self aliases


]
