"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_attributes_xml_io_record_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING := '';
		attrcode : STRING;
	END_LOCAL;

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			code := code + ada_entity_attributes_xml_io_record_code ( sup );
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			attrcode := explicit_attribute_xml_io_record_code ( attr );
			code := code + attrcode;
		END_ALIAS;
	END_REPEAT;

	IF ( code = '' ) THEN
		code := '\tnull;';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityAttributesXmlIoRecordCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code',
		'attrcode'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> attrcode [
	^ attrcode


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> attrcode: aString1 [
	attrcode := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityAttributesXmlIoRecordCodeFunction >> invoke [
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
				statementsBlock: [ :sup1695 | 
					self
						code:
							(self code
								pltPlus:
									(ExChdAdaEntityAttributesXmlIoRecordCodeFunction
										invokeFromValues:
											(OrderedCollection new
												add: sup1695;
												yourself))) ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no597 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no597)
				statementsBlock: [ :attr2553 | 
					self
						attrcode:
							(ExChdExplicitAttributeXmlIoRecordCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr2553;
										yourself)).
					self code: (self code pltPlus: self attrcode) ] ]
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
		ifTrue: [ self code: '\tnull;' ].
	^ self return: self code


]
