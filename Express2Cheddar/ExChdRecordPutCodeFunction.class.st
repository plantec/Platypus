"
<ISO10303-11-EXPRESS>
FUNCTION record_put_code ( rec : record ) : STRING;
	LOCAL 
		code : STRING;
		acode : STRING;
	END_LOCAL;
	code := 'procedure Put(obj : in ' + rec.name + ') is \nbegin\n';

	REPEAT no := LOINDEX ( rec.explicit_attributes ) TO HIINDEX ( rec.explicit_attributes );

		ALIAS attr FOR rec.explicit_attributes [ no];
			acode := explicit_attribute_put ( attr );
			IF ( acode > '' ) THEN
				code := code + '\t' + acode + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	code := code + 'end Put;\n \n' 
	+ 'procedure Put(obj : in ' + rec.ptr_type + ') is\n' 
	+ 'begin\n' 
	+ '\tPut(Obj.All);\n' 
	+ 'end Put;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordPutCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'rec',
		'code',
		'acode'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordPutCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordPutCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordPutCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordPutCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> acode [
	^ acode


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> acode: aString1 [
	acode := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> fromValues: values [
	self rec: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdRecordPutCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		code: (('procedure Put(obj : in ' pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ') is \nbegin\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no2022 | 
			PlatypusCoreAliasStatement
				alias: ((self rec explicitAttributesUsingContext: self class context) pltAt: no2022)
				statementsBlock: [ :attr3978 | 
					self
						acode:
							(ExChdExplicitAttributePutFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr3978;
										yourself)).
					self acode > ''
						ifTrue: [ self code: (((self code pltPlus: '\t') pltPlus: self acode) pltPlus: '\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self rec explicitAttributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self rec explicitAttributesUsingContext: self class context);
						yourself)).
	self
		code:
			(((((((self code pltPlus: 'end Put;\n \n') pltPlus: 'procedure Put(obj : in ')
				pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ') is\n') pltPlus: 'begin\n')
				pltPlus: '\tPut(Obj.All);\n') pltPlus: 'end Put;\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> rec [
	^ rec


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordPutCodeFunction >> rec: aExChdRecord [
	rec := aExChdRecord


]
