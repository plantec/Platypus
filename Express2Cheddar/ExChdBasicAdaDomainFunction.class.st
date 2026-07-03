"
<ISO10303-11-EXPRESS>
FUNCTION basic_ada_domain ( d : dictionary_instance ) : entity_instance;
	RETURN ( ( d || basic_ada_type_getter ( ) ).accepted );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdBasicAdaDomainFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'd'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaDomainFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdBasicAdaDomainFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaDomainFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaDomainFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaDomainFunction >> d [
	^ d


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaDomainFunction >> d: aExChdDictionaryInstance [
	d := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaDomainFunction >> fromValues: values [
	self d: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdBasicAdaDomainFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			((PlatypusComplexInstance
				fromRecords:
					(OrderedCollection new
						add: self d;
						add: ExChdBasicAdaTypeGetter new;
						yourself)) pltAsObject acceptedUsingContext: self class context)


]
