"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_xml_end_element_code ( typ : discriminated_type ) : STRING;
	RETURN ( '\nprocedure End_Element(\n' 
		+ '\tHandler : in out Xml_generic_parser;\n' 
		+ '\tobj : in out ' + typ.name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name    : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """") is \nbegin\n' 
		+ discriminated_type_attributes_xml_end_element_code ( typ ) + '\nend End_Element;\n' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeXmlEndElementCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction class >> schemaDefinition [

	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction >> fromValues: values [

	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------"

	^ self return: ((((((((('\nprocedure End_Element(\n' pltPlus:
			           '\tHandler : in out Xml_generic_parser;\n') pltPlus:
			          '\tobj : in out ') pltPlus:
			         (self typ nameUsingContext: self class context)) pltPlus:
			        '_io;\n') pltPlus:
			       '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
			      pltPlus:
			      '\tLocal_Name    : Unicode.CES.Byte_Sequence := "";\n')
			     pltPlus:
			     '\tQname : Unicode.CES.Byte_Sequence := "") is \nbegin\n')
			    pltPlus:
				    (ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction
					     invokeFromValues: (OrderedCollection new
							      add: self typ;
							      yourself))) pltPlus: '\nend End_Element;\n')


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction >> typ [

	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlEndElementCodeFunction >> typ: aExChdDiscriminatedType [

	typ := aExChdDiscriminatedType


]
