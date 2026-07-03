"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_union_case_code ( u : discriminated_type_union_type ) : STRING;
	LOCAL 
		code : STRING := '';
		all_attributes : LIST OF attribute := inherited_explicit_attributes ( u );
	END_LOCAL;

	REPEAT no := LOINDEX ( all_attributes ) TO HIINDEX ( all_attributes );

		ALIAS attr FOR all_attributes [ no];
			ALIAS ada_domain FOR basic_ada_domain ( attr.domain ).handled;
				code := code + '\t\twhen ' + attr.name + ' => \n ' + ada_domain.union_ads_code;
			END_ALIAS;
		END_ALIAS;
		code := code + '\n';
	END_REPEAT;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeUnionCaseCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'u',
		'code',
		'allAttributes'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionCaseCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionCaseCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionCaseCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> allAttributes [
	^ allAttributes


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> allAttributes: aListOfExChdAttribute [
	allAttributes := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> fromValues: values [
	self u: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> invoke [
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
		repeat: [ :no2561 | 
			PlatypusCoreAliasStatement
				alias: (self allAttributes pltAt: no2561)
				statementsBlock: [ :attr3679 | 
					PlatypusCoreAliasStatement
						alias:
							((ExChdBasicAdaDomainFunction
								invokeFromValues:
									(OrderedCollection new
										add: (attr3679 domainUsingContext: self class context);
										yourself)) handledUsingContext: self class context)
						statementsBlock: [ :adaDomain2883 | 
							self
								code:
									((((self code pltPlus: '\t\twhen ') pltPlus: (attr3679 nameUsingContext: self class context)) pltPlus: ' => \n ')
										pltPlus: (adaDomain2883 unionAdsCodeUsingContext: self class context)) ] ].
			self code: (self code pltPlus: '\n') ]
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
ExChdDiscriminatedTypeUnionCaseCodeFunction >> u [
	^ u


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionCaseCodeFunction >> u: aExChdDiscriminatedTypeUnionType [
	u := aExChdDiscriminatedTypeUnionType


]
