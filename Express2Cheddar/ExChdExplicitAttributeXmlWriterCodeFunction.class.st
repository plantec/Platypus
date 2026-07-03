"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_xml_writer_code ( prefix : STRING; attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING;
		domain : entity_instance := basic_ada_domain ( attr.domain );
		tag : STRING := Lowerize ( attr.name );
	END_LOCAL;

	IF ( 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' IN TYPEOF ( domain.handled ) ) THEN
		RETURN ( '' );
	END_IF;

	IF ( attr.name = xml_id_name ) THEN
		RETURN ( '' );
	END_IF;

	IF is_generic_object ( domain.handled ) THEN
		code := '\tresult := result & to_unbounded_string(""<' + attr.name + ' ref="""""") & ' + prefix + '.' + attr.name + '.' + xml_id_name + ' & to_unbounded_string("""""" />"");';
	ELSE
		code := '\tif (XML_String(' + prefix + '.' + attr.name + ') /= Empty_String) then\n' 
		+ '\t\tresult := result & to_unbounded_string(""<' + tag + '>"") & XML_String(' + prefix + '.' + attr.name + ') & to_unbounded_string(""</' + tag + '>"");\n\tend if;';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdExplicitAttributeXmlWriterCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'prefix',
		'attr',
		'code',
		'domain',
		'tag'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlWriterCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlWriterCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlWriterCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> attr [
	^ attr


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> fromValues: values [
	self prefix: (values at: 1).
	self attr: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdExplicitAttributeXmlWriterCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		domain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr domainUsingContext: self class context);
						yourself)).
	self
		tag:
			(PTsLowerizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr nameUsingContext: self class context);
						yourself)).	" ---------- statements ----------"
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) includes: 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR')
		ifTrue: [ ^ self return: '' ].
	(self attr nameUsingContext: self class context) = 'cheddar_private_id'
		ifTrue: [ ^ self return: '' ].
	(ExChdIsGenericObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself))
		ifTrue: [ 
			self
				code:
					(((((((('\tresult := result & to_unbounded_string("<' pltPlus: (self attr nameUsingContext: self class context))
						pltPlus: ' ref=""") & ') pltPlus: self prefix) pltPlus: '.')
						pltPlus: (self attr nameUsingContext: self class context)) pltPlus: '.') pltPlus: 'cheddar_private_id')
						pltPlus: ' & to_unbounded_string(""" />");') ]
		ifFalse: [ 
			self
				code:
					((((((((((((('\tif (XML_String(' pltPlus: self prefix) pltPlus: '.')
						pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ') /= Empty_String) then\n')
						pltPlus: '\t\tresult := result & to_unbounded_string("<') pltPlus: self tag) pltPlus: '>") & XML_String(')
						pltPlus: self prefix) pltPlus: '.') pltPlus: (self attr nameUsingContext: self class context))
						pltPlus: ') & to_unbounded_string("</') pltPlus: self tag) pltPlus: '>");\n\tend if;') ].
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> prefix [
	^ prefix


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> prefix: aString [
	prefix := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> prefix: aString attr: aExChdExplicitAttribute [
	self prefix: aString.
	self attr: aExChdExplicitAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> tag [
	^ tag


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlWriterCodeFunction >> tag: aString1 [
	tag := aString1


]
