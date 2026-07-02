"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_attributes_xml_end_element_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		code : STRING := '';
		s : STRING;
		discrim_attr : attribute := typ.discriminant;
		attrs : LIST OF attribute := typ.tail_attributes + typ.translated_attributes;
	END_LOCAL;
	code := code + explicit_attribute_xml_end_element_code ( discrim_attr ) + '\n';

	REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );

		ALIAS attr FOR attrs [ no];
			s := explicit_attribute_xml_end_element_code ( attr );
			IF ( s > '' ) THEN
				code := code + '\n' 
				+ s;
			END_IF;
		END_ALIAS;
	END_REPEAT;

	IF ( code = '' ) THEN
		code := '\tnull;\n';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'typ',
		'code',
		's',
		'discrimAttr',
		'attrs'
	],
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> attrs [
	^ attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> attrs: aListOfExChdAttribute [
	attrs := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> discrimAttr [
	^ discrimAttr


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> discrimAttr: aExChdAttribute [
	discrimAttr := aExChdAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self discrimAttr: (self typ discriminantUsingContext: self class context).
	self
		attrs:
			((self typ tailAttributesUsingContext: self class context)
				pltPlus: (self typ translatedAttributesUsingContext: self class context)).	" ---------- statements ----------"
	self
		code:
			((self code
				pltPlus:
					(ExChdExplicitAttributeXmlEndElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: self discrimAttr;
								yourself))) pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no1233 | 
			PlatypusCoreAliasStatement
				alias: (self attrs pltAt: no1233)
				statementsBlock: [ :attr2343 | 
					self
						s:
							(ExChdExplicitAttributeXmlEndElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr2343;
										yourself)).
					self s > ''
						ifTrue: [ self code: ((self code pltPlus: '\n') pltPlus: self s) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attrs;
						yourself)).
	self code = ''
		ifTrue: [ self code: '\tnull;\n' ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> s [
	^ s


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> s: aString1 [
	s := aString1


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> typ [
	^ typ


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]
