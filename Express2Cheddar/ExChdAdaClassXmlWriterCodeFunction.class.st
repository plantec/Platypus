"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_xml_writer_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
		contents : STRING := '';
		sub : STRING;
	END_LOCAL;
	code := '\nprocedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String) is \nbegin\n';

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			contents := contents + '\tBuild_Attributes_XML_String(' + sup.name + '(obj), result);\n';
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			sub := explicit_attribute_xml_writer_code ( 'obj', attr );
			IF sub > '' THEN
				contents := contents + sub + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;

	IF contents = '' THEN
		contents := '\tnull;\n';
	END_IF;
	code := code + contents + 'end Build_Attributes_XML_String;\n\n' 

	+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
	+ '\tresult : Unbounded_String;\n' 
	+ 'begin\n' 
	+ '\tresult := to_unbounded_string(""<' + cip.html_tag + ' id="""""") & obj.' + xml_id_name + ' & to_unbounded_string("""""" >"");\n' 
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
	+ '\tresult := to_unbounded_string(""<' + cip.html_tag + ' ref="""""") & obj.' + xml_id_name + ' & to_unbounded_string("""""" />"");\n' 
	+ '\treturn (result);\n' 
	+ 'end XML_Ref_String;\n\n' 

	+ 'function XML_Ref_String(obj : in ' + cip.ptr_type + ') return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '\treturn XML_Ref_String(obj.all);\n' 
	+ 'end XML_Ref_String;\n\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaClassXmlWriterCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code',
		'contents',
		'sub'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlWriterCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassXmlWriterCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlWriterCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlWriterCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> contents [
	^ contents


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> contents: aString1 [
	contents := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaClassXmlWriterCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self contents: ''.	" ---------- statements ----------"
	self
		code:
			(('\nprocedure Build_Attributes_XML_String(obj : in ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: '; result : in out Unbounded_String) is \nbegin\n').
	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self cip supertypesUsingContext: self class context);
				yourself)) > 0
		ifTrue: [ 
			PlatypusCoreAliasStatement
				alias:
					(((self cip supertypesUsingContext: self class context)
						pltAt:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self cip supertypesUsingContext: self class context);
										yourself))) handledUsingContext: self class context)
				statementsBlock: [ :sup2341 | 
					self
						contents:
							(((self contents pltPlus: '\tBuild_Attributes_XML_String(') pltPlus: (sup2341 nameUsingContext: self class context))
								pltPlus: '(obj), result);\n') ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no2720 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no2720)
				statementsBlock: [ :attr580 | 
					self
						sub:
							(ExChdExplicitAttributeXmlWriterCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: 'obj';
										add: attr580;
										yourself)).
					self sub > ''
						ifTrue: [ self contents: ((self contents pltPlus: self sub) pltPlus: '\n') ] ] ]
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
	self contents = ''
		ifTrue: [ self contents: '\tnull;\n' ].
	self
		code:
			((((((((((((((((((((((((((((((((((((((((((((((self code pltPlus: self contents)
				pltPlus: 'end Build_Attributes_XML_String;\n\n') pltPlus: 'function XML_String(obj : in ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n') pltPlus: '\tresult := to_unbounded_string("<')
				pltPlus: (self cip htmlTagUsingContext: self class context)) pltPlus: ' id=""") & obj.')
				pltPlus: 'cheddar_private_id') pltPlus: ' & to_unbounded_string(""" >");\n')
				pltPlus: '\tBuild_Attributes_XML_String(obj, result);\n') pltPlus: '\tresult := result & to_unbounded_string("</')
				pltPlus: (self cip htmlTagUsingContext: self class context)) pltPlus: '>");\n') pltPlus: '\treturn (result);\n')
				pltPlus: 'end XML_String;\n\n') pltPlus: 'function XML_String(obj : in ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: 'begin\n') pltPlus: '	if obj /= null then\n') pltPlus: '		return XML_String(obj.all);\n')
				pltPlus: '	else\n') pltPlus: '		return Empty_String;\n') pltPlus: '	end if;\n') pltPlus: 'end XML_String;\n\n')
				pltPlus: 'function XML_Ref_String(obj : in ') pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n')
				pltPlus: '\tresult := to_unbounded_string("<') pltPlus: (self cip htmlTagUsingContext: self class context))
				pltPlus: ' ref=""") & obj.') pltPlus: 'cheddar_private_id') pltPlus: ' & to_unbounded_string(""" />");\n')
				pltPlus: '\treturn (result);\n') pltPlus: 'end XML_Ref_String;\n\n') pltPlus: 'function XML_Ref_String(obj : in ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: 'begin\n') pltPlus: '\treturn XML_Ref_String(obj.all);\n') pltPlus: 'end XML_Ref_String;\n\n').
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> sub [
	^ sub


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlWriterCodeFunction >> sub: aString2 [
	sub := aString2


]
