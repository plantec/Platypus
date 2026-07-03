"
<ISO10303-11-EXPRESS>
FUNCTION compute_discriminated_type_code ( ent : discriminated_type_dtd_element ) : STRING;
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
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputeDiscriminatedTypeCodeFunction',
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
ExChdComputeDiscriminatedTypeCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeDiscriminatedTypeCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeDiscriminatedTypeCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> ent [

	^ ent


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> ent: aExChdDiscriminatedTypeDtdElement [

	ent := aExChdDiscriminatedTypeDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> fromValues: values [

	self ent: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdComputeDiscriminatedTypeCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self s: ''.
	self l: Array new.
	self subs: (self ent subsUsingContext: self class context). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2955357 |
				PlatypusCoreAliasStatement
					alias: (self subs pltAt: no2955357)
					statementsBlock: [ :curr1743433 |
							self l:
								(self l pltPlus:
									 (curr1743433 tagUsingContext: self class context)) ] ]
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
	^ self return: self s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> l [

	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> l: aListOfString [

	l := aListOfString
		     ifNil: [ OrderedCollection new ]
		     ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> s [

	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> s: aString [

	s := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> subs [

	^ subs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeDiscriminatedTypeCodeFunction >> subs: aListOfExChdDtdElement [

	subs := aListOfExChdDtdElement
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
