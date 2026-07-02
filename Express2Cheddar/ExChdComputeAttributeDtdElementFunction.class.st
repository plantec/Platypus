"
<ISO10303-11-EXPRESS>
FUNCTION compute_attribute_dtd_element ( owner : dtd_element; a : attribute ) : attribute_dtd_element;
	LOCAL 
		domain : entity_instance := basic_ada_domain ( a.domain ).handled;
		result : attribute_dtd_element;
	END_LOCAL;
	result := ( dtd_element ( owner, ? ) || attribute_dtd_element ( a, ? ) );
	result.domain := compute_domain_dtd_element ( result, domain );
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputeAttributeDtdElementFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'owner',
		'a',
		'domain',
		'result'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdElementFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputeAttributeDtdElementFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdElementFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeAttributeDtdElementFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> a [
	^ a


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> a: aExChdAttribute [
	a := aExChdAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> fromValues: values [
	self owner: (values at: 1).
	self a: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputeAttributeDtdElementFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		domain:
			((ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self a domainUsingContext: self class context);
						yourself)) handledUsingContext: self class context).	" ---------- statements ----------"
	self
		result:
			(PlatypusComplexInstance
				fromRecords:
					(OrderedCollection new
						add:
								(ExChdDtdElement new
										dtdElementFromValues:
												(OrderedCollection new
														add: self owner;
														add: nil;
														yourself);
										yourself);
						add:
								(ExChdAttributeDtdElement new
										attributeDtdElementFromValues:
												(OrderedCollection new
														add: self a;
														add: nil;
														yourself);
										yourself);
						yourself)) pltAsObject.
	self result
		domain:
			(ExChdComputeDomainDtdElementFunction
				invokeFromValues:
					(OrderedCollection new
						add: self result;
						add: self domain;
						yourself)).
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> owner [
	^ owner


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> owner: aExChdDtdElement [
	owner := aExChdDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> owner: aExChdDtdElement a: aExChdAttribute [
	self owner: aExChdDtdElement.
	self a: aExChdAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeAttributeDtdElementFunction >> result: aExChdAttributeDtdElement [
	result := aExChdAttributeDtdElement


]
