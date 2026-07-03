"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_copy_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
		v : STRING := 'New_' + cip.name;
		local_sup : entity_definition := local_root_supertype_of ( cip );
	END_LOCAL;
	code := 'function Copy ( obj : in ' + cip.name + ' ) return ' + local_sup.ptr_type + ' is\n' 
	+ '\t' + v + ' : ' + cip.ptr_type + ';\n' 
	+ 'begin\n' 
	+ '\t' + v + ' := new ' + cip.name + '''(obj);\n';

	IF local_sup.ptr_type <> cip.ptr_type THEN
		code := code + '\treturn ' + local_sup.ptr_type + '(' + v + ');\n';
	ELSE
		code := code + '\treturn (' + v + ');\n';
	END_IF;
	code := code + 'end Copy;\n\n' 

	+ 'function Copy ( obj : in ' + cip.ptr_type + ' ) return ' + local_sup.ptr_type + ' is\n' 
	+ 'begin\n' 
	+ '\treturn copy(obj.all);\n' 
	+ 'end Copy;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassCopyCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code',
		'v',
		'localSup'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassCopyCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassCopyCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassCopyCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassCopyCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaClassCopyCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self v: ('New_' pltPlus: (self cip nameUsingContext: self class context)).
	self
		localSup:
			(PTsLocalRootSupertypeOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self cip;
						yourself)).	" ---------- statements ----------"
	self
		code:
			((((((((((((((('function Copy ( obj : in ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ' ) return ') pltPlus: (self localSup ptrTypeUsingContext: self class context)) pltPlus: ' is\n')
				pltPlus: '\t') pltPlus: self v) pltPlus: ' : ') pltPlus: (self cip ptrTypeUsingContext: self class context))
				pltPlus: ';\n') pltPlus: 'begin\n') pltPlus: '\t') pltPlus: self v) pltPlus: ' := new ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '''(obj);\n').
	(self localSup ptrTypeUsingContext: self class context) ~= (self cip ptrTypeUsingContext: self class context)
		ifTrue: [ 
			self
				code:
					(((((self code pltPlus: '\treturn ') pltPlus: (self localSup ptrTypeUsingContext: self class context)) pltPlus: '(')
						pltPlus: self v) pltPlus: ');\n') ]
		ifFalse: [ self code: (((self code pltPlus: '\treturn (') pltPlus: self v) pltPlus: ');\n') ].
	self
		code:
			(((((((((self code pltPlus: 'end Copy;\n\n') pltPlus: 'function Copy ( obj : in ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ' ) return ')
				pltPlus: (self localSup ptrTypeUsingContext: self class context)) pltPlus: ' is\n') pltPlus: 'begin\n')
				pltPlus: '\treturn copy(obj.all);\n') pltPlus: 'end Copy;\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> localSup [
	^ localSup


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> localSup: aExChdEntityDefinition [
	localSup := aExChdEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> v [
	^ v


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassCopyCodeFunction >> v: aString1 [
	v := aString1


]
