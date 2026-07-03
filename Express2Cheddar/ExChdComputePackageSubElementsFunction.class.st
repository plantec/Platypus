"
<ISO10303-11-EXPRESS>
FUNCTION compute_package_sub_elements ( e : package_dtd_element ) : LIST OF dtd_element;
	LOCAL 
		result : LIST OF dtd_element := [ ];
		classes : LIST OF ada_entity := package_ada_classes ( e.package );
		records : LIST OF ada_entity := package_records ( e.package );
		discrims : LIST OF discriminated_type := package_discriminated_types ( e.package );
	END_LOCAL;

	REPEAT no := LOINDEX ( classes ) TO HIINDEX ( classes );

		ALIAS curr FOR classes [ no];
			result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || ada_class_dtd_element ( ) );
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( records ) TO HIINDEX ( records );

		ALIAS curr FOR records [ no];
			result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || record_dtd_element ( ) );
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( discrims ) TO HIINDEX ( discrims );

		ALIAS curr FOR discrims [ no];
			result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || discriminated_type_dtd_element ( ) );
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputePackageSubElementsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'result',
		'classes',
		'records',
		'discrims'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageSubElementsFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputePackageSubElementsFunction class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageSubElementsFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageSubElementsFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> classes [

	^ classes


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> classes: aListOfExChdAdaEntity [

	classes := aListOfExChdAdaEntity
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [ aListOfExChdAdaEntity as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> discrims [

	^ discrims


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> discrims: aListOfExChdDiscriminatedType [

	discrims := aListOfExChdDiscriminatedType
		            ifNil: [ OrderedCollection new ]
		            ifNotNil: [
		            aListOfExChdDiscriminatedType as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> e [

	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> e: aExChdPackageDtdElement [

	e := aExChdPackageDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> fromValues: values [

	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputePackageSubElementsFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.
	self classes: (ExChdPackageAdaClassesFunction invokeFromValues:
			 (OrderedCollection new
				  add: (self e packageUsingContext: self class context);
				  yourself)).
	self records:
		(ExChdPackageRecordsFunction invokeFromValues:
			 (OrderedCollection new
				  add: (self e packageUsingContext: self class context);
				  yourself)).
	self discrims:
		(ExChdPackageDiscriminatedTypesFunction invokeFromValues:
			 (OrderedCollection new
				  add: (self e packageUsingContext: self class context);
				  yourself)). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no14343 |
				PlatypusCoreAliasStatement
					alias: (self classes pltAt: no14343)
					statementsBlock: [ :curr1993775 |
							self result: (self result pltPlus:
									 (PlatypusComplexInstance fromRecords:
										  (OrderedCollection new
											   add:
												   (PlatypusComplexInstance fromRecords:
														    (OrderedCollection new
															     add:
																     (PlatypusComplexInstance fromRecords:
																		      (OrderedCollection new
																			       add: (ExChdDtdElement new
																					        dtdElementFromValues:
																						        (OrderedCollection new
																							         add: self e;
																							         add: nil;
																							         yourself);
																					        yourself);
																			       add: ExChdCompositeDtdElement new;
																			       yourself)) pltAsObject;
															     add: (ExChdEntityDtdElement new
																	      entityDtdElementFromValues:
																		      (OrderedCollection new
																			       add: curr1993775;
																			       yourself);
																	      yourself);
															     yourself)) pltAsObject;
											   add: ExChdAdaClassDtdElement new;
											   yourself)) pltAsObject) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self classes;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self classes;
					  yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no1092273 |
				PlatypusCoreAliasStatement
					alias: (self records pltAt: no1092273)
					statementsBlock: [ :curr3564309 |
							self result: (self result pltPlus:
									 (PlatypusComplexInstance fromRecords:
										  (OrderedCollection new
											   add:
												   (PlatypusComplexInstance fromRecords:
														    (OrderedCollection new
															     add:
																     (PlatypusComplexInstance fromRecords:
																		      (OrderedCollection new
																			       add: (ExChdDtdElement new
																					        dtdElementFromValues:
																						        (OrderedCollection new
																							         add: self e;
																							         add: nil;
																							         yourself);
																					        yourself);
																			       add: ExChdCompositeDtdElement new;
																			       yourself)) pltAsObject;
															     add: (ExChdEntityDtdElement new
																	      entityDtdElementFromValues:
																		      (OrderedCollection new
																			       add: curr3564309;
																			       yourself);
																	      yourself);
															     yourself)) pltAsObject;
											   add: ExChdRecordDtdElement new;
											   yourself)) pltAsObject) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self records;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self records;
					  yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no2302139 |
				PlatypusCoreAliasStatement
					alias: (self discrims pltAt: no2302139)
					statementsBlock: [ :curr3796379 |
							self result: (self result pltPlus:
									 (PlatypusComplexInstance fromRecords:
										  (OrderedCollection new
											   add:
												   (PlatypusComplexInstance fromRecords:
														    (OrderedCollection new
															     add:
																     (PlatypusComplexInstance fromRecords:
																		      (OrderedCollection new
																			       add: (ExChdDtdElement new
																					        dtdElementFromValues:
																						        (OrderedCollection new
																							         add: self e;
																							         add: nil;
																							         yourself);
																					        yourself);
																			       add: ExChdCompositeDtdElement new;
																			       yourself)) pltAsObject;
															     add: (ExChdEntityDtdElement new
																	      entityDtdElementFromValues:
																		      (OrderedCollection new
																			       add: curr3796379;
																			       yourself);
																	      yourself);
															     yourself)) pltAsObject;
											   add: ExChdDiscriminatedTypeDtdElement new;
											   yourself)) pltAsObject) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self discrims;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self discrims;
					  yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> records [

	^ records


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> records: aListOfExChdAdaEntity1 [

	records := aListOfExChdAdaEntity1
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [ aListOfExChdAdaEntity1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageSubElementsFunction >> result: aListOfExChdDtdElement [

	result := aListOfExChdDtdElement
		          ifNil: [ OrderedCollection new ]
		          ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
