"
<ISO10303-11-EXPRESS>
FUNCTION compute_package_attribute_dtd_elements ( p : package_dtd_element ) : LIST OF attribute_dtd_element;
	LOCAL 
		subs : LIST OF dtd_element := p.subs;
		r : LIST OF attribute_dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
		r := r + subs [ no].subs;
	END_REPEAT;
	RETURN ( r );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputePackageAttributeDtdElementsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'p',
		'subs',
		'r'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageAttributeDtdElementsFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputePackageAttributeDtdElementsFunction class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageAttributeDtdElementsFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputePackageAttributeDtdElementsFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> fromValues: values [

	self p: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputePackageAttributeDtdElementsFunction >> invoke [
	" ---------- locals assignments ----------"

	self subs: (self p subsUsingContext: self class context).
	self r: Array new. " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2201957 |
				self r: (self r pltPlus:
						 ((self subs pltAt: no2201957) subsUsingContext:
							  self class context)) ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self subs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self subs;
					  yourself)).
	^ self return: self r


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> p [

	^ p


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> p: aExChdPackageDtdElement [

	p := aExChdPackageDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> r [

	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> r: aListOfExChdAttributeDtdElement [

	r := aListOfExChdAttributeDtdElement
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [
		     aListOfExChdAttributeDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> subs [

	^ subs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputePackageAttributeDtdElementsFunction >> subs: aListOfExChdDtdElement [

	subs := aListOfExChdDtdElement
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
