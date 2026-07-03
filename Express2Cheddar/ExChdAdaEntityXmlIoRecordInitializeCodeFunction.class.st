"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_xml_io_record_initialize_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING := ada_entity_attributes_xml_io_record_initialize_code ( cip );
	END_LOCAL;

	IF ( code = '' ) THEN
		code := '\tnull;';
	END_IF;
	RETURN ( '\nprocedure Initialize(obj : out ' + cip.name + '_io) is \nbegin ' + code + '\nend Initialize;\n' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityXmlIoRecordInitializeCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> cip [

	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> cip: aExChdAdaClass [

	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> code [

	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> code: aString [

	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> fromValues: values [

	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityXmlIoRecordInitializeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code:
		(ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction
			 invokeFromValues: (OrderedCollection new
					  add: self cip;
					  yourself)). " ---------- statements ----------"
	self code = '' ifTrue: [ self code: '\tnull;' ].
	^ self return: (((('\nprocedure Initialize(obj : out ' pltPlus:
			      (self cip nameUsingContext: self class context)) pltPlus:
			     '_io) is \nbegin ') pltPlus: self code) pltPlus:
			   '\nend Initialize;\n')


]
