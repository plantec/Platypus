"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_initialize ( attr : explicit_attribute ) : STRING;
	LOCAL 
		domain : dictionary_instance := basic_ada_domain ( attr.domain );
		init : STRING := domain.init_value;
	END_LOCAL;

	IF ( attr.name = xml_id_name ) THEN
		RETURN ( 'generate_id( framework_id, obj.' + attr.name + ' );' );
	END_IF;

	IF ( 'CHEDDAR_DOMAINS.IN_SCOPE_ATTRIBUTE' IN TYPEOF ( attr ) ) THEN
		RETURN ( attr.init_code );
	END_IF;

	IF ( 'CHEDDAR_DOMAINS.CHEDDAR_PRIMITIVE_TYPE' IN TYPEOF ( domain.handled ) ) THEN
		init := domain.handled.init_value;
	END_IF;

	IF NOT EXISTS ( init ) THEN
		RETURN ( ? );
	ELSE

		IF init <> 'initialize' THEN
			RETURN ( 'obj.' + attr.name + ' := ' + init + ';' );
		ELSE
			IF domain.handled.refed_by_pointer THEN
				RETURN ( 'initialize( obj.' + attr.name + '.all);' );
			ELSE
				RETURN ( 'initialize( obj.' + attr.name + ');' );
			END_IF;
		END_IF;
	END_IF;
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdExplicitAttributeInitializeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'attr',
		'domain',
		'init'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeInitializeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributeInitializeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeInitializeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdExplicitAttributeInitializeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> attr [

	^ attr


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> attr: aExChdExplicitAttribute [

	attr := aExChdExplicitAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> domain [

	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> domain: aExChdDictionaryInstance [

	domain := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> fromValues: values [

	self attr: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> init [

	^ init


]

{ #category : 'platypus-generated-accessing' }
ExChdExplicitAttributeInitializeFunction >> init: aString [

	init := aString


]

{ #category : 'platypus-generated-invoking' }
ExChdExplicitAttributeInitializeFunction >> invoke [
	" ---------- locals assignments ----------"

	self domain:
		(ExChdBasicAdaDomainFunction invokeFromValues:
			 (OrderedCollection new
				  add: (self attr domainUsingContext: self class context);
				  yourself)).
	self init: (self domain initValueUsingContext: self class context). " ---------- statements ----------"
	(self attr nameUsingContext: self class context)
	= 'cheddar_private_id' ifTrue: [
			^ self return: (('generate_id( framework_id, obj.' pltPlus:
					    (self attr nameUsingContext: self class context)) pltPlus:
					   ' );') ].
	((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
			   add: self attr;
			   yourself)) includes: 'CHEDDAR_DOMAINS.IN_SCOPE_ATTRIBUTE')
		ifTrue: [
		^ self return: (self attr initCodeUsingContext: self class context) ].
	((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
			   add: (self domain handledUsingContext: self class context);
			   yourself)) includes: 'CHEDDAR_DOMAINS.CHEDDAR_PRIMITIVE_TYPE')
		ifTrue: [
				self init: ((self domain handledUsingContext: self class context)
						 initValueUsingContext: self class context) ].
	(PltEXISTSFunction invokeFromValues: (OrderedCollection new
			  add: self init;
			  yourself)) not
		ifTrue: [ ^ self return: nil ]
		ifFalse: [
				self init ~= 'initialize'
					ifTrue: [
							^ self return:
								  (((('obj.' pltPlus:
									      (self attr nameUsingContext: self class context))
									     pltPlus: ' := ') pltPlus: self init) pltPlus: ';') ]
					ifFalse: [
							((self domain handledUsingContext: self class context)
								 refedByPointerUsingContext: self class context)
								ifTrue: [
										^ self return: (('initialize( obj.' pltPlus:
												    (self attr nameUsingContext: self class context))
												   pltPlus: '.all);') ]
								ifFalse: [
										^ self return: (('initialize( obj.' pltPlus:
												    (self attr nameUsingContext: self class context))
												   pltPlus: ');') ] ] ]


]
