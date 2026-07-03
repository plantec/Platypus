"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_xml_io_record_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		code : STRING := '';
		discrim_attr : attribute := typ.discriminant;
		discrim_type : entity_instance := discrim_attr.domain.handled;
		union_attr : attribute := typ.union_attr;
		union_type : defined_type := union_attr.domain.handled;
		union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
		tails_attrs : LIST OF attribute := typ.tail_attributes;
		transl_attrs : LIST OF attribute := typ.translated_attributes;
	END_LOCAL;
	code := '\ntype ' + typ.name + '_io is record' + '\n\t' + discrim_attr.name + ' : ' + discrim_type.name + ';';

	REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );

		ALIAS attr FOR transl_attrs [ no];
			code := code + explicit_attribute_xml_io_record_code ( attr );
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( tails_attrs ) TO HIINDEX ( tails_attrs );

		ALIAS attr FOR tails_attrs [ no];
			code := code + explicit_attribute_xml_io_record_code ( attr );
		END_ALIAS;
	END_REPEAT;
	code := code + '\nend record;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeXmlIoRecordCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ',
		'code',
		'discrimAttr',
		'discrimType',
		'unionAttr',
		'unionType',
		'unionAttributes',
		'tailsAttrs',
		'translAttrs'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> discrimAttr [
	^ discrimAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> discrimAttr: aExChdAttribute [
	discrimAttr := aExChdAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> discrimType [
	^ discrimType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> discrimType: aExChdEntityInstance [
	discrimType := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self discrimAttr: (self typ discriminantUsingContext: self class context).
	self discrimType: ((self discrimAttr domainUsingContext: self class context) handledUsingContext: self class context).
	self unionAttr: (self typ unionAttrUsingContext: self class context).
	self unionType: ((self unionAttr domainUsingContext: self class context) handledUsingContext: self class context).
	self
		unionAttributes:
			(PTsInheritedExplicitAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionType;
						yourself)).
	self tailsAttrs: (self typ tailAttributesUsingContext: self class context).
	self translAttrs: (self typ translatedAttributesUsingContext: self class context).	" ---------- statements ----------"
	self
		code:
			((((((('\ntype ' pltPlus: (self typ nameUsingContext: self class context)) pltPlus: '_io is record') pltPlus: '\n\t')
				pltPlus: (self discrimAttr nameUsingContext: self class context)) pltPlus: ' : ')
				pltPlus: (self discrimType nameUsingContext: self class context)) pltPlus: ';').
	PlatypusCoreRepeatStatement
		repeat: [ :no15 | 
			PlatypusCoreAliasStatement
				alias: (self translAttrs pltAt: no15)
				statementsBlock: [ :attr1129 | 
					self
						code:
							(self code
								pltPlus:
									(ExChdExplicitAttributeXmlIoRecordCodeFunction
										invokeFromValues:
											(OrderedCollection new
												add: attr1129;
												yourself))) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self translAttrs;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no2247 | 
			PlatypusCoreAliasStatement
				alias: (self tailsAttrs pltAt: no2247)
				statementsBlock: [ :attr3361 | 
					self
						code:
							(self code
								pltPlus:
									(ExChdExplicitAttributeXmlIoRecordCodeFunction
										invokeFromValues:
											(OrderedCollection new
												add: attr3361;
												yourself))) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self tailsAttrs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self tailsAttrs;
						yourself)).
	self code: (self code pltPlus: '\nend record;\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> tailsAttrs [
	^ tailsAttrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> tailsAttrs: aListOfExChdAttribute1 [
	tailsAttrs := aListOfExChdAttribute1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> translAttrs [
	^ translAttrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> translAttrs: aListOfExChdAttribute2 [
	translAttrs := aListOfExChdAttribute2
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute2 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> typ [
	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionAttr [
	^ unionAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionAttr: aExChdAttribute1 [
	unionAttr := aExChdAttribute1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionAttributes [
	^ unionAttributes


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionAttributes: aListOfExChdAttribute [
	unionAttributes := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionType [
	^ unionType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeXmlIoRecordCodeFunction >> unionType: aExChdDefinedType [
	unionType := aExChdDefinedType


]
