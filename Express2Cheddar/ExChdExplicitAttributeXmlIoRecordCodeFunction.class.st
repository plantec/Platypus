"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_xml_io_record_code ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING := '';
		domain : entity_instance := basic_ada_domain ( attr.domain );
		init : STRING := domain.init_value;
	END_LOCAL;

	IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( domain.handled ) ) THEN
		RETURN ( ada_entity_attributes_xml_io_record_code ( domain.handled ) );
	END_IF;

	IF NOT is_generic_object ( domain.handled ) THEN

		IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) OR EXISTS ( init ) THEN
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
				code := '\t' + attr.name + ' : ' + domain.ada_ref_ident + ';';
			ELSE
				IF ( init = 'empty_string' ) THEN
					code := '\t' + attr.name + ' : Unbounded_String;';
				ELSE
					IF ( lowerize ( init ) = 'false' ) THEN
						code := '\t' + attr.name + ' : Boolean;';
					ELSE
						IF ( init = '0' ) THEN
							code := '\t' + attr.name + ' : Integer;';
						ELSE
							code := '\t' + attr.name + ' : Double;';
						END_IF;
					END_IF;
				END_IF;
			END_IF;
		END_IF;
	ELSE
		code := '\t' + attr.name + ' : Unbounded_String;';
	END_IF;

	IF ( code > '' ) THEN
		code := '\n' 
		+ code;
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdExplicitAttributeXmlIoRecordCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'attr',
		'code',
		'domain',
		'init'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlIoRecordCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlIoRecordCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlIoRecordCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> attr [
	^ attr


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> init [
	^ init


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> init: aString1 [
	init := aString1


]

{ #category : 'platypus-generated-invoking' }
ExChdExplicitAttributeXmlIoRecordCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self
		domain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr domainUsingContext: self class context);
						yourself)).
	self init: (self domain initValueUsingContext: self class context).	" ---------- statements ----------"
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) includes: 'RECORD_AND_CLASS.RECORD')
		ifTrue: [ 
			^ self
				return:
					(ExChdAdaEntityAttributesXmlIoRecordCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self domain handledUsingContext: self class context);
								yourself)) ].
	(ExChdIsGenericObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) not
		ifTrue: [ 
			(((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self domain handledUsingContext: self class context);
						yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
				or: [ 
					PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: self init;
								yourself) ])
				ifTrue: [ 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self domain handledUsingContext: self class context);
								yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
						ifTrue: [ 
							self
								code:
									(((('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : ')
										pltPlus: (self domain adaRefIdentUsingContext: self class context)) pltPlus: ';') ]
						ifFalse: [ 
							self init = 'empty_string'
								ifTrue: [ self code: (('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : Unbounded_String;') ]
								ifFalse: [ 
									(PTsLowerizeFunction
										invokeFromValues:
											(OrderedCollection new
												add: self init;
												yourself)) = 'false'
										ifTrue: [ self code: (('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : Boolean;') ]
										ifFalse: [ 
											self init = '0'
												ifTrue: [ self code: (('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : Integer;') ]
												ifFalse: [ self code: (('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : Double;') ] ] ] ] ] ]
		ifFalse: [ self code: (('\t' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' : Unbounded_String;') ].
	self code > ''
		ifTrue: [ self code: ('\n' pltPlus: self code) ].
	^ self return: self code


]
