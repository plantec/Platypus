"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_attributes_ads_code ( cip : ada_class ) : STRING;
	LOCAL 
		result : STRING;
		domain : entity_instance;
	END_LOCAL;

	IF SIZEOF ( cip.explicit_attributes ) = 0 THEN
		result := 'null record;\n';
	ELSE
		result := '\nrecord\n';

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				domain := basic_ada_domain ( attr.domain );
				IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) OR ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( domain.handled ) ) THEN
					result := result + ' ' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
				ELSE
					result := result + ' ' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		result := result + 'end record;\n';
	END_IF;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassAttributesAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'result',
		'domain'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAttributesAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassAttributesAdsCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAttributesAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAttributesAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> cip [
	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> cip: aExChdAdaClass [
	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> fromValues: values [
	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaClassAttributesAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self cip explicitAttributesUsingContext: self class context);
				yourself)) = 0
		ifTrue: [ self result: 'null record;\n' ]
		ifFalse: [ 
			self result: '\nrecord\n'.
			PlatypusCoreRepeatStatement
				repeat: [ :no3151 | 
					PlatypusCoreAliasStatement
						alias: ((self cip explicitAttributesUsingContext: self class context) pltAt: no3151)
						statementsBlock: [ :attr1141 | 
							self
								domain:
									(ExChdBasicAdaDomainFunction
										invokeFromValues:
											(OrderedCollection new
												add: (attr1141 domainUsingContext: self class context);
												yourself)).
							(((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self domain handledUsingContext: self class context);
										yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
								or: [ 
									(PltTYPEOFFunction
										invokeFromValues:
											(OrderedCollection new
												add: (self domain handledUsingContext: self class context);
												yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' ])
								ifTrue: [ 
									self
										result:
											(((((self result pltPlus: ' ') pltPlus: (attr1141 nameUsingContext: self class context)) pltPlus: ' : ')
												pltPlus: ((self domain handledUsingContext: self class context) ptrTypeUsingContext: self class context))
												pltPlus: ';\n') ]
								ifFalse: [ 
									self
										result:
											(((((self result pltPlus: ' ') pltPlus: (attr1141 nameUsingContext: self class context)) pltPlus: ' : ')
												pltPlus: (self domain adaRefIdentUsingContext: self class context)) pltPlus: ';\n') ] ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self cip explicitAttributesUsingContext: self class context);
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self cip explicitAttributesUsingContext: self class context);
								yourself)).
			self result: (self result pltPlus: 'end record;\n') ].
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAttributesAdsCodeFunction >> result: aString [
	result := aString


]
