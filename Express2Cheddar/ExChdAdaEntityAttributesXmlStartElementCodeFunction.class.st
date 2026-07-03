"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_attributes_xml_start_element_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING := '';
		s : STRING;
	END_LOCAL;

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			code := code + ada_entity_attributes_xml_start_element_code ( sup );
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			s := explicit_attribute_xml_start_element_code ( attr );
			IF ( s > '' ) THEN
				code := code + s;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityAttributesXmlStartElementCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code',
		's'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> invoke [
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
				statementsBlock: [ :sup2793 | 
					self
						code:
							(self code
								pltPlus:
									(ExChdAdaEntityAttributesXmlStartElementCodeFunction
										invokeFromValues:
											(OrderedCollection new
												add: sup2793;
												yourself))) ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no1692 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no1692)
				statementsBlock: [ :attr3648 | 
					self
						s:
							(ExChdExplicitAttributeXmlStartElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr3648;
										yourself)).
					self s > ''
						ifTrue: [ self code: (self code pltPlus: self s) ] ] ]
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
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> s [
	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlStartElementCodeFunction >> s: aString1 [
	s := aString1


]
