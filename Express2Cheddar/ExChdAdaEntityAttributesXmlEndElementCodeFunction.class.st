"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_attributes_xml_end_element_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING := '';
		s : STRING;
	END_LOCAL;

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			code := code + ada_entity_attributes_xml_end_element_code ( sup );
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			s := explicit_attribute_xml_end_element_code ( attr );
			IF ( s > '' ) THEN
				code := code + '\n' 
				+ s;
			END_IF;
		END_ALIAS;
	END_REPEAT;

	IF ( code = '' ) THEN
		code := '\tnull;\n';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaEntityAttributesXmlEndElementCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code',
		's'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.	" ---------- statements ----------"
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
				statementsBlock: [ :sup2241 | 
					self
						code:
							(self code
								pltPlus:
									(ExChdAdaEntityAttributesXmlEndElementCodeFunction
										invokeFromValues:
											(OrderedCollection new
												add: sup2241;
												yourself))) ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no1147 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no1147)
				statementsBlock: [ :attr3103 | 
					self
						s:
							(ExChdExplicitAttributeXmlEndElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr3103;
										yourself)).
					self s > ''
						ifTrue: [ self code: ((self code pltPlus: '\n') pltPlus: self s) ] ] ]
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
	self code = ''
		ifTrue: [ self code: '\tnull;\n' ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> s [
	^ s


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlEndElementCodeFunction >> s: aString1 [
	s := aString1


]
