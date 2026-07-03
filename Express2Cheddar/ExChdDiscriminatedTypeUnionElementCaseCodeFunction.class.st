"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_union_element_case_code ( u : discriminated_type_union_element_type ) : STRING;
	LOCAL 
		code : STRING := '';
		all_attributes : LIST OF attribute := inherited_explicit_attributes ( u );
		domain : entity_instance;
	END_LOCAL;

	REPEAT no := LOINDEX ( all_attributes ) TO HIINDEX ( all_attributes );

		ALIAS attr FOR all_attributes [ no];
			domain := basic_ada_domain ( attr.domain );
			IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) THEN
				code := code + '\t\t\t' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
			ELSE
				code := code + '\t\t\t' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeUnionElementCaseCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'u',
		'code',
		'allAttributes',
		'domain'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> allAttributes [
	^ allAttributes


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> allAttributes: aListOfExChdAttribute [
	allAttributes := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> fromValues: values [
	self u: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self
		allAttributes:
			(PTsInheritedExplicitAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self u;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no375 | 
			PlatypusCoreAliasStatement
				alias: (self allAttributes pltAt: no375)
				statementsBlock: [ :attr1493 | 
					self
						domain:
							(ExChdBasicAdaDomainFunction
								invokeFromValues:
									(OrderedCollection new
										add: (attr1493 domainUsingContext: self class context);
										yourself)).
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self domain handledUsingContext: self class context);
								yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
						ifTrue: [ 
							self
								code:
									(((((self code pltPlus: '\t\t\t') pltPlus: (attr1493 nameUsingContext: self class context)) pltPlus: ' : ')
										pltPlus: ((self domain handledUsingContext: self class context) ptrTypeUsingContext: self class context))
										pltPlus: ';\n') ]
						ifFalse: [ 
							self
								code:
									(((((self code pltPlus: '\t\t\t') pltPlus: (attr1493 nameUsingContext: self class context)) pltPlus: ' : ')
										pltPlus: (self domain adaRefIdentUsingContext: self class context)) pltPlus: ';\n') ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allAttributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allAttributes;
						yourself)).
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> u [
	^ u


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionElementCaseCodeFunction >> u: aExChdDiscriminatedTypeUnionElementType [
	u := aExChdDiscriminatedTypeUnionElementType


]
