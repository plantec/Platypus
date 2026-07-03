"
<ISO10303-11-EXPRESS>
FUNCTION xml_architecture_io_ads_package_code : STRING;
	LOCAL 
		test : STRING := '';
		code : STRING := '';
		pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
		allcls : LIST OF ada_class := all_ada_classes ( );
		allrecs : LIST OF ada_class := all_ada_records ( );
		alldts : LIST OF discriminated_type := all_ada_discriminated_types ( );
		interfaces : LIST OF ada_interface := [ ada_interface ( 'Sax', 'Readers', true, true ), ada_interface ( 'Networks', ?, true, true ), ada_interface ( 'Sax', 'Exceptions', true, true ), ada_interface ( 'Sax', 'Locators', true, true ), ada_interface ( 'Sax', 'Attributes', true, true ), ada_interface ( 'Unicode', 'CES', true, true ), ada_interface ( 'Unicode', ?, true, true ), ada_interface ( 'xml_generic_parsers', ?, true, true ), ada_interface ( 'Ada', 'Text_IO', true, true ), ada_interface ( 'Ada', 'Strings.Unbounded', true, true ), ada_interface ( 'Strings', ?, true, true ), ada_interface ( 'Unbounded_Strings', ?, true, true ), ada_interface ( 'Ada', 'Numerics.Aux', true, true ), ada_interface ( 'call_framework_interface', ?, true, true ), ada_interface ( 'Debug', ?, true, true ) ];
	END_LOCAL;
	code := source_licence + '\n';

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		interfaces := interfaces + ada_interface ( pkgs [ no].name, ?, true, true );
		interfaces := interfaces + ada_package_interface ( pkgs [ no], true );
	END_REPEAT;
	code := source_licence + ada_interfaces_code ( ?, interfaces );
	code := code + 'package xml_architecture_io is\n\n' 

	+ '-- Attributes of the discriminated types\n\n';

	REPEAT no := LOINDEX ( alldts ) TO HIINDEX ( alldts );
		code := code + alldts [ no].xml_io_record_code + '\n';
	END_REPEAT;
	code := code + '\nprocedure Start_Element(' + '\n	Handler: in out Xml_Generic_Parser;' + '\n	ref : in out unbounded_string;' + '\n	id : in out unbounded_string;' + '\n	Namespace_Uri : Unicode.CES.Byte_Sequence := """";' + '\n	Local_Name : Unicode.CES.Byte_Sequence := """";' + '\n	Qname : Unicode.CES.Byte_Sequence := """";' + '\n	Atts : Sax.Attributes.Attributes''Class);\n';

	REPEAT no := LOINDEX ( alldts ) TO HIINDEX ( alldts );
		test := discriminated_type_xml_start_element_code ( alldts [ no] );

		IF ( test > '' ) THEN
			code := code + '\nprocedure Start_Element(\n' 
			+ '\tHandler : in out Xml_generic_parser;\n' 
			+ '\tobj : in out ' + alldts [ no].name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class);\n';
		END_IF;
		code := code + '\nprocedure End_Element(\n' 
		+ '\tHandler : in out Xml_generic_parser;\n' 
		+ '\tobj : in out ' + alldts [ no].name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """");\n';
	END_REPEAT;

	REPEAT no := LOINDEX ( alldts ) TO HIINDEX ( alldts );
		code := code + '\nprocedure Initialize(obj : out ' + alldts [ no].name + '_io);';
	END_REPEAT;
	code := code + '\n\n' 

	+ '-- Attributes of the parsed entities\n\n';

	REPEAT no := LOINDEX ( allrecs ) TO HIINDEX ( allrecs );
		code := code + allrecs [ no].xml_io_record_code + '\n';
	END_REPEAT;
	code := code + '\n';

	REPEAT no := LOINDEX ( allrecs ) TO HIINDEX ( allrecs );
		code := code + '\nprocedure Initialize(obj : out ' + allrecs [ no].name + '_io);';
	END_REPEAT;
	code := code + '\n';

	REPEAT no := LOINDEX ( allrecs ) TO HIINDEX ( allrecs );
		test := ada_entity_xml_start_element_code ( allrecs [ no] );

		IF ( test > '' ) THEN
			code := code + '\nprocedure Start_Element(\n' 
			+ '\tHandler : in out Xml_generic_parser;\n' 
			+ '\tobj : in out ' + allrecs [ no].name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class);\n';
		END_IF;
		code := code + '\nprocedure End_Element(\n' 
		+ '\tHandler : in out Xml_generic_parser;\n' 
		+ '\tobj : in out ' + allrecs [ no].name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """");\n';
	END_REPEAT;

	REPEAT no := LOINDEX ( allcls ) TO HIINDEX ( allcls );
		code := code + allcls [ no].xml_io_record_code + '\n';
	END_REPEAT;
	code := code + '\n';

	REPEAT no := LOINDEX ( allcls ) TO HIINDEX ( allcls );
		code := code + '\nprocedure Initialize(obj : out ' + allcls [ no].name + '_io);';
	END_REPEAT;
	code := code + '\n';

	REPEAT no := LOINDEX ( allcls ) TO HIINDEX ( allcls );
		test := ada_entity_xml_start_element_code ( allcls [ no] );

		IF ( test > '' ) THEN
			code := code + '\nprocedure Start_Element(\n' 
			+ '\tHandler : in out Xml_generic_parser;\n' 
			+ '\tobj : in out ' + allcls [ no].name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class);\n';
		END_IF;
		code := code + '\nprocedure End_Element(\n' 
		+ '\tHandler : in out Xml_generic_parser;\n' 
		+ '\tobj : in out ' + allcls [ no].name + '_io;\n' 
		+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
		+ '\tQname : Unicode.CES.Byte_Sequence := """");\n';
	END_REPEAT;
	code := code + '\n\nend xml_architecture_io;\n';
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdXmlArchitectureIoAdsPackageCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'test',
		'code',
		'pkgs',
		'allcls',
		'allrecs',
		'alldts',
		'interfaces'
	],
	#category : 'Express2Cheddar-XmlIoSchema',
	#package : 'Express2Cheddar',
	#tag : 'XmlIoSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdsPackageCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction class >> schemaDefinition [
	^ ExChdXmlIoSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdsPackageCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlArchitectureIoAdsPackageCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> allcls [
	^ allcls


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> allcls: aListOfExChdAdaClass [
	allcls := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> alldts [
	^ alldts


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> alldts: aListOfExChdDiscriminatedType [
	alldts := aListOfExChdDiscriminatedType
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDiscriminatedType as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> allrecs [
	^ allrecs


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> allrecs: aListOfExChdAdaClass1 [
	allrecs := aListOfExChdAdaClass1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> code: aString1 [
	code := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> interfaces [
	^ interfaces


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> interfaces: aListOfExChdAdaInterface [
	interfaces := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : 'platypus-generated-invoking' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self test: ''.
	self code: ''.
	self
		pkgs:
			(PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself)).
	self allcls: ExChdAllAdaClassesFunction invoke.
	self allrecs: ExChdAllAdaRecordsFunction invoke.
	self alldts: ExChdAllAdaDiscriminatedTypesFunction invoke.
	self
		interfaces:
			(PlatypusCoreAggregateInitializer
				collectionFrom:
					(OrderedCollection new
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Sax';
														add: 'Readers';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Networks';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Sax';
														add: 'Exceptions';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Sax';
														add: 'Locators';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Sax';
														add: 'Attributes';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Unicode';
														add: 'CES';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Unicode';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'xml_generic_parsers';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Ada';
														add: 'Text_IO';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Ada';
														add: 'Strings.Unbounded';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Strings';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Unbounded_Strings';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Ada';
														add: 'Numerics.Aux';
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'call_framework_interface';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						add:
								(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'Debug';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself);
						yourself)).	" ---------- statements ----------"
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
	PlatypusCoreRepeatStatement
		repeat: [ :no2 | 
			self
				interfaces:
					(self interfaces
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: ((self pkgs pltAt: no2) nameUsingContext: self class context);
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself)).
			self
				interfaces:
					(self interfaces
						pltPlus:
							(ExChdAdaPackageInterfaceFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self pkgs pltAt: no2);
										add: true;
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
				pltPlus: '------------------------------------------------------------------------------\n')
				pltPlus:
					(ExChdAdaInterfacesCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: nil;
								add: self interfaces;
								yourself))).
	self
		code:
			((self code pltPlus: 'package xml_architecture_io is\n\n') pltPlus: '-- Attributes of the discriminated types\n\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no2218 | 
			self
				code:
					((self code pltPlus: ((self alldts pltAt: no2218) xmlIoRecordCodeUsingContext: self class context)) pltPlus: '\n') ]
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
	self
		code:
			((((((((self code pltPlus: '\nprocedure Start_Element(') pltPlus: '\n	Handler: in out Xml_Generic_Parser;')
				pltPlus: '\n	ref : in out unbounded_string;') pltPlus: '\n	id : in out unbounded_string;')
				pltPlus: '\n	Namespace_Uri : Unicode.CES.Byte_Sequence := "";')
				pltPlus: '\n	Local_Name : Unicode.CES.Byte_Sequence := "";') pltPlus: '\n	Qname : Unicode.CES.Byte_Sequence := "";')
				pltPlus: '\n	Atts : Sax.Attributes.Attributes''Class);\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3465 | 
			self
				test:
					(ExChdDiscriminatedTypeXmlStartElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self alldts pltAt: no3465);
								yourself)).
			self test > ''
				ifTrue: [ 
					self
						code:
							(((((((((self code pltPlus: '\nprocedure Start_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
								pltPlus: '\tobj : in out ') pltPlus: ((self alldts pltAt: no3465) nameUsingContext: self class context))
								pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tAtts : Sax.Attributes.Attributes''Class);\n') ].
			self
				code:
					((((((((self code pltPlus: '\nprocedure End_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
						pltPlus: '\tobj : in out ') pltPlus: ((self alldts pltAt: no3465) nameUsingContext: self class context))
						pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "");\n') ]
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
		repeat: [ :no3305 | 
			self
				code:
					(((self code pltPlus: '\nprocedure Initialize(obj : out ')
						pltPlus: ((self alldts pltAt: no3305) nameUsingContext: self class context)) pltPlus: '_io);') ]
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
	self code: ((self code pltPlus: '\n\n') pltPlus: '-- Attributes of the parsed entities\n\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3543 | 
			self
				code:
					((self code pltPlus: ((self allrecs pltAt: no3543) xmlIoRecordCodeUsingContext: self class context)) pltPlus: '\n') ]
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
	self code: (self code pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no826 | 
			self
				code:
					(((self code pltPlus: '\nprocedure Initialize(obj : out ')
						pltPlus: ((self allrecs pltAt: no826) nameUsingContext: self class context)) pltPlus: '_io);') ]
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
	self code: (self code pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3410 | 
			self
				test:
					(ExChdAdaEntityXmlStartElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self allrecs pltAt: no3410);
								yourself)).
			self test > ''
				ifTrue: [ 
					self
						code:
							(((((((((self code pltPlus: '\nprocedure Start_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
								pltPlus: '\tobj : in out ') pltPlus: ((self allrecs pltAt: no3410) nameUsingContext: self class context))
								pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tAtts : Sax.Attributes.Attributes''Class);\n') ].
			self
				code:
					((((((((self code pltPlus: '\nprocedure End_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
						pltPlus: '\tobj : in out ') pltPlus: ((self allrecs pltAt: no3410) nameUsingContext: self class context))
						pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "");\n') ]
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
		repeat: [ :no3242 | 
			self
				code:
					((self code pltPlus: ((self allcls pltAt: no3242) xmlIoRecordCodeUsingContext: self class context)) pltPlus: '\n') ]
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
	self code: (self code pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no504 | 
			self
				code:
					(((self code pltPlus: '\nprocedure Initialize(obj : out ')
						pltPlus: ((self allcls pltAt: no504) nameUsingContext: self class context)) pltPlus: '_io);') ]
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
	self code: (self code pltPlus: '\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no3088 | 
			self
				test:
					(ExChdAdaEntityXmlStartElementCodeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self allcls pltAt: no3088);
								yourself)).
			self test > ''
				ifTrue: [ 
					self
						code:
							(((((((((self code pltPlus: '\nprocedure Start_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
								pltPlus: '\tobj : in out ') pltPlus: ((self allcls pltAt: no3088) nameUsingContext: self class context))
								pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "";\n')
								pltPlus: '\tAtts : Sax.Attributes.Attributes''Class);\n') ].
			self
				code:
					((((((((self code pltPlus: '\nprocedure End_Element(\n') pltPlus: '\tHandler : in out Xml_generic_parser;\n')
						pltPlus: '\tobj : in out ') pltPlus: ((self allcls pltAt: no3088) nameUsingContext: self class context))
						pltPlus: '_io;\n') pltPlus: '\tNamespace_Uri : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tLocal_Name : Unicode.CES.Byte_Sequence := "";\n')
						pltPlus: '\tQname : Unicode.CES.Byte_Sequence := "");\n') ]
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
	self code: (self code pltPlus: '\n\nend xml_architecture_io;\n').
	^ self return: self code


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> pkgs [
	^ pkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> pkgs: aListOfExChdAdaPackage [
	pkgs := aListOfExChdAdaPackage
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaPackage as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> test [
	^ test


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlArchitectureIoAdsPackageCodeFunction >> test: aString [
	test := aString


]
