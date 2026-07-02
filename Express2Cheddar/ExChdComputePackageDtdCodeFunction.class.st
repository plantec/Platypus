"
<ISO10303-11-EXPRESS>
FUNCTION compute_package_dtd_code ( p : package_dtd_element ) : STRING;
	LOCAL 
		subs : LIST OF dtd_element := p.subs;
		s : STRING := '';
	END_LOCAL;

	IF ( SIZEOF ( subs ) > 0 ) THEN
		s := s + '<!ELEMENT ' + p.tag + ' (';

		REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
			s := s + subs [ no].tag;
			IF ( no < HIINDEX ( subs ) ) THEN
				s := s + ' | ';
			END_IF;
		END_REPEAT;
		s := s + ')+>\n';

		REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
			s := s + subs [ no].dtd_code;
		END_REPEAT;
		s := s + '\n';
	END_IF;
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputePackageDtdCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p',
		'subs',
		's'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputePackageDtdCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputePackageDtdCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputePackageDtdCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputePackageDtdCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> fromValues: values [
	self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputePackageDtdCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self subs: (self p subsUsingContext: self class context).
	self s: ''.	" ---------- statements ----------"
	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self subs;
				yourself)) > 0
		ifTrue: [ 
			self s: (((self s pltPlus: '<!ELEMENT ') pltPlus: (self p tagUsingContext: self class context)) pltPlus: ' (').
			PlatypusCoreRepeatStatement
				repeat: [ :no2094 | 
					self s: (self s pltPlus: ((self subs pltAt: no2094) tagUsingContext: self class context)).
					no2094
						<
							(PltHIINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: self subs;
										yourself))
						ifTrue: [ self s: (self s pltPlus: ' | ') ] ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self subs;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self subs;
								yourself)).
			self s: (self s pltPlus: ')+>\n').
			PlatypusCoreRepeatStatement
				repeat: [ :no2882 | self s: (self s pltPlus: ((self subs pltAt: no2882) dtdCodeUsingContext: self class context)) ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self subs;
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self subs;
								yourself)).
			self s: (self s pltPlus: '\n') ].
	^ self return: self s


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> p [
	^ p


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> p: aExChdPackageDtdElement [
	p := aExChdPackageDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> s [
	^ s


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> s: aString [
	s := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> subs [
	^ subs


]

{ #category : #'platypus-generated-accessing' }
ExChdComputePackageDtdCodeFunction >> subs: aListOfExChdDtdElement [
	subs := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
