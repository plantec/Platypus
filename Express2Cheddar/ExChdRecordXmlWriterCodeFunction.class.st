"
<ISO10303-11-EXPRESS>
FUNCTION record_xml_writer_code ( cip : record ) : STRING;
	LOCAL 
		code : STRING;
		acode : STRING;
	END_LOCAL;
	code := '\nprocedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String) is \nbegin\n';

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			acode := explicit_attribute_xml_writer_code ( 'obj', attr );
			IF ( acode > '' ) THEN
				code := code + acode + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	code := code + 'end Build_Attributes_XML_String;\n\n' 

	+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
	+ '\tresult : Unbounded_String;\n' 
	+ 'begin\n' 
	+ '\tresult := to_unbounded_string(""<' + cip.html_tag + '>"");\n' 
	+ '\tBuild_Attributes_XML_String(obj, result);\n' 
	+ '\tresult := result & to_unbounded_string(""</' + cip.html_tag + '>"");\n' 
	+ '\treturn (result);\n' 
	+ 'end XML_String;\n\n' 

	+ 'function XML_String(obj : in ' + cip.ptr_type + ') return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '	if obj /= null then\n' 
	+ '		return XML_String(obj.all);\n' 
	+ '	else\n' 
	+ '		return Empty_String;\n' 
	+ '	end if;\n' 
	+ 'end XML_String;\n\n' 

	+ 'function XML_Ref_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
	+ '\tresult : Unbounded_String;\n' 
	+ 'begin\n' 
	+ '	raise xml_ref_string_error;\n' 
	+ '	return to_unbounded_string("""");\n' 
	+ 'end XML_Ref_String;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordXmlWriterCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code',
		'acode'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordXmlWriterCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordXmlWriterCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordXmlWriterCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordXmlWriterCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> acode [
	^ acode


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> acode: aString1 [
	acode := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> cip: aExChdRecord [
	cip := aExChdRecord


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordXmlWriterCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdRecordXmlWriterCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code:
			(('\nprocedure Build_Attributes_XML_String(obj : in ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: '; result : in out Unbounded_String) is \nbegin\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no1655 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no1655)
				statementsBlock: [ :attr3611 | 
					self
						acode:
							(ExChdExplicitAttributeXmlWriterCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: 'obj';
										add: attr3611;
										yourself)).
					self acode > ''
						ifTrue: [ self code: ((self code pltPlus: self acode) pltPlus: '\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself)).
	self
		code:
			(((((((((((((((((((((((((((((((((self code pltPlus: 'end Build_Attributes_XML_String;\n\n')
				pltPlus: 'function XML_String(obj : in ') pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n')
				pltPlus: '\tresult := to_unbounded_string("<') pltPlus: (self cip htmlTagUsingContext: self class context))
				pltPlus: '>");\n') pltPlus: '\tBuild_Attributes_XML_String(obj, result);\n')
				pltPlus: '\tresult := result & to_unbounded_string("</') pltPlus: (self cip htmlTagUsingContext: self class context))
				pltPlus: '>");\n') pltPlus: '\treturn (result);\n') pltPlus: 'end XML_String;\n\n')
				pltPlus: 'function XML_String(obj : in ') pltPlus: (self cip ptrTypeUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: 'begin\n') pltPlus: '	if obj /= null then\n')
				pltPlus: '		return XML_String(obj.all);\n') pltPlus: '	else\n') pltPlus: '		return Empty_String;\n')
				pltPlus: '	end if;\n') pltPlus: 'end XML_String;\n\n') pltPlus: 'function XML_Ref_String(obj : in ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n') pltPlus: '	raise xml_ref_string_error;\n')
				pltPlus: '	return to_unbounded_string("");\n') pltPlus: 'end XML_Ref_String;\n').
	^ self return: self code


]
