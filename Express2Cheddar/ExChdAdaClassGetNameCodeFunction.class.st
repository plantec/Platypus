"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_get_name_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
	END_LOCAL;
	code := 'function Get_Name (obj : in ' + cip.name + ') return Unbounded_String is\n' 
	+ 'begin\n';

	IF has_inherited_attribute_named ( cip, 'name' ) THEN
		code := code + '	return obj.name;\n';
	ELSE
		code := code + '	return obj.' + xml_id_name + ';\n';
	END_IF;
	code := code + 'end Get_Name;\n\n' 

	+ 'function Get_Name (obj : in ' + cip.name + '_ptr) return Unbounded_String is\n' 
	+ 'begin\n';

	IF has_inherited_attribute_named ( cip, 'name' ) THEN
		code := code + '	return obj.name;\n';
	ELSE
		code := code + '	return obj.' + xml_id_name + ';\n';
	END_IF;
	code := code + 'end Get_Name;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassGetNameCodeFunction',
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
ExChdAdaClassGetNameCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassGetNameCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassGetNameCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassGetNameCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassGetNameCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassGetNameCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassGetNameCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassGetNameCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassGetNameCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaClassGetNameCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code:
			((('function Get_Name (obj : in ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ') return Unbounded_String is\n') pltPlus: 'begin\n').
	(PTsHasInheritedAttributeNamedFunction
		invokeFromValues:
			(OrderedCollection new
				add: self cip;
				add: 'name';
				yourself))
		ifTrue: [ self code: (self code pltPlus: '	return obj.name;\n') ]
		ifFalse: [ self code: (((self code pltPlus: '	return obj.') pltPlus: 'cheddar_private_id') pltPlus: ';\n') ].
	self
		code:
			(((((self code pltPlus: 'end Get_Name;\n\n') pltPlus: 'function Get_Name (obj : in ')
				pltPlus: (self cip nameUsingContext: self class context)) pltPlus: '_ptr) return Unbounded_String is\n')
				pltPlus: 'begin\n').
	(PTsHasInheritedAttributeNamedFunction
		invokeFromValues:
			(OrderedCollection new
				add: self cip;
				add: 'name';
				yourself))
		ifTrue: [ self code: (self code pltPlus: '	return obj.name;\n') ]
		ifFalse: [ self code: (((self code pltPlus: '	return obj.') pltPlus: 'cheddar_private_id') pltPlus: ';\n') ].
	self code: (self code pltPlus: 'end Get_Name;\n').
	^ self return: self code


]
