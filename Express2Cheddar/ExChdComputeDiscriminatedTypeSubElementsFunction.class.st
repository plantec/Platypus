"
<ISO10303-11-EXPRESS>
FUNCTION compute_discriminated_type_sub_elements ( e : discriminated_type_dtd_element ) : LIST OF dtd_element;
	LOCAL 
		attrs : LIST OF explicit_attribute := discriminated_type_attributes ( e.domain );
		result : LIST OF dtd_element := compute_attribute_dtd_list_from_attribute_list ( e, attrs );
	END_LOCAL;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputeDiscriminatedTypeSubElementsFunction',
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
ExChdComputeDiscriminatedTypeSubElementsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeDiscriminatedTypeSubElementsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeDiscriminatedTypeSubElementsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> attrs [
	^ attrs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> attrs: aListOfExChdExplicitAttribute [
	attrs := aListOfExChdExplicitAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdExplicitAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> e: aExChdDiscriminatedTypeDtdElement [
	e := aExChdDiscriminatedTypeDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		attrs:
			(ExChdDiscriminatedTypeAttributesFunction
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
ExChdComputeDiscriminatedTypeSubElementsFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeSubElementsFunction >> result: aListOfExChdDtdElement [
	result := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
