"
<ISO10303-11-EXPRESS>
FUNCTION is_generic_object ( e : entity_instance ) : BOOLEAN;

	IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) ) THEN
		RETURN ( inherits_from_entity_named ( e, 'generic_object' ) );
	END_IF;
	RETURN ( false );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdIsGenericObjectFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsGenericObjectFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdIsGenericObjectFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsGenericObjectFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsGenericObjectFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdIsGenericObjectFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdIsGenericObjectFunction >> e: aExChdEntityInstance [
	e := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdIsGenericObjectFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdIsGenericObjectFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
		ifTrue: [ 
			^ self
				return:
					(PTsInheritsFromEntityNamedFunction
						invokeFromValues:
							(OrderedCollection new
								add: self e;
								add: 'generic_object';
								yourself)) ].
	^ self return: false


]
