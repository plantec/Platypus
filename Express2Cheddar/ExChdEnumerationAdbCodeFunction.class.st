"
<ISO10303-11-EXPRESS>
FUNCTION enumeration_adb_code ( e : ada_enumeration ) : STRING;
	LOCAL 
		code : STRING;
	END_LOCAL;
	code := 'function XML_String(obj : in ' + e.name + ') return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '	return to_unbounded_string(' + e.name + '''image (obj) );\n' 
	+ 'end XML_String;\n\n' 

	+ 'function XML_Ref_String (obj : in ' + e.name + ') return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '\traise xml_ref_string_error;\n' 
	+ '\treturn to_unbounded_string("""");\n' 
	+ 'end XML_Ref_String;\n\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdEnumerationAdbCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'code'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdEnumerationAdbCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdEnumerationAdbCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEnumerationAdbCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEnumerationAdbCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdEnumerationAdbCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdEnumerationAdbCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdEnumerationAdbCodeFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdEnumerationAdbCodeFunction >> e: aExChdAdaEnumeration [
	e := aExChdAdaEnumeration


]

{ #category : 'platypus-generated-accessing' }
ExChdEnumerationAdbCodeFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdEnumerationAdbCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code:
			(((((((((((((('function XML_String(obj : in ' pltPlus: (self e nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: 'begin\n') pltPlus: '	return to_unbounded_string(')
				pltPlus: (self e nameUsingContext: self class context)) pltPlus: '''image (obj) );\n')
				pltPlus: 'end XML_String;\n\n') pltPlus: 'function XML_Ref_String (obj : in ')
				pltPlus: (self e nameUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: 'begin\n') pltPlus: '\traise xml_ref_string_error;\n') pltPlus: '\treturn to_unbounded_string("");\n')
				pltPlus: 'end XML_Ref_String;\n\n').
	^ self return: self code


]
