"
<ISO10303-11-EXPRESS>
FUNCTION dependencies_of ( o : context_definition; t : dictionary_instance ) : LIST OF dictionary_instance;
	LOCAL 
		r : LIST OF dictionary_instance := [ ];
	END_LOCAL;

	IF ( 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE' IN TYPEOF ( t ) ) THEN
		r := r + dependencies_of ( o, t.element_type.handled );
	ELSE

		IF is_of_generated_concept_kind ( t ) THEN
			IF ( t.owner = o ) THEN
				r := r + t.dependencies + t;
			END_IF;
		END_IF;
	END_IF;
	RETURN ( r );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDependenciesOfFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'o',
		't',
		'r'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDependenciesOfFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> fromValues: values [
	self o: (values at: 1).
	self t: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdDependenciesOfFunction >> invoke [
	" ---------- locals assignments ----------"

	self r: Array new.	" ---------- statements ----------"
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self t;
				yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE')
		ifTrue: [ 
			self
				r:
					(self r
						pltPlus:
							(ExChdDependenciesOfFunction
								invokeFromValues:
									(OrderedCollection new
										add: self o;
										add: ((self t elementTypeUsingContext: self class context) handledUsingContext: self class context);
										yourself))) ]
		ifFalse: [ 
			(ExChdIsOfGeneratedConceptKindFunction
				invokeFromValues:
					(OrderedCollection new
						add: self t;
						yourself))
				ifTrue: [ 
					(self t ownerUsingContext: self class context) = self o
						ifTrue: [ self r: ((self r pltPlus: (self t dependenciesUsingContext: self class context)) pltPlus: self t) ] ] ].
	^ self return: self r


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> o [
	^ o


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> o: aExChdContextDefinition [
	o := aExChdContextDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> o: aExChdContextDefinition t: aExChdDictionaryInstance [
	self o: aExChdContextDefinition.
	self t: aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> r: aListOfExChdDictionaryInstance [
	r := aListOfExChdDictionaryInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> t [
	^ t


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfFunction >> t: aExChdDictionaryInstance [
	t := aExChdDictionaryInstance


]
