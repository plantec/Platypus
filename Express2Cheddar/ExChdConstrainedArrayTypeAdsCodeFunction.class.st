"
<ISO10303-11-EXPRESS>
FUNCTION constrained_array_type_ads_code ( a : constrained_array_type ) : STRING;
	LOCAL 
		code : STRING := '';
	END_LOCAL;
	code := 'type ' + a.ada_ident + ' is Array ( ';

	IF EXISTS ( a.max_idx ) THEN
		code := code + a.min_idx + ' .. ' + a.max_idx;
	ELSE
		code := code + a.min_idx;
	END_IF;

	ALIAS etype FOR a.domain.element_type.handled;

		IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( etype ) ) THEN
			code := code + ' ) of ' + etype.ptr_type + ';\n';
		ELSE
			code := code + ' ) of ' + etype.ada_ident + ';\n';
		END_IF;
	END_ALIAS;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdConstrainedArrayTypeAdsCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'a',
		'code'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayTypeAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayTypeAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdConstrainedArrayTypeAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction >> a [
	^ a


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction >> a: aExChdConstrainedArrayType [
	a := aExChdConstrainedArrayType


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdConstrainedArrayTypeAdsCodeFunction >> fromValues: values [
	self a: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdConstrainedArrayTypeAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.	" ---------- statements ----------"
	self code: (('type ' pltPlus: (self a adaIdentUsingContext: self class context)) pltPlus: ' is Array ( ').
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self a maxIdxUsingContext: self class context);
				yourself))
		ifTrue: [ 
			self
				code:
					(((self code pltPlus: (self a minIdxUsingContext: self class context)) pltPlus: ' .. ')
						pltPlus: (self a maxIdxUsingContext: self class context)) ]
		ifFalse: [ self code: (self code pltPlus: (self a minIdxUsingContext: self class context)) ].
	PlatypusCoreAliasStatement
		alias:
			(((self a domainUsingContext: self class context) elementTypeUsingContext: self class context)
				handledUsingContext: self class context)
		statementsBlock: [ :etype2148 | 
			((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: etype2148;
						yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
				ifTrue: [ self code: (((self code pltPlus: ' ) of ') pltPlus: (etype2148 ptrTypeUsingContext: self class context)) pltPlus: ';\n') ]
				ifFalse: [ 
					self
						code:
							(((self code pltPlus: ' ) of ') pltPlus: (etype2148 adaIdentUsingContext: self class context)) pltPlus: ';\n') ] ].
	^ self return: self code


]
