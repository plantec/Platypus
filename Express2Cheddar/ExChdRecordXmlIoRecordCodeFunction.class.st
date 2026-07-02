"
<ISO10303-11-EXPRESS>
FUNCTION record_xml_io_record_code ( rec : record ) : STRING;
	RETURN ( '\ntype ' + rec.name + '_io is record' + ada_entity_attributes_xml_io_record_code ( rec ) + '\nend record;\n' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdRecordXmlIoRecordCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'rec'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordXmlIoRecordCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRecordXmlIoRecordCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordXmlIoRecordCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordXmlIoRecordCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordXmlIoRecordCodeFunction >> fromValues: values [
	self rec: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdRecordXmlIoRecordCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(((('\ntype ' pltPlus: (self rec nameUsingContext: self class context)) pltPlus: '_io is record')
				pltPlus:
					(ExChdAdaEntityAttributesXmlIoRecordCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self rec;
								yourself))) pltPlus: '\nend record;\n')


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordXmlIoRecordCodeFunction >> rec [
	^ rec


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordXmlIoRecordCodeFunction >> rec: aExChdRecord [
	rec := aExChdRecord


]
