"
<ISO10303-11-EXPRESS>
FUNCTION concept_list_local_dependencies ( sch : schema_definition; l : LIST OF dictionary_instance ) : LIST OF dictionary_instance;
	LOCAL 
		wl : LIST OF dictionary_instance := [ ];
		r : LIST OF dictionary_instance := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );

		ALIAS c FOR l [ no];
			IF is_of_generated_concept_kind ( c ) THEN
				wl := c.dependencies;
				REPEAT noi := LOINDEX ( wl ) TO HIINDEX ( wl );
					IF NOT concept_in_list ( wl [ noi], r ) THEN
						r := r + wl [ noi];
					END_IF;
				END_REPEAT;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( r );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdConceptListLocalDependenciesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'sch',
		'l',
		'wl',
		'r'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptListLocalDependenciesFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdConceptListLocalDependenciesFunction class >> schemaDefinition [

	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptListLocalDependenciesFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptListLocalDependenciesFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> fromValues: values [

	self sch: (values at: 1).
	self l: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdConceptListLocalDependenciesFunction >> invoke [
	" ---------- locals assignments ----------"

	self wl: Array new.
	self r: Array new. " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no713581 |
				PlatypusCoreAliasStatement
					alias: (self l pltAt: no713581)
					statementsBlock: [ :c1647033 |
							(ExChdIsOfGeneratedConceptKindFunction invokeFromValues:
								 (OrderedCollection new
									  add: c1647033;
									  yourself)) ifTrue: [
									self wl:
										(c1647033 dependenciesUsingContext: self class context).
									PlatypusCoreRepeatStatement
										repeat: [ :noi3706367 |
												(ExChdConceptInListFunction invokeFromValues:
													 (OrderedCollection new
														  add: (self wl pltAt: noi3706367);
														  add: self r;
														  yourself)) not ifTrue: [
													self r: (self r pltPlus: (self wl pltAt: noi3706367)) ] ]
										from:
											(PltLOINDEXFunction invokeFromValues:
												 (OrderedCollection new
													  add: self wl;
													  yourself))
										to:
											(PltHIINDEXFunction invokeFromValues:
												 (OrderedCollection new
													  add: self wl;
													  yourself)) ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self l;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self l;
					  yourself)).
	^ self return: self r


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> l [

	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> l: aListOfExChdDictionaryInstance [

	l := aListOfExChdDictionaryInstance
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [
		     aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> r [

	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> r: aListOfExChdDictionaryInstance1 [

	r := aListOfExChdDictionaryInstance1
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [
		     aListOfExChdDictionaryInstance1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> sch [

	^ sch


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> sch: aExChdSchemaDefinition [

	sch := aExChdSchemaDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> sch: aExChdSchemaDefinition l: aListOfExChdDictionaryInstance [

	self sch: aExChdSchemaDefinition.
	self l: aListOfExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> wl [

	^ wl


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptListLocalDependenciesFunction >> wl: aListOfExChdDictionaryInstance [

	wl := aListOfExChdDictionaryInstance
		      ifNil: [ OrderedCollection new ]
		      ifNotNil: [
		      aListOfExChdDictionaryInstance as: OrderedCollection ]


]
