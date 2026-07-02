"
<ISO10303-11-EXPRESS>
FUNCTION explicit_attribute_put ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING;
		prfx : STRING := '';
		domain : entity_instance := basic_ada_domain ( attr.domain );
	END_LOCAL;
	code := 'put(""' + attr.name + ': ""); ';

	IF ( 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' IN TYPEOF ( domain.handled ) ) THEN
		RETURN ( '' );
	END_IF;

	IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( domain.handled ) ) THEN
		prfx := domain.handled.put_prefix;
	END_IF;

	IF domain.handled.refed_by_pointer THEN
		code := code + 'if obj.' + attr.name + ' /= null then ' + prfx + 'put(obj.' + attr.name + '.all' + '); else put(""null""); end if;';
	ELSE
		code := code + prfx + 'put(obj.' + attr.name + '); ';
	END_IF;
	code := code + 'put ( ""; "" );';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdExplicitAttributePutFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'attr',
		'code',
		'prfx',
		'domain'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributePutFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdExplicitAttributePutFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributePutFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdExplicitAttributePutFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> attr [
	^ attr


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdExplicitAttributePutFunction >> invoke [
	" ---------- locals assignments ----------"

	self prfx: ''.
	self
		domain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr domainUsingContext: self class context);
						yourself)).	" ---------- statements ----------"
	self code: (('put("' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ': "); ').
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) includes: 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR')
		ifTrue: [ ^ self return: '' ].
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self domain handledUsingContext: self class context);
				yourself)) includes: 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE')
		ifTrue: [ self prfx: ((self domain handledUsingContext: self class context) putPrefixUsingContext: self class context) ].
	((self domain handledUsingContext: self class context) refedByPointerUsingContext: self class context)
		ifTrue: [ 
			self
				code:
					((((((((self code pltPlus: 'if obj.') pltPlus: (self attr nameUsingContext: self class context))
						pltPlus: ' /= null then ') pltPlus: self prfx) pltPlus: 'put(obj.')
						pltPlus: (self attr nameUsingContext: self class context)) pltPlus: '.all')
						pltPlus: '); else put("null"); end if;') ]
		ifFalse: [ 
			self
				code:
					((((self code pltPlus: self prfx) pltPlus: 'put(obj.') pltPlus: (self attr nameUsingContext: self class context))
						pltPlus: '); ') ].
	self code: (self code pltPlus: 'put ( "; " );').
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> prfx [
	^ prfx


]

{ #category : #'platypus-generated-accessing' }
ExChdExplicitAttributePutFunction >> prfx: aString1 [
	prfx := aString1


]
