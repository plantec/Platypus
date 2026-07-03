"
<ISO10303-11-EXPRESS>
FUNCTION range_type_ads_code ( rt : range_type ) : STRING;
	LOCAL 
		r : STRING := 'type ' + rt.ada_ident + ' is Range ' + rt.lower + ' .. ' + rt.upper + ';\n';
	END_LOCAL;

	IF EXISTS ( rt.lower_constant ) THEN
		r := r + rt.lower_constant + ' : constant ' + rt.ada_ident + ' := ' + rt.ada_ident + '''First;\n';
	END_IF;

	IF EXISTS ( rt.upper_constant ) THEN
		r := r + rt.upper_constant + ' : constant ' + rt.ada_ident + ' := ' + rt.ada_ident + '''Last;\n';
	END_IF;
	RETURN ( r );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRangeTypeAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'rt',
		'r'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRangeTypeAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRangeTypeAdsCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRangeTypeAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRangeTypeAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdRangeTypeAdsCodeFunction >> fromValues: values [
	self rt: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdRangeTypeAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		r:
			(((((('type ' pltPlus: (self rt adaIdentUsingContext: self class context)) pltPlus: ' is Range ')
				pltPlus: (self rt lowerUsingContext: self class context)) pltPlus: ' .. ')
				pltPlus: (self rt upperUsingContext: self class context)) pltPlus: ';\n').	" ---------- statements ----------"
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self rt lowerConstantUsingContext: self class context);
				yourself))
		ifTrue: [ 
			self
				r:
					((((((self r pltPlus: (self rt lowerConstantUsingContext: self class context)) pltPlus: ' : constant ')
						pltPlus: (self rt adaIdentUsingContext: self class context)) pltPlus: ' := ')
						pltPlus: (self rt adaIdentUsingContext: self class context)) pltPlus: '''First;\n') ].
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self rt upperConstantUsingContext: self class context);
				yourself))
		ifTrue: [ 
			self
				r:
					((((((self r pltPlus: (self rt upperConstantUsingContext: self class context)) pltPlus: ' : constant ')
						pltPlus: (self rt adaIdentUsingContext: self class context)) pltPlus: ' := ')
						pltPlus: (self rt adaIdentUsingContext: self class context)) pltPlus: '''Last;\n') ].
	^ self return: self r


]

{ #category : 'platypus-generated-accessing' }
ExChdRangeTypeAdsCodeFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdRangeTypeAdsCodeFunction >> r: aString [
	r := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdRangeTypeAdsCodeFunction >> rt [
	^ rt


]

{ #category : 'platypus-generated-accessing' }
ExChdRangeTypeAdsCodeFunction >> rt: aExChdRangeType [
	rt := aExChdRangeType


]
