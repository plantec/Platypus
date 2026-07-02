"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_xml_io_record_initialize_code ( typ : discriminated_type ) : STRING;
	RETURN ( '\nprocedure Initialize(obj : out ' + typ.name + '_io) is \nbegin ' + discriminated_type_attributes_xml_io_record_initialize_code ( typ ) + '\nend Initialize;\n' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'typ'
	],
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(((('\nprocedure Initialize(obj : out ' pltPlus: (self typ nameUsingContext: self class context))
				pltPlus: '_io) is \nbegin ')
				pltPlus:
					(ExChdDiscriminatedTypeAttributesXmlIoRecordInitializeCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self typ;
								yourself))) pltPlus: '\nend Initialize;\n')


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction >> typ [
	^ typ


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]
