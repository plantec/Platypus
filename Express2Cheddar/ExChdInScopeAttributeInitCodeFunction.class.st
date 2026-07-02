"
<ISO10303-11-EXPRESS>
FUNCTION in_scope_attribute_init_code ( a : in_scope_attribute ) : STRING;
	LOCAL 
		code : STRING := '';
	END_LOCAL;

	ALIAS domain FOR a.domain.handled;

		IF domain.refed_by_pointer THEN
			code := code + '\n\tif obj.' + a.name + ' /= null then\n' 
			+ '\t\tFree (obj.' + a.name + ' );\n' 
			+ '\tend if;\n' 
			+ '\tobj.' + a.name + ' := new ' + domain.name + ';\n' 
			+ '\tInitialize(obj.' + a.name + '.all);\n';
		END_IF;
	END_ALIAS;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdInScopeAttributeInitCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'a',
		'code'
	],
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdInScopeAttributeInitCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdInScopeAttributeInitCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdInScopeAttributeInitCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdInScopeAttributeInitCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdInScopeAttributeInitCodeFunction >> a [
	^ a


]

{ #category : #'platypus-generated-accessing' }
ExChdInScopeAttributeInitCodeFunction >> a: aExChdInScopeAttribute [
	a := aExChdInScopeAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdInScopeAttributeInitCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdInScopeAttributeInitCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdInScopeAttributeInitCodeFunction >> fromValues: values [
	self a: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdInScopeAttributeInitCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: ((self a domainUsingContext: self class context) handledUsingContext: self class context)
		statementsBlock: [ :domain1726 | 
			(domain1726 refedByPointerUsingContext: self class context)
				ifTrue: [ 
					self
						code:
							(((((((((((((((self code pltPlus: '\n\tif obj.') pltPlus: (self a nameUsingContext: self class context))
								pltPlus: ' /= null then\n') pltPlus: '\t\tFree (obj.') pltPlus: (self a nameUsingContext: self class context))
								pltPlus: ' );\n') pltPlus: '\tend if;\n') pltPlus: '\tobj.')
								pltPlus: (self a nameUsingContext: self class context)) pltPlus: ' := new ')
								pltPlus: (domain1726 nameUsingContext: self class context)) pltPlus: ';\n') pltPlus: '\tInitialize(obj.')
								pltPlus: (self a nameUsingContext: self class context)) pltPlus: '.all);\n') ] ].
	^ self return: self code


]
