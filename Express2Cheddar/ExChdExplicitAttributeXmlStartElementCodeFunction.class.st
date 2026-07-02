"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_xml_start_element_code ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING := '';
		domain : entity_instance := basic_ada_domain ( attr.domain );
		sub_domain : entity_instance;
		element_domain : entity_instance;
	END_LOCAL;

	IF is_generic_object ( domain.handled ) THEN
		code := '\n\t\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
		+ '\t\t\tfor J in 0 .. Get_Length (Atts) - 1 loop\n' 
		+ '\t\t\t\tif To_String (To_Lower (Get_Qname (Atts, J))) = ""ref"" then\n' 
		+ '\t\t\t\t\tobj.' + attr.name + ' := To_Unbounded_String (Get_Value (Atts, J));\n' 
		+ '\t\t\t\tend if;\n' 
		+ '\t\t\tend loop;\n' 
		+ '\t\tend if;';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdExplicitAttributeXmlStartElementCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'attr',
		'code',
		'domain',
		'subDomain',
		'elementDomain'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlStartElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlStartElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlStartElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> attr [
	^ attr


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> elementDomain [
	^ elementDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> elementDomain: aExChdEntityInstance2 [
	elementDomain := aExChdEntityInstance2


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self
		domain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr domainUsingContext: self class context);
						yourself)).	" ---------- statements ----------"
	(ExChdIsGenericObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself))
		ifTrue: [ 
			self
				code:
					(((((((((('\n\t\tif To_String (To_Lower (Qname)) = "'
						pltPlus:
							(PTsLowerizeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self attr nameUsingContext: self class context);
										yourself))) pltPlus: '" then\n') pltPlus: '\t\t\tfor J in 0 .. Get_Length (Atts) - 1 loop\n')
						pltPlus: '\t\t\t\tif To_String (To_Lower (Get_Qname (Atts, J))) = "ref" then\n') pltPlus: '\t\t\t\t\tobj.')
						pltPlus: (self attr nameUsingContext: self class context))
						pltPlus: ' := To_Unbounded_String (Get_Value (Atts, J));\n') pltPlus: '\t\t\t\tend if;\n')
						pltPlus: '\t\t\tend loop;\n') pltPlus: '\t\tend if;') ]
		ifFalse: [  ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> subDomain [
	^ subDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlStartElementCodeFunction >> subDomain: aExChdEntityInstance1 [
	subDomain := aExChdEntityInstance1


]
