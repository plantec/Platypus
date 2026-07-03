"
<ISO10303-11-EXPRESS>
FUNCTION compute_entity_dtd_code ( ent : entity_dtd_element ) : STRING;
	LOCAL 
		s : STRING := '';
		l : LIST OF STRING := [ ];
		subs : LIST OF dtd_element := ent.subs;
	END_LOCAL;

	REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );

		ALIAS curr FOR subs [ no];
			l := l + curr.tag;
		END_ALIAS;
	END_REPEAT;
	s := '<!ELEMENT ' + ent.tag + ' (' + StringAggregateConcatSeparatedBy ( l, ' | ' ) + ')*>\n';

	IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( ent.domain ) ) THEN
		s := s + '<!ATTLIST ' + ent.tag + ' id ID #REQUIRED>\n';
	END_IF;
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputeEntityDtdCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'ent',
		's',
		'l',
		'subs'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntityDtdCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputeEntityDtdCodeFunction class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntityDtdCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeEntityDtdCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> ent [

	^ ent


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> ent: aExChdEntityDtdElement [

	ent := aExChdEntityDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> fromValues: values [

	self ent: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputeEntityDtdCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self s: ''.
	self l: Array new.
	self subs: (self ent subsUsingContext: self class context). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no302829 |
				PlatypusCoreAliasStatement
					alias: (self subs pltAt: no302829)
					statementsBlock: [ :curr1966755 |
							self l:
								(self l pltPlus:
									 (curr1966755 tagUsingContext: self class context)) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self subs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self subs;
					  yourself)).
	self s: (((('<!ELEMENT ' pltPlus:
			    (self ent tagUsingContext: self class context)) pltPlus: ' (')
			  pltPlus:
				  (PTsStringAggregateConcatSeparatedByFunction invokeFromValues:
					   (OrderedCollection new
						    add: self l;
						    add: ' | ';
						    yourself))) pltPlus: ')*>\n').
	((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
			   add: (self ent domainUsingContext: self class context);
			   yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS') ifTrue: [
			self s: (((self s pltPlus: '<!ATTLIST ') pltPlus:
					  (self ent tagUsingContext: self class context)) pltPlus:
					 ' id ID #REQUIRED>\n') ].
	^ self return: self s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> l [

	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> l: aListOfString [

	l := aListOfString
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> s [

	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> s: aString [

	s := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> subs [

	^ subs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeEntityDtdCodeFunction >> subs: aListOfExChdDtdElement [

	subs := aListOfExChdDtdElement
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
