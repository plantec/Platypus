"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_initialize_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
		innerCode : STRING := '';
		attrs : LIST OF attribute;
		init : STRING;
	END_LOCAL;
	code := '\nprocedure Initialize(obj : in out ' + cip.name + ') is \nbegin\n';

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
			innerCode := innerCode + '\tinitialize(' + sup.name + '(obj));\n';
		END_ALIAS;
	END_IF;

	REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );

		ALIAS attr FOR cip.explicit_attributes [ no];
			init := explicit_attribute_initialize ( attr );
			IF ( EXISTS ( init ) AND ( init > '' ) ) THEN
				innerCode := innerCode + '\t' + init + '\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( cip.derived_attributes ) TO HIINDEX ( cip.derived_attributes );

		ALIAS attr FOR cip.derived_attributes [ no];
			init := derived_attribute_initialize ( attr );
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
	#name : #ExChdAdaClassInitializeCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cip',
		'code',
		'innerCode',
		'attrs',
		'init'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassInitializeCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaClassInitializeCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassInitializeCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaClassInitializeCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> attrs [
	^ attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> attrs: aListOfExChdAttribute [
	attrs := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> cip [
	^ cip


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> init [
	^ init


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> init: aString2 [
	init := aString2


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> innerCode [
	^ innerCode


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaClassInitializeCodeFunction >> innerCode: aString1 [
	innerCode := aString1


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaClassInitializeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self innerCode: ''.	" ---------- statements ----------"
	self
		code:
			(('\nprocedure Initialize(obj : in out ' pltPlus: (self cip nameUsingContext: self class context))
				pltPlus: ') is \nbegin\n').
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
				statementsBlock: [ :sup643 | 
					self
						innerCode:
							(((self innerCode pltPlus: '\tinitialize(') pltPlus: (sup643 nameUsingContext: self class context)) pltPlus: '(obj));\n') ] ].
	PlatypusCoreRepeatStatement
		repeat: [ :no1011 | 
			PlatypusCoreAliasStatement
				alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no1011)
				statementsBlock: [ :attr2967 | 
					self
						init:
							(ExChdExplicitAttributeInitializeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr2967;
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
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip explicitAttributesUsingContext: self class context);
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no1677 | 
			PlatypusCoreAliasStatement
				alias: ((self cip derivedAttributesUsingContext: self class context) pltAt: no1677)
				statementsBlock: [ :attr3633 | 
					self
						init:
							(ExChdDerivedAttributeInitializeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr3633;
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
						add: (self cip derivedAttributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self cip derivedAttributesUsingContext: self class context);
						yourself)).
	self innerCode = ''
		ifTrue: [ self innerCode: '\tnull;\n' ].
	self code: ((self code pltPlus: self innerCode) pltPlus: 'end Initialize;\n').
	^ self return: self code


]
