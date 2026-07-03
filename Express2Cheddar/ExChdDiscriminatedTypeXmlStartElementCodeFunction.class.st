"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_xml_start_element_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		code : STRING := discriminated_type_attributes_xml_start_element_code ( typ );
	END_LOCAL;

	IF ( code > '' ) THEN
		code := '\nprocedure Start_Element(\n' 
		+ '\tHandler: in out Xml_Generic_Parser;\n' 
		+ '\tobj : in out ' + typ.name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n' 
		+ '\tif Get_Length (Atts) > 0 then' + code + '\n' 
		+ '\tend if;\n' 
		+ 'end Start_Element;\n';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeXmlStartElementCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ',
		'code'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		code:
			(ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self typ;
						yourself)).	" ---------- statements ----------"
	self code > ''
		ifTrue: [ 
			self
				code:
					((((((((((((('\nprocedure Start_Element(\n' pltPlus: '\tHandler: in out Xml_Generic_Parser;\n')
						pltPlus: '\tobj : in out ') pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '_io;\n')
						pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n') pltPlus: '\tif Get_Length (Atts) > 0 then')
						pltPlus: self code) pltPlus: '\n') pltPlus: '\tend if;\n') pltPlus: 'end Start_Element;\n') ].
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> typ [
	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlStartElementCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]
