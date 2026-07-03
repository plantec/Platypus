"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_xml_start_element_code ( cip : ada_entity ) : STRING;
	LOCAL 
		code : STRING;
	END_LOCAL;

	IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( cip ) ) THEN
		code := '\nprocedure Start_Element(\n' 
		+ '\tHandler: in out Xml_Generic_Parser;\n' 
		+ '\tobj : in out ' + cip.name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tAtts : Sax.Attributes.Attributes''Class) is\n' 
		+ 'begin\n' 
		+ '\tif To_String (To_Lower (Qname)) = ""' + cip.html_tag + '"" then\n' 
		+ '\t\tinitialize(obj);\n' 
		+ '\tend if;\n' 
		+ 'end Start_Element;\n';
	ELSE
		code := ada_entity_attributes_xml_start_element_code ( cip );

		IF ( code > '' ) THEN
			code := '\nprocedure Start_Element(\n' 
			+ '\tHandler: in out Xml_Generic_Parser;\n' 
			+ '\tobj : in out ' + cip.name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n' 
			+ '\tif Get_Length (Atts) > 0 then' + code + '\n' 
			+ '\tend if;\n' 
			+ 'end Start_Element;\n';
		END_IF;
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityXmlStartElementCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlStartElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlStartElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlStartElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction >> cip: aExChdAdaEntity [
	cip := aExChdAdaEntity


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlStartElementCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityXmlStartElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self cip;
				yourself)) includes: 'RECORD_AND_CLASS.RECORD')
		ifTrue: [ 
			self
				code:
					((((((((((((((('\nprocedure Start_Element(\n' pltPlus: '\tHandler: in out Xml_Generic_Parser;\n')
						pltPlus: '\tobj : in out ') pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '_io;\n')
						pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tAtts : Sax.Attributes.Attributes''Class) is\n') pltPlus: 'begin\n')
						pltPlus: '\tif To_String (To_Lower (Qname)) = "') pltPlus: (self cip htmlTagUsingContext: self class context))
						pltPlus: '" then\n') pltPlus: '\t\tinitialize(obj);\n') pltPlus: '\tend if;\n') pltPlus: 'end Start_Element;\n') ]
		ifFalse: [ 
			self
				code:
					(ExChdAdaEntityAttributesXmlStartElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself)).
			self code > ''
				ifTrue: [ 
					self
						code:
							((((((((((((('\nprocedure Start_Element(\n' pltPlus: '\tHandler: in out Xml_Generic_Parser;\n')
								pltPlus: '\tobj : in out ') pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '_io;\n')
								pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n') pltPlus: '\tif Get_Length (Atts) > 0 then')
								pltPlus: self code) pltPlus: '\n') pltPlus: '\tend if;\n') pltPlus: 'end Start_Element;\n') ] ].
	^ self return: self code


]
