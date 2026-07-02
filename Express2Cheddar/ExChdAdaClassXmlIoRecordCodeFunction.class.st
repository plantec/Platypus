"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_xml_io_record_code ( cip : ada_class ) : STRING;
	RETURN ( '\ntype ' + cip.name + '_io is record' + ada_entity_attributes_xml_io_record_code ( cip ) + '\nend record;' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaClassXmlIoRecordCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlIoRecordCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassXmlIoRecordCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlIoRecordCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassXmlIoRecordCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlIoRecordCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlIoRecordCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassXmlIoRecordCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaClassXmlIoRecordCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(((('\ntype ' pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '_io is record')
				pltPlus:
					(ExChdAdaEntityAttributesXmlIoRecordCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\nend record;')


]
