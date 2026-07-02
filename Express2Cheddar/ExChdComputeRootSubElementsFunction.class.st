"
<ISO10303-11-EXPRESS>
FUNCTION compute_root_sub_elements ( e : root_dtd_element ) : LIST OF package_dtd_element;
	LOCAL 
		result : LIST OF package_dtd_element := [ ];
	END_LOCAL;

	ALIAS packages FOR e.packages;

		REPEAT no := LOINDEX ( packages ) TO HIINDEX ( packages );
			result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || package_dtd_element ( packages [ no] ) );
		END_REPEAT;
	END_ALIAS;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputeRootSubElementsFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'result'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeRootSubElementsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputeRootSubElementsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeRootSubElementsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeRootSubElementsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeRootSubElementsFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeRootSubElementsFunction >> e: aExChdRootDtdElement [
	e := aExChdRootDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeRootSubElementsFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputeRootSubElementsFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: (self e packagesUsingContext: self class context)
		statementsBlock: [ :packages962 | 
			PlatypusCoreRepeatStatement
				repeat: [ :no1087 | 
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
																		add:
																				(ExChdDtdElement new
																						dtdElementFromValues:
																								(OrderedCollection new
																										add: self e;
																										add: nil;
																										yourself);
																						yourself);
																		add: ExChdCompositeDtdElement new;
																		yourself)) pltAsObject;
												add:
														(ExChdPackageDtdElement new
																packageDtdElementFromValues:
																		(OrderedCollection new
																				add: (packages962 pltAt: no1087);
																				yourself);
																yourself);
												yourself)) pltAsObject) ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: packages962;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: packages962;
								yourself)) ].
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeRootSubElementsFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeRootSubElementsFunction >> result: aListOfExChdPackageDtdElement [
	result := aListOfExChdPackageDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdPackageDtdElement as: OrderedCollection ]


]
