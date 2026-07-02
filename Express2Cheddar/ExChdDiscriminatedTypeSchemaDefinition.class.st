"
<ISO10303-11-EXPRESS>
SCHEMA discriminated_type;
	USE FROM platypus_dictionary_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express_dictionary_queries;
	USE FROM express2cheddar_facade;
	USE FROM record_and_class;
	USE FROM cheddar_domains;
	USE FROM ada_interface;

	ENTITY discriminated_type 
		SUBTYPE OF ( ada_entity );
	DERIVE
		SELF\ada_entity.refed_by_pointer : BOOLEAN := false;
		discriminant : attribute := QUERY ( attr <* attributes | 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_DISCRIMINANT' IN TYPEOF ( attr ) ) [ 1 ];
		union_attr : attribute := QUERY ( attr <* attributes | 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE_UNION' IN TYPEOF ( attr ) ) [ 1 ];
		ads_interfaces_list : LIST OF ada_interface := discriminated_Type_interfaces_list ( SELF, true );
		adb_interfaces_list : LIST OF ada_interface := discriminated_Type_interfaces_list ( SELF, false );
		translated_attributes : LIST OF explicit_attribute := explicit_attributes - discriminant - union_attr;
		SELF\ada_entity.ada_ident : STRING := name;
		SELF\ada_entity.ada_ref_ident : STRING := SELF.ada_ident + '_Ptr';
		SELF\ada_entity.xml_io_record_code : STRING := discriminated_type_xml_io_record_code ( SELF );
		tail_attributes : LIST OF attribute := discriminated_type_tails_attributes ( SELF );
		ads_code : STRING := discriminated_type_ads_code ( SELF );
		adb_code : STRING := discriminated_type_adb_code ( SELF );
		ads_pre_def : STRING := '';
	END_ENTITY;

	ENTITY discriminated_type_discriminant 
		SUBTYPE OF ( explicit_attribute );
	END_ENTITY;

	ENTITY discriminated_type_union 
		SUBTYPE OF ( explicit_attribute );
	END_ENTITY;

	ENTITY discriminated_type_union_element_type 
		SUBTYPE OF ( ada_entity );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ads_code : STRING := '';
		adb_code : STRING := '';
		union_ads_code : STRING := discriminated_type_union_element_case_code ( SELF );
		ads_pre_def : STRING := '';
	END_ENTITY;

	ENTITY discriminated_type_union_type 
		SUBTYPE OF ( ada_entity );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := discriminated_type_union_type_interfaces_list ( SELF, true );
		adb_interfaces_list : LIST OF ada_interface := discriminated_type_union_type_interfaces_list ( SELF, false );
		ads_code : STRING := '';
		adb_code : STRING := '';
		union_ads_code : STRING := discriminated_type_union_case_code ( SELF );
		all_attributes : LIST OF attribute := inherited_explicit_attributes ( SELF );
		ads_pre_def : STRING := '';
	END_ENTITY;

	FUNCTION discriminated_type_attributes ( d : discriminated_type ) : LIST OF attribute;
		LOCAL 
			other_attrs : LIST OF attribute := [ d.discriminant] + d.translated_attributes;
			tail_attrs : LIST OF explicit_attribute := discriminated_type_tails_attributes ( d );
			attrs : LIST OF attribute := other_attrs + tail_attrs;
		END_LOCAL;
		RETURN ( attrs );
	END_FUNCTION;

	FUNCTION discriminated_type_interfaces_list ( r : discriminated_type; ads : BOOLEAN ) : LIST OF ada_interface;
		RETURN ( ada_entity_interfaces_list ( r, ads ) );
	END_FUNCTION;

	FUNCTION discriminated_type_union_type_interfaces_list ( d : discriminated_type_union_type; isAds : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			l : LIST OF ada_interface := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( d.attributes ) TO HIINDEX ( d.attributes );
			ALIAS curr FOR d.attributes [ no];
				l := l + entity_definition_interfaces_list ( curr.domain.handled, isAds );
			END_ALIAS;
		END_REPEAT;
		RETURN ( l );
	END_FUNCTION;

	FUNCTION discriminated_type_adb_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING;
			acode : STRING;
			discrim_attr : attribute := typ.discriminant;
			union_attr : attribute := typ.union_attr;
			union_type : defined_type := union_attr.domain.handled;
			union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
			transl_attrs : LIST OF attribute := typ.translated_attributes;
			v : STRING := 'New_' + typ.name;
		END_LOCAL;
		code := 'procedure Initialize (obj : out ' + typ.name + '_Ptr) is\n' 
		+ 'begin\n' 
		+ '\tobj := NULL;\n' 
		+ 'end Initialize;\n \n' 
		+ 'procedure Put(obj : in ' + typ.name + '_Ptr) is\n' 
		+ 'begin\n' 
		+ '\tif (obj /= NULL) then\n';

		REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );
			ALIAS attr FOR transl_attrs [ no];
				acode := explicit_attribute_put ( attr );
				IF ( acode > '' ) THEN
					code := code + '\t\t' + acode + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		code := code + '\t\t' + explicit_attribute_put ( discrim_attr ) + '\n' 
		+ '\t\tput ( ""value: "" );\n' 
		+ '\t\tcase obj.' + discrim_attr.name + ' is \n';

		REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );
			ALIAS union_attr FOR union_attributes [ no];
				ALIAS ada_domain FOR basic_ada_domain ( union_attr.domain ).handled;
					ALIAS element_attributes FOR inherited_explicit_attributes ( ada_domain );
						code := code + '\t\t\twhen ' + union_attr.name + ' => \n';
						REPEAT noi := LOINDEX ( element_attributes ) TO HIINDEX ( element_attributes );
							ALIAS element_attr FOR element_attributes [ noi];
								acode := explicit_attribute_put ( element_attr );
								IF ( acode > '' ) THEN
									code := code + '\t\t\t\t' + acode + '\n';
								END_IF;
							END_ALIAS;
						END_REPEAT;
					END_ALIAS;
				END_ALIAS;
			END_ALIAS;
			code := code + '\n';
		END_REPEAT;
		code := code + '\t\tend case;\n\tend if;\n\tNew_Line;\nend Put;\n\n' 

		+ 'function Copy ( obj : in ' + typ.name + ' ) return ' + typ.ptr_type + ' is\n' 
		+ '\t' + v + ' : ' + typ.ptr_type + ';\n' 
		+ 'begin\n' 
		+ '\t' + v + ' := new ' + typ.name + '''(obj);\n' 
		+ '\treturn (' + v + ');\n' 
		+ 'end Copy;\n\n' 

		+ 'function Copy ( obj : in ' + typ.ptr_type + ' ) return ' + typ.ptr_type + ' is\n' 
		+ 'begin\n' 
		+ '\treturn copy(obj.all);\n' 
		+ 'end Copy;\n\n' 

		+ 'function XML_String(obj : in ' + typ.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '	result := to_unbounded_string(""<' + typ.html_tag + '>"");\n';

		REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );
			ALIAS attr FOR transl_attrs [ no];
				acode := explicit_attribute_xml_writer_code ( 'obj', attr );
				IF ( acode > '' ) THEN
					code := code + '\t\t' + acode + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		code := code + explicit_attribute_xml_writer_code ( 'obj', discrim_attr ) + '\n\n' 

		+ '\tcase obj.' + discrim_attr.name + ' is \n';

		REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );
			ALIAS union_attr FOR union_attributes [ no];
				ALIAS ada_domain FOR basic_ada_domain ( union_attr.domain ).handled;
					ALIAS element_attributes FOR inherited_explicit_attributes ( ada_domain );
						code := code + '\t\twhen ' + union_attr.name + ' => \n';
						REPEAT noi := LOINDEX ( element_attributes ) TO HIINDEX ( element_attributes );
							ALIAS element_attr FOR element_attributes [ noi];
								acode := explicit_attribute_xml_writer_code ( 'obj', element_attr );
								IF ( acode > '' ) THEN
									code := code + '\t\t' + acode + '\n';
								END_IF;
							END_ALIAS;
						END_REPEAT;
					END_ALIAS;
				END_ALIAS;
			END_ALIAS;
			code := code + '\n';
		END_REPEAT;
		code := code + '\tend case;\n' 
		+ '\tresult := result & to_unbounded_string(""</' + typ.html_tag + '>"");\n' 
		+ '\treturn (result);\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_String(obj : in ' + typ.name + '_Ptr) return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '	return XML_String(obj.all);\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_Ref_String(obj : in ' + typ.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '	raise xml_ref_string_error;\n' 
		+ '	return to_unbounded_string("""");\n' 
		+ 'end XML_Ref_String;\n' 
		+ 'function XML_Ref_String(obj : in ' + typ.name + '_Ptr) return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '	return XML_Ref_String(obj.all);\n' 
		+ 'end XML_Ref_String;\n\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_ads_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			result : STRING;
			discrim_attr : attribute := typ.discriminant;
			discrim_type : entity_instance := discrim_attr.domain.handled;
			union_attr : attribute := typ.union_attr;
			union_type : defined_type := union_attr.domain.handled;
			union_selections : LIST OF attribute := inherited_explicit_attributes ( union_type );
			domain : entity_instance;
			transl_attrs : LIST OF attribute := typ.translated_attributes;
		END_LOCAL;
		result := 'type ' + typ.name + ' (' + discrim_attr.name + ' : ' + discrim_type.name + ' ) is record\n';

		REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );
			ALIAS attr FOR transl_attrs [ no];
				domain := basic_ada_domain ( attr.domain );
				IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) THEN
					result := result + '\t' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
				ELSE
					result := result + '\t' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		result := result + '\tcase ' + discrim_attr.name + ' is \n' 
		+ union_type.union_ads_code + '\tend case;\nend record;\n\n' 

		+ 'type ' + typ.ptr_type + ' is access all ' + typ.name + ';\n' 
		+ '\nprocedure Initialize(obj : out ' + typ.ptr_type + ');\n' 
		+ '\nprocedure Put(obj : in ' + typ.ptr_type + ');\n' 
		+ 'function Copy(obj : in ' + typ.ptr_type + ') return ' + typ.ptr_type + ';\n' 
		+ 'function Copy(obj : in ' + typ.name + ') return ' + typ.ptr_type + ';\n' 
		+ 'function XML_String(obj : in ' + typ.name + ') return Unbounded_String;\n' 
		+ '\nfunction XML_String(obj : in ' + typ.ptr_type + ') return Unbounded_String;\n' 
		+ 'procedure Free  is new Unchecked_Deallocation (' + typ.name + ', ' + typ.ptr_type + ');\n' 
		+ 'function XML_Ref_String(obj : in ' + typ.name + ') return Unbounded_String;\n' 
		+ '\nfunction XML_Ref_String(obj : in ' + typ.ptr_type + ') return Unbounded_String;\n';
		RETURN ( result );
	END_FUNCTION;

	FUNCTION discriminated_type_union_case_code ( u : discriminated_type_union_type ) : STRING;
		LOCAL 
			code : STRING := '';
			all_attributes : LIST OF attribute := inherited_explicit_attributes ( u );
		END_LOCAL;

		REPEAT no := LOINDEX ( all_attributes ) TO HIINDEX ( all_attributes );
			ALIAS attr FOR all_attributes [ no];
				ALIAS ada_domain FOR basic_ada_domain ( attr.domain ).handled;
					code := code + '\t\twhen ' + attr.name + ' => \n ' + ada_domain.union_ads_code;
				END_ALIAS;
			END_ALIAS;
			code := code + '\n';
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_union_element_case_code ( u : discriminated_type_union_element_type ) : STRING;
		LOCAL 
			code : STRING := '';
			all_attributes : LIST OF attribute := inherited_explicit_attributes ( u );
			domain : entity_instance;
		END_LOCAL;

		REPEAT no := LOINDEX ( all_attributes ) TO HIINDEX ( all_attributes );
			ALIAS attr FOR all_attributes [ no];
				domain := basic_ada_domain ( attr.domain );
				IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) THEN
					code := code + '\t\t\t' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
				ELSE
					code := code + '\t\t\t' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_xml_io_record_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING := '';
			discrim_attr : attribute := typ.discriminant;
			discrim_type : entity_instance := discrim_attr.domain.handled;
			union_attr : attribute := typ.union_attr;
			union_type : defined_type := union_attr.domain.handled;
			union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
			tails_attrs : LIST OF attribute := typ.tail_attributes;
			transl_attrs : LIST OF attribute := typ.translated_attributes;
		END_LOCAL;
		code := '\ntype ' + typ.name + '_io is record' + '\n\t' + discrim_attr.name + ' : ' + discrim_type.name + ';';

		REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );
			ALIAS attr FOR transl_attrs [ no];
				code := code + explicit_attribute_xml_io_record_code ( attr );
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( tails_attrs ) TO HIINDEX ( tails_attrs );
			ALIAS attr FOR tails_attrs [ no];
				code := code + explicit_attribute_xml_io_record_code ( attr );
			END_ALIAS;
		END_REPEAT;
		code := code + '\nend record;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_tails_attributes ( typ : discriminated_type ) : LIST OF attribute;
		LOCAL 
			union_attr : attribute := typ.union_attr;
			union_type : defined_type := union_attr.domain.handled;
			union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
			found : LIST OF attribute := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );
			ALIAS curr FOR union_attributes [ no];
				ALIAS handled FOR curr.domain.handled;
					found := found + inherited_explicit_attributes ( handled );
				END_ALIAS;
			END_ALIAS;
		END_REPEAT;
		RETURN ( found );
	END_FUNCTION;

	FUNCTION discriminated_type_xml_end_element_code ( typ : discriminated_type ) : STRING;
		RETURN ( '\nprocedure End_Element(\n' 
			+ '\tHandler : in out Xml_generic_parser;\n' 
			+ '\tobj : in out ' + typ.name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name    : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """") is \nbegin\n' 
			+ discriminated_type_attributes_xml_end_element_code ( typ ) + '\nend End_Element;\n' );
	END_FUNCTION;

	FUNCTION discriminated_type_xml_start_element_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING := discriminated_type_attributes_xml_start_element_code ( typ );
		END_LOCAL;

		IF ( code > '' ) THEN
			code := '\nprocedure Start_Element(\n' 
			+ '\tHandler: in out Xml_Generic_Parser;\n' 
			+ '\tobj : in out ' + typ.name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n' 
			+ '\tif Get_Length (Atts) > 0 then' + code + '\n' 
			+ '\tend if;\n' 
			+ 'end Start_Element;\n';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_attributes_xml_end_element_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
			discrim_attr : attribute := typ.discriminant;
			attrs : LIST OF attribute := typ.tail_attributes + typ.translated_attributes;
		END_LOCAL;
		code := code + explicit_attribute_xml_end_element_code ( discrim_attr ) + '\n';

		REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );
			ALIAS attr FOR attrs [ no];
				s := explicit_attribute_xml_end_element_code ( attr );
				IF ( s > '' ) THEN
					code := code + '\n' 
					+ s;
				END_IF;
			END_ALIAS;
		END_REPEAT;

		IF ( code = '' ) THEN
			code := '\tnull;\n';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_attributes_xml_start_element_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
			discrim_attr : attribute := typ.discriminant;
			attrs : LIST OF attribute := typ.tail_attributes + typ.translated_attributes;
		END_LOCAL;
		code := explicit_attribute_xml_start_element_code ( discrim_attr );

		REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );
			ALIAS attr FOR attrs [ no];
				s := explicit_attribute_xml_start_element_code ( attr );
				IF ( s > '' ) THEN
					code := code + '\n' 
					+ s;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_attributes_xml_io_record_initialize_code ( typ : discriminated_type ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
			discrim_attr : attribute := typ.discriminant;
			attrs : LIST OF attribute := typ.tail_attributes + typ.translated_attributes;
		END_LOCAL;
		code := code + explicit_attribute_xml_io_record_initialize_code ( discrim_attr ) + '\n';

		REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );
			ALIAS attr FOR attrs [ no];
				s := explicit_attribute_xml_io_record_initialize_code ( attr );
				IF ( s > '' ) THEN
					code := code + '\n' 
					+ s;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION discriminated_type_xml_io_record_initialize_code ( typ : discriminated_type ) : STRING;
		RETURN ( '\nprocedure Initialize(obj : out ' + typ.name + '_io) is \nbegin ' + discriminated_type_attributes_xml_io_record_initialize_code ( typ ) + '\nend Initialize;\n' );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeSchemaDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-context-accessing' }
ExChdDiscriminatedTypeSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinition1 [
	^ #(#discriminated_type #ExChdDiscriminatedType)


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinition2 [
	^ #(#discriminated_type_discriminant #ExChdDiscriminatedTypeDiscriminant)


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinition3 [
	^ #(#discriminated_type_union #ExChdDiscriminatedTypeUnion)


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinition4 [
	^ #(#discriminated_type_union_element_type #ExChdDiscriminatedTypeUnionElementType)


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinition5 [
	^ #(#discriminated_type_union_type #ExChdDiscriminatedTypeUnionType)


]

{ #category : #'platypus-generated-entities' }
ExChdDiscriminatedTypeSchemaDefinition >> entityDefinitionCount [
	^ 5


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration1 [
	^ #(#discriminated_type_attributes #ExChdDiscriminatedTypeAttributesFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration10 [
	^ #(#discriminated_type_xml_end_element_code #ExChdDiscriminatedTypeXmlEndElementCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration11 [
	^ #(#discriminated_type_xml_start_element_code #ExChdDiscriminatedTypeXmlStartElementCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration12 [
	^ #(#discriminated_type_attributes_xml_end_element_code #ExChdDiscriminatedTypeAttributesXmlEndElementCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration13 [
	^ #(#discriminated_type_attributes_xml_start_element_code #ExChdDiscriminatedTypeAttributesXmlStartElementCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration14 [
	^ #(#discriminated_type_attributes_xml_io_record_initialize_code #ExChdDiscriminatedTypeAttributesXmlIoRecordInitializeCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration15 [
	^ #(#discriminated_type_xml_io_record_initialize_code #ExChdDiscriminatedTypeXmlIoRecordInitializeCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration2 [
	^ #(#discriminated_type_interfaces_list #ExChdDiscriminatedTypeInterfacesListFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration3 [
	^ #(#discriminated_type_union_type_interfaces_list #ExChdDiscriminatedTypeUnionTypeInterfacesListFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration4 [
	^ #(#discriminated_type_adb_code #ExChdDiscriminatedTypeAdbCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration5 [
	^ #(#discriminated_type_ads_code #ExChdDiscriminatedTypeAdsCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration6 [
	^ #(#discriminated_type_union_case_code #ExChdDiscriminatedTypeUnionCaseCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration7 [
	^ #(#discriminated_type_union_element_case_code #ExChdDiscriminatedTypeUnionElementCaseCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration8 [
	^ #(#discriminated_type_xml_io_record_code #ExChdDiscriminatedTypeXmlIoRecordCodeFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclaration9 [
	^ #(#discriminated_type_tails_attributes #ExChdDiscriminatedTypeTailsAttributesFunction)


]

{ #category : #'platypus-generated-functions' }
ExChdDiscriminatedTypeSchemaDefinition >> functionDeclarationCount [
	^ 15


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeSchemaDefinition >> schemaInstanceClassName [
	^ #ExChdExpress2cheddarSchemaInstance


]
