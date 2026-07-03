"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_attributes_xml_io_record_initialize_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING := '';
		s : STRING;
	END_LOCAL;

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			code := code + ada_entity_attributes_xml_io_record_initialize_code ( sup );
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			s := explicit_attribute_xml_io_record_initialize_code ( attr );
			IF ( s > '' ) THEN
				code := code + '\n' 
				+ s;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction',
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
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> cip [

	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> cip: aExChdAdaClass [

	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> code [

	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> code: aString [

	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> fromValues: values [

	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''. " ---------- statements ----------"
	(PltSIZEOFFunction invokeFromValues: (OrderedCollection new
			  add: (self cip supertypesUsingContext: self class context);
			  yourself)) > 0 ifTrue: [
			PlatypusCoreAliasStatement
				alias:
					(((self cip supertypesUsingContext: self class context) pltAt:
						  (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
								    add: (self cip supertypesUsingContext: self class context);
								    yourself))) handledUsingContext: self class context)
				statementsBlock: [ :sup1326865 |
						self code: (self code pltPlus:
								 (ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction
									  invokeFromValues: (OrderedCollection new
											   add: sup1326865;
											   yourself))) ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no3710495 |
				PlatypusCoreAliasStatement
					alias:
						((self cip explicitAttributesUsingContext: self class context)
							 pltAt: no3710495)
					statementsBlock: [ :attr1383895 |
							self s:
								(ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction
									 invokeFromValues: (OrderedCollection new
											  add: attr1383895;
											  yourself)).
							self s > '' ifTrue: [
								self code: ((self code pltPlus: '\n') pltPlus: self s) ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add:
						  (self cip explicitAttributesUsingContext: self class context);
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add:
						  (self cip explicitAttributesUsingContext: self class context);
					  yourself)).
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> s [

	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction >> s: aString1 [

	s := aString1


]
