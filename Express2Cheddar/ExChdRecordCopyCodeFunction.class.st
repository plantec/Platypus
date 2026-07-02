"
<ISO10303-11-EXPRESS>
FUNCTION record_copy_code ( cip : record ) : STRING;
	LOCAL 
		code : STRING;
		v : STRING := 'New_' + cip.name;
	END_LOCAL;
	code := 'function Copy ( obj : in ' + cip.name + ' ) return ' + cip.ptr_type + ' is\n' 
	+ '\t' + v + ' : ' + cip.ptr_type + ';\n' 
	+ 'begin\n' 
	+ '\t' + v + ' := new ' + cip.name + '''(obj);\n';
	code := code + '\treturn (' + v + ');\n';
	code := code + 'end Copy;\n\n' 

	+ 'function Copy ( obj : in ' + cip.ptr_type + ' ) return ' + cip.ptr_type + ' is\n' 
	+ 'begin\n' 
	+ '\treturn copy(obj.all);\n' 
	+ 'end Copy;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdRecordCopyCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code',
		'v'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordCopyCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRecordCopyCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordCopyCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordCopyCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> cip: aExChdRecord [
	cip := aExChdRecord


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdRecordCopyCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self v: ('New_' pltPlus: (self cip nameUsingContext: self class context)).	" ---------- statements ----------"
	self
		code:
			((((((((((((((('function Copy ( obj : in ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ' ) return ') pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ' is\n') pltPlus: '\t')
				pltPlus: self v) pltPlus: ' : ') pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ';\n')
				pltPlus: 'begin\n') pltPlus: '\t') pltPlus: self v) pltPlus: ' := new ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '''(obj);\n').
	self code: (((self code pltPlus: '\treturn (') pltPlus: self v) pltPlus: ');\n').
	self
		code:
			(((((((((self code pltPlus: 'end Copy;\n\n') pltPlus: 'function Copy ( obj : in ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ' ) return ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ' is\n') pltPlus: 'begin\n')
				pltPlus: '\treturn copy(obj.all);\n') pltPlus: 'end Copy;\n').
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> v [
	^ v


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordCopyCodeFunction >> v: aString1 [
	v := aString1


]
