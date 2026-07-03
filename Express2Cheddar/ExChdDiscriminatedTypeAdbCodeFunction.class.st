"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_adb_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		code : STRING;
		acode : STRING;
		discrim_attr : attribute := typ.discriminant;
		union_attr : attribute := typ.union_attr;
		union_type : defined_type := union_attr.domain.handled;
		union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
		transl_attrs : LIST OF attribute := typ.translated_attributes;
		v : STRING := 'New_' + typ.name;
	END_LOCAL;
	code := 'procedure Initialize (obj : out ' + typ.name + '_Ptr) is\n' 
	+ 'begin\n' 
	+ '\tobj := NULL;\n' 
	+ 'end Initialize;\n \n' 
	+ 'procedure Put(obj : in ' + typ.name + '_Ptr) is\n' 
	+ 'begin\n' 
	+ '\tif (obj /= NULL) then\n';

	REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );

		ALIAS attr FOR transl_attrs [ no];
			acode := explicit_attribute_put ( attr );
			IF ( acode > '' ) THEN
				code := code + '\t\t' + acode + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	code := code + '\t\t' + explicit_attribute_put ( discrim_attr ) + '\n' 
	+ '\t\tput ( ""value: "" );\n' 
	+ '\t\tcase obj.' + discrim_attr.name + ' is \n';

	REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );

		ALIAS union_attr FOR union_attributes [ no];
			ALIAS ada_domain FOR basic_ada_domain ( union_attr.domain ).handled;
				ALIAS element_attributes FOR inherited_explicit_attributes ( ada_domain );
					code := code + '\t\t\twhen ' + union_attr.name + ' => \n';
					REPEAT noi := LOINDEX ( element_attributes ) TO HIINDEX ( element_attributes );
						ALIAS element_attr FOR element_attributes [ noi];
							acode := explicit_attribute_put ( element_attr );
							IF ( acode > '' ) THEN
								code := code + '\t\t\t\t' + acode + '\n';
							END_IF;
						END_ALIAS;
					END_REPEAT;
				END_ALIAS;
			END_ALIAS;
		END_ALIAS;
		code := code + '\n';
	END_REPEAT;
	code := code + '\t\tend case;\n\tend if;\n\tNew_Line;\nend Put;\n\n' 

	+ 'function Copy ( obj : in ' + typ.name + ' ) return ' + typ.ptr_type + ' is\n' 
	+ '\t' + v + ' : ' + typ.ptr_type + ';\n' 
	+ 'begin\n' 
	+ '\t' + v + ' := new ' + typ.name + '''(obj);\n' 
	+ '\treturn (' + v + ');\n' 
	+ 'end Copy;\n\n' 

	+ 'function Copy ( obj : in ' + typ.ptr_type + ' ) return ' + typ.ptr_type + ' is\n' 
	+ 'begin\n' 
	+ '\treturn copy(obj.all);\n' 
	+ 'end Copy;\n\n' 

	+ 'function XML_String(obj : in ' + typ.name + ') return Unbounded_String is\n' 
	+ '\tresult : Unbounded_String;\n' 
	+ 'begin\n' 
	+ '	result := to_unbounded_string(""<' + typ.html_tag + '>"");\n';

	REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );

		ALIAS attr FOR transl_attrs [ no];
			acode := explicit_attribute_xml_writer_code ( 'obj', attr );
			IF ( acode > '' ) THEN
				code := code + '\t\t' + acode + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	code := code + explicit_attribute_xml_writer_code ( 'obj', discrim_attr ) + '\n\n' 

	+ '\tcase obj.' + discrim_attr.name + ' is \n';

	REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );

		ALIAS union_attr FOR union_attributes [ no];
			ALIAS ada_domain FOR basic_ada_domain ( union_attr.domain ).handled;
				ALIAS element_attributes FOR inherited_explicit_attributes ( ada_domain );
					code := code + '\t\twhen ' + union_attr.name + ' => \n';
					REPEAT noi := LOINDEX ( element_attributes ) TO HIINDEX ( element_attributes );
						ALIAS element_attr FOR element_attributes [ noi];
							acode := explicit_attribute_xml_writer_code ( 'obj', element_attr );
							IF ( acode > '' ) THEN
								code := code + '\t\t' + acode + '\n';
							END_IF;
						END_ALIAS;
					END_REPEAT;
				END_ALIAS;
			END_ALIAS;
		END_ALIAS;
		code := code + '\n';
	END_REPEAT;
	code := code + '\tend case;\n' 
	+ '\tresult := result & to_unbounded_string(""</' + typ.html_tag + '>"");\n' 
	+ '\treturn (result);\n' 
	+ 'end XML_String;\n\n' 

	+ 'function XML_String(obj : in ' + typ.name + '_Ptr) return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '	return XML_String(obj.all);\n' 
	+ 'end XML_String;\n\n' 

	+ 'function XML_Ref_String(obj : in ' + typ.name + ') return Unbounded_String is\n' 
	+ '\tresult : Unbounded_String;\n' 
	+ 'begin\n' 
	+ '	raise xml_ref_string_error;\n' 
	+ '	return to_unbounded_string("""");\n' 
	+ 'end XML_Ref_String;\n' 
	+ 'function XML_Ref_String(obj : in ' + typ.name + '_Ptr) return Unbounded_String is\n' 
	+ 'begin\n' 
	+ '	return XML_Ref_String(obj.all);\n' 
	+ 'end XML_Ref_String;\n\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeAdbCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ',
		'code',
		'acode',
		'discrimAttr',
		'unionAttr',
		'unionType',
		'unionAttributes',
		'translAttrs',
		'v'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdbCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdbCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdbCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> acode [
	^ acode


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> acode: aString1 [
	acode := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> discrimAttr [
	^ discrimAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> discrimAttr: aExChdAttribute [
	discrimAttr := aExChdAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeAdbCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self discrimAttr: (self typ discriminantUsingContext: self class context).
	self unionAttr: (self typ unionAttrUsingContext: self class context).
	self unionType: ((self unionAttr domainUsingContext: self class context) handledUsingContext: self class context).
	self
		unionAttributes:
			(PTsInheritedExplicitAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionType;
						yourself)).
	self translAttrs: (self typ translatedAttributesUsingContext: self class context).
	self v: ('New_' pltPlus: (self typ nameUsingContext: self class context)).	" ---------- statements ----------"
	self
		code:
			(((((((((('procedure Initialize (obj : out ' pltPlus: (self typ nameUsingContext: self class context))
				pltPlus: '_Ptr) is\n') pltPlus: 'begin\n') pltPlus: '\tobj := NULL;\n') pltPlus: 'end Initialize;\n \n')
				pltPlus: 'procedure Put(obj : in ') pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '_Ptr) is\n')
				pltPlus: 'begin\n') pltPlus: '\tif (obj /= NULL) then\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no138 | 
			PlatypusCoreAliasStatement
				alias: (self translAttrs pltAt: no138)
				statementsBlock: [ :attr1252 | 
					self
						acode:
							(ExChdExplicitAttributePutFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr1252;
										yourself)).
					self acode > ''
						ifTrue: [ self code: (((self code pltPlus: '\t\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself)).
	self
		code:
			(((((((self code pltPlus: '\t\t')
				pltPlus:
					(ExChdExplicitAttributePutFunction
						invokeFromValues:
							(OrderedCollection new
								add: self discrimAttr;
								yourself))) pltPlus: '\n') pltPlus: '\t\tput ( "value: " );\n') pltPlus: '\t\tcase obj.')
				pltPlus: (self discrimAttr nameUsingContext: self class context)) pltPlus: ' is \n').
	PlatypusCoreRepeatStatement
		repeat: [ :no972 | 
			PlatypusCoreAliasStatement
				alias: (self unionAttributes pltAt: no972)
				statementsBlock: [ :unionAttr2096 | 
					PlatypusCoreAliasStatement
						alias:
							((ExChdBasicAdaDomainFunction
								invokeFromValues:
									(OrderedCollection new
										add: (unionAttr2096 domainUsingContext: self class context);
										yourself)) handledUsingContext: self class context)
						statementsBlock: [ :adaDomain1310 | 
							PlatypusCoreAliasStatement
								alias:
									(PTsInheritedExplicitAttributesFunction
										invokeFromValues:
											(OrderedCollection new
												add: adaDomain1310;
												yourself))
								statementsBlock: [ :elementAttributes2992 | 
									self
										code:
											(((self code pltPlus: '\t\t\twhen ') pltPlus: (unionAttr2096 nameUsingContext: self class context)) pltPlus: ' => \n').
									PlatypusCoreRepeatStatement
										repeat: [ :noi3422 | 
											PlatypusCoreAliasStatement
												alias: (elementAttributes2992 pltAt: noi3422)
												statementsBlock: [ :elementAttr973 | 
													self
														acode:
															(ExChdExplicitAttributePutFunction
																invokeFromValues:
																	(OrderedCollection new
																		add: elementAttr973;
																		yourself)).
													self acode > ''
														ifTrue: [ self code: (((self code pltPlus: '\t\t\t\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
										from:
											(PltLOINDEXFunction
												invokeFromValues:
													(OrderedCollection new
														add: elementAttributes2992;
														yourself))
										to:
											(PltHIINDEXFunction
												invokeFromValues:
													(OrderedCollection new
														add: elementAttributes2992;
														yourself)) ] ] ].
			self code: (self code pltPlus: '\n') ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself)).
	self
		code:
			(((((((((((((((((((((((((((((((((((((self code pltPlus: '\t\tend case;\n\tend if;\n\tNew_Line;\nend Put;\n\n')
				pltPlus: 'function Copy ( obj : in ') pltPlus: (self typ nameUsingContext: self class context))
				pltPlus: ' ) return ') pltPlus: (self typ ptrTypeUsingContext: self class context)) pltPlus: ' is\n') pltPlus: '\t')
				pltPlus: self v) pltPlus: ' : ') pltPlus: (self typ ptrTypeUsingContext: self class context)) pltPlus: ';\n')
				pltPlus: 'begin\n') pltPlus: '\t') pltPlus: self v) pltPlus: ' := new ')
				pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '''(obj);\n') pltPlus: '\treturn (')
				pltPlus: self v) pltPlus: ');\n') pltPlus: 'end Copy;\n\n') pltPlus: 'function Copy ( obj : in ')
				pltPlus: (self typ ptrTypeUsingContext: self class context)) pltPlus: ' ) return ')
				pltPlus: (self typ ptrTypeUsingContext: self class context)) pltPlus: ' is\n') pltPlus: 'begin\n')
				pltPlus: '\treturn copy(obj.all);\n') pltPlus: 'end Copy;\n\n') pltPlus: 'function XML_String(obj : in ')
				pltPlus: (self typ nameUsingContext: self class context)) pltPlus: ') return Unbounded_String is\n')
				pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n') pltPlus: '	result := to_unbounded_string("<')
				pltPlus: (self typ htmlTagUsingContext: self class context)) pltPlus: '>");\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no647 | 
			PlatypusCoreAliasStatement
				alias: (self translAttrs pltAt: no647)
				statementsBlock: [ :attr1761 | 
					self
						acode:
							(ExChdExplicitAttributeXmlWriterCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: 'obj';
										add: attr1761;
										yourself)).
					self acode > ''
						ifTrue: [ self code: (((self code pltPlus: '\t\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself)).
	self
		code:
			(((((self code
				pltPlus:
					(ExChdExplicitAttributeXmlWriterCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: 'obj';
								add: self discrimAttr;
								yourself))) pltPlus: '\n\n') pltPlus: '\tcase obj.')
				pltPlus: (self discrimAttr nameUsingContext: self class context)) pltPlus: ' is \n').
	PlatypusCoreRepeatStatement
		repeat: [ :no767 | 
			PlatypusCoreAliasStatement
				alias: (self unionAttributes pltAt: no767)
				statementsBlock: [ :unionAttr1891 | 
					PlatypusCoreAliasStatement
						alias:
							((ExChdBasicAdaDomainFunction
								invokeFromValues:
									(OrderedCollection new
										add: (unionAttr1891 domainUsingContext: self class context);
										yourself)) handledUsingContext: self class context)
						statementsBlock: [ :adaDomain1100 | 
							PlatypusCoreAliasStatement
								alias:
									(PTsInheritedExplicitAttributesFunction
										invokeFromValues:
											(OrderedCollection new
												add: adaDomain1100;
												yourself))
								statementsBlock: [ :elementAttributes2775 | 
									self
										code:
											(((self code pltPlus: '\t\twhen ') pltPlus: (unionAttr1891 nameUsingContext: self class context)) pltPlus: ' => \n').
									PlatypusCoreRepeatStatement
										repeat: [ :noi3201 | 
											PlatypusCoreAliasStatement
												alias: (elementAttributes2775 pltAt: noi3201)
												statementsBlock: [ :elementAttr747 | 
													self
														acode:
															(ExChdExplicitAttributeXmlWriterCodeFunction
																invokeFromValues:
																	(OrderedCollection new
																		add: 'obj';
																		add: elementAttr747;
																		yourself)).
													self acode > ''
														ifTrue: [ self code: (((self code pltPlus: '\t\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
										from:
											(PltLOINDEXFunction
												invokeFromValues:
													(OrderedCollection new
														add: elementAttributes2775;
														yourself))
										to:
											(PltHIINDEXFunction
												invokeFromValues:
													(OrderedCollection new
														add: elementAttributes2775;
														yourself)) ] ] ].
			self code: (self code pltPlus: '\n') ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself)).
	self
		code:
			((((((((((((((((((((((((((self code pltPlus: '\tend case;\n') pltPlus: '\tresult := result & to_unbounded_string("</')
				pltPlus: (self typ htmlTagUsingContext: self class context)) pltPlus: '>");\n') pltPlus: '\treturn (result);\n')
				pltPlus: 'end XML_String;\n\n') pltPlus: 'function XML_String(obj : in ')
				pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '_Ptr) return Unbounded_String is\n')
				pltPlus: 'begin\n') pltPlus: '	return XML_String(obj.all);\n') pltPlus: 'end XML_String;\n\n')
				pltPlus: 'function XML_Ref_String(obj : in ') pltPlus: (self typ nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: '\tresult : Unbounded_String;\n') pltPlus: 'begin\n')
				pltPlus: '	raise xml_ref_string_error;\n') pltPlus: '	return to_unbounded_string("");\n')
				pltPlus: 'end XML_Ref_String;\n') pltPlus: 'function XML_Ref_String(obj : in ')
				pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '_Ptr) return Unbounded_String is\n')
				pltPlus: 'begin\n') pltPlus: '	return XML_Ref_String(obj.all);\n') pltPlus: 'end XML_Ref_String;\n\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> translAttrs [
	^ translAttrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> translAttrs: aListOfExChdAttribute1 [
	translAttrs := aListOfExChdAttribute1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> typ [
	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionAttr [
	^ unionAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionAttr: aExChdAttribute1 [
	unionAttr := aExChdAttribute1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionAttributes [
	^ unionAttributes


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionAttributes: aListOfExChdAttribute [
	unionAttributes := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionType [
	^ unionType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> unionType: aExChdDefinedType [
	unionType := aExChdDefinedType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> v [
	^ v


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdbCodeFunction >> v: aString2 [
	v := aString2


]
