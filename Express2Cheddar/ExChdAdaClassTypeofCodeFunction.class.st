"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_typeof_code ( cip : ada_class ) : STRING;
	LOCAL 
		code : STRING;
		sups : LIST OF entity_definition := all_supertypes_of ( cip );
	END_LOCAL;
	code := 'function type_of ( obj : in ' + cip.name + ' ) return unbounded_string_list is\n' 
	+ '\tlist : unbounded_string_list;\n' 
	+ '\ts : unbounded_string_ptr;\n' 
	+ 'begin\n' 
	+ '\t' + 'Initialize(list);\n' 
	+ '\n';

	REPEAT no := LOINDEX ( sups ) TO HIINDEX ( sups );

		ALIAS curr FOR sups [ no];
			code := code + '\t' + 's := new unbounded_string;\n' 
			+ '\t' + 's.all := to_unbounded_string(""' + upperize ( curr.owner.name ) + '.' + upperize ( curr.name ) + '"");\n' 
			+ '\t' + 'Add (list, s);\n' 
			+ '\n';
		END_ALIAS;
	END_REPEAT;
	code := code + '\treturn list;\nend type_of;\n\n' 

	+ 'function type_of ( obj : in ' + cip.ptr_type + ' ) return unbounded_string_list is\n' 
	+ 'begin\n' 
	+ '\treturn type_of(obj.all);\n' 
	+ 'end type_of;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassTypeofCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'code',
		'sups'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassTypeofCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassTypeofCodeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassTypeofCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassTypeofCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> cip [

	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> cip: aExChdAdaClass [

	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> code [

	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> code: aString [

	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> fromValues: values [

	self cip: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaClassTypeofCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self sups:
		(PTsAllSupertypesOfFunction invokeFromValues:
			 (OrderedCollection new
				  add: self cip;
				  yourself)). " ---------- statements ----------"
	self code: (((((((('function type_of ( obj : in ' pltPlus:
			        (self cip nameUsingContext: self class context)) pltPlus:
			       ' ) return unbounded_string_list is\n') pltPlus:
			      '\tlist : unbounded_string_list;\n') pltPlus:
			     '\ts : unbounded_string_ptr;\n') pltPlus: 'begin\n') pltPlus:
			   '\t') pltPlus: 'Initialize(list);\n') pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3642985 |
				PlatypusCoreAliasStatement
					alias: (self sups pltAt: no3642985)
					statementsBlock: [ :curr3403911 |
							self code: (((((((((((self code pltPlus: '\t') pltPlus:
									          's := new unbounded_string;\n') pltPlus: '\t')
									        pltPlus: 's.all := to_unbounded_string("') pltPlus:
									       (PTsUpperizeFunction invokeFromValues:
										        (OrderedCollection new
											         add:
												         ((curr3403911 ownerUsingContext:
														           self class context) nameUsingContext:
														          self class context);
											         yourself))) pltPlus: '.') pltPlus:
									     (PTsUpperizeFunction invokeFromValues:
										      (OrderedCollection new
											       add:
												       (curr3403911 nameUsingContext: self class context);
											       yourself))) pltPlus: '");\n') pltPlus: '\t')
									  pltPlus: 'Add (list, s);\n') pltPlus: '\n') ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self sups;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self sups;
					  yourself)).
	self code:
		(((((((self code pltPlus: '\treturn list;\nend type_of;\n\n')
			      pltPlus: 'function type_of ( obj : in ') pltPlus:
			     (self cip ptrTypeUsingContext: self class context)) pltPlus:
			    ' ) return unbounded_string_list is\n') pltPlus: 'begin\n')
			  pltPlus: '\treturn type_of(obj.all);\n') pltPlus:
			 'end type_of;\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> sups [

	^ sups


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassTypeofCodeFunction >> sups: aListOfExChdEntityDefinition [

	sups := aListOfExChdEntityDefinition
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [
		        aListOfExChdEntityDefinition as: OrderedCollection ]


]
