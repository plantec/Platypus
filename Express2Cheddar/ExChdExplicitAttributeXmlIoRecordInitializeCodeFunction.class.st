"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_xml_io_record_initialize_code ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING := '';
		domain : entity_instance := basic_ada_domain ( attr.domain );
		init : STRING := domain.init_value;
	END_LOCAL;

	IF NOT is_generic_object ( domain.handled ) THEN

		IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
			code := '\tobj.' + attr.name + ' := ' + domain.ada_ref_ident + '''first;';
		ELSE
			IF EXISTS ( init ) THEN
				code := '\tobj.' + attr.name + ' := ' + init + ';';
			END_IF;
		END_IF;
	ELSE
		code := '\tobj.' + attr.name + ' := empty_string;';
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction',
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
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> attr [
	^ attr


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> init [
	^ init


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> init: aString1 [
	init := aString1


]

{ #category : 'platypus-generated-invoking' }
ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction >> invoke [
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
	(ExChdIsGenericObjectFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) not
		ifTrue: [ 
			((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self domain handledUsingContext: self class context);
						yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
				ifTrue: [ 
					self
						code:
							(((('\tobj.' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' := ')
								pltPlus: (self domain adaRefIdentUsingContext: self class context)) pltPlus: '''first;') ]
				ifFalse: [ 
					(PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: self init;
								yourself))
						ifTrue: [ 
							self
								code:
									(((('\tobj.' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' := ') pltPlus: self init)
										pltPlus: ';') ] ] ]
		ifFalse: [ self code: (('\tobj.' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' := empty_string;') ].
	^ self return: self code


]
