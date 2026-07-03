"
<ISO10303-11-EXPRESS>
SCHEMA xml_io;
	USE FROM platypus_dictionary_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express2cheddar_facade;
	USE FROM record_and_class;
	USE FROM discriminated_type;
	USE FROM ada_interface;
	USE FROM package;

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
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdXmlIoSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-XmlIoSchema',
	#package : 'Express2Cheddar',
	#tag : 'XmlIoSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlIoSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlIoSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlIoSchemaDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdXmlIoSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdXmlIoSchemaDefinition >> entityDefinitionCount [
	^ 0


]

{ #category : 'platypus-generated-functions' }
ExChdXmlIoSchemaDefinition >> functionDeclaration1 [
	^ #(#xml_architecture_io_ads_package_code #ExChdXmlArchitectureIoAdsPackageCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdXmlIoSchemaDefinition >> functionDeclaration2 [
	^ #(#xml_architecture_io_adb_package_code #ExChdXmlArchitectureIoAdbPackageCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdXmlIoSchemaDefinition >> functionDeclarationCount [
	^ 2


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdXmlIoSchemaDefinition >> schemaInstanceClassName [
	^ #ExChdExpress2cheddarSchemaInstance


]
