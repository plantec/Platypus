"
<ISO10303-11-EXPRESS>
FUNCTION compute_attribute_dtd_list_from_attribute_list ( owner : dtd_element; attrs : LIST OF explicit_attribute ) : LIST OF dtd_element;
	LOCAL 
		result : LIST OF dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );

		ALIAS curr FOR attrs [ no];
			IF ( lowerize ( curr.name ) <> lowerize ( xml_id_name ) ) THEN
				result := result + compute_attribute_dtd_element ( owner, curr );
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputeAttributeDtdListFromAttributeListFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'owner',
		'attrs',
		'result'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdListFromAttributeListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdListFromAttributeListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdListFromAttributeListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> attrs [
	^ attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> attrs: aListOfExChdExplicitAttribute [
	attrs := aListOfExChdExplicitAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdExplicitAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> fromValues: values [
	self owner: (values at: 1).
	self attrs: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2577 | 
			PlatypusCoreAliasStatement
				alias: (self attrs pltAt: no2577)
				statementsBlock: [ :curr3687 | 
					(PTsLowerizeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (curr3687 nameUsingContext: self class context);
								yourself))
						~=
							(PTsLowerizeFunction
								invokeFromValues:
									(OrderedCollection new
										add: 'cheddar_private_id';
										yourself))
						ifTrue: [ 
							self
								result:
									(self result
										pltPlus:
											(ExChdComputeAttributeDtdElementFunction
												invokeFromValues:
													(OrderedCollection new
														add: self owner;
														add: curr3687;
														yourself))) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attrs;
						yourself)).
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> owner [
	^ owner


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> owner: aExChdDtdElement [
	owner := aExChdDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> owner: aExChdDtdElement attrs: aListOfExChdExplicitAttribute [
	self owner: aExChdDtdElement.
	self attrs: aListOfExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdListFromAttributeListFunction >> result: aListOfExChdDtdElement [
	result := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
