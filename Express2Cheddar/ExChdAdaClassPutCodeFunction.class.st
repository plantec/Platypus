"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_put_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
		acode : STRING;
	END_LOCAL;
	code := 'procedure Put(obj : in ' + cip.name + ') is \nbegin\n';

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			code := code + '\tput(' + sup.name + '(obj));\n';
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			acode := explicit_attribute_put ( attr );
			IF ( acode > '' ) THEN
				code := code + '\t' + acode + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	code := code + 'end Put;\n \n' 
	+ 'procedure Put(obj : in ' + cip.ptr_type + ') is\n' 
	+ 'begin\n' 
	+ '\tPut(Obj.All);\n' 
	+ 'end Put;\n \n';
	code := code + 'procedure Put_Name ( obj : in ' + cip.ptr_type + ') is\n' 
	+ 'begin\n';

	IF has_inherited_attribute_named ( cip, 'name' ) THEN
		code := code + '\tPut ( To_String ( Obj.Name ) );\n';
	ELSE
		code := code + '\tPut ( To_String ( Obj.' + xml_id_name + ' ) );\n';
	END_IF;
	code := code + 'end Put_Name;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaClassPutCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code',
		'acode'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassPutCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassPutCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassPutCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassPutCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> acode [
	^ acode


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> acode: aString1 [
	acode := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassPutCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaClassPutCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code: (('procedure Put(obj : in ' pltPlus: (self cip nameUsingContext: self class context)) pltPlus: ') is \nbegin\n').
	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self cip supertypesUsingContext: self class context);
				yourself)) > 0
		ifTrue: [ 
			PlatypusCoreAliasStatement
				alias:
					(((self cip supertypesUsingContext: self class context)
						pltAt:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self cip supertypesUsingContext: self class context);
										yourself))) handledUsingContext: self class context)
				statementsBlock: [ :sup1737 | 
					self
						code:
							(((self code pltPlus: '\tput(') pltPlus: (sup1737 nameUsingContext: self class context)) pltPlus: '(obj));\n') ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no2092 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no2092)
				statementsBlock: [ :attr4048 | 
					self
						acode:
							(ExChdExplicitAttributePutFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr4048;
										yourself)).
					self acode > ''
						ifTrue: [ self code: (((self code pltPlus: '\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself)).
	self
		code:
			(((((((self code pltPlus: 'end Put;\n \n') pltPlus: 'procedure Put(obj : in ')
				pltPlus: (self cip ptrTypeUsingContext: self class context)) pltPlus: ') is\n') pltPlus: 'begin\n')
				pltPlus: '\tPut(Obj.All);\n') pltPlus: 'end Put;\n \n').
	self
		code:
			((((self code pltPlus: 'procedure Put_Name ( obj : in ') pltPlus: (self cip ptrTypeUsingContext: self class context))
				pltPlus: ') is\n') pltPlus: 'begin\n').
	(PTsHasInheritedAttributeNamedFunction
		invokeFromValues:
			(OrderedCollection new
				add: self cip;
				add: 'name';
				yourself))
		ifTrue: [ self code: (self code pltPlus: '\tPut ( To_String ( Obj.Name ) );\n') ]
		ifFalse: [ self code: (((self code pltPlus: '\tPut ( To_String ( Obj.') pltPlus: 'cheddar_private_id') pltPlus: ' ) );\n') ].
	self code: (self code pltPlus: 'end Put_Name;\n').
	^ self return: self code


]
