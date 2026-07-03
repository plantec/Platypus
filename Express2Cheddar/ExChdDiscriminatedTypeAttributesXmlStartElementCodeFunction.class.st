"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_attributes_xml_start_element_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		code : STRING := '';
		s : STRING;
		discrim_attr : attribute := typ.discriminant;
		attrs : LIST OF attribute := typ.tail_attributes + typ.translated_attributes;
	END_LOCAL;
	code := explicit_attribute_xml_start_element_code ( discrim_attr );

	REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );

		ALIAS attr FOR attrs [ no];
			s := explicit_attribute_xml_start_element_code ( attr );
			IF ( s > '' ) THEN
				code := code + '\n' 
				+ s;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ',
		'code',
		's',
		'discrimAttr',
		'attrs'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> attrs [
	^ attrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> attrs: aListOfExChdAttribute [
	attrs := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> discrimAttr [
	^ discrimAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> discrimAttr: aExChdAttribute [
	discrimAttr := aExChdAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self discrimAttr: (self typ discriminantUsingContext: self class context).
	self
		attrs:
			((self typ tailAttributesUsingContext: self class context)
				pltPlus: (self typ translatedAttributesUsingContext: self class context)).	" ---------- statements ----------"
	self
		code:
			(ExChdExplicitAttributeXmlStartElementCodeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self discrimAttr;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no1420 | 
			PlatypusCoreAliasStatement
				alias: (self attrs pltAt: no1420)
				statementsBlock: [ :attr2530 | 
					self
						s:
							(ExChdExplicitAttributeXmlStartElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: attr2530;
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
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> s [
	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> s: aString1 [
	s := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> typ [
	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]
