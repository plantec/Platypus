"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_xml_end_element_code ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING := '';
		domain : entity_instance := basic_ada_domain ( attr.domain );
		init : STRING := domain.init_value;
		io_domain : STRING;
	END_LOCAL;

	IF NOT is_generic_object ( domain.handled ) THEN

		IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) OR EXISTS ( init ) THEN
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
				io_domain := domain.ada_ident;
			ELSE
				IF ( init = 'empty_string' ) THEN
					io_domain := 'String';
				ELSE
					IF ( lowerize ( init ) = 'false' ) THEN
						io_domain := 'Boolean';
					ELSE
						IF ( init = '0' ) THEN
							io_domain := 'Integer';
						ELSE
							io_domain := 'Double';
						END_IF;
					END_IF;
				END_IF;
			END_IF;
			IF init = 'empty_string' THEN
				code := '\n\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
				+ '\t\tobj.' + attr.name + ' := handler.Parameter_List (1);\n' 
				+ '\tend if;';
			ELSE
				code := '\n\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
				+ '\t\tTo_' + io_domain + ' (handler.Parameter_List (1), obj.' + attr.name + ', Handler.Ok);\n' 
				+ '\t\tif not Handler.Ok then\n' 
				+ '\t\t\tPut_Line (""Warning : Error on data type From "" & To_String (Handler.Locator));\n' 
				+ '\t\tend if;\n' 
				+ '\tend if;';
			END_IF;
		END_IF;
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdExplicitAttributeXmlEndElementCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'attr',
		'code',
		'domain',
		'init',
		'ioDomain'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlEndElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlEndElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlEndElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> attr [
	^ attr


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> init [
	^ init


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> init: aString1 [
	init := aString1


]

{ #category : #'platypus-generated-invoking' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self
		domain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr domainUsingContext: self class context);
						yourself)).
	self init: (self domain initValueUsingContext: self class context).	" ---------- statements ----------"
	(ExChdIsGenericObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) not
		ifTrue: [ 
			(((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self domain handledUsingContext: self class context);
						yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
				or: [ 
					PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: self init;
								yourself) ])
				ifTrue: [ 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self domain handledUsingContext: self class context);
								yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
						ifTrue: [ self ioDomain: (self domain adaIdentUsingContext: self class context) ]
						ifFalse: [ 
							self init = 'empty_string'
								ifTrue: [ self ioDomain: 'String' ]
								ifFalse: [ 
									(PTsLowerizeFunction
										invokeFromValues:
											(OrderedCollection new
												add: self init;
												yourself)) = 'false'
										ifTrue: [ self ioDomain: 'Boolean' ]
										ifFalse: [ 
											self init = '0'
												ifTrue: [ self ioDomain: 'Integer' ]
												ifFalse: [ self ioDomain: 'Double' ] ] ] ].
					self init = 'empty_string'
						ifTrue: [ 
							self
								code:
									(((((('\n\tif To_String (To_Lower (Qname)) = "'
										pltPlus:
											(PTsLowerizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (self attr nameUsingContext: self class context);
														yourself))) pltPlus: '" then\n') pltPlus: '\t\tobj.')
										pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' := handler.Parameter_List (1);\n')
										pltPlus: '\tend if;') ]
						ifFalse: [ 
							self
								code:
									((((((((((('\n\tif To_String (To_Lower (Qname)) = "'
										pltPlus:
											(PTsLowerizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (self attr nameUsingContext: self class context);
														yourself))) pltPlus: '" then\n') pltPlus: '\t\tTo_') pltPlus: self ioDomain)
										pltPlus: ' (handler.Parameter_List (1), obj.') pltPlus: (self attr nameUsingContext: self class context))
										pltPlus: ', Handler.Ok);\n') pltPlus: '\t\tif not Handler.Ok then\n')
										pltPlus: '\t\t\tPut_Line ("Warning : Error on data type From " & To_String (Handler.Locator));\n')
										pltPlus: '\t\tend if;\n') pltPlus: '\tend if;') ] ] ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> ioDomain [
	^ ioDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributeXmlEndElementCodeFunction >> ioDomain: aString2 [
	ioDomain := aString2


]
