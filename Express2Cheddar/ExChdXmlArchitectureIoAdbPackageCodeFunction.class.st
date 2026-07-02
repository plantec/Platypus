"
<ISO10303-11-EXPRESS>
FUNCTION xml_architecture_io_adb_package_code : STRING;
	LOCAL 
		code : STRING := '';
		allcls : LIST OF ada_class := all_ada_classes ( );
		allrecs : LIST OF record := all_ada_records ( );
		allents : LIST OF ada_entity := allcls + allrecs;
		strtab : LIST OF STRING := [ ];
		alldts : LIST OF discriminated_type := all_ada_discriminated_types ( );
	END_LOCAL;
	code := source_licence + '\n';
	code := code + 'package body xml_architecture_io is\n\n';
	code := code + '\n';
	code := code + '\nprocedure Start_Element(' + '\n	Handler: in out Xml_Generic_Parser;' + '\n	ref : in out unbounded_string;' + '\n	id : in out unbounded_string;' + '\n	Namespace_Uri : Unicode.CES.Byte_Sequence := """";' + '\n	Local_Name : Unicode.CES.Byte_Sequence := """";' + '\n	Qname : Unicode.CES.Byte_Sequence := """";' + '\n	Atts : Sax.Attributes.Attributes''Class) is' + '\nbegin' + '\n	if Get_Length (Atts) > 0 then' + '\n		if (To_String (To_Lower (Qname)) = ""' + Lowerize ( allents [ LOINDEX ( allents ) ].name ) + '"")';

	REPEAT no := LOINDEX ( allents ) + 1 TO HIINDEX ( allents );
		code := code + '\n\t\t\t OR (To_String (To_Lower (Qname)) = ""' + Lowerize ( allents [ no].name ) + '"")';
	END_REPEAT;
	code := code + ' then' + '\n			for J in 0 .. Get_Length (Atts) - 1 loop' + '\n				if To_String (To_Lower (Get_Qname (Atts, J))) = ""id"" then' + '\n					id := To_Unbounded_String (Get_Value (Atts, J));' + '\n				end if;' + '\n				if To_String (To_Lower (Get_Qname (Atts, J))) = ""ref"" then' + '\n					ref := To_Unbounded_String (Get_Value (Atts, J));' + '\n				end if;' + '\n			end loop;' + '\n		end if;' + '\n	end if;' + '\nend Start_Element;\n\n';

	REPEAT no := LOINDEX ( alldts ) TO HIINDEX ( alldts );
		code := code + discriminated_type_xml_io_record_initialize_code ( alldts [ no] );
		code := code + discriminated_type_xml_start_element_code ( alldts [ no] );
		code := code + discriminated_type_xml_end_element_code ( alldts [ no] );
	END_REPEAT;

	REPEAT no := LOINDEX ( allrecs ) TO HIINDEX ( allrecs );
		code := code + ada_entity_xml_io_record_initialize_code ( allrecs [ no] );
		code := code + ada_entity_xml_start_element_code ( allrecs [ no] );
		code := code + ada_entity_xml_end_element_code ( allrecs [ no] );
	END_REPEAT;

	REPEAT no := LOINDEX ( allcls ) TO HIINDEX ( allcls );
		code := code + ada_entity_xml_io_record_initialize_code ( allcls [ no] );
		code := code + ada_entity_xml_start_element_code ( allcls [ no] );
		code := code + ada_entity_xml_end_element_code ( allcls [ no] );
	END_REPEAT;
	code := code + 'end xml_architecture_io;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdXmlArchitectureIoAdbPackageCodeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'code',
		'allcls',
		'allrecs',
		'allents',
		'strtab',
		'alldts'
	],
	#category : #'Express2Cheddar-XmlIoSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdbPackageCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction class >> schemaDefinition [
	^ ExChdXmlIoSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdbPackageCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdbPackageCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allcls [
	^ allcls


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allcls: aListOfExChdAdaClass [
	allcls := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> alldts [
	^ alldts


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> alldts: aListOfExChdDiscriminatedType [
	alldts := aListOfExChdDiscriminatedType
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDiscriminatedType as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allents [
	^ allents


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allents: aListOfExChdAdaEntity [
	allents := aListOfExChdAdaEntity
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaEntity as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allrecs [
	^ allrecs


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> allrecs: aListOfExChdRecord [
	allrecs := aListOfExChdRecord ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfExChdRecord as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-invoking' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.
	self allcls: ExChdAllAdaClassesFunction invoke.
	self allrecs: ExChdAllAdaRecordsFunction invoke.
	self allents: (self allcls pltPlus: self allrecs).
	self strtab: Array new.
	self alldts: ExChdAllAdaDiscriminatedTypesFunction invoke.	" ---------- statements ----------"
	self
		code:
			(((((((((((((((((((((((((((((((((((((((''
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
				pltPlus: '------------------------------------------------------------------------------\n') pltPlus: '\n').
	self code: (self code pltPlus: 'package body xml_architecture_io is\n\n').
	self code: (self code pltPlus: '\n').
	self
		code:
			(((((((((((((self code pltPlus: '\nprocedure Start_Element(') pltPlus: '\n	Handler: in out Xml_Generic_Parser;')
				pltPlus: '\n	ref : in out unbounded_string;') pltPlus: '\n	id : in out unbounded_string;')
				pltPlus: '\n	Namespace_Uri : Unicode.CES.Byte_Sequence := "";')
				pltPlus: '\n	Local_Name : Unicode.CES.Byte_Sequence := "";') pltPlus: '\n	Qname : Unicode.CES.Byte_Sequence := "";')
				pltPlus: '\n	Atts : Sax.Attributes.Attributes''Class) is') pltPlus: '\nbegin')
				pltPlus: '\n	if Get_Length (Atts) > 0 then') pltPlus: '\n		if (To_String (To_Lower (Qname)) = "')
				pltPlus:
					(PTsLowerizeFunction
						invokeFromValues:
							(OrderedCollection new
								add:
										((self allents
												pltAt:
													(PltLOINDEXFunction
														invokeFromValues:
															(OrderedCollection new
																add: self allents;
																yourself))) nameUsingContext: self class context);
								yourself))) pltPlus: '")').
	PlatypusCoreRepeatStatement
		repeat: [ :no793 | 
			self
				code:
					(((self code pltPlus: '\n\t\t\t OR (To_String (To_Lower (Qname)) = "')
						pltPlus:
							(PTsLowerizeFunction
								invokeFromValues:
									(OrderedCollection new
										add: ((self allents pltAt: no793) nameUsingContext: self class context);
										yourself))) pltPlus: '")') ]
		from:
			((PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allents;
						yourself)) pltPlus: 1)
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allents;
						yourself)).
	self
		code:
			((((((((((((self code pltPlus: ' then') pltPlus: '\n			for J in 0 .. Get_Length (Atts) - 1 loop')
				pltPlus: '\n				if To_String (To_Lower (Get_Qname (Atts, J))) = "id" then')
				pltPlus: '\n					id := To_Unbounded_String (Get_Value (Atts, J));') pltPlus: '\n				end if;')
				pltPlus: '\n				if To_String (To_Lower (Get_Qname (Atts, J))) = "ref" then')
				pltPlus: '\n					ref := To_Unbounded_String (Get_Value (Atts, J));') pltPlus: '\n				end if;')
				pltPlus: '\n			end loop;') pltPlus: '\n		end if;') pltPlus: '\n	end if;') pltPlus: '\nend Start_Element;\n\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3362 | 
			self
				code:
					(self code
						pltPlus:
							(ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self alldts pltAt: no3362);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdDiscriminatedTypeXmlStartElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self alldts pltAt: no3362);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdDiscriminatedTypeXmlEndElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self alldts pltAt: no3362);
										yourself))) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self alldts;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self alldts;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no183 | 
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlIoRecordInitializeCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allrecs pltAt: no183);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlStartElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allrecs pltAt: no183);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlEndElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allrecs pltAt: no183);
										yourself))) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allrecs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allrecs;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no1076 | 
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlIoRecordInitializeCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allcls pltAt: no1076);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlStartElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allcls pltAt: no1076);
										yourself))).
			self
				code:
					(self code
						pltPlus:
							(ExChdAdaEntityXmlEndElementCodeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self allcls pltAt: no1076);
										yourself))) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allcls;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allcls;
						yourself)).
	self code: (self code pltPlus: 'end xml_architecture_io;\n').
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> strtab [
	^ strtab


]

{ #category : #'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdbPackageCodeFunction >> strtab: aListOfString [
	strtab := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]
