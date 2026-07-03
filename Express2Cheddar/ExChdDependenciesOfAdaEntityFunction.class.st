"
<ISO10303-11-EXPRESS>
FUNCTION dependencies_of_ada_entity ( o : context_definition; t : ada_entity ) : LIST OF dictionary_instance;
	LOCAL 
		r : LIST OF dictionary_instance := [ ];
		attrs : LIST OF attribute := inherited_explicit_attributes ( t );
	END_LOCAL;

	REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );
		r := r + dependencies_of ( o, attrs [ no].domain.handled );
	END_REPEAT;
	r := r + t;
	RETURN ( r );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDependenciesOfAdaEntityFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'o',
		't',
		'r',
		'attrs'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfAdaEntityFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDependenciesOfAdaEntityFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfAdaEntityFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDependenciesOfAdaEntityFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> attrs [

	^ attrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> attrs: aListOfExChdAttribute [

	attrs := aListOfExChdAttribute
		         ifNil: [ OrderedCollection new ]
		         ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> fromValues: values [

	self o: (values at: 1).
	self t: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdDependenciesOfAdaEntityFunction >> invoke [
	" ---------- locals assignments ----------"

	self r: Array new.
	self attrs:
		(PTsInheritedExplicitAttributesFunction invokeFromValues:
			 (OrderedCollection new
				  add: self t;
				  yourself)). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2045159 |
				self r: (self r pltPlus:
						 (ExChdDependenciesOfFunction invokeFromValues:
							  (OrderedCollection new
								   add: self o;
								   add:
									   (((self attrs pltAt: no2045159) domainUsingContext:
											     self class context) handledUsingContext:
											    self class context);
								   yourself))) ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self attrs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self attrs;
					  yourself)).
	self r: (self r pltPlus: self t).
	^ self return: self r


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> o [

	^ o


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> o: aExChdContextDefinition [

	o := aExChdContextDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> o: aExChdContextDefinition t: aExChdAdaEntity [

	self o: aExChdContextDefinition.
	self t: aExChdAdaEntity


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> r [

	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> r: aListOfExChdDictionaryInstance [

	r := aListOfExChdDictionaryInstance
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [
		     aListOfExChdDictionaryInstance as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> t [

	^ t


]

{ #category : 'platypus-generated-accessing' }
ExChdDependenciesOfAdaEntityFunction >> t: aExChdAdaEntity [

	t := aExChdAdaEntity


]
