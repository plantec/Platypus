"
<ISO10303-11-EXPRESS>
SCHEMA cheddar_domains;
	USE FROM express2cheddar_facade;
	USE FROM ada_interface;
	USE FROM platypus_dictionary_schema;
	USE FROM platypus_expressions_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express_dictionary_queries;

	CONSTANT 
		std_io_interfaces : LIST OF ada_interface := [ ada_interface ( 'standards_io', ?, true, true ) ];
	END_CONSTANT;

	ENTITY pragma_convention;
		convention : STRING;
	END_ENTITY;

	ENTITY ada_type 
		SUBTYPE OF ( defined_type );
	DERIVE
		ada_ident : STRING := name;
		ada_ref_ident : STRING := name;
		init_value : STRING := ?;
		dependencies : LIST OF dictionary_instance := dependencies_of ( SELF.owner, SELF.domain.handled );
		refed_by_pointer : BOOLEAN := false;
	END_ENTITY;

	ENTITY cheddar_defined_type 
		SUBTYPE OF ( ada_type );
	DERIVE
		ads_interface_list : LIST OF ada_interface := cheddar_defined_type_interfaces_list ( SELF, true );
		adb_interface_list : LIST OF ada_interface := cheddar_defined_type_interfaces_list ( SELF, false );
		SELF\defined_type.accepted : entity_instance := SELF.accept_cheddar_defined_type;
		ads_pre_def : STRING := '';
	END_ENTITY;

	ENTITY constrained_array_type 
		SUBTYPE OF ( cheddar_defined_type );
		min_idx : STRING;
		max_idx : OPTIONAL STRING;
		interfaces : LIST OF ada_interface;
	DERIVE
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ads_interfaces_list : LIST OF ada_interface := interfaces;
		adb_code : STRING := '';
		ads_code : STRING := constrained_array_type_ads_code ( SELF );
	END_ENTITY;

	ENTITY cheddar_entity_definition 
		SUBTYPE OF ( entity_definition );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := SELF.name;
		ada_ref_ident : STRING := SELF.name;
		init_value : STRING := ?;
		ads_code : STRING := '';
		adb_code : STRING := '';
	END_ENTITY;

	ENTITY unmapped_type_reference;
		ref : entity_instance;
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := basic_ada_domain ( SELF.ref ).ads_interfaces_list;
		adb_interfaces_list : LIST OF ada_interface := basic_ada_domain ( SELF.ref ).adb_interfaces_list;
		ada_ident : STRING := SELF.name;
		ada_ref_ident : STRING := SELF.name;
		init_value : STRING := basic_ada_domain ( SELF.ref ).init_value;
		ads_code : STRING := '';
		adb_code : STRING := '';
		refed_by_pointer : BOOLEAN := false;
	END_ENTITY;

	ENTITY unmapped_entity_definition;
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := SELF.name;
		ada_ref_ident : STRING := SELF.name;
		init_value : STRING := ?;
		ads_code : STRING := '';
		adb_code : STRING := '';
	END_ENTITY;

	ENTITY basic_ada_type_getter;
	DERIVE
		accept_string_type : dictionary_instance := ( ada_unbounded_string_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
		accept_integer_type : dictionary_instance := ( ada_natural_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
		accept_real_type : dictionary_instance := ( ada_double_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
		accept_boolean_type : dictionary_instance := ( ada_boolean_type ( ) || ada_primitive_type ( ) || dictionary_instance ( ) );
		accept_enumeration_type : dictionary_instance := SELF\enumeration_type;
		accept_ada_enumeration : dictionary_instance := SELF;
		accept_attribute_reference : dictionary_instance := ( ada_attribute_reference ( ) || ada_named_type_reference ( ) || SELF\attribute_reference );
		accept_defined_type_reference : dictionary_instance := basic_ada_domain ( SELF\defined_type_reference.ref );
		accept_defined_type : dictionary_instance := unmapped_type_reference ( SELF.domain ) || SELF;
		accept_ada_range : dictionary_instance := SELF;
		accept_ada_class_reference : dictionary_instance := SELF;
		accept_ada_record_reference : dictionary_instance := SELF;
		accept_entity_definition_reference : dictionary_instance := ( unmapped_type_reference ( SELF.ref ) || SELF\entity_definition_reference );
		accept_entity_definition : dictionary_instance := ( unmapped_entity_definition ( ) || SELF\entity_definition );
		accept_cheddar_defined_type : dictionary_instance := SELF;
		accept_list_type : dictionary_instance := ( ada_list_type ( ) || SELF\list_type );
		accept_array_type : dictionary_instance := ( ada_array_type ( ) || SELF\array_type );
		accept_set_type : dictionary_instance := ( ada_set_type ( ) || SELF\set_type );
		accept_bag_type : dictionary_instance := ( ada_bag_type ( ) || SELF\bag_type );
		accept_explicit_type_reference : dictionary_instance := SELF;
	END_ENTITY;

	ENTITY ada_primitive_type 
		SUBTYPE OF ( entity_definition );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ads_code : STRING := '';
		adb_code : STRING := '';
		put_prefix : STRING := '';
		refed_by_pointer : BOOLEAN := false;
	END_ENTITY;

	ENTITY cheddar_primitive_type 
		SUBTYPE OF ( ada_primitive_type );
	END_ENTITY;

	ENTITY cheddar_law_type 
		SUBTYPE OF ( cheddar_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Expression', ?, true, true ), ada_interface ( 'Expression', ?, false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := 'law_type';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := ?;
	END_ENTITY;

	ENTITY cheddar_priority_range 
		SUBTYPE OF ( cheddar_defined_type );
	DERIVE
		ads_code : STRING := '
-- Definition of priority range. We choose the most current value :
-- 256 priority levels (from 0 to 255)
-- Zero is the lowest priority level
Type Priority_Range is new Natural range 0 .. 255;
package Priority_Io is new Text_IO.Integer_IO (Priority_Range);
use Priority_Io;
';
		adb_code : STRING := '';
		ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Framework_Config', ?, true, true ), ada_interface ( 'Framework_Config', 'Priority_Io', false, true ) ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		SELF\ada_type.ada_ident : STRING := 'Priority_Range';
		SELF\ada_type.ada_ref_ident : STRING := SELF.ada_ident;
		SELF\ada_type.init_value : STRING := '0';
	END_ENTITY;

	ENTITY ada_natural_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'natural_io', false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Natural';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := '0';
		SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.natural_io.';
	END_ENTITY;

	ENTITY ada_unbounded_string_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'ada.strings', 'unbounded.text_io', true, true ), ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'Unbounded_Strings', ?, true, true ), ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Unbounded_String';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := 'empty_string';
	END_ENTITY;

	ENTITY cheddar_xml_id_type 
		SUBTYPE OF ( string_type );
	DERIVE
		SELF\ada_unbounded_string_type.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'ada.strings', 'unbounded.text_io', true, true ), ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'Unbounded_Strings', ?, true, true ), ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ), ada_interface ( 'id_generators', ?, true, true ) ];
		adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'call_framework', ?, true, true ), ada_interface ( 'id_generators', ?, true, true ) ];
		ads_code : STRING := '';
		adb_code : STRING := '';
		put_prefix : STRING := '';
		refed_by_pointer : BOOLEAN := false;
		SELF\ada_unbounded_string_type.init_value : STRING := 'generate_id';
	END_ENTITY;

	ENTITY ada_boolean_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'boolean_io', false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Boolean';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := 'false';
		SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.boolean_io.';
	END_ENTITY;

	ENTITY ada_real_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'Ada', 'Numerics.Aux', true, true ), ada_interface ( 'standards_io', 'float_io', false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Float';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := '0.0';
		SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.float_io.';
	END_ENTITY;

	ENTITY ada_double_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'Ada', 'Numerics.Aux', true, true ), ada_interface ( 'standards_io', 'double_io', false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Double';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := '0.0';
		SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.double_io.';
	END_ENTITY;

	ENTITY ada_integer_type 
		SUBTYPE OF ( ada_primitive_type );
	DERIVE
		SELF\ada_primitive_type.ads_interfaces_list : LIST OF ada_interface := std_io_interfaces + [ ada_interface ( 'standards_io', 'integer_io', false, true ) ];
		SELF\ada_primitive_type.adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ada_ident : STRING := 'Integer';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := '0';
		SELF\ada_primitive_type.put_prefix : STRING := 'standards_io.integer_io.';
	END_ENTITY;

	ENTITY ada_named_type_reference 
		SUBTYPE OF ( entity_instance );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := SELF.ref.name;
		ada_ref_ident : STRING := SELF.ada_ident;
	END_ENTITY;

	ENTITY ada_record_reference 
		SUBTYPE OF ( ada_named_type_reference );
	DERIVE
		SELF\entity_definition_reference.accepted : entity_instance := SELF.accept_ada_record_reference;
	END_ENTITY;

	ENTITY ada_class_reference 
		SUBTYPE OF ( ada_named_type_reference );
	DERIVE
		SELF\entity_definition_reference.accepted : entity_instance := SELF.accept_ada_class_reference;
		SELF\ada_named_type_reference.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.ref.owner.name, ?, true, true ) ];
		SELF\ada_named_type_reference.ada_ident : STRING := SELF.ref.name + '_Ptr';
		init_value : STRING := 'initialize';
	END_ENTITY;

	ENTITY ada_primitive_class_reference 
		SUBTYPE OF ( ada_class_reference );
		pointed_type_name : STRING;
		package_name : STRING;
	DERIVE
		SELF\ada_class_reference.ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( package_name, ?, true, true ) ];
		SELF\ada_class_reference.ada_ident : STRING := pointed_type_name + '_Ptr';
	END_ENTITY;

	ENTITY ada_attribute_reference 
		SUBTYPE OF ( ada_named_type_reference );
	END_ENTITY;

	ENTITY ada_array_type 
		SUBTYPE OF ( array_type );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := ?;
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := ?;
	END_ENTITY;

	ENTITY ada_list_type 
		SUBTYPE OF ( list_type );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := 'list';
		ada_ref_ident : STRING := SELF.ada_ident;
		init_value : STRING := ?;
	END_ENTITY;

	ENTITY ada_set_type 
		SUBTYPE OF ( set_type );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := 'set';
		ada_ref_ident : STRING := SELF.ada_ident;
	END_ENTITY;

	ENTITY ada_bag_type 
		SUBTYPE OF ( bag_type );
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := 'bag';
		ada_ref_ident : STRING := SELF.ada_ident;
	END_ENTITY;

	ENTITY ada_enumeration 
		SUBTYPE OF ( ada_type );
		convertion : OPTIONAL STRING;
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'Convert_Strings', ?, true, false ), ada_interface ( 'Convert_Unbounded_Strings', ?, true, false ), ada_interface ( 'text_io', ?, true, true ), ada_interface ( 'ada.strings', 'unbounded', true, true ) ];
		adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( 'primitive_xml_strings', ?, true, true ) ];
		ads_code : STRING := enumeration_ads_code ( SELF );
		adb_code : STRING := enumeration_adb_code ( SELF );
		SELF\ada_type.ada_ident : STRING := name;
		SELF\ada_type.ada_ref_ident : STRING := SELF.ada_ident;
		SELF\ada_type.init_value : STRING := NVL ( convertion, domain.elements [ 1 ] );
		io_type_name : STRING := SELF.ada_ident + '_io';
		full_io_type_name : STRING := SELF.owner.name + '.' + SELF.io_type_name;
		SELF\defined_type.accepted : entity_instance := SELF.accept_ada_enumeration;
		ads_pre_def : STRING := '';
	END_ENTITY;

	ENTITY basic_ada_type_value_format 
		SUBTYPE OF ( dictionary_instance );
		val : expression;
		basic_ada_type : OPTIONAL dictionary_instance;
	DERIVE
		formated : STRING := basic_ada_expression_value_string ( SELF.val );
	END_ENTITY;

	ENTITY range_type 
		SUBTYPE OF ( defined_type );
		lower : STRING;
		upper : STRING;
		lower_constant : OPTIONAL STRING;
		upper_constant : OPTIONAL STRING;
	DERIVE
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ada_ident : STRING := name;
		ada_ref_ident : STRING := SELF.ada_ident;
		ads_code : STRING := range_type_ads_code ( SELF );
		adb_code : STRING := '';
	END_ENTITY;

	ENTITY explicit_type_reference 
		SUBTYPE OF ( defined_type );
		used_name : OPTIONAL STRING;
		interfaces : LIST OF ada_interface;
	DERIVE
		SELF\defined_type.accepted : entity_instance := SELF.accept_explicit_type_reference;
		ads_interfaces_list : LIST OF ada_interface := SELF.interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.owner.name, ?, true, true ) ] + interfaces;
		ada_ident : STRING := SELF.name;
		ptr_type : STRING := SELF.ada_ident + '_Ptr';
		ada_ref_ident : STRING := NVL ( SELF.used_name, SELF.name );
		init_value : STRING := ?;
		ads_code : STRING := '';
		adb_code : STRING := '';
		refed_by_pointer : BOOLEAN := string_ends_with ( SELF.ada_ref_ident, '_Ptr' );
	END_ENTITY;

	ENTITY in_scope_attribute;
	DERIVE
		init_code : STRING := in_scope_attribute_init_code ( SELF );
	END_ENTITY;

	FUNCTION dependencies_of ( o : context_definition; t : dictionary_instance ) : LIST OF dictionary_instance;
		LOCAL 
			r : LIST OF dictionary_instance := [ ];
		END_LOCAL;

		IF ( 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE' IN TYPEOF ( t ) ) THEN
			r := r + dependencies_of ( o, t.element_type.handled );
		ELSE
			IF is_of_generated_concept_kind ( t ) THEN
				IF ( t.owner = o ) THEN
					r := r + t.dependencies + t;
				END_IF;
			END_IF;
		END_IF;
		RETURN ( r );
	END_FUNCTION;

	FUNCTION constrained_array_type_ads_code ( a : constrained_array_type ) : STRING;
		LOCAL 
			code : STRING := '';
		END_LOCAL;
		code := 'type ' + a.ada_ident + ' is Array ( ';

		IF EXISTS ( a.max_idx ) THEN
			code := code + a.min_idx + ' .. ' + a.max_idx;
		ELSE
			code := code + a.min_idx;
		END_IF;

		ALIAS etype FOR a.domain.element_type.handled;
			IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( etype ) ) THEN
				code := code + ' ) of ' + etype.ptr_type + ';\n';
			ELSE
				code := code + ' ) of ' + etype.ada_ident + ';\n';
			END_IF;
		END_ALIAS;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION cheddar_defined_type_interfaces_list ( r : cheddar_defined_type; ads : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			result : LIST OF ada_interface := [ ];
		END_LOCAL;

		IF ads THEN
			result := result + ada_interface ( r.owner.name, ?, true, true );
		END_IF;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION basic_ada_domain ( d : dictionary_instance ) : entity_instance;
		RETURN ( ( d || basic_ada_type_getter ( ) ).accepted );
	END_FUNCTION;

	FUNCTION enumeration_ads_code ( e : ada_enumeration ) : STRING;
		LOCAL 
			code : STRING;
			convert_type : STRING := NVL ( e.convertion, e.domain.elements [ LOINDEX ( e.domain.elements ) ] );
		END_LOCAL;
		code := 'type ' + e.name + ' is (\n\t' + StringAggregateConcatSeparatedBy ( e.domain.elements, ',\n\t' ) + ');\n';

		IF ( 'CHEDDAR_DOMAINS.PRAGMA_CONVENTION' IN TYPEOF ( e ) ) THEN
			code := code + 'pragma convention (' + e.convention + ', ' + e.name + ');\n';
		END_IF;
		code := code + '\n' 
		+ 'procedure To_' + e.name + ' is\n' 
		+ 'new Convert_Strings(' + e.name + ', ' + convert_type + ');\n' 
		+ 'procedure To_' + e.name + ' is\n' 
		+ 'new Convert_Unbounded_Strings(' + e.name + ', ' + convert_type + ');\n' 
		+ 'function XML_String (obj : in ' + e.name + ') return Unbounded_String;\n' 
		+ 'function XML_Ref_String (obj : in ' + e.name + ') return Unbounded_String;\n' 
		+ 'package ' + e.name + '_io is new text_io.enumeration_io(' + e.name + ');\n' 
		+ 'use ' + e.name + '_io;\n\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION basic_ada_expression_value_string ( e : expression ) : STRING;
		LOCAL 
			code : STRING := '';
		END_LOCAL;

		IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.IDENTIFIER' IN TYPEOF ( e ) ) THEN
			RETURN ( e.name );
		END_IF;

		IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.INTEGER_LITERAL' IN TYPEOF ( e ) ) THEN
			RETURN ( FORMAT ( e.val, 'I' ) );
		END_IF;

		IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.TRUE_CONSTANT' IN TYPEOF ( e ) ) THEN
			RETURN ( 'True' );
		END_IF;

		IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.FALSE_CONSTANT' IN TYPEOF ( e ) ) THEN
			RETURN ( 'False' );
		END_IF;

		IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.BINARY_EXPRESSION' IN TYPEOF ( e ) ) THEN
			RETURN ( '(' + basic_ada_expression_value_string ( e.left_expr ) + ' ' + e.op_string + ' ' + basic_ada_expression_value_string ( e.right_expr ) + ')' );
		END_IF;
		RETURN ( 'null' );
	END_FUNCTION;

	FUNCTION enumeration_adb_code ( e : ada_enumeration ) : STRING;
		LOCAL 
			code : STRING;
		END_LOCAL;
		code := 'function XML_String(obj : in ' + e.name + ') return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '	return to_unbounded_string(' + e.name + '''image (obj) );\n' 
		+ 'end XML_String;\n\n' 

		+ 'function XML_Ref_String (obj : in ' + e.name + ') return Unbounded_String is\n' 
		+ 'begin\n' 
		+ '\traise xml_ref_string_error;\n' 
		+ '\treturn to_unbounded_string("""");\n' 
		+ 'end XML_Ref_String;\n\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION range_type_ads_code ( rt : range_type ) : STRING;
		LOCAL 
			r : STRING := 'type ' + rt.ada_ident + ' is Range ' + rt.lower + ' .. ' + rt.upper + ';\n';
		END_LOCAL;

		IF EXISTS ( rt.lower_constant ) THEN
			r := r + rt.lower_constant + ' : constant ' + rt.ada_ident + ' := ' + rt.ada_ident + '''First;\n';
		END_IF;

		IF EXISTS ( rt.upper_constant ) THEN
			r := r + rt.upper_constant + ' : constant ' + rt.ada_ident + ' := ' + rt.ada_ident + '''Last;\n';
		END_IF;
		RETURN ( r );
	END_FUNCTION;

	FUNCTION in_scope_attribute_init_code ( a : in_scope_attribute ) : STRING;
		LOCAL 
			code : STRING := '';
		END_LOCAL;

		ALIAS domain FOR a.domain.handled;
			IF domain.refed_by_pointer THEN
				code := code + '\n\tif obj.' + a.name + ' /= null then\n' 
				+ '\t\tFree (obj.' + a.name + ' );\n' 
				+ '\tend if;\n' 
				+ '\tobj.' + a.name + ' := new ' + domain.name + ';\n' 
				+ '\tInitialize(obj.' + a.name + '.all);\n';
			END_IF;
		END_ALIAS;
		RETURN ( code );
	END_FUNCTION;

	FUNCTION domain_interfaces_list ( ada_domain : entity_instance; ads : BOOLEAN; pkg : schema_definition ) : LIST OF ada_interface;
		LOCAL 
			result : LIST OF ada_interface := [ ];
		END_LOCAL;

		ALIAS h FOR ada_domain.handled;
			IF ads THEN
				result := result + ada_domain.ads_interfaces_list;
			ELSE
				result := result + ada_domain.adb_interfaces_list;
				IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( h ) ) THEN
					IF ( h.owner.name <> pkg.name ) THEN
						result := result + ada_interface ( h.owner.name, ?, true, false );
						result := result + ada_interface ( h.full_io_type_name, ?, false, true );
					END_IF;
				END_IF;
			END_IF;
			IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( h ) ) OR ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( h ) ) THEN
				IF ads THEN
					result := result + h.ads_interfaces_list;
				ELSE
					result := result + h.adb_interfaces_list;
				END_IF;
			END_IF;
		END_ALIAS;
		RETURN ( result );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarDomainsSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDomainsSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDomainsSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDomainsSchemaDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdCheddarDomainsSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition1 [
	^ #(#pragma_convention #ExChdPragmaConvention)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition10 [
	^ #(#cheddar_primitive_type #ExChdCheddarPrimitiveType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition11 [
	^ #(#cheddar_law_type #ExChdCheddarLawType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition12 [
	^ #(#cheddar_priority_range #ExChdCheddarPriorityRange)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition13 [
	^ #(#ada_natural_type #ExChdAdaNaturalType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition14 [
	^ #(#ada_unbounded_string_type #ExChdAdaUnboundedStringType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition15 [
	^ #(#cheddar_xml_id_type #ExChdCheddarXmlIdType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition16 [
	^ #(#ada_boolean_type #ExChdAdaBooleanType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition17 [
	^ #(#ada_real_type #ExChdAdaRealType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition18 [
	^ #(#ada_double_type #ExChdAdaDoubleType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition19 [
	^ #(#ada_integer_type #ExChdAdaIntegerType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition2 [
	^ #(#ada_type #ExChdAdaType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition20 [
	^ #(#ada_named_type_reference #ExChdAdaNamedTypeReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition21 [
	^ #(#ada_record_reference #ExChdAdaRecordReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition22 [
	^ #(#ada_class_reference #ExChdAdaClassReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition23 [
	^ #(#ada_primitive_class_reference #ExChdAdaPrimitiveClassReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition24 [
	^ #(#ada_attribute_reference #ExChdAdaAttributeReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition25 [
	^ #(#ada_array_type #ExChdAdaArrayType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition26 [
	^ #(#ada_list_type #ExChdAdaListType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition27 [
	^ #(#ada_set_type #ExChdAdaSetType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition28 [
	^ #(#ada_bag_type #ExChdAdaBagType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition29 [
	^ #(#ada_enumeration #ExChdAdaEnumeration)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition3 [
	^ #(#cheddar_defined_type #ExChdCheddarDefinedType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition30 [
	^ #(#basic_ada_type_value_format #ExChdBasicAdaTypeValueFormat)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition31 [
	^ #(#range_type #ExChdRangeType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition32 [
	^ #(#explicit_type_reference #ExChdExplicitTypeReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition33 [
	^ #(#in_scope_attribute #ExChdInScopeAttribute)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition4 [
	^ #(#constrained_array_type #ExChdConstrainedArrayType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition5 [
	^ #(#cheddar_entity_definition #ExChdCheddarEntityDefinition)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition6 [
	^ #(#unmapped_type_reference #ExChdUnmappedTypeReference)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition7 [
	^ #(#unmapped_entity_definition #ExChdUnmappedEntityDefinition)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition8 [
	^ #(#basic_ada_type_getter #ExChdBasicAdaTypeGetter)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinition9 [
	^ #(#ada_primitive_type #ExChdAdaPrimitiveType)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDomainsSchemaDefinition >> entityDefinitionCount [
	^ 33


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration1 [
	^ #(#dependencies_of #ExChdDependenciesOfFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration10 [
	^ #(#domain_interfaces_list #ExChdDomainInterfacesListFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration2 [
	^ #(#constrained_array_type_ads_code #ExChdConstrainedArrayTypeAdsCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration3 [
	^ #(#cheddar_defined_type_interfaces_list #ExChdCheddarDefinedTypeInterfacesListFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration4 [
	^ #(#basic_ada_domain #ExChdBasicAdaDomainFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration5 [
	^ #(#enumeration_ads_code #ExChdEnumerationAdsCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration6 [
	^ #(#basic_ada_expression_value_string #ExChdBasicAdaExpressionValueStringFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration7 [
	^ #(#enumeration_adb_code #ExChdEnumerationAdbCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration8 [
	^ #(#range_type_ads_code #ExChdRangeTypeAdsCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclaration9 [
	^ #(#in_scope_attribute_init_code #ExChdInScopeAttributeInitCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDomainsSchemaDefinition >> functionDeclarationCount [
	^ 10


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarDomainsSchemaDefinition >> schemaInstanceClassName [
	^ #ExChdExpress2cheddarSchemaInstance


]
