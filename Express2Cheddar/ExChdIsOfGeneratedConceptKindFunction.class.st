"
<ISO10303-11-EXPRESS>
FUNCTION is_of_generated_concept_kind ( c : dictionary_instance ) : BOOLEAN;
	RETURN ( ( 'CHEDDAR_DOMAINS.ADA_TYPE' IN TYPEOF ( c ) ) OR ( 'RECORD_AND_CLASS.ADA_ENTITY' IN TYPEOF ( c ) ) OR ( 'PACKAGE.PACKAGE_ALIAS' IN TYPEOF ( c ) ) OR ( 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' IN TYPEOF ( c ) ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdIsOfGeneratedConceptKindFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'c'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsOfGeneratedConceptKindFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdIsOfGeneratedConceptKindFunction class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsOfGeneratedConceptKindFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdIsOfGeneratedConceptKindFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdIsOfGeneratedConceptKindFunction >> c [

	^ c


]

{ #category : 'platypus-generated-accessing' }
ExChdIsOfGeneratedConceptKindFunction >> c: aExChdDictionaryInstance [

	c := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdIsOfGeneratedConceptKindFunction >> fromValues: values [

	self c: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdIsOfGeneratedConceptKindFunction >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------"

	^ self return:
		  (((((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
				        add: self c;
				        yourself)) includes: 'CHEDDAR_DOMAINS.ADA_TYPE') or: [
				     (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
						       add: self c;
						       yourself)) includes: 'RECORD_AND_CLASS.ADA_ENTITY' ])
			    or: [
					    (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
							      add: self c;
							      yourself)) includes: 'PACKAGE.PACKAGE_ALIAS' ]) or: [
				   (PltTYPEOFFunction invokeFromValues: (OrderedCollection new
						     add: self c;
						     yourself)) includes:
					   'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' ])


]
