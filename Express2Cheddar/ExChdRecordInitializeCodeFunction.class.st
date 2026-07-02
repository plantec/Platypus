"
<ISO10303-11-EXPRESS>
FUNCTION record_initialize_code ( rec : record ) : STRING;
	LOCAL 
		code : STRING;
		innerCode : STRING := '';
		attrs : LIST OF attribute;
		init : STRING;
	END_LOCAL;
	code := '\nprocedure Initialize(obj : out ' + rec.name + ') is \nbegin\n';

	REPEAT no := LOINDEX ( rec.explicit_attributes ) TO HIINDEX ( rec.explicit_attributes );

		ALIAS attr FOR rec.explicit_attributes [ no];
			init := explicit_attribute_initialize ( attr );
			IF ( EXISTS ( init ) AND ( init > '' ) ) THEN
				innerCode := innerCode + '\t' + init + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;

	IF innerCode = '' THEN
		innerCode := '\tnull;\n';
	END_IF;
	code := code + innerCode + 'end Initialize;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdRecordInitializeCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'rec',
		'code',
		'innerCode',
		'attrs',
		'init'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordInitializeCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRecordInitializeCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordInitializeCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordInitializeCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> attrs [
	^ attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> attrs: aListOfExChdAttribute [
	attrs := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> fromValues: values [
	self rec: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> init [
	^ init


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> init: aString2 [
	init := aString2


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> innerCode [
	^ innerCode


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> innerCode: aString1 [
	innerCode := aString1


]

{ #category : #'platypus-generated-invoking' }
ExChdRecordInitializeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self innerCode: ''.	" ---------- statements ----------"
	self
		code:
			(('\nprocedure Initialize(obj : out ' pltPlus: (self rec nameUsingContext: self class context))
				pltPlus: ') is \nbegin\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no1681 | 
			PlatypusCoreAliasStatement
				alias: ((self rec explicitAttributesUsingContext: self class context) pltAt: no1681)
				statementsBlock: [ :attr3637 | 
					self
						init:
							(ExChdExplicitAttributeInitializeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr3637;
										yourself)).
					((PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: self init;
								yourself)) and: [ self init > '' ])
						ifTrue: [ self innerCode: (((self innerCode pltPlus: '\t') pltPlus: self init) pltPlus: '\n') ] ] ]
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
	self innerCode = ''
		ifTrue: [ self innerCode: '\tnull;\n' ].
	self code: ((self code pltPlus: self innerCode) pltPlus: 'end Initialize;\n').
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> rec [
	^ rec


]

{ #category : #'platypus-generated-accessing' }
ExChdRecordInitializeCodeFunction >> rec: aExChdRecord [
	rec := aExChdRecord


]
