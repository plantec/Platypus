"
<ISO10303-11-EXPRESS>
FUNCTION ada_constant_ads_code ( c : ada_constant ) : STRING;
	LOCAL 
		code : STRING := '';
		remarks : LIST OF remark := remarks_for ( c );
		rem : STRING;
		domain : dictionary_instance := basic_ada_domain ( c.domain );
	END_LOCAL;

	IF ( SIZEOF ( remarks ) > 0 ) THEN

		REPEAT no := LOINDEX ( remarks ) TO HIINDEX ( remarks );
			rem := clean_remark_text_of ( remarks [ no] );
			rem := do_comments_with ( rem );
			code := code + rem;
		END_REPEAT;
	END_IF;
	code := code + c.name + ' : ';

	IF c.final THEN
		code := code + 'constant ';
	END_IF;
	code := code + domain.ada_ref_ident;

	IF NOT EXISTS ( c.other_initializer ) THEN
		code := code + ' := ' + basic_ada_type_value_format ( c.initializer, ? ).formated + ';';
	ELSE

		IF c.other_initializer > '' THEN
			code := code + ' := ' + c.other_initializer;
		END_IF;
		code := code + ';';
	END_IF;
	code := code + '\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaConstantAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'c',
		'code',
		'remarks',
		'rem',
		'domain'
	],
	#category : 'Express2Cheddar-CheddarConstantsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarConstantsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantAdsCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaConstantAdsCodeFunction class >> schemaDefinition [

	^ ExChdCheddarConstantsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantAdsCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantAdsCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> c [

	^ c


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> c: aExChdAdaConstant [

	c := aExChdAdaConstant


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> code [

	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> code: aString [

	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> domain [

	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> domain: aExChdDictionaryInstance [

	domain := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> fromValues: values [

	self c: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaConstantAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self remarks:
		(PTsRemarksForFunction invokeFromValues: (OrderedCollection new
				  add: self c;
				  yourself)).
	self domain:
		(ExChdBasicAdaDomainFunction invokeFromValues:
			 (OrderedCollection new
				  add: (self c domainUsingContext: self class context);
				  yourself)). " ---------- statements ----------"
	(PltSIZEOFFunction invokeFromValues: (OrderedCollection new
			  add: self remarks;
			  yourself)) > 0 ifTrue: [
			PlatypusCoreRepeatStatement
				repeat: [ :no1104571 |
						self rem: (PTsCleanRemarkTextOfFunction invokeFromValues:
								 (OrderedCollection new
									  add: (self remarks pltAt: no1104571);
									  yourself)).
						self rem:
							(ExChdDoCommentsWithFunction invokeFromValues:
								 (OrderedCollection new
									  add: self rem;
									  yourself)).
						self code: (self code pltPlus: self rem) ]
				from:
					(PltLOINDEXFunction invokeFromValues: (OrderedCollection new
							  add: self remarks;
							  yourself))
				to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
							  add: self remarks;
							  yourself)) ].
	self code:
		((self code pltPlus: (self c nameUsingContext: self class context))
			 pltPlus: ' : ').
	(self c finalUsingContext: self class context) ifTrue: [
		self code: (self code pltPlus: 'constant ') ].
	self code: (self code pltPlus:
			 (self domain adaRefIdentUsingContext: self class context)).
	(PltEXISTSFunction invokeFromValues: (OrderedCollection new
			  add: (self c otherInitializerUsingContext: self class context);
			  yourself)) not
		ifTrue: [
				self code: (((self code pltPlus: ' := ') pltPlus:
						  ((ExChdBasicAdaTypeValueFormat new
							    basicAdaTypeValueFormatFromValues: (OrderedCollection new
									     add:
										     (self c initializerUsingContext: self class context);
									     add: nil;
									     yourself);
							    yourself) formatedUsingContext: self class context))
						 pltPlus: ';') ]
		ifFalse: [
				(self c otherInitializerUsingContext: self class context) > ''
					ifTrue: [
							self code: ((self code pltPlus: ' := ') pltPlus:
									 (self c otherInitializerUsingContext: self class context)) ].
				self code: (self code pltPlus: ';') ].
	self code: (self code pltPlus: '\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> rem [

	^ rem


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> rem: aString1 [

	rem := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> remarks [

	^ remarks


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantAdsCodeFunction >> remarks: aListOfExChdRemark [

	remarks := aListOfExChdRemark
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [ aListOfExChdRemark as: OrderedCollection ]


]
