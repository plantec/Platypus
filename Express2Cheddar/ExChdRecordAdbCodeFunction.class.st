"
<ISO10303-11-EXPRESS>
FUNCTION record_adb_code ( rec : record ) : STRING;
	LOCAL 
		code : STRING;
	END_LOCAL;
	code := '\n' 
	+ '-- --------= ' + rec.name + ' =--------\n' 
	+ record_initialize_code ( rec ) + '\n' 
	+ record_put_code ( rec ) + '\n' 
	+ record_xml_writer_code ( rec ) + '\n' 
	+ record_copy_code ( rec ) + '\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordAdbCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'rec',
		'code'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdbCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordAdbCodeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdbCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdbCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdbCodeFunction >> code [

	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdbCodeFunction >> code: aString [

	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdbCodeFunction >> fromValues: values [

	self rec: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdRecordAdbCodeFunction >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------"

	self code: ((((((((((('\n' pltPlus: '-- --------= ') pltPlus:
			          (self rec nameUsingContext: self class context))
			         pltPlus: ' =--------\n') pltPlus:
			        (ExChdRecordInitializeCodeFunction invokeFromValues:
				         (OrderedCollection new
					          add: self rec;
					          yourself))) pltPlus: '\n') pltPlus:
			      (ExChdRecordPutCodeFunction invokeFromValues:
				       (OrderedCollection new
					        add: self rec;
					        yourself))) pltPlus: '\n') pltPlus:
			    (ExChdRecordXmlWriterCodeFunction invokeFromValues:
				     (OrderedCollection new
					      add: self rec;
					      yourself))) pltPlus: '\n') pltPlus:
			  (ExChdRecordCopyCodeFunction invokeFromValues:
				   (OrderedCollection new
					    add: self rec;
					    yourself))) pltPlus: '\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdbCodeFunction >> rec [

	^ rec


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdbCodeFunction >> rec: aExChdRecord [

	rec := aExChdRecord


]
