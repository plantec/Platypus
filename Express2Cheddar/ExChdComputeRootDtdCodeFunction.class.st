"
<ISO10303-11-EXPRESS>
FUNCTION compute_root_dtd_code ( r : root_dtd_element ) : STRING;
	LOCAL 
		s : STRING := '';
		code : STRING;
		lines : LIST OF STRING := [ ];
		licence : STRING := string_replace ( source_licence, '--', '  ' );
		pkgs : LIST OF package_dtd_element := r.subs;
		attributes : LIST OF attribute_dtd_element := [ ];
		acode : STRING;
		previous : LIST OF STRING := [ ];
		implicits : LIST OF dtd_element := r.implicit_domains;
		infered : LIST OF entity_dtd_element := [ ];
		el : entity_dtd_element;
		infered_attributes : LIST OF attribute_dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( implicits ) TO HIINDEX ( implicits );
		el := implicits [ no].infered_element;
		infered := infered + el;
		infered_attributes := infered_attributes + el.subs;
	END_REPEAT;
	s := s + '<!--' + licence + '-->\n\n' 

	+ '<!ELEMENT ' + r.tag + ' (';

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		s := s + pkgs [ no].tag + '?';

		IF ( no < HIINDEX ( pkgs ) ) THEN
			s := s + ' | ';
		END_IF;
	END_REPEAT;
	s := s + ')*>\n\n';

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		code := pkgs [ no].dtd_code;
		previous := previous + LinesFromString ( code );
		s := s + code;
	END_REPEAT;
	s := s + '\n';

	REPEAT no := LOINDEX ( infered ) TO HIINDEX ( infered );
		acode := infered [ no].dtd_code;

		IF NOT ( acode IN previous ) THEN
			s := s + acode;
			previous := previous + acode;
		END_IF;
	END_REPEAT;

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		attributes := attributes + compute_package_attribute_dtd_elements ( pkgs [ no] );
	END_REPEAT;

	REPEAT no := LOINDEX ( attributes ) TO HIINDEX ( attributes );
		acode := attributes [ no].dtd_code;

		IF NOT ( acode IN previous ) THEN
			s := s + attributes [ no].dtd_code;
			previous := previous + acode;
		END_IF;
	END_REPEAT;

	REPEAT no := LOINDEX ( infered_attributes ) TO HIINDEX ( infered_attributes );
		acode := infered_attributes [ no].dtd_code;

		IF NOT ( acode IN previous ) THEN
			s := s + acode;
			previous := previous + acode;
		END_IF;
	END_REPEAT;
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdComputeRootDtdCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'r',
		's',
		'code',
		'lines',
		'licence',
		'pkgs',
		'attributes',
		'acode',
		'previous',
		'implicits',
		'infered',
		'el',
		'inferedAttributes'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeRootDtdCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdComputeRootDtdCodeFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeRootDtdCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdComputeRootDtdCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> acode [
	^ acode


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> acode: aString3 [
	acode := aString3


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> attributes [
	^ attributes


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> attributes: aListOfExChdAttributeDtdElement [
	attributes := aListOfExChdAttributeDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttributeDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> code: aString1 [
	code := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> el [
	^ el


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> el: aExChdEntityDtdElement [
	el := aExChdEntityDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> fromValues: values [
	self r: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> implicits [
	^ implicits


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> implicits: aListOfExChdDtdElement [
	implicits := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> infered [
	^ infered


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> infered: aListOfExChdEntityDtdElement [
	infered := aListOfExChdEntityDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdEntityDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> inferedAttributes [
	^ inferedAttributes


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> inferedAttributes: aListOfExChdAttributeDtdElement1 [
	inferedAttributes := aListOfExChdAttributeDtdElement1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttributeDtdElement1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-invoking' }
ExChdComputeRootDtdCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self s: ''.
	self lines: Array new.
	self
		licence:
			(PTsStringReplaceFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								((((((((((((((((((((((((((((((((((((((''
										pltPlus: '------------------------------------------------------------------------------\n')
										pltPlus: '------------------------------------------------------------------------------\n')
										pltPlus: '--  This source file was automatically generated by Platypus\n')
										pltPlus: '--  see http://dossen.univ-brest.fr/apl\n') pltPlus: '-- \n')
										pltPlus: '--  Any modification of this file will be lost. \n')
										pltPlus: '--  Please see the "platypus" directory instead : it contains the Cheddar''s\n')
										pltPlus: '--  model and its meta-model. \n')
										pltPlus: '------------------------------------------------------------------------------\n \n')
										pltPlus: '------------------------------------------------------------------------------\n')
										pltPlus: '-- Cheddar is a free real time scheduling tool.\n')
										pltPlus: '-- This program provides services to automatically check temporal constraints\n')
										pltPlus: '-- of real time tasks.\n') pltPlus: '--\n') pltPlus: '-- Copyright (C) 2002-2014   Frank Singhoff\n')
										pltPlus: '-- Cheddar is developed by the LAB-STICC Team, University of Brest\n') pltPlus: '--\n')
										pltPlus: '-- This program is free software; you can redistribute it and/or modify\n')
										pltPlus: '-- it under the terms of the GNU General Public License as published by\n')
										pltPlus: '-- the Free Software Foundation; either version 2 of the License, or\n')
										pltPlus: '-- (at your option) any later version.\n') pltPlus: '--\n')
										pltPlus: '-- This program is distributed in the hope that it will be useful,\n')
										pltPlus: '-- but WITHOUT ANY WARRANTY; without even the implied warranty of\n')
										pltPlus: '-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n')
										pltPlus: '-- GNU General Public License for more details.\n') pltPlus: '--\n')
										pltPlus: '-- You should have received a copy of the GNU General Public License\n')
										pltPlus: '-- along with this program; if not, write to the Free Software\n')
										pltPlus: '-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\n') pltPlus: '--\n')
										pltPlus: '--\n') pltPlus: '-- Contact : cheddar@listes.univ-brest.fr\n')
										pltPlus: '-- 	To post to this mailing list, you must be subscribed\n')
										pltPlus: '-- 	(see http//beru.univ-brest.fr/~singhoff/cheddar for details)\n') pltPlus: '--\n')
										pltPlus: '------------------------------------------------------------------------------\n')
										pltPlus: '------------------------------------------------------------------------------\n');
						add: '--';
						add: '  ';
						yourself)).
	self pkgs: (self r subsUsingContext: self class context).
	self attributes: Array new.
	self previous: Array new.
	self implicits: (self r implicitDomainsUsingContext: self class context).
	self infered: Array new.
	self inferedAttributes: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1278 | 
			self el: ((self implicits pltAt: no1278) inferedElementUsingContext: self class context).
			self infered: (self infered pltPlus: self el).
			self inferedAttributes: (self inferedAttributes pltPlus: (self el subsUsingContext: self class context)) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self implicits;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self implicits;
						yourself)).
	self
		s:
			((((((self s pltPlus: '<!--') pltPlus: self licence) pltPlus: '-->\n\n') pltPlus: '<!ELEMENT ')
				pltPlus: (self r tagUsingContext: self class context)) pltPlus: ' (').
	PlatypusCoreRepeatStatement
		repeat: [ :no1059 | 
			self s: ((self s pltPlus: ((self pkgs pltAt: no1059) tagUsingContext: self class context)) pltPlus: '?').
			no1059
				<
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self pkgs;
								yourself))
				ifTrue: [ self s: (self s pltPlus: ' | ') ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself)).
	self s: (self s pltPlus: ')*>\n\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no247 | 
			self code: ((self pkgs pltAt: no247) dtdCodeUsingContext: self class context).
			self
				previous:
					(self previous
						pltPlus:
							(PTsLinesFromStringFunction
								invokeFromValues:
									(OrderedCollection new
										add: self code;
										yourself))).
			self s: (self s pltPlus: self code) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself)).
	self s: (self s pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no1456 | 
			self acode: ((self infered pltAt: no1456) dtdCodeUsingContext: self class context).
			(self previous includes: self acode) not
				ifTrue: [ 
					self s: (self s pltPlus: self acode).
					self previous: (self previous pltPlus: self acode) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self infered;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self infered;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no517 | 
			self
				attributes:
					(self attributes
						pltPlus:
							(ExChdComputePackageAttributeDtdElementsFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self pkgs pltAt: no517);
										yourself))) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no1822 | 
			self acode: ((self attributes pltAt: no1822) dtdCodeUsingContext: self class context).
			(self previous includes: self acode) not
				ifTrue: [ 
					self s: (self s pltPlus: ((self attributes pltAt: no1822) dtdCodeUsingContext: self class context)).
					self previous: (self previous pltPlus: self acode) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attributes;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no3487 | 
			self acode: ((self inferedAttributes pltAt: no3487) dtdCodeUsingContext: self class context).
			(self previous includes: self acode) not
				ifTrue: [ 
					self s: (self s pltPlus: self acode).
					self previous: (self previous pltPlus: self acode) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self inferedAttributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self inferedAttributes;
						yourself)).
	^ self return: self s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> licence [
	^ licence


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> licence: aString2 [
	licence := aString2


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> lines [
	^ lines


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> lines: aListOfString [
	lines := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> pkgs [
	^ pkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> pkgs: aListOfExChdPackageDtdElement [
	pkgs := aListOfExChdPackageDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdPackageDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> previous [
	^ previous


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> previous: aListOfString1 [
	previous := aListOfString1 ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> r: aExChdRootDtdElement [
	r := aExChdRootDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> s [
	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdComputeRootDtdCodeFunction >> s: aString [
	s := aString


]
