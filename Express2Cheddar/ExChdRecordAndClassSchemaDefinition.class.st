"
<ISO10303-11-EXPRESS>
SCHEMA record_and_class;
	USE FROM platypus_dictionary_schema;
	USE FROM platypus_environment_schema;
	USE FROM platypus_expressions_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express_dictionary_queries;
	USE FROM express2cheddar_facade;
	USE FROM cheddar_domains;
	USE FROM discriminated_type;
	USE FROM ada_interface;

	ENTITY ada_entity 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( entity_definition );
	DERIVE
		refed_by_pointer : BOOLEAN := false;
		ada_ident : STRING := name;
		ada_ref_ident : STRING := SELF.ada_ident;
		ptr_type : STRING := name + '_Ptr';
		explicit_attributes : LIST OF explicit_attribute := QUERY ( a <* attributes | 'PLATYPUS_DICTIONARY_SCHEMA.EXPLICIT_ATTRIBUTE' IN TYPEOF ( a ) );
		derived_attributes : LIST OF explicit_attribute := QUERY ( a <* attributes | 'PLATYPUS_DICTIONARY_SCHEMA.DERIVED_ATTRIBUTE' IN TYPEOF ( a ) );
		put_prefix : STRING := '';
		dependencies : LIST OF dictionary_instance := dependencies_of_ada_entity ( SELF.owner, SELF );
		xml_writer_code : STRING := ?;
		xml_io_record_code : STRING := ?;
		html_tag : STRING := Lowerize ( SELF.name );
	END_ENTITY;

	ENTITY ada_class 
		SUBTYPE OF ( ada_entity );
		is_private : BOOLEAN;
	DERIVE
		SELF\ada_entity.refed_by_pointer : BOOLEAN := true;
		ads_pre_def : STRING := 'type ' + SELF.name + '; type ' + SELF.ptr_type + ' is access all ' + SELF.name + '''Class;';
		ads_code : STRING := ada_class_ads_code ( SELF, is_private );
		adb_code : STRING := ada_class_adb_code ( SELF );
		init_value : STRING := ?;
		ads_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, true );
		adb_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, false );
		SELF\ada_entity.ada_ref_ident : STRING := SELF.ptr_type;
		SELF\ada_entity.xml_writer_code : STRING := ada_class_xml_writer_code ( SELF );
		SELF\ada_entity.xml_io_record_code : STRING := ada_class_xml_io_record_code ( SELF );
	END_ENTITY;

	ENTITY record 
		SUBTYPE OF ( ada_entity );
	DERIVE
		ads_code : STRING := record_ads_code ( SELF );
		adb_code : STRING := record_adb_code ( SELF );
		ads_pre_def : STRING := 'type ' + SELF.name + '; type ' + SELF.ptr_type + ' is access all ' + SELF.name + ';';
		ads_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, true );
		adb_interfaces_list : LIST OF ada_interface := ada_entity_interfaces_list ( SELF, false );
		SELF\ada_entity.xml_writer_code : STRING := record_xml_writer_code ( SELF );
		SELF\ada_entity.xml_io_record_code : STRING := record_xml_io_record_code ( SELF );
	END_ENTITY;

	ENTITY cheddar_function_ptr 
		SUBTYPE OF ( entity_definition );
		arguments : STRING;
		returns : STRING;
	DERIVE
		ads_interface_list : LIST OF ada_interface := [ ];
		adb_interface_list : LIST OF ada_interface := [ ];
		ads_code : STRING := 'Type ' + SELF.name + ' is access function (' + SELF.arguments + ') return ' + SELF.returns + ';';
		adb_code : STRING := '';
		dependencies : LIST OF dictionary_instance := [ SELF ];
		refed_by_pointer : BOOLEAN := false;
		ads_pre_def : STRING := '';
	END_ENTITY;

	FUNCTION is_generic_object ( e : entity_instance ) : BOOLEAN;

		IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) ) THEN
			RETURN ( inherits_from_entity_named ( e, 'generic_object' ) );
		END_IF;
		RETURN ( false );
	END_FUNCTION;

	FUNCTION is_named_object ( e : entity_instance ) : BOOLEAN;

		IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) ) THEN
			RETURN ( inherits_from_entity_named ( e, 'named_object' ) );
		END_IF;
		RETURN ( false );
	END_FUNCTION;

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

	FUNCTION ada_class_ads_code ( cip : ada_class; with_private : BOOLEAN ) : STRING;
		LOCAL 
			result : STRING;
			abstr : STRING := '';
			local_sup : entity_definition := local_root_supertype_of ( cip );
		END_LOCAL;
		result := '\n' 
		+ '-- --------= ' + cip.name + ' =--------\n\n';

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS supref FOR cip.supertypes [ 1 ].ref;
				result := result + 'type ' + cip.name + ' is ' + abstr + 'new ' + supref.ada_ident + ' with ';
			END_ALIAS;
		ELSE
			result := result + 'type ' + cip.name + ' is ' + abstr + 'new Ada.Finalization.Controlled with ';
		END_IF;

		IF with_private THEN
			result := result + 'private;\n';
		ELSE
			result := result + ada_class_attributes_ads_code ( cip );
		END_IF;
		result := result + '\nprocedure Initialize(obj : in out ' + cip.name + ');\n' 
		+ 'procedure Put(obj : in ' + cip.name + ');\n' 
		+ 'procedure Put(obj : in ' + cip.ptr_type + ');\n';
		result := result + 'procedure Put_Name(obj : in ' + cip.ptr_type + ');\n';
		result := result + 'procedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String);\n' 
		+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String;\n' 
		+ 'function XML_String(obj : in ' + cip.ptr_type + ') return Unbounded_String;\n' 
		+ 'function XML_Ref_String(obj : in ' + cip.name + ') return Unbounded_String;\n' 
		+ 'function XML_Ref_String(obj : in ' + cip.ptr_type + ') return Unbounded_String;\n';

		IF is_named_object ( cip ) THEN
			result := result + 'function Get_Name (obj : in ' + cip.name + ') return Unbounded_String;\n' 
			+ 'function Get_Name (obj : in ' + cip.ptr_type + ') return Unbounded_String;\n';
		END_IF;
		result := result + 'function Copy(obj : in ' + cip.ptr_type + ') return ' + local_sup.ptr_type + ';\n' 
		+ 'function Copy(obj : in ' + cip.name + ') return ' + local_sup.ptr_type + ';\n' 
		+ 'function type_of(obj : in ' + cip.name + ') return unbounded_string_list;\n' 
		+ 'function type_of(obj : in ' + cip.ptr_type + ') return unbounded_string_list;\n' 
		+ 'procedure Free  is new Unchecked_Deallocation (' + cip.name + '''Class, ' + cip.ptr_type + ');\n';
		RETURN ( result );
	END_FUNCTION;

	FUNCTION ada_class_adb_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
		END_LOCAL;
		code := '\n' 
		+ '-- --------= ' + cip.name + ' =--------\n' 
		+ ada_class_initialize_code ( cip ) + '\n' 
		+ ada_class_copy_code ( cip ) + '\n' 
		+ ada_class_put_code ( cip ) + '\n';

		IF is_named_object ( cip ) THEN
			code := code + ada_class_get_name_code ( cip ) + '\n';
		END_IF;
		code := code + ada_class_typeof_code ( cip ) + '\n' 
		+ ada_class_xml_writer_code ( cip ) + '\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_xml_writer_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
			contents : STRING := '';
			sub : STRING;
		END_LOCAL;
		code := '\nprocedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String) is \nbegin\n';

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				contents := contents + '\tBuild_Attributes_XML_String(' + sup.name + '(obj), result);\n';
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				sub := explicit_attribute_xml_writer_code ( 'obj', attr );
				IF sub > '' THEN
					contents := contents + sub + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;

		IF contents = '' THEN
			contents := '\tnull;\n';
		END_IF;
		code := code + contents + 'end Build_Attributes_XML_String;\n\n' 

		+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '\tresult := to_unbounded_string(""<' + cip.html_tag + ' id="""""") & obj.' + xml_id_name + ' & to_unbounded_string("""""" >"");\n' 
		+ '\tBuild_Attributes_XML_String(obj, result);\n' 
		+ '\tresult := result & to_unbounded_string(""</' + cip.html_tag + '>"");\n' 
		+ '\treturn (result);\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_String(obj : in ' + cip.ptr_type + ') return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '	if obj /= null then\n' 
		+ '		return XML_String(obj.all);\n' 
		+ '	else\n' 
		+ '		return Empty_String;\n' 
		+ '	end if;\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_Ref_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '\tresult := to_unbounded_string(""<' + cip.html_tag + ' ref="""""") & obj.' + xml_id_name + ' & to_unbounded_string("""""" />"");\n' 
		+ '\treturn (result);\n' 
		+ 'end XML_Ref_String;\n\n' 

		+ 'function XML_Ref_String(obj : in ' + cip.ptr_type + ') return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '\treturn XML_Ref_String(obj.all);\n' 
		+ 'end XML_Ref_String;\n\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION record_xml_writer_code ( cip : record ) : STRING;
		LOCAL 
			code : STRING;
			acode : STRING;
		END_LOCAL;
		code := '\nprocedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String) is \nbegin\n';

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				acode := explicit_attribute_xml_writer_code ( 'obj', attr );
				IF ( acode > '' ) THEN
					code := code + acode + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		code := code + 'end Build_Attributes_XML_String;\n\n' 

		+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '\tresult := to_unbounded_string(""<' + cip.html_tag + '>"");\n' 
		+ '\tBuild_Attributes_XML_String(obj, result);\n' 
		+ '\tresult := result & to_unbounded_string(""</' + cip.html_tag + '>"");\n' 
		+ '\treturn (result);\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_String(obj : in ' + cip.ptr_type + ') return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '	if obj /= null then\n' 
		+ '		return XML_String(obj.all);\n' 
		+ '	else\n' 
		+ '		return Empty_String;\n' 
		+ '	end if;\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_Ref_String(obj : in ' + cip.name + ') return Unbounded_String is\n' 
		+ '\tresult : Unbounded_String;\n' 
		+ 'begin\n' 
		+ '	raise xml_ref_string_error;\n' 
		+ '	return to_unbounded_string("""");\n' 
		+ 'end XML_Ref_String;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_initialize_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
			innerCode : STRING := '';
			attrs : LIST OF attribute;
			init : STRING;
		END_LOCAL;
		code := '\nprocedure Initialize(obj : in out ' + cip.name + ') is \nbegin\n';

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				innerCode := innerCode + '\tinitialize(' + sup.name + '(obj));\n';
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				init := explicit_attribute_initialize ( attr );
				IF ( EXISTS ( init ) AND ( init > '' ) ) THEN
					innerCode := innerCode + '\t' + init + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( cip.derived_attributes ) TO HIINDEX ( cip.derived_attributes );
			ALIAS attr FOR cip.derived_attributes [ no];
				init := derived_attribute_initialize ( attr );
				IF ( EXISTS ( init ) AND ( init > '' ) ) THEN
					innerCode := innerCode + '\t' + init + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;

		IF innerCode = '' THEN
			innerCode := '\tnull;\n';
		END_IF;
		code := code + innerCode + 'end Initialize;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_initialize ( attr : explicit_attribute ) : STRING;
		LOCAL 
			domain : dictionary_instance := basic_ada_domain ( attr.domain );
			init : STRING := domain.init_value;
		END_LOCAL;

		IF ( attr.name = xml_id_name ) THEN
			RETURN ( 'generate_id( framework_id, obj.' + attr.name + ' );' );
		END_IF;

		IF ( 'CHEDDAR_DOMAINS.IN_SCOPE_ATTRIBUTE' IN TYPEOF ( attr ) ) THEN
			RETURN ( attr.init_code );
		END_IF;

		IF ( 'CHEDDAR_DOMAINS.CHEDDAR_PRIMITIVE_TYPE' IN TYPEOF ( domain.handled ) ) THEN
			init := domain.handled.init_value;
		END_IF;

		IF NOT EXISTS ( init ) THEN
			RETURN ( ? );
		ELSE
			IF init <> 'initialize' THEN
				RETURN ( 'obj.' + attr.name + ' := ' + init + ';' );
			ELSE
				IF domain.handled.refed_by_pointer THEN
					RETURN ( 'initialize( obj.' + attr.name + '.all);' );
				ELSE
					RETURN ( 'initialize( obj.' + attr.name + ');' );
				END_IF;
			END_IF;
		END_IF;
	END_FUNCTION;

	FUNCTION derived_attribute_initialize ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING;
			val : STRING;
			key : STRING := upperize ( attr.name );
		END_LOCAL;

		IF EXISTS ( attr.redeclaring ) THEN
			IF SIZEOF ( QUERY ( a <* inherited_explicit_attributes ( attr.owner ) | upperize ( a.name ) = key ) ) > 0 THEN
				val := basic_ada_type_value_format ( attr.assign, ? ).formated;
				code := 'obj.' + attr.name + ' := ' + val + ';';
			END_IF;
		END_IF;
		RETURN ( code );
	END_FUNCTION;

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

	FUNCTION ada_class_copy_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
			v : STRING := 'New_' + cip.name;
			local_sup : entity_definition := local_root_supertype_of ( cip );
		END_LOCAL;
		code := 'function Copy ( obj : in ' + cip.name + ' ) return ' + local_sup.ptr_type + ' is\n' 
		+ '\t' + v + ' : ' + cip.ptr_type + ';\n' 
		+ 'begin\n' 
		+ '\t' + v + ' := new ' + cip.name + '''(obj);\n';

		IF local_sup.ptr_type <> cip.ptr_type THEN
			code := code + '\treturn ' + local_sup.ptr_type + '(' + v + ');\n';
		ELSE
			code := code + '\treturn (' + v + ');\n';
		END_IF;
		code := code + 'end Copy;\n\n' 

		+ 'function Copy ( obj : in ' + cip.ptr_type + ' ) return ' + local_sup.ptr_type + ' is\n' 
		+ 'begin\n' 
		+ '\treturn copy(obj.all);\n' 
		+ 'end Copy;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_put_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
			acode : STRING;
		END_LOCAL;
		code := 'procedure Put(obj : in ' + cip.name + ') is \nbegin\n';

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				code := code + '\tput(' + sup.name + '(obj));\n';
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				acode := explicit_attribute_put ( attr );
				IF ( acode > '' ) THEN
					code := code + '\t' + acode + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		code := code + 'end Put;\n \n' 
		+ 'procedure Put(obj : in ' + cip.ptr_type + ') is\n' 
		+ 'begin\n' 
		+ '\tPut(Obj.All);\n' 
		+ 'end Put;\n \n';
		code := code + 'procedure Put_Name ( obj : in ' + cip.ptr_type + ') is\n' 
		+ 'begin\n';

		IF has_inherited_attribute_named ( cip, 'name' ) THEN
			code := code + '\tPut ( To_String ( Obj.Name ) );\n';
		ELSE
			code := code + '\tPut ( To_String ( Obj.' + xml_id_name + ' ) );\n';
		END_IF;
		code := code + 'end Put_Name;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_get_name_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING;
		END_LOCAL;
		code := 'function Get_Name (obj : in ' + cip.name + ') return Unbounded_String is\n' 
		+ 'begin\n';

		IF has_inherited_attribute_named ( cip, 'name' ) THEN
			code := code + '	return obj.name;\n';
		ELSE
			code := code + '	return obj.' + xml_id_name + ';\n';
		END_IF;
		code := code + 'end Get_Name;\n\n' 

		+ 'function Get_Name (obj : in ' + cip.name + '_ptr) return Unbounded_String is\n' 
		+ 'begin\n';

		IF has_inherited_attribute_named ( cip, 'name' ) THEN
			code := code + '	return obj.name;\n';
		ELSE
			code := code + '	return obj.' + xml_id_name + ';\n';
		END_IF;
		code := code + 'end Get_Name;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_attributes_ads_code ( cip : ada_class ) : STRING;
		LOCAL 
			result : STRING;
			domain : entity_instance;
		END_LOCAL;

		IF SIZEOF ( cip.explicit_attributes ) = 0 THEN
			result := 'null record;\n';
		ELSE
			result := '\nrecord\n';
			REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
				ALIAS attr FOR cip.explicit_attributes [ no];
					domain := basic_ada_domain ( attr.domain );
					IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) OR ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( domain.handled ) ) THEN
						result := result + ' ' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
					ELSE
						result := result + ' ' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
					END_IF;
				END_ALIAS;
			END_REPEAT;
			result := result + 'end record;\n';
		END_IF;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION ada_entity_interfaces_list ( r : ada_entity; ads : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			result : LIST OF ada_interface := entity_definition_interfaces_list ( r, ads );
		END_LOCAL;

		IF ads THEN
			IF 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( r.owner ) THEN
				result := result + ada_interface ( r.owner.name, ?, true, true );
			END_IF;
			IF ( SIZEOF ( r.supertypes ) > 0 ) THEN
				ALIAS supref FOR r.supertypes [ 1 ].ref;
					IF 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( supref.owner ) THEN
						result := result + ada_interface ( supref.owner.name, ?, true, true );
					END_IF;
				END_ALIAS;
			END_IF;
			result := result + ada_interface ( 'Ada.Finalization', ?, true, false );
			result := result + ada_interface ( 'unbounded_strings', ?, true, true );
			result := result + ada_interface ( 'ada.strings', 'unbounded', true, true );
			result := result + ada_interface ( 'unbounded_strings', 'Unbounded_String_List_Package', false, true );
			result := result + ada_interface ( 'Unchecked_Deallocation', ?, true, false );
			result := result + ada_interface ( 'Primitive_XML_Strings', ?, true, true );
		ELSE
			IF has_attribute_named ( r, xml_id_name ) THEN
				result := result + ada_interface ( 'framework', ?, true, true );
				result := result + ada_interface ( 'id_generators', ?, true, true );
			END_IF;
		END_IF;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION entity_definition_interfaces_list ( r : entity_definition; ads : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			result : LIST OF ada_interface := [ ];
			ada_domain : entity_instance;
		END_LOCAL;

		REPEAT no := LOINDEX ( r.explicit_attributes ) TO HIINDEX ( r.explicit_attributes );
			ALIAS curr FOR r.explicit_attributes [ no];
				ada_domain := basic_ada_domain ( curr.domain );
				result := result + domain_interfaces_list ( ada_domain, ads, r.owner );
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION record_ads_code ( rec : record ) : STRING;
		LOCAL 
			result : STRING;
			domain : entity_instance;
		END_LOCAL;
		result := '\n' 
		+ '-- --------= ' + rec.name + ' =--------\n\n' 

		+ 'type ' + rec.name + ' is\nrecord\n';

		REPEAT no := LOINDEX ( rec.attributes ) TO HIINDEX ( rec.attributes );
			result := result + ' ' + rec.attributes [ no].name + ' : ';
			domain := basic_ada_domain ( rec.attributes [ no].domain );
			IF domain.handled.refed_by_pointer THEN
				result := result + domain.handled.ptr_type + ';\n';
			ELSE
				result := result + domain.ada_ref_ident + ';\n';
			END_IF;
		END_REPEAT;
		result := result + 'end record;\n\n' 

		+ 'procedure Initialize(obj : out ' + rec.name + ');\n' 
		+ 'procedure Put(obj : in ' + rec.name + ');\n' 
		+ 'procedure Put(obj : in ' + rec.ptr_type + ');\n' 
		+ 'function Copy(obj : in ' + rec.ptr_type + ') return ' + rec.ptr_type + ';\n' 
		+ 'function Copy(obj : in ' + rec.name + ') return ' + rec.ptr_type + ';\n' 
		+ 'procedure Build_Attributes_XML_String(obj : in ' + rec.name + '; result : in out Unbounded_String);\n' 
		+ 'function XML_String(obj : in ' + rec.name + ') return Unbounded_String;\n' 
		+ 'function XML_String(obj : in ' + rec.ptr_type + ') return Unbounded_String;\n' 
		+ 'function XML_Ref_String(obj : in ' + rec.name + ') return Unbounded_String;\n' 
		+ 'procedure Free  is new Unchecked_Deallocation (' + rec.name + ', ' + rec.ptr_type + ');\n';
		RETURN ( result );
	END_FUNCTION;

	FUNCTION record_initialize_code ( rec : record ) : STRING;
		LOCAL 
			code : STRING;
			innerCode : STRING := '';
			attrs : LIST OF attribute;
			init : STRING;
		END_LOCAL;
		code := '\nprocedure Initialize(obj : out ' + rec.name + ') is \nbegin\n';

		REPEAT no := LOINDEX ( rec.explicit_attributes ) TO HIINDEX ( rec.explicit_attributes );
			ALIAS attr FOR rec.explicit_attributes [ no];
				init := explicit_attribute_initialize ( attr );
				IF ( EXISTS ( init ) AND ( init > '' ) ) THEN
					innerCode := innerCode + '\t' + init + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;

		IF innerCode = '' THEN
			innerCode := '\tnull;\n';
		END_IF;
		code := code + innerCode + 'end Initialize;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION record_adb_code ( rec : record ) : STRING;
		LOCAL 
			code : STRING;
		END_LOCAL;
		code := '\n' 
		+ '-- --------= ' + rec.name + ' =--------\n' 
		+ record_initialize_code ( rec ) + '\n' 
		+ record_put_code ( rec ) + '\n' 
		+ record_xml_writer_code ( rec ) + '\n' 
		+ record_copy_code ( rec ) + '\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION record_put_code ( rec : record ) : STRING;
		LOCAL 
			code : STRING;
			acode : STRING;
		END_LOCAL;
		code := 'procedure Put(obj : in ' + rec.name + ') is \nbegin\n';

		REPEAT no := LOINDEX ( rec.explicit_attributes ) TO HIINDEX ( rec.explicit_attributes );
			ALIAS attr FOR rec.explicit_attributes [ no];
				acode := explicit_attribute_put ( attr );
				IF ( acode > '' ) THEN
					code := code + '\t' + acode + '\n';
				END_IF;
			END_ALIAS;
		END_REPEAT;
		code := code + 'end Put;\n \n' 
		+ 'procedure Put(obj : in ' + rec.ptr_type + ') is\n' 
		+ 'begin\n' 
		+ '\tPut(Obj.All);\n' 
		+ 'end Put;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_put ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING;
			prfx : STRING := '';
			domain : entity_instance := basic_ada_domain ( attr.domain );
		END_LOCAL;
		code := 'put(""' + attr.name + ': ""); ';

		IF ( 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' IN TYPEOF ( domain.handled ) ) THEN
			RETURN ( '' );
		END_IF;

		IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( domain.handled ) ) THEN
			prfx := domain.handled.put_prefix;
		END_IF;

		IF domain.handled.refed_by_pointer THEN
			code := code + 'if obj.' + attr.name + ' /= null then ' + prfx + 'put(obj.' + attr.name + '.all' + '); else put(""null""); end if;';
		ELSE
			code := code + prfx + 'put(obj.' + attr.name + '); ';
		END_IF;
		code := code + 'put ( ""; "" );';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_xml_writer_code ( prefix : STRING; attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING;
			domain : entity_instance := basic_ada_domain ( attr.domain );
			tag : STRING := Lowerize ( attr.name );
		END_LOCAL;

		IF ( 'RECORD_AND_CLASS.CHEDDAR_FUNCTION_PTR' IN TYPEOF ( domain.handled ) ) THEN
			RETURN ( '' );
		END_IF;

		IF ( attr.name = xml_id_name ) THEN
			RETURN ( '' );
		END_IF;

		IF is_generic_object ( domain.handled ) THEN
			code := '\tresult := result & to_unbounded_string(""<' + attr.name + ' ref="""""") & ' + prefix + '.' + attr.name + '.' + xml_id_name + ' & to_unbounded_string("""""" />"");';
		ELSE
			code := '\tif (XML_String(' + prefix + '.' + attr.name + ') /= Empty_String) then\n' 
			+ '\t\tresult := result & to_unbounded_string(""<' + tag + '>"") & XML_String(' + prefix + '.' + attr.name + ') & to_unbounded_string(""</' + tag + '>"");\n\tend if;';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION record_copy_code ( cip : record ) : STRING;
		LOCAL 
			code : STRING;
			v : STRING := 'New_' + cip.name;
		END_LOCAL;
		code := 'function Copy ( obj : in ' + cip.name + ' ) return ' + cip.ptr_type + ' is\n' 
		+ '\t' + v + ' : ' + cip.ptr_type + ';\n' 
		+ 'begin\n' 
		+ '\t' + v + ' := new ' + cip.name + '''(obj);\n';
		code := code + '\treturn (' + v + ');\n';
		code := code + 'end Copy;\n\n' 

		+ 'function Copy ( obj : in ' + cip.ptr_type + ' ) return ' + cip.ptr_type + ' is\n' 
		+ 'begin\n' 
		+ '\treturn copy(obj.all);\n' 
		+ 'end Copy;\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_class_xml_io_record_code ( cip : ada_class ) : STRING;
		RETURN ( '\ntype ' + cip.name + '_io is record' + ada_entity_attributes_xml_io_record_code ( cip ) + '\nend record;' );
	END_FUNCTION;

	FUNCTION ada_entity_attributes_xml_io_record_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING := '';
			attrcode : STRING;
		END_LOCAL;

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				code := code + ada_entity_attributes_xml_io_record_code ( sup );
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				attrcode := explicit_attribute_xml_io_record_code ( attr );
				code := code + attrcode;
			END_ALIAS;
		END_REPEAT;

		IF ( code = '' ) THEN
			code := '\tnull;';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_xml_io_record_code ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING := '';
			domain : entity_instance := basic_ada_domain ( attr.domain );
			init : STRING := domain.init_value;
		END_LOCAL;

		IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( domain.handled ) ) THEN
			RETURN ( ada_entity_attributes_xml_io_record_code ( domain.handled ) );
		END_IF;

		IF NOT is_generic_object ( domain.handled ) THEN
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) OR EXISTS ( init ) THEN
				IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
					code := '\t' + attr.name + ' : ' + domain.ada_ref_ident + ';';
				ELSE
					IF ( init = 'empty_string' ) THEN
						code := '\t' + attr.name + ' : Unbounded_String;';
					ELSE
						IF ( lowerize ( init ) = 'false' ) THEN
							code := '\t' + attr.name + ' : Boolean;';
						ELSE
							IF ( init = '0' ) THEN
								code := '\t' + attr.name + ' : Integer;';
							ELSE
								code := '\t' + attr.name + ' : Double;';
							END_IF;
						END_IF;
					END_IF;
				END_IF;
			END_IF;
		ELSE
			code := '\t' + attr.name + ' : Unbounded_String;';
		END_IF;

		IF ( code > '' ) THEN
			code := '\n' 
			+ code;
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION record_xml_io_record_code ( rec : record ) : STRING;
		RETURN ( '\ntype ' + rec.name + '_io is record' + ada_entity_attributes_xml_io_record_code ( rec ) + '\nend record;\n' );
	END_FUNCTION;

	FUNCTION ada_entity_xml_io_record_initialize_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING := ada_entity_attributes_xml_io_record_initialize_code ( cip );
		END_LOCAL;

		IF ( code = '' ) THEN
			code := '\tnull;';
		END_IF;
		RETURN ( '\nprocedure Initialize(obj : out ' + cip.name + '_io) is \nbegin ' + code + '\nend Initialize;\n' );
	END_FUNCTION;

	FUNCTION ada_entity_attributes_xml_io_record_initialize_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
		END_LOCAL;

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				code := code + ada_entity_attributes_xml_io_record_initialize_code ( sup );
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				s := explicit_attribute_xml_io_record_initialize_code ( attr );
				IF ( s > '' ) THEN
					code := code + '\n' 
					+ s;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_xml_io_record_initialize_code ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING := '';
			domain : entity_instance := basic_ada_domain ( attr.domain );
			init : STRING := domain.init_value;
		END_LOCAL;

		IF NOT is_generic_object ( domain.handled ) THEN
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
				code := '\tobj.' + attr.name + ' := ' + domain.ada_ref_ident + '''first;';
			ELSE
				IF EXISTS ( init ) THEN
					code := '\tobj.' + attr.name + ' := ' + init + ';';
				END_IF;
			END_IF;
		ELSE
			code := '\tobj.' + attr.name + ' := empty_string;';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_entity_xml_start_element_code ( cip : ada_entity ) : STRING;
		LOCAL 
			code : STRING;
		END_LOCAL;

		IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( cip ) ) THEN
			code := '\nprocedure Start_Element(\n' 
			+ '\tHandler: in out Xml_Generic_Parser;\n' 
			+ '\tobj : in out ' + cip.name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tAtts : Sax.Attributes.Attributes''Class) is\n' 
			+ 'begin\n' 
			+ '\tif To_String (To_Lower (Qname)) = ""' + cip.html_tag + '"" then\n' 
			+ '\t\tinitialize(obj);\n' 
			+ '\tend if;\n' 
			+ 'end Start_Element;\n';
		ELSE
			code := ada_entity_attributes_xml_start_element_code ( cip );
			IF ( code > '' ) THEN
				code := '\nprocedure Start_Element(\n' 
				+ '\tHandler: in out Xml_Generic_Parser;\n' 
				+ '\tobj : in out ' + cip.name + '_io;\n' 
				+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
				+ '\tLocal_Name : Unicode.CES.Byte_Sequence := """";\n' 
				+ '\tQname : Unicode.CES.Byte_Sequence := """";\n' 
				+ '\tAtts : Sax.Attributes.Attributes''Class) is \nbegin\n' 
				+ '\tif Get_Length (Atts) > 0 then' + code + '\n' 
				+ '\tend if;\n' 
				+ 'end Start_Element;\n';
			END_IF;
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_entity_attributes_xml_start_element_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
		END_LOCAL;

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				code := code + ada_entity_attributes_xml_start_element_code ( sup );
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
				s := explicit_attribute_xml_start_element_code ( attr );
				IF ( s > '' ) THEN
					code := code + s;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_xml_end_element_code ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING := '';
			domain : entity_instance := basic_ada_domain ( attr.domain );
			init : STRING := domain.init_value;
			io_domain : STRING;
		END_LOCAL;

		IF NOT is_generic_object ( domain.handled ) THEN
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) OR EXISTS ( init ) THEN
				IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain.handled ) ) THEN
					io_domain := domain.ada_ident;
				ELSE
					IF ( init = 'empty_string' ) THEN
						io_domain := 'String';
					ELSE
						IF ( lowerize ( init ) = 'false' ) THEN
							io_domain := 'Boolean';
						ELSE
							IF ( init = '0' ) THEN
								io_domain := 'Integer';
							ELSE
								io_domain := 'Double';
							END_IF;
						END_IF;
					END_IF;
				END_IF;
				IF init = 'empty_string' THEN
					code := '\n\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
					+ '\t\tobj.' + attr.name + ' := handler.Parameter_List (1);\n' 
					+ '\tend if;';
				ELSE
					code := '\n\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
					+ '\t\tTo_' + io_domain + ' (handler.Parameter_List (1), obj.' + attr.name + ', Handler.Ok);\n' 
					+ '\t\tif not Handler.Ok then\n' 
					+ '\t\t\tPut_Line (""Warning : Error on data type From "" & To_String (Handler.Locator));\n' 
					+ '\t\tend if;\n' 
					+ '\tend if;';
				END_IF;
			END_IF;
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION explicit_attribute_xml_start_element_code ( attr : explicit_attribute ) : STRING;
		LOCAL 
			code : STRING := '';
			domain : entity_instance := basic_ada_domain ( attr.domain );
			sub_domain : entity_instance;
			element_domain : entity_instance;
		END_LOCAL;

		IF is_generic_object ( domain.handled ) THEN
			code := '\n\t\tif To_String (To_Lower (Qname)) = ""' + lowerize ( attr.name ) + '"" then\n' 
			+ '\t\t\tfor J in 0 .. Get_Length (Atts) - 1 loop\n' 
			+ '\t\t\t\tif To_String (To_Lower (Get_Qname (Atts, J))) = ""ref"" then\n' 
			+ '\t\t\t\t\tobj.' + attr.name + ' := To_Unbounded_String (Get_Value (Atts, J));\n' 
			+ '\t\t\t\tend if;\n' 
			+ '\t\t\tend loop;\n' 
			+ '\t\tend if;';
		END_IF;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_entity_xml_end_element_code ( cip : ada_entity ) : STRING;
		RETURN ( '\nprocedure End_Element(\n' 
			+ '\tHandler : in out Xml_generic_parser;\n' 
			+ '\tobj : in out ' + cip.name + '_io;\n' 
			+ '\tNamespace_Uri : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tLocal_Name    : Unicode.CES.Byte_Sequence := """";\n' 
			+ '\tQname : Unicode.CES.Byte_Sequence := """") is \nbegin\n' 
			+ ada_entity_attributes_xml_end_element_code ( cip ) + '\nend End_Element;\n' );
	END_FUNCTION;

	FUNCTION ada_entity_attributes_xml_end_element_code ( cip : ada_class ) : STRING;
		LOCAL 
			code : STRING := '';
			s : STRING;
		END_LOCAL;

		IF SIZEOF ( cip.supertypes ) > 0 THEN
			ALIAS sup FOR cip.supertypes [ LOINDEX ( cip.supertypes ) ].handled;
				code := code + ada_entity_attributes_xml_end_element_code ( sup );
			END_ALIAS;
		END_IF;

		REPEAT no := LOINDEX ( cip.explicit_attributes ) TO HIINDEX ( cip.explicit_attributes );
			ALIAS attr FOR cip.explicit_attributes [ no];
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
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordAndClassSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAndClassSchemaDefinition class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAndClassSchemaDefinition class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAndClassSchemaDefinition class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdRecordAndClassSchemaDefinition >> context [

	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdRecordAndClassSchemaDefinition >> entityDefinition1 [

	^ #( #ada_entity #ExChdAdaEntity )


]

{ #category : 'platypus-generated-entities' }
ExChdRecordAndClassSchemaDefinition >> entityDefinition2 [

	^ #( #ada_class #ExChdAdaClass )


]

{ #category : 'platypus-generated-entities' }
ExChdRecordAndClassSchemaDefinition >> entityDefinition3 [

	^ #( #record #ExChdRecord )


]

{ #category : 'platypus-generated-entities' }
ExChdRecordAndClassSchemaDefinition >> entityDefinition4 [

	^ #( #cheddar_function_ptr #ExChdCheddarFunctionPtr )


]

{ #category : 'platypus-generated-entities' }
ExChdRecordAndClassSchemaDefinition >> entityDefinitionCount [

	^ 4


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration1 [

	^ #( #is_generic_object #ExChdIsGenericObjectFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration10 [

	^ #( #derived_attribute_initialize #ExChdDerivedAttributeInitializeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration11 [

	^ #( #ada_class_typeof_code #ExChdAdaClassTypeofCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration12 [

	^ #( #ada_class_copy_code #ExChdAdaClassCopyCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration13 [

	^ #( #ada_class_put_code #ExChdAdaClassPutCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration14 [

	^ #( #ada_class_get_name_code #ExChdAdaClassGetNameCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration15 [

	^ #( #ada_class_attributes_ads_code #ExChdAdaClassAttributesAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration16 [

	^ #( #ada_entity_interfaces_list #ExChdAdaEntityInterfacesListFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration17 [

	^ #( #entity_definition_interfaces_list
	     #ExChdEntityDefinitionInterfacesListFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration18 [

	^ #( #record_ads_code #ExChdRecordAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration19 [

	^ #( #record_initialize_code #ExChdRecordInitializeCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration2 [

	^ #( #is_named_object #ExChdIsNamedObjectFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration20 [

	^ #( #record_adb_code #ExChdRecordAdbCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration21 [

	^ #( #record_put_code #ExChdRecordPutCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration22 [

	^ #( #explicit_attribute_put #ExChdExplicitAttributePutFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration23 [

	^ #( #explicit_attribute_xml_writer_code
	     #ExChdExplicitAttributeXmlWriterCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration24 [

	^ #( #record_copy_code #ExChdRecordCopyCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration25 [

	^ #( #ada_class_xml_io_record_code #ExChdAdaClassXmlIoRecordCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration26 [

	^ #( #ada_entity_attributes_xml_io_record_code
	     #ExChdAdaEntityAttributesXmlIoRecordCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration27 [

	^ #( #explicit_attribute_xml_io_record_code
	     #ExChdExplicitAttributeXmlIoRecordCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration28 [

	^ #( #record_xml_io_record_code #ExChdRecordXmlIoRecordCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration29 [

	^ #( #ada_entity_xml_io_record_initialize_code
	     #ExChdAdaEntityXmlIoRecordInitializeCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration3 [

	^ #( #dependencies_of_ada_entity #ExChdDependenciesOfAdaEntityFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration30 [

	^ #( #ada_entity_attributes_xml_io_record_initialize_code
	     #ExChdAdaEntityAttributesXmlIoRecordInitializeCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration31 [

	^ #( #explicit_attribute_xml_io_record_initialize_code
	     #ExChdExplicitAttributeXmlIoRecordInitializeCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration32 [

	^ #( #ada_entity_xml_start_element_code
	     #ExChdAdaEntityXmlStartElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration33 [

	^ #( #ada_entity_attributes_xml_start_element_code
	     #ExChdAdaEntityAttributesXmlStartElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration34 [

	^ #( #explicit_attribute_xml_end_element_code
	     #ExChdExplicitAttributeXmlEndElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration35 [

	^ #( #explicit_attribute_xml_start_element_code
	     #ExChdExplicitAttributeXmlStartElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration36 [

	^ #( #ada_entity_xml_end_element_code
	     #ExChdAdaEntityXmlEndElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration37 [

	^ #( #ada_entity_attributes_xml_end_element_code
	     #ExChdAdaEntityAttributesXmlEndElementCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration4 [

	^ #( #ada_class_ads_code #ExChdAdaClassAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration5 [

	^ #( #ada_class_adb_code #ExChdAdaClassAdbCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration6 [

	^ #( #ada_class_xml_writer_code #ExChdAdaClassXmlWriterCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration7 [

	^ #( #record_xml_writer_code #ExChdRecordXmlWriterCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration8 [

	^ #( #ada_class_initialize_code #ExChdAdaClassInitializeCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclaration9 [

	^ #( #explicit_attribute_initialize #ExChdExplicitAttributeInitializeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdRecordAndClassSchemaDefinition >> functionDeclarationCount [

	^ 37


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordAndClassSchemaDefinition >> schemaInstanceClassName [

	^ #ExChdExpress2cheddarSchemaInstance


]
