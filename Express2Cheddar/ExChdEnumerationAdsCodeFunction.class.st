"
<ISO10303-11-EXPRESS>
FUNCTION enumeration_ads_code ( e : ada_enumeration ) : STRING;
	LOCAL 
		code : STRING;
		convert_type : STRING := NVL ( e.convertion, e.domain.elements [ LOINDEX ( e.domain.elements ) ] );
	END_LOCAL;
	code := 'type ' + e.name + ' is (\n\t' + StringAggregateConcatSeparatedBy ( e.domain.elements, ',\n\t' ) + ');\n';

	IF ( 'CHEDDAR_DOMAINS.PRAGMA_CONVENTION' IN TYPEOF ( e ) ) THEN
		code := code + 'pragma convention (' + e.convention + ', ' + e.name + ');\n';
	END_IF;
	code := code + '\n' 
	+ 'procedure To_' + e.name + ' is\n' 
	+ 'new Convert_Strings(' + e.name + ', ' + convert_type + ');\n' 
	+ 'procedure To_' + e.name + ' is\n' 
	+ 'new Convert_Unbounded_Strings(' + e.name + ', ' + convert_type + ');\n' 
	+ 'function XML_String (obj : in ' + e.name + ') return Unbounded_String;\n' 
	+ 'function XML_Ref_String (obj : in ' + e.name + ') return Unbounded_String;\n' 
	+ 'package ' + e.name + '_io is new text_io.enumeration_io(' + e.name + ');\n' 
	+ 'use ' + e.name + '_io;\n\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdEnumerationAdsCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'code',
		'convertType'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdEnumerationAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdEnumerationAdsCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdEnumerationAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdEnumerationAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> convertType [
	^ convertType


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> convertType: aString1 [
	convertType := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> e: aExChdAdaEnumeration [
	e := aExChdAdaEnumeration


]

{ #category : #'platypus-generated-accessing' }
ExChdEnumerationAdsCodeFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdEnumerationAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		convertType:
			(PltNVLFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self e convertionUsingContext: self class context);
						add:
								(((self e domainUsingContext: self class context) elementsUsingContext: self class context)
										pltAt:
											(PltLOINDEXFunction
												invokeFromValues:
													(OrderedCollection new
														add: ((self e domainUsingContext: self class context) elementsUsingContext: self class context);
														yourself)));
						yourself)).	" ---------- statements ----------"
	self
		code:
			(((('type ' pltPlus: (self e nameUsingContext: self class context)) pltPlus: ' is (\n\t')
				pltPlus:
					(PTsStringAggregateConcatSeparatedByFunction
						invokeFromValues:
							(OrderedCollection new
								add: ((self e domainUsingContext: self class context) elementsUsingContext: self class context);
								add: ',\n\t';
								yourself))) pltPlus: ');\n').
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'CHEDDAR_DOMAINS.PRAGMA_CONVENTION')
		ifTrue: [ 
			self
				code:
					(((((self code pltPlus: 'pragma convention (') pltPlus: (self e conventionUsingContext: self class context))
						pltPlus: ', ') pltPlus: (self e nameUsingContext: self class context)) pltPlus: ');\n') ].
	self
		code:
			(((((((((((((((((((((((((((((((self code pltPlus: '\n') pltPlus: 'procedure To_')
				pltPlus: (self e nameUsingContext: self class context)) pltPlus: ' is\n') pltPlus: 'new Convert_Strings(')
				pltPlus: (self e nameUsingContext: self class context)) pltPlus: ', ') pltPlus: self convertType) pltPlus: ');\n')
				pltPlus: 'procedure To_') pltPlus: (self e nameUsingContext: self class context)) pltPlus: ' is\n')
				pltPlus: 'new Convert_Unbounded_Strings(') pltPlus: (self e nameUsingContext: self class context)) pltPlus: ', ')
				pltPlus: self convertType) pltPlus: ');\n') pltPlus: 'function XML_String (obj : in ')
				pltPlus: (self e nameUsingContext: self class context)) pltPlus: ') return Unbounded_String;\n')
				pltPlus: 'function XML_Ref_String (obj : in ') pltPlus: (self e nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String;\n') pltPlus: 'package ') pltPlus: (self e nameUsingContext: self class context))
				pltPlus: '_io is new text_io.enumeration_io(') pltPlus: (self e nameUsingContext: self class context))
				pltPlus: ');\n') pltPlus: 'use ') pltPlus: (self e nameUsingContext: self class context)) pltPlus: '_io;\n\n').
	^ self return: self code


]
