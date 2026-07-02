"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_xml_end_element_code ( cip : ada_entity ) : STRING;
	RETURN ( '\nprocedure End_Element(\n' 
		+ '\tHandler : in out Xml_generic_parser;\n' 
		+ '\tobj : in out ' + cip.name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name    : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """") is \nbegin\n' 
		+ ada_entity_attributes_xml_end_element_code ( cip ) + '\nend End_Element;\n' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaEntityXmlEndElementCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlEndElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaEntityXmlEndElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlEndElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlEndElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityXmlEndElementCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityXmlEndElementCodeFunction >> cip: aExChdAdaEntity [
	cip := aExChdAdaEntity


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityXmlEndElementCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaEntityXmlEndElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			((((((((('\nprocedure End_Element(\n' pltPlus: '\tHandler : in out Xml_generic_parser;\n') pltPlus: '\tobj : in out ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '_io;\n')
				pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
				pltPlus: '\tLocal_Name    : Unicode.CES.Byte_Sequence := "";\n')
				pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "") is \nbegin\n')
				pltPlus:
					(ExChdAdaEntityAttributesXmlEndElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\nend End_Element;\n')


]
