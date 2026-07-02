"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_adb_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
	END_LOCAL;
	code := '\n' 
	+ '-- --------= ' + cip.name + ' =--------\n' 
	+ ada_class_initialize_code ( cip ) + '\n' 
	+ ada_class_copy_code ( cip ) + '\n' 
	+ ada_class_put_code ( cip ) + '\n';

	IF is_named_object ( cip ) THEN
		code := code + ada_class_get_name_code ( cip ) + '\n';
	END_IF;
	code := code + ada_class_typeof_code ( cip ) + '\n' 
	+ ada_class_xml_writer_code ( cip ) + '\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaClassAdbCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassAdbCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassAdbCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassAdbCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassAdbCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassAdbCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassAdbCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassAdbCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassAdbCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassAdbCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaClassAdbCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code:
			((((((((('\n' pltPlus: '-- --------= ') pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ' =--------\n')
				pltPlus:
					(ExChdAdaClassInitializeCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\n')
				pltPlus:
					(ExChdAdaClassCopyCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\n')
				pltPlus:
					(ExChdAdaClassPutCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\n').
	(ExChdIsNamedObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: self cip;
				yourself))
		ifTrue: [ 
			self
				code:
					((self code
						pltPlus:
							(ExChdAdaClassGetNameCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: self cip;
										yourself))) pltPlus: '\n') ].
	self
		code:
			((((self code
				pltPlus:
					(ExChdAdaClassTypeofCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\n')
				pltPlus:
					(ExChdAdaClassXmlWriterCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self cip;
								yourself))) pltPlus: '\n').
	^ self return: self code


]
