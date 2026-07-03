"
<ISO10303-11-EXPRESS>
FUNCTION compute_entity_sub_elements ( e : entity_dtd_element ) : LIST OF dtd_element;
	LOCAL 
		attrs : LIST OF explicit_attribute := inherited_explicit_attributes ( e.domain );
		result : LIST OF dtd_element := compute_attribute_dtd_list_from_attribute_list ( e, attrs );
	END_LOCAL;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputeEntitySubElementsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'attrs',
		'result'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntitySubElementsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputeEntitySubElementsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntitySubElementsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntitySubElementsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> attrs [
	^ attrs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> attrs: aListOfExChdExplicitAttribute [
	attrs := aListOfExChdExplicitAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdExplicitAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> e: aExChdEntityDtdElement [
	e := aExChdEntityDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputeEntitySubElementsFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		attrs:
			(PTsInheritedExplicitAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self e domainUsingContext: self class context);
						yourself)).
	self
		result:
			(ExChdComputeAttributeDtdListFromAttributeListFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						add: self attrs;
						yourself)).	" ---------- statements ----------"
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntitySubElementsFunction >> result: aListOfExChdDtdElement [
	result := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
