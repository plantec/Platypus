"
<ISO10303-11-EXPRESS>
SCHEMA Platypus_expressions_schema;
	USE FROM Platypus_dictionary_schema;
	USE FROM Platypus_statements_schema;
	USE FROM Platypus_population_schema;

	ENTITY expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( dictionary_instance );
	END_ENTITY;

	ENTITY unary_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( expression );
	END_ENTITY;

	ENTITY binary_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( expression );
		parenthesis : OPTIONAL BOOLEAN;
		left_expr : expression;
		right_expr : expression;
	DERIVE
		op_string : STRING := ?;
	END_ENTITY;

	ENTITY logical_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( binary_expression );
	END_ENTITY;

	ENTITY entity_instance_reference 
		SUBTYPE OF ( expression );
		persistent_label : STRING;
		ref : entity_instance;
	END_ENTITY;

	ENTITY instance_construction_expression 
		SUBTYPE OF ( binary_expression );
	END_ENTITY;

	ENTITY arithmetic_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( binary_expression );
	END_ENTITY;

	ENTITY expo_expression 
		SUBTYPE OF ( arithmetic_expression );
	END_ENTITY;

	ENTITY mult_expression 
		SUBTYPE OF ( arithmetic_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := '*';
	END_ENTITY;

	ENTITY div_expression 
		SUBTYPE OF ( arithmetic_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := '/';
	END_ENTITY;

	ENTITY real_div_expression 
		SUBTYPE OF ( arithmetic_expression );
	END_ENTITY;

	ENTITY mod_expression 
		SUBTYPE OF ( arithmetic_expression );
	END_ENTITY;

	ENTITY plus_expression 
		SUBTYPE OF ( arithmetic_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := '+';
	END_ENTITY;

	ENTITY minus_expression 
		SUBTYPE OF ( arithmetic_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := '-';
	END_ENTITY;

	ENTITY and_expression 
		SUBTYPE OF ( logical_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := 'AND';
	END_ENTITY;

	ENTITY or_expression 
		SUBTYPE OF ( logical_expression );
	DERIVE
		SELF\binary_expression.op_string : STRING := 'OR';
	END_ENTITY;

	ENTITY xor_expression 
		SUBTYPE OF ( logical_expression );
	END_ENTITY;

	ENTITY comparison_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( logical_expression );
	END_ENTITY;

	ENTITY less_than_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY greater_than_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY equal_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY less_equal_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY greater_equal_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY not_equal_expression 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY inst_comparison_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( comparison_expression );
	END_ENTITY;

	ENTITY inst_equal_expression 
		SUBTYPE OF ( inst_comparison_expression );
	END_ENTITY;

	ENTITY inst_not_equal_expression 
		SUBTYPE OF ( inst_comparison_expression );
	END_ENTITY;

	ENTITY in_expression 
		SUBTYPE OF ( logical_expression );
	END_ENTITY;

	ENTITY like_expression 
		SUBTYPE OF ( logical_expression );
	END_ENTITY;

	ENTITY cardinality_expression 
		SUBTYPE OF ( logical_expression );
		card1 : expression;
		card2 : expression;
	END_ENTITY;

	ENTITY simple_unary_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( unary_expression );
		expr : expression;
	END_ENTITY;

	ENTITY not_expression 
		SUBTYPE OF ( simple_unary_expression );
	END_ENTITY;

	ENTITY positive_expression 
		SUBTYPE OF ( simple_unary_expression );
	END_ENTITY;

	ENTITY negative_expression 
		SUBTYPE OF ( simple_unary_expression );
	END_ENTITY;

	ENTITY typed_expression 
		SUBTYPE OF ( simple_unary_expression );
		domain : named_type_reference;
	END_ENTITY;

	ENTITY enumeration_value 
		SUBTYPE OF ( qualifier );
		domain : defined_type_reference;
		element : STRING;
	END_ENTITY;

	ENTITY entity_instances_set 
		SUBTYPE OF ( unary_expression );
		entity_ref : entity_definition_reference;
	END_ENTITY;

	ENTITY qualified_expression 
		SUBTYPE OF ( unary_expression );
		head : expression;
		qualifiers : LIST OF qualifier;
	END_ENTITY;

	ENTITY literal 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( unary_expression );
	END_ENTITY;

	ENTITY identifier 
		SUBTYPE OF ( unary_expression );
		name : STRING;
		ref : dictionary_instance;
		parameters : OPTIONAL LIST OF expression;
	END_ENTITY;

	ENTITY attribute_identifier 
		SUBTYPE OF ( identifier );
		selfInstance : generic_instance;
	END_ENTITY;

	ENTITY self_identifier 
		SUBTYPE OF ( unary_expression );
	END_ENTITY;

	ENTITY uniqueness_rule_attribute_identifier 
		SUBTYPE OF ( identifier );
		group_ref_name : OPTIONAL STRING;
		SELF\identifier.ref : attribute;
	END_ENTITY;

	ENTITY missing_value 
		SUBTYPE OF ( unary_expression );
	END_ENTITY;

	ENTITY redefined_attribute_value 
		SUBTYPE OF ( missing_value );
	END_ENTITY;

	ENTITY implicitly_declared_identifier 
		SUBTYPE OF ( identifier );
	END_ENTITY;

	ENTITY interval 
		SUBTYPE OF ( unary_expression );
		expr : and_expression;
	END_ENTITY;

	ENTITY aggr_unary_expression 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( unary_expression );
	END_ENTITY;

	ENTITY query_variable 
		SUBTYPE OF ( dictionary_instance );
		variable_id : STRING;
		SELF\entity_instance.owner : query_expression;
	END_ENTITY;

	ENTITY query_expression 
		SUBTYPE OF ( aggr_unary_expression );
		variable : query_variable;
		aggregate_source : expression;
		such_that : expression;
	END_ENTITY;

	ENTITY entity_instance_constructor 
		SUBTYPE OF ( unary_expression );
		decl : entity_definition_reference;
		parameters : LIST OF expression;
	END_ENTITY;

	ENTITY qualifier 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( unary_expression );
	END_ENTITY;

	ENTITY attribute_qualifier 
		SUBTYPE OF ( qualifier );
		attribute_name : STRING;
	END_ENTITY;

	ENTITY group_qualifier 
		SUBTYPE OF ( qualifier );
		group_name : STRING;
	END_ENTITY;

	ENTITY index_qualifier 
		SUBTYPE OF ( qualifier );
	END_ENTITY;

	ENTITY element_qualifier 
		SUBTYPE OF ( index_qualifier );
		index : expression;
	END_ENTITY;

	ENTITY range_qualifier 
		SUBTYPE OF ( index_qualifier );
		index1 : expression;
		index2 : expression;
	END_ENTITY;

	ENTITY numeric_literal 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( literal );
	END_ENTITY;

	ENTITY logical_literal 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( literal );
	END_ENTITY;

	ENTITY true_constant 
		SUBTYPE OF ( logical_literal );
	END_ENTITY;

	ENTITY false_constant 
		SUBTYPE OF ( logical_literal );
	END_ENTITY;

	ENTITY unknown_constant 
		SUBTYPE OF ( logical_literal );
	END_ENTITY;

	ENTITY integer_literal 
		SUBTYPE OF ( numeric_literal );
		val : INTEGER;
	END_ENTITY;

	ENTITY real_literal 
		SUBTYPE OF ( numeric_literal );
		val : REAL;
	END_ENTITY;

	ENTITY pi_constant 
		SUBTYPE OF ( real_literal );
	DERIVE
		SELF\real_literal.val : REAL := 3.14159;
	END_ENTITY;

	ENTITY e_constant 
		SUBTYPE OF ( real_literal );
	DERIVE
		SELF\real_literal.val : REAL := 2.71828;
	END_ENTITY;

	ENTITY string_literal 
		SUBTYPE OF ( literal );
		val : STRING;
	END_ENTITY;

	ENTITY binary_literal 
		SUBTYPE OF ( literal );
		val : BINARY;
	END_ENTITY;

	ENTITY native_expression 
		SUBTYPE OF ( expression );
		source : native_algorithm;
	END_ENTITY;

	ENTITY escaped_expression 
		SUBTYPE OF ( expression );
		expr : expression;
	END_ENTITY;
END_SCHEMA;


SCHEMA Platypus_statements_schema;
	USE FROM Platypus_dictionary_schema;
	USE FROM Platypus_expressions_schema;

	ENTITY assignable 
		SUBTYPE OF ( dictionary_instance );
		head : identifier;
		qualifiers : LIST OF qualifier;
	END_ENTITY;

	ENTITY statement 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( dictionary_instance );
	END_ENTITY;

	ENTITY null_statement 
		SUBTYPE OF ( statement );
	END_ENTITY;

	ENTITY native_statement 
		SUBTYPE OF ( statement );
		source : native_algorithm;
	END_ENTITY;

	ENTITY alias_statement_variable 
		SUBTYPE OF ( dictionary_instance );
		alias_ident : STRING;
		ref : assignable;
		SELF\entity_instance.owner : alias_statement;
	END_ENTITY;

	ENTITY alias_statement 
		SUBTYPE OF ( statement );
		variable : alias_statement_variable;
		statements : LIST OF statement;
	END_ENTITY;

	ENTITY assignment_statement 
		SUBTYPE OF ( statement );
		left : assignable;
		right_expr : expression;
	END_ENTITY;

	ENTITY case_statement 
		SUBTYPE OF ( statement );
		selector : expression;
		case_actions : LIST OF case_action;
		case_otherwise : OPTIONAL statement;
	END_ENTITY;

	ENTITY case_action 
		SUBTYPE OF ( dictionary_instance );
		labels : LIST OF expression;
		action : statement;
	END_ENTITY;

	ENTITY compound_statement 
		SUBTYPE OF ( statement );
		statements : LIST OF statement;
	END_ENTITY;

	ENTITY escape_statement 
		SUBTYPE OF ( statement );
	END_ENTITY;

	ENTITY if_statement 
		SUBTYPE OF ( statement );
		selector : expression;
		then_statements : LIST OF statement;
		else_statements : OPTIONAL LIST OF statement;
	END_ENTITY;

	ENTITY repeat_statement 
		SUBTYPE OF ( statement );
		incr_control : OPTIONAL increment_control;
		until_control : OPTIONAL expression;
		while_control : OPTIONAL expression;
		statements : LIST OF statement;
	END_ENTITY;

	ENTITY increment_control_variable 
		SUBTYPE OF ( dictionary_instance );
		variable_id : STRING;
		SELF\entity_instance.owner : increment_control;
	END_ENTITY;

	ENTITY increment_control 
		SUBTYPE OF ( dictionary_instance );
		variable : increment_control_variable;
		first : expression;
		last : expression;
		step : OPTIONAL expression;
		SELF\entity_instance.owner : repeat_statement;
	END_ENTITY;

	ENTITY return_statement 
		SUBTYPE OF ( statement );
		returned : OPTIONAL expression;
	END_ENTITY;

	ENTITY procedure_call_statement 
		SUBTYPE OF ( statement );
		call : identifier;
	END_ENTITY;

	ENTITY skip_statement 
		SUBTYPE OF ( statement );
	END_ENTITY;

	ENTITY output_statement 
		SUBTYPE OF ( statement );
		output : expression;
	END_ENTITY;

	ENTITY splitmark_statement 
		SUBTYPE OF ( statement );
		filename : expression;
	END_ENTITY;

	ENTITY end_splitmark_statement 
		SUBTYPE OF ( statement );
	END_ENTITY;

	ENTITY anonymous_variable 
		SUBTYPE OF ( dictionary_instance );
		domain : parameter_type;
	END_ENTITY;
END_SCHEMA;


SCHEMA Platypus_aggregate_data_schema;
	USE FROM Platypus_population_schema;
	USE FROM Platypus_dictionary_schema;
	USE FROM Platypus_expressions_schema;

	ENTITY aggregate_data 
		ABSTRACT SUPERTYPE OF ( ONEOF ( aggregate_instance, aggregate_initializer ) ) 
		SUBTYPE OF ( expression );
	END_ENTITY;

	ENTITY aggregate_initializer 
		SUBTYPE OF ( aggregate_data );
		contents : LIST OF aggregate_initializer_element;
	END_ENTITY;

	ENTITY aggregate_initializer_element 
		SUBTYPE OF ( dictionary_instance );
		SELF\entity_instance.owner : aggregate_initializer;
		val : primitive;
		repetition : OPTIONAL expression;
	END_ENTITY;

	ENTITY aggregate_instance 
		ABSTRACT SUPERTYPE OF ( ONEOF ( array_instance, variable_size_aggregation_instance ) ) 
		SUBTYPE OF ( aggregate_data );
		lower_bound : integer_literal;
		upper_bound : integer_literal;
	END_ENTITY;

	ENTITY array_instance 
		SUBTYPE OF ( aggregate_instance );
		contents : LIST OF primitive;
	END_ENTITY;

	ENTITY variable_size_aggregation_instance 
		ABSTRACT SUPERTYPE OF ( ONEOF ( set_instance, bag_instance, list_instance ) ) 
		SUBTYPE OF ( aggregate_instance );
	END_ENTITY;

	ENTITY list_instance 
		SUBTYPE OF ( variable_size_aggregation_instance );
		contents : LIST OF primitive;
	END_ENTITY;

	ENTITY bag_instance 
		SUBTYPE OF ( variable_size_aggregation_instance );
		contents : BAG OF primitive;
	END_ENTITY;

	ENTITY set_instance 
		SUBTYPE OF ( variable_size_aggregation_instance );
		contents : SET OF primitive;
	END_ENTITY;
END_SCHEMA;


SCHEMA Platypus_population_schema;
	USE FROM Platypus_expressions_schema;
	USE FROM Platypus_environment_schema;
	USE FROM Platypus_dictionary_schema;

	ENTITY instance_scope 
		SUBTYPE OF ( session_instance );
		owned : LIST [ 1 : ? ] OF entity_instance;
		export_list : LIST [ 0 : ? ] OF entity_instance;
	END_ENTITY;

	ENTITY application_instance 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( entity_instance );
		owning_model : model_contents;
		persistent_label : STRING;
	END_ENTITY;

	ENTITY generic_instance 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( application_instance );
		instance_scope : OPTIONAL instance_scope;
	END_ENTITY;

	ENTITY internal_representation 
		SUBTYPE OF ( generic_instance );
		definition : entity_definition_reference;
		parameters : LIST OF primitive;
	END_ENTITY;

	ENTITY external_representation 
		SUBTYPE OF ( generic_instance );
		records : LIST OF simple_record;
	END_ENTITY;

	ENTITY group_representation 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( generic_instance );
		definition : entity_definition_reference;
		instRef : generic_instance;
	END_ENTITY;

	ENTITY external_group_representation 
		SUBTYPE OF ( group_representation );
	END_ENTITY;

	ENTITY internal_group_representation 
		SUBTYPE OF ( group_representation );
	END_ENTITY;

	ENTITY user_defined_application_instance 
		SUBTYPE OF ( application_instance );
		name : STRING;
		parameters : LIST OF primitive;
	END_ENTITY;

	ENTITY simple_record 
		SUBTYPE OF ( entity_instance );
		definition : entity_definition_reference;
		parameters : LIST OF primitive;
		SELF\entity_instance.owner : generic_instance;
	END_ENTITY;

	ENTITY header_instance 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( entity_instance );
		owning_model : model_contents;
	END_ENTITY;

	ENTITY user_defined_header_instance 
		SUBTYPE OF ( header_instance );
		name : STRING;
		parameters : LIST OF primitive;
	END_ENTITY;

	ENTITY file_description 
		SUBTYPE OF ( header_instance );
		description : LIST [ 1 : ? ] OF STRING ( 256 );
		implementation_level : STRING ( 256 );
	END_ENTITY;

	ENTITY file_name 
		SUBTYPE OF ( header_instance );
		name : STRING ( 256 );
		time_stamp : STRING ( 256 );
		author : LIST [ 1 : ? ] OF STRING ( 256 );
		organization : LIST [ 1 : ? ] OF STRING ( 256 );
		preprocessor_version : STRING ( 256 );
		originating_system : STRING ( 256 );
		authorisation : STRING ( 256 );
	END_ENTITY;

	ENTITY file_schema 
		SUBTYPE OF ( header_instance );
		schema_identifiers : LIST [ 1 : ? ] OF schema_name;
	END_ENTITY;
END_SCHEMA;


SCHEMA Platypus_environment_schema;
	USE FROM Platypus_population_schema;
	USE FROM Platypus_dictionary_schema;

	ENTITY model_contents 
		SUBTYPE OF ( session_instance );
		SELF\entity_instance.owner : schema_instance;
	INVERSE
		instances : SET [ 0 : ? ] OF application_instance FOR owning_model;
	END_ENTITY;

	ENTITY schema_instance 
		SUBTYPE OF ( session_instance );
		name : STRING;
		associated_models : LIST [ 0 : ? ] OF model_contents;
		schemata : LIST [ 0 : ? ] OF schema_definition;
	DERIVE
		accepted : entity_instance := SELF.accept_schema_instance;
	END_ENTITY;
END_SCHEMA;


SCHEMA Platypus_dictionary_schema;
	USE FROM Platypus_expressions_schema;
	USE FROM Platypus_statements_schema;
	USE FROM Platypus_population_schema;
	USE FROM Platypus_environment_schema;
	USE FROM Platypus_aggregate_data_schema;

	TYPE constructed_type = SELECT
		( enumeration_type, select_type );
	END_TYPE;

	TYPE type_or_rule = SELECT
		( named_type, global_rule );
	END_TYPE;

	TYPE base_type = SELECT
		( simple_type, aggregation_type, named_type_reference );
	END_TYPE;

	TYPE underlying_type = SELECT
		( simple_type, aggregation_type, named_type_reference, constructed_type );
	END_TYPE;

	TYPE parameter_type = SELECT
		( simple_type, aggregate_type, aggregate_initializer_domain, named_type_reference );
	END_TYPE;

	TYPE declaration = SELECT
		( named_type, global_rule, constant_definition, procedure_declaration );
	END_TYPE;

	TYPE time_stamp = STRING ( 256 );
	END_TYPE;

	TYPE primitive = expression;
	END_TYPE;

	TYPE schema_name = STRING;
	END_TYPE;

	TYPE context_owner = SELECT
		( context_definition, schema_instance );
	END_TYPE;

	TYPE inter_schema_link = ENUMERATION
		OF ( used, referenced );
	END_TYPE;

	ENTITY entity_instance 
		ABSTRACT SUPERTYPE;
		owner : OPTIONAL entity_instance;
	END_ENTITY;

	ENTITY sdai_instance 
		ABSTRACT SUPERTYPE OF ( ONEOF ( dictionary_instance, session_instance ) ) 
		SUBTYPE OF ( entity_instance );
	END_ENTITY;

	ENTITY dictionary_instance 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( sdai_instance );
	DERIVE
		handled : dictionary_instance := SELF;
	END_ENTITY;

	ENTITY session_instance 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( sdai_instance );
		change_date : OPTIONAL time_stamp;
		validation_date : time_stamp;
		validation_result : LOGICAL;
	END_ENTITY;

	ENTITY domain_equivalent_item 
		SUBTYPE OF ( dictionary_instance );
		name : STRING;
		external_item_id : STRING;
		native_item : declaration;
	END_ENTITY;

	ENTITY context_definition 
		ABSTRACT SUPERTYPE OF ( ONEOF ( schema_definition, statements_container ) ) 
		SUBTYPE OF ( dictionary_instance );
		name : STRING;
		constants : LIST OF constant_definition;
		types : LIST OF defined_type;
		entities : LIST OF entity_definition;
		algorithmes : LIST OF algorithm_declaration;
		SELF\entity_instance.owner : OPTIONAL context_owner;
	END_ENTITY;

	ENTITY statements_container 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( context_definition );
		locals : LIST OF local_variable;
		statements : LIST OF statement;
	END_ENTITY;

	ENTITY global_rule 
		SUBTYPE OF ( statements_container );
		for_entities : LIST [ 1 : ? ] OF entity_instances_set;
		where_rules : LIST [ 1 : ? ] OF where_rule;
		SELF\context_definition.owner : schema_definition;
	DERIVE
		accepted : entity_instance := SELF.accept_global_rule;
	END_ENTITY;

	ENTITY external_schema 
		SUBTYPE OF ( dictionary_instance );
		name : schema_name;
		SELF\entity_instance.owner : schema_definition;
	END_ENTITY;

	ENTITY include_schema 
		SUBTYPE OF ( external_schema );
		native_schema : schema_definition;
		explicitly_imported_items : LIST OF domain_equivalent_item;
		implicitly_imported_items : LIST OF domain_equivalent_item;
	END_ENTITY;

	ENTITY used_schema 
		SUBTYPE OF ( include_schema );
	END_ENTITY;

	ENTITY referenced_schema 
		SUBTYPE OF ( include_schema );
	END_ENTITY;

	ENTITY external_meta_schema 
		SUBTYPE OF ( external_schema );
	END_ENTITY;

	ENTITY algorithm_declaration 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( statements_container );
		formal_parameters : LIST OF parameter_definition;
	END_ENTITY;

	ENTITY native_code 
		SUBTYPE OF ( dictionary_instance );
		language_signature : STRING;
		code : STRING;
	END_ENTITY;

	ENTITY native_algorithm 
		SUBTYPE OF ( dictionary_instance );
		implementations : LIST OF native_code;
	END_ENTITY;

	ENTITY procedure_declaration 
		SUBTYPE OF ( algorithm_declaration );
	DERIVE
		accepted : entity_instance := SELF.accept_procedure_declaration;
	END_ENTITY;

	ENTITY function_declaration 
		SUBTYPE OF ( algorithm_declaration );
		return_type : parameter_type;
	DERIVE
		accepted : entity_instance := SELF.accept_function_declaration;
	END_ENTITY;

	ENTITY bound 
		ABSTRACT SUPERTYPE OF ( ONEOF ( integer_bound, population_dependent_bound ) ) 
		SUBTYPE OF ( dictionary_instance );
	END_ENTITY;

	ENTITY integer_bound 
		SUBTYPE OF ( bound );
		bound_value : INTEGER;
	END_ENTITY;

	ENTITY population_dependent_bound 
		SUBTYPE OF ( bound );
		bound_value : expression;
	END_ENTITY;

	ENTITY enumeration_type 
		SUBTYPE OF ( dictionary_instance );
		elements : LIST [ 1 : ? ] OF UNIQUE STRING;
		SELF\entity_instance.owner : defined_type;
	DERIVE
		accepted : entity_instance := SELF.accept_enumeration_type;
	END_ENTITY;

	ENTITY named_type 
		ABSTRACT SUPERTYPE OF ( ONEOF ( entity_definition, defined_type ) ) 
		SUBTYPE OF ( dictionary_instance );
		name : STRING;
		where_rules : LIST [ 0 : ? ] OF where_rule;
		SELF\entity_instance.owner : context_definition;
	END_ENTITY;

	ENTITY dictionary_instance_reference 
		SUBTYPE OF ( dictionary_instance );
		ref : dictionary_instance;
		name : STRING;
	DERIVE
		SELF\dictionary_instance.handled : dictionary_instance := SELF.ref;
	END_ENTITY;

	ENTITY named_type_reference 
		SUBTYPE OF ( dictionary_instance_reference );
		SELF\dictionary_instance_reference.ref : named_type;
	DERIVE
		accepted : entity_instance := SELF.accept_named_type_reference;
	END_ENTITY;

	ENTITY attribute_reference 
		SUBTYPE OF ( dictionary_instance_reference );
		SELF\dictionary_instance_reference.ref : attribute;
		entity_ref : entity_definition_reference;
	DERIVE
		SELF\named_type_reference.accepted : entity_instance := SELF.accept_attribute_reference;
	END_ENTITY;

	ENTITY entity_definition_reference 
		SUBTYPE OF ( named_type_reference );
		SELF\named_type_reference.ref : entity_definition;
	DERIVE
		SELF\named_type_reference.accepted : entity_instance := SELF.accept_entity_definition_reference;
	END_ENTITY;

	ENTITY defined_type_reference 
		SUBTYPE OF ( named_type_reference );
		SELF\named_type_reference.ref : defined_type;
	DERIVE
		SELF\named_type_reference.accepted : entity_instance := SELF.accept_defined_type_reference;
	END_ENTITY;

	ENTITY where_rule 
		SUBTYPE OF ( dictionary_instance );
		label : OPTIONAL STRING;
		SELF\entity_instance.owner : type_or_rule;
		where_value : expression;
	END_ENTITY;

	ENTITY select_type 
		SUBTYPE OF ( dictionary_instance );
		selections : LIST [ 1 : ? ] OF named_type_reference;
		SELF\entity_instance.owner : defined_type;
	DERIVE
		accepted : entity_instance := SELF.accept_select_type;
	END_ENTITY;

	ENTITY defined_type 
		SUBTYPE OF ( named_type );
		domain : underlying_type;
	DERIVE
		accepted : entity_instance := SELF.accept_defined_type;
	END_ENTITY;

	ENTITY entity_definition 
		SUBTYPE OF ( named_type );
		supertype_constraint : OPTIONAL supertype_constraint;
		supertypes : LIST OF UNIQUE entity_definition_reference;
		attributes : LIST OF UNIQUE attribute;
		uniqueness_rules : LIST OF UNIQUE uniqueness_rule;
		complex : BOOLEAN;
		instantiable : BOOLEAN;
		independent : BOOLEAN;
	DERIVE
		accepted : entity_instance := SELF.accept_entity_definition;
	END_ENTITY;

	ENTITY supertype_constraint 
		SUBTYPE OF ( dictionary_instance );
		constrained : entity_definition_reference;
		expr : OPTIONAL supertype_expression;
	END_ENTITY;

	ENTITY supertype_expression 
		ABSTRACT SUPERTYPE OF ( ONEOF ( sub_entity_ref_expression, binary_supertype_expression, oneof_supertype_expression ) ) 
		SUBTYPE OF ( dictionary_instance );
	END_ENTITY;

	ENTITY sub_entity_ref_expression 
		SUBTYPE OF ( supertype_expression );
		entity_ref : entity_definition_reference;
	END_ENTITY;

	ENTITY binary_supertype_expression 
		SUBTYPE OF ( supertype_expression );
		parenthesis : OPTIONAL BOOLEAN;
		left_expr : supertype_expression;
		right_expr : supertype_expression;
	END_ENTITY;

	ENTITY andor_supertype 
		SUBTYPE OF ( binary_supertype_expression );
	END_ENTITY;

	ENTITY and_supertype 
		SUBTYPE OF ( binary_supertype_expression );
	END_ENTITY;

	ENTITY oneof_supertype_expression 
		SUBTYPE OF ( supertype_expression );
		expr_list : LIST OF supertype_expression;
	END_ENTITY;

	ENTITY uniqueness_rule 
		SUBTYPE OF ( dictionary_instance );
		label : OPTIONAL STRING;
		attributes : LIST [ 1 : ? ] OF UNIQUE uniqueness_rule_attribute_identifier;
		SELF\entity_instance.owner : entity_definition;
	END_ENTITY;

	ENTITY attribute 
		ABSTRACT SUPERTYPE OF ( ONEOF ( derived_attribute, explicit_attribute, inverse_attribute ) ) 
		SUBTYPE OF ( dictionary_instance );
		name : STRING;
		SELF\entity_instance.owner : entity_definition;
		domain : base_type;
		redeclaring : OPTIONAL attribute_reference;
	END_ENTITY;

	ENTITY aggregate_initializer_domain 
		SUBTYPE OF ( dictionary_instance );
		types : LIST [ 1 : ? ] OF parameter_type;
	END_ENTITY;

	ENTITY aggregate_type 
		ABSTRACT SUPERTYPE OF ( ONEOF ( aggregation_type, general_aggregate_type ) ) 
		SUBTYPE OF ( dictionary_instance );
		element_type : parameter_type;
	END_ENTITY;

	ENTITY general_aggregate_type 
		SUBTYPE OF ( aggregate_type );
		type_label : OPTIONAL STRING;
	END_ENTITY;

	ENTITY aggregation_type 
		ABSTRACT SUPERTYPE OF ( ONEOF ( variable_size_aggregation_type, array_type ) ) 
		SUBTYPE OF ( aggregate_type );
		lower_bound : OPTIONAL bound;
		upper_bound : OPTIONAL bound;
		is_general_type : BOOLEAN;
	END_ENTITY;

	ENTITY array_type 
		SUBTYPE OF ( aggregation_type );
		unique_flag : BOOLEAN;
		optional_flag : BOOLEAN;
		SELF\aggregation_type.lower_bound : bound;
		SELF\aggregation_type.upper_bound : bound;
	DERIVE
		accepted : entity_instance := SELF.accept_array_type;
	END_ENTITY;

	ENTITY variable_size_aggregation_type 
		ABSTRACT SUPERTYPE OF ( ONEOF ( set_type, bag_type, list_type ) ) 
		SUBTYPE OF ( aggregation_type );
	END_ENTITY;

	ENTITY list_type 
		SUBTYPE OF ( variable_size_aggregation_type );
		unique_flag : BOOLEAN;
	DERIVE
		accepted : entity_instance := SELF.accept_list_type;
	END_ENTITY;

	ENTITY bag_type 
		SUBTYPE OF ( variable_size_aggregation_type );
	DERIVE
		accepted : entity_instance := SELF.accept_bag_type;
	END_ENTITY;

	ENTITY set_type 
		SUBTYPE OF ( variable_size_aggregation_type );
	DERIVE
		accepted : entity_instance := SELF.accept_set_type;
	END_ENTITY;

	ENTITY simple_type 
		ABSTRACT SUPERTYPE OF ( ONEOF ( string_type, binary_type, logical_type, number_type ) ) 
		SUBTYPE OF ( dictionary_instance );
	END_ENTITY;

	ENTITY string_type 
		SUBTYPE OF ( simple_type );
		width : OPTIONAL bound;
		fixed_width : BOOLEAN;
	DERIVE
		accepted : entity_instance := SELF.accept_string_type;
	END_ENTITY;

	ENTITY binary_type 
		SUBTYPE OF ( simple_type );
		width : OPTIONAL bound;
		fixed_width : BOOLEAN;
	DERIVE
		accepted : entity_instance := SELF.accept_binary_type;
	END_ENTITY;

	ENTITY number_type 
		SUBTYPE OF ( simple_type );
	DERIVE
		accepted : entity_instance := SELF.accept_number_type;
	END_ENTITY;

	ENTITY real_type 
		SUBTYPE OF ( number_type );
		precision : OPTIONAL bound;
	DERIVE
		SELF\number_type.accepted : entity_instance := SELF.accept_real_type;
	END_ENTITY;

	ENTITY integer_type 
		SUBTYPE OF ( number_type );
		precision : OPTIONAL bound;
	DERIVE
		SELF\number_type.accepted : entity_instance := SELF.accept_integer_type;
	END_ENTITY;

	ENTITY logical_type 
		SUBTYPE OF ( simple_type );
	DERIVE
		accepted : entity_instance := SELF.accept_logical_type;
	END_ENTITY;

	ENTITY boolean_type 
		SUBTYPE OF ( logical_type );
	DERIVE
		SELF\logical_type.accepted : entity_instance := SELF.accept_boolean_type;
	END_ENTITY;

	ENTITY constant_definition 
		SUBTYPE OF ( dictionary_instance );
		name : STRING;
		domain : base_type;
		initializer : expression;
		SELF\entity_instance.owner : context_definition;
	END_ENTITY;

	ENTITY local_variable 
		SUBTYPE OF ( dictionary_instance );
		SELF\entity_instance.owner : statements_container;
		name : STRING;
		domain : parameter_type;
		initializer : OPTIONAL expression;
	END_ENTITY;

	ENTITY parameter_definition 
		SUBTYPE OF ( dictionary_instance );
		SELF\entity_instance.owner : algorithm_declaration;
		name : STRING;
		by_copy : BOOLEAN;
		domain : parameter_type;
	END_ENTITY;

	ENTITY generic_type 
		SUBTYPE OF ( dictionary_instance );
		type_label : OPTIONAL STRING;
	DERIVE
		accepted : entity_instance := SELF.accept_generic_type;
	END_ENTITY;

	ENTITY remark 
		ABSTRACT SUPERTYPE OF ( ONEOF ( tail_remark, embedded_remark ) ) 
		SUBTYPE OF ( entity_instance );
		text : STRING;
	END_ENTITY;

	ENTITY tail_remark 
		SUBTYPE OF ( remark );
	END_ENTITY;

	ENTITY embedded_remark 
		SUBTYPE OF ( remark );
	END_ENTITY;

	ENTITY remark_reference 
		SUBTYPE OF ( dictionary_instance );
		prefix : STRING;
		suffix : OPTIONAL STRING;
		inside : dictionary_instance_reference;
		referenced : dictionary_instance_reference;
		remark : remark;
	END_ENTITY;

	ENTITY meta_concept_definition 
		SUBTYPE OF ( dictionary_instance );
		definition : dictionary_instance;
		expression : STRING;
	END_ENTITY;

	ENTITY derived_attribute 
		SUBTYPE OF ( attribute );
		assign : expression;
	DERIVE
		accepted : entity_instance := SELF.accept_derived_attribute;
	END_ENTITY;

	ENTITY explicit_attribute 
		SUBTYPE OF ( attribute );
		optional_flag : BOOLEAN;
	DERIVE
		accepted : entity_instance := SELF.accept_explicit_attribute;
	END_ENTITY;

	ENTITY inverse_attribute 
		SUBTYPE OF ( attribute );
		inverted_attr : attribute_reference;
		min_cardinality : OPTIONAL bound;
		max_cardinality : OPTIONAL bound;
		duplicates : BOOLEAN;
	DERIVE
		SELF\attribute.domain : entity_definition_reference := inverted_attr.entity_ref;
		accepted : entity_instance := SELF.accept_inverse_attribute;
	END_ENTITY;

	ENTITY meta_mapping_rule 
		SUBTYPE OF ( dictionary_instance );
		condition : STRING;
		expression : STRING;
	END_ENTITY;

	ENTITY meta_mapping_definition 
		SUBTYPE OF ( dictionary_instance );
		definition : dictionary_instance;
		expression : STRING;
	END_ENTITY;

	ENTITY schema_definition 
		SUBTYPE OF ( context_definition );
		global_rules : LIST OF global_rule;
		interface : LIST OF external_schema;
		remark_references : LIST OF remark_reference;
	DERIVE
		accepted : entity_instance := SELF.accept_schema_definition;
	END_ENTITY;
END_SCHEMA;


</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusMetaSchemasSchemaInstance,
	#superclass : #PlatypusCoreSchemaInstance,
	#instVars : [
		'context'
	],
	#category : #'Platypus-PlatypusMetaSchemasSchemaInstance'
}

{ #category : #'platypus-generated-initializing' }
PltPlatypusMetaSchemasSchemaInstance class >> bootstraps [ 	self reinitializeSingleton. self singleton buildIndexes.


]

{ #category : #'platypus-generated-initializing' }
PltPlatypusMetaSchemasSchemaInstance class >> initialize [
  self reinitializeSingleton.
  self singleton buildIndexes


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusMetaSchemasSchemaInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #accessing }
PltPlatypusMetaSchemasSchemaInstance class >> singleton [
	^ singleton ifNil: [singleton := self new]
	
]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusMetaSchemasSchemaInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusMetaSchemasSchemaInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> context [
  ^context


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> context: aContext [
  context := aContext.
  super context: aContext


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode1 [	^	'SCHEMA Platypus_expressions_schema;(*\\*)',	'	USE FROM Platypus_dictionary_schema;(*\\*)',	'	USE FROM Platypus_statements_schema;(*\\*)',	'	USE FROM Platypus_population_schema;(*\\*)',	'(*\\*)',	'	ENTITY expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		owner : OPTIONAL dictionary_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY unary_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY binary_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'		parenthesis : OPTIONAL BOOLEAN;(*\\*)',	'		left_expr : expression;(*\\*)',	'		right_expr : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY logical_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( binary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_instance_reference (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'		persistent_label : STRING;(*\\*)',	'		ref : entity_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY instance_construction_expression (*\\*)',	'		SUBTYPE OF ( binary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY arithmetic_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( binary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY expo_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY mult_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY div_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY real_div_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY mod_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY plus_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY minus_expression (*\\*)',	'		SUBTYPE OF ( arithmetic_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY and_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY or_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY xor_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY comparison_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY less_than_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY greater_than_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY equal_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY less_equal_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY greater_equal_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY not_equal_expression (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY inst_comparison_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY inst_equal_expression (*\\*)',	'		SUBTYPE OF ( inst_comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY inst_not_equal_expression (*\\*)',	'		SUBTYPE OF ( inst_comparison_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY in_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY like_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY cardinality_expression (*\\*)',	'		SUBTYPE OF ( logical_expression );(*\\*)',	'		card1 : expression;(*\\*)',	'		card2 : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY simple_unary_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		expr : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY not_expression (*\\*)',	'		SUBTYPE OF ( simple_unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY positive_expression (*\\*)',	'		SUBTYPE OF ( simple_unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY negative_expression (*\\*)',	'		SUBTYPE OF ( simple_unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY typed_expression (*\\*)',	'		SUBTYPE OF ( simple_unary_expression );(*\\*)',	'		domain : named_type_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY enumeration_value (*\\*)',	'		SUBTYPE OF ( qualifier );(*\\*)',	'		domain : defined_type_reference;(*\\*)',	'		element : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_instances_set (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		entity_ref : entity_definition_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY qualified_expression (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		head : expression;(*\\*)',	'		qualifiers : LIST OF qualifier;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY literal (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY identifier (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		name : STRING;(*\\*)',	'		ref : dictionary_instance;(*\\*)',	'		parameters : OPTIONAL LIST OF expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY attribute_identifier (*\\*)',	'		SUBTYPE OF ( identifier );(*\\*)',	'		selfInstance : generic_instance_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY self_identifier (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode2 [	^	'(*\\*)',	'	ENTITY uniqueness_rule_attribute_identifier (*\\*)',	'		SUBTYPE OF ( identifier );(*\\*)',	'		group_ref_name : OPTIONAL STRING;(*\\*)',	'		SELF\identifier.ref : attribute;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY missing_value (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY redefined_attribute_value (*\\*)',	'		SUBTYPE OF ( missing_value );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY implicitly_declared_identifier (*\\*)',	'		SUBTYPE OF ( identifier );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY interval (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		expr : and_expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggr_unary_expression (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY query_variable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		variable_id : STRING;(*\\*)',	'		owner : query_expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY query_expression (*\\*)',	'		SUBTYPE OF ( aggr_unary_expression );(*\\*)',	'		variable : query_variable;(*\\*)',	'		aggregate_source : expression;(*\\*)',	'		such_that : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_instance_constructor (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'		decl : entity_definition_reference;(*\\*)',	'		parameters : LIST OF expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY qualifier (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( unary_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY attribute_qualifier (*\\*)',	'		SUBTYPE OF ( qualifier );(*\\*)',	'		attribute_name : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY group_qualifier (*\\*)',	'		SUBTYPE OF ( qualifier );(*\\*)',	'		group_name : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY index_qualifier (*\\*)',	'		SUBTYPE OF ( qualifier );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY element_qualifier (*\\*)',	'		SUBTYPE OF ( index_qualifier );(*\\*)',	'		index : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY range_qualifier (*\\*)',	'		SUBTYPE OF ( index_qualifier );(*\\*)',	'		index1 : expression;(*\\*)',	'		index2 : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY numeric_literal (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( literal );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY logical_literal (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( literal );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY true_constant (*\\*)',	'		SUBTYPE OF ( logical_literal );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY false_constant (*\\*)',	'		SUBTYPE OF ( logical_literal );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY unknown_constant (*\\*)',	'		SUBTYPE OF ( logical_literal );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY integer_literal (*\\*)',	'		SUBTYPE OF ( numeric_literal );(*\\*)',	'		val : INTEGER;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY real_literal (*\\*)',	'		SUBTYPE OF ( numeric_literal );(*\\*)',	'		val : REAL;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY pi_constant (*\\*)',	'		SUBTYPE OF ( real_literal );(*\\*)',	'	DERIVE(*\\*)',	'		SELF\real_literal.val : REAL := 3.14159;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY e_constant (*\\*)',	'		SUBTYPE OF ( real_literal );(*\\*)',	'	DERIVE(*\\*)',	'		SELF\real_literal.val : REAL := 2.71828;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY string_literal (*\\*)',	'		SUBTYPE OF ( literal );(*\\*)',	'		val : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY binary_literal (*\\*)',	'		SUBTYPE OF ( literal );(*\\*)',	'		val : BINARY;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY native_expression (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'		source : native_algorithm;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY escaped_expression (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'		expr : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'END_SCHEMA;(*\\*)',	'(*\\*)',	'(*\\*)',	'SCHEMA Platypus_statements_schema;(*\\*)',	'	USE FROM Platypus_dictionary_schema;(*\\*)',	'	USE FROM Platypus_expressions_schema;(*\\*)',	'(*\\*)',	'	ENTITY assignable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		head : identifier;(*\\*)',	'		qualifiers : LIST OF qualifier;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY statement (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		owner : dictionary_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY null_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY native_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		source : native_algorithm;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY alias_statement_variable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		alias_ident : STRING;(*\\*)',	'		ref : assignable;(*\\*)',	'		owner : alias_statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY alias_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		variable : alias_statement_variable;(*\\*)',	'		statements : LIST OF statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY assignment_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		left : assignable;(*\\*)',	'		right_expr : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY case_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		selector : expression;(*\\*)',	'		case_actions : LIST OF case_action;(*\\*)',	'		case_otherwise : OPTIONAL statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY case_action (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		labels : LIST OF expression;(*\\*)',	'		action : statement;(*\\*)',	'	END_ENTITY;(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode3 [	^	'(*\\*)',	'	ENTITY compound_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		statements : LIST OF statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY escape_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY if_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		selector : expression;(*\\*)',	'		then_statements : LIST OF statement;(*\\*)',	'		else_statements : OPTIONAL LIST OF statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY repeat_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		incr_control : OPTIONAL increment_control;(*\\*)',	'		until_control : OPTIONAL expression;(*\\*)',	'		while_control : OPTIONAL expression;(*\\*)',	'		statements : LIST OF statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY increment_control_variable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		variable_id : STRING;(*\\*)',	'		owner : increment_control;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY increment_control (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		variable : increment_control_variable;(*\\*)',	'		first : expression;(*\\*)',	'		last : expression;(*\\*)',	'		step : OPTIONAL expression;(*\\*)',	'		owner : repeat_statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY return_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		returned : OPTIONAL expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY procedure_call_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		call : identifier;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY skip_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY output_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		output : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY splitmark_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'		filename : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY end_splitmark_statement (*\\*)',	'		SUBTYPE OF ( statement );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY anonymous_variable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		domain : parameter_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'END_SCHEMA;(*\\*)',	'(*\\*)',	'(*\\*)',	'SCHEMA Platypus_aggregate_data_schema;(*\\*)',	'	USE FROM Platypus_population_schema;(*\\*)',	'	USE FROM Platypus_dictionary_schema;(*\\*)',	'	USE FROM Platypus_expressions_schema;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_data (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( aggregate_instance, aggregate_initializer ) ) (*\\*)',	'		SUBTYPE OF ( expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_initializer (*\\*)',	'		SUBTYPE OF ( aggregate_data );(*\\*)',	'		contents : LIST OF aggregate_initializer_element;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_initializer_element (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		val : primitive;(*\\*)',	'		repetition : OPTIONAL expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_instance (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( array_instance, variable_size_aggregation_instance ) ) (*\\*)',	'		SUBTYPE OF ( aggregate_data );(*\\*)',	'		lower_bound : integer_literal;(*\\*)',	'		upper_bound : integer_literal;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY array_instance (*\\*)',	'		SUBTYPE OF ( aggregate_instance );(*\\*)',	'		contents : LIST OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY variable_size_aggregation_instance (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( set_instance, bag_instance, list_instance ) ) (*\\*)',	'		SUBTYPE OF ( aggregate_instance );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY list_instance (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_instance );(*\\*)',	'		contents : LIST OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY bag_instance (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_instance );(*\\*)',	'		contents : BAG OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY set_instance (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_instance );(*\\*)',	'		contents : SET OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'END_SCHEMA;(*\\*)',	'(*\\*)',	'(*\\*)',	'SCHEMA Platypus_population_schema;(*\\*)',	'	USE FROM Platypus_expressions_schema;(*\\*)',	'	USE FROM Platypus_environment_schema;(*\\*)',	'	USE FROM Platypus_dictionary_schema;(*\\*)',	'(*\\*)',	'	ENTITY instance_scope (*\\*)',	'		SUBTYPE OF ( session_instance );(*\\*)',	'		owner : entity_instance;(*\\*)',	'		owned : LIST [ 1 : ? ] OF entity_instance;(*\\*)',	'		export_list : LIST [ 0 : ? ] OF entity_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY application_instance (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'		owning_model : model_contents;(*\\*)',	'		persistent_label : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY generic_instance (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( application_instance );(*\\*)',	'		owner : OPTIONAL entity_instance;(*\\*)',	'		scope : OPTIONAL instance_scope;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY internal_representation (*\\*)',	'		SUBTYPE OF ( generic_instance );(*\\*)',	'		definition : entity_definition_reference;(*\\*)',	'		parameters : LIST OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY external_representation (*\\*)',	'		SUBTYPE OF ( generic_instance );(*\\*)',	'		records : LIST OF simple_record;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY group_representation (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( generic_instance );(*\\*)',	'		definition : entity_definition_reference;(*\\*)',	'		instRef : generic_instance_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY external_group_representation (*\\*)',	'		SUBTYPE OF ( group_representation );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY internal_group_representation (*\\*)',	'		SUBTYPE OF ( group_representation );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY generic_instance_reference (*\\*)',	'		SUBTYPE OF ( entity_instance_reference );(*\\*)',	'		SELF\entity_instance_reference.ref : generic_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY user_defined_application_instance (*\\*)',	'		SUBTYPE OF ( application_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		parameters : LIST OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY simple_record (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'		definition : entity_definition_reference;(*\\*)',	'		parameters : LIST OF primitive;(*\\*)',	'		owner : generic_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode4 [	^	'	ENTITY header_instance (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'		owning_model : model_contents;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY user_defined_header_instance (*\\*)',	'		SUBTYPE OF ( header_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		parameters : LIST OF primitive;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY file_description (*\\*)',	'		SUBTYPE OF ( header_instance );(*\\*)',	'		description : LIST [ 1 : ? ] OF STRING ( 256 );(*\\*)',	'		implementation_level : STRING ( 256 );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY file_name (*\\*)',	'		SUBTYPE OF ( header_instance );(*\\*)',	'		name : STRING ( 256 );(*\\*)',	'		time_stamp : STRING ( 256 );(*\\*)',	'		author : LIST [ 1 : ? ] OF STRING ( 256 );(*\\*)',	'		organization : LIST [ 1 : ? ] OF STRING ( 256 );(*\\*)',	'		preprocessor_version : STRING ( 256 );(*\\*)',	'		originating_system : STRING ( 256 );(*\\*)',	'		authorisation : STRING ( 256 );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY file_schema (*\\*)',	'		SUBTYPE OF ( header_instance );(*\\*)',	'		schema_identifiers : LIST [ 1 : ? ] OF schema_name;(*\\*)',	'	END_ENTITY;(*\\*)',	'END_SCHEMA;(*\\*)',	'(*\\*)',	'(*\\*)',	'SCHEMA Platypus_environment_schema;(*\\*)',	'	USE FROM Platypus_population_schema;(*\\*)',	'	USE FROM Platypus_dictionary_schema;(*\\*)',	'(*\\*)',	'	ENTITY model_contents (*\\*)',	'		SUBTYPE OF ( session_instance );(*\\*)',	'		owner : schema_instance;(*\\*)',	'	INVERSE(*\\*)',	'		instances : SET [ 0 : ? ] OF application_instance FOR owning_model;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY schema_instance (*\\*)',	'		SUBTYPE OF ( session_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		associated_models : LIST [ 0 : ? ] OF model_contents;(*\\*)',	'		schemata : LIST [ 0 : ? ] OF schema_definition;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_schema_instance;(*\\*)',	'	END_ENTITY;(*\\*)',	'END_SCHEMA;(*\\*)',	'(*\\*)',	'(*\\*)',	'SCHEMA Platypus_dictionary_schema;(*\\*)',	'	USE FROM Platypus_expressions_schema;(*\\*)',	'	USE FROM Platypus_statements_schema;(*\\*)',	'	USE FROM Platypus_population_schema;(*\\*)',	'	USE FROM Platypus_environment_schema;(*\\*)',	'	USE FROM Platypus_aggregate_data_schema;(*\\*)',	'(*\\*)',	'	TYPE constructed_type = SELECT(*\\*)',	'		( enumeration_type, select_type );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE type_or_rule = SELECT(*\\*)',	'		( named_type, global_rule );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE base_type = SELECT(*\\*)',	'		( simple_type, aggregation_type, named_type_reference );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE underlying_type = SELECT(*\\*)',	'		( simple_type, aggregation_type, named_type_reference, constructed_type );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE parameter_type = SELECT(*\\*)',	'		( simple_type, aggregate_type, aggregate_initializer_domain, named_type_reference );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE declaration = SELECT(*\\*)',	'		( named_type, global_rule, constant_definition, procedure_declaration );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE time_stamp = STRING ( 256 );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE primitive = expression;(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE schema_name = STRING;(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE context_owner = SELECT(*\\*)',	'		( context_definition, schema_instance );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE inter_schema_link = ENUMERATION(*\\*)',	'		OF ( used, referenced );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	TYPE context_container_ref = SELECT(*\\*)',	'		( schema_instance_ref, context_ref );(*\\*)',	'	END_TYPE;(*\\*)',	'(*\\*)',	'	ENTITY element_ref (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'		name : STRING;(*\\*)',	'	DERIVE(*\\*)',	'		ref : entity_instance := ?;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY schema_instance_ref (*\\*)',	'		SUBTYPE OF ( element_ref );(*\\*)',	'	DERIVE(*\\*)',	'		SELF\element_ref.ref : entity_instance := schema_instance_from_ref ( SELF );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY context_ref (*\\*)',	'		SUBTYPE OF ( element_ref );(*\\*)',	'		owner : context_container_ref;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY schema_ref (*\\*)',	'		SUBTYPE OF ( context_ref );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY algorithm_ref (*\\*)',	'		SUBTYPE OF ( context_ref );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY rule_ref (*\\*)',	'		SUBTYPE OF ( context_ref );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY named_type_ref (*\\*)',	'		SUBTYPE OF ( element_ref );(*\\*)',	'		owner : context_ref;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_instance (*\\*)',	'		ABSTRACT SUPERTYPE;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY sdai_instance (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( dictionary_instance, session_instance ) ) (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY dictionary_instance (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( sdai_instance );(*\\*)',	'	DERIVE(*\\*)',	'		handled : dictionary_instance := SELF;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY session_instance (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( sdai_instance );(*\\*)',	'		change_date : OPTIONAL time_stamp;(*\\*)',	'		validation_date : time_stamp;(*\\*)',	'		validation_result : LOGICAL;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY domain_equivalent_item (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		external_item_id : STRING;(*\\*)',	'		native_item : declaration;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY context_definition (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( schema_definition, statements_container ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		constants : LIST OF constant_definition;(*\\*)',	'		types : LIST OF defined_type;(*\\*)',	'		entities : LIST OF entity_definition;(*\\*)',	'		algorithmes : LIST OF algorithm_declaration;(*\\*)',	'		owner : OPTIONAL context_owner;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY statements_container (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( context_definition );(*\\*)',	'		locals : LIST OF local_variable;(*\\*)',	'		statements : LIST OF statement;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY global_rule (*\\*)',	'		SUBTYPE OF ( statements_container );(*\\*)',	'		for_entities : LIST [ 1 : ? ] OF entity_instances_set;(*\\*)',	'		where_rules : LIST [ 1 : ? ] OF where_rule;(*\\*)',	'		SELF\context_definition.owner : schema_definition;(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode5 [	^	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_global_rule;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY schema_definition (*\\*)',	'		SUBTYPE OF ( context_definition );(*\\*)',	'		global_rules : LIST OF global_rule;(*\\*)',	'		interface : LIST OF external_schema;(*\\*)',	'		remark_references : LIST OF remark_reference;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_schema_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY external_schema (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : schema_name;(*\\*)',	'		owner : schema_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY include_schema (*\\*)',	'		SUBTYPE OF ( external_schema );(*\\*)',	'		native_schema : schema_definition;(*\\*)',	'		explicitly_imported_items : LIST OF domain_equivalent_item;(*\\*)',	'		implicitly_imported_items : LIST OF domain_equivalent_item;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY used_schema (*\\*)',	'		SUBTYPE OF ( include_schema );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY referenced_schema (*\\*)',	'		SUBTYPE OF ( include_schema );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY external_meta_schema (*\\*)',	'		SUBTYPE OF ( external_schema );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY algorithm_declaration (*\\*)',	'		ABSTRACT SUPERTYPE (*\\*)',	'		SUBTYPE OF ( statements_container );(*\\*)',	'		formal_parameters : LIST OF parameter_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY native_code (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		language_signature : STRING;(*\\*)',	'		code : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY native_algorithm (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		implementations : LIST OF native_code;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY procedure_declaration (*\\*)',	'		SUBTYPE OF ( algorithm_declaration );(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_procedure_declaration;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY function_declaration (*\\*)',	'		SUBTYPE OF ( algorithm_declaration );(*\\*)',	'		return_type : parameter_type;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_function_declaration;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY bound (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( integer_bound, population_dependent_bound ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY integer_bound (*\\*)',	'		SUBTYPE OF ( bound );(*\\*)',	'		bound_value : INTEGER;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY population_dependent_bound (*\\*)',	'		SUBTYPE OF ( bound );(*\\*)',	'		bound_value : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY enumeration_type (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		elements : LIST [ 1 : ? ] OF UNIQUE STRING;(*\\*)',	'		owner : defined_type;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_enumeration_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY named_type (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( entity_definition, defined_type ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		where_rules : LIST [ 0 : ? ] OF where_rule;(*\\*)',	'		owner : context_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY dictionary_instance_reference (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		ref : dictionary_instance;(*\\*)',	'		name : STRING;(*\\*)',	'	DERIVE(*\\*)',	'		SELF\dictionary_instance.handled : dictionary_instance := SELF.ref;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY named_type_reference (*\\*)',	'		SUBTYPE OF ( dictionary_instance_reference );(*\\*)',	'		SELF\dictionary_instance_reference.ref : named_type;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_named_type_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY attribute_reference (*\\*)',	'		SUBTYPE OF ( dictionary_instance_reference );(*\\*)',	'		SELF\dictionary_instance_reference.ref : attribute;(*\\*)',	'		entity_ref : entity_definition_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_definition_reference (*\\*)',	'		SUBTYPE OF ( named_type_reference );(*\\*)',	'		SELF\named_type_reference.ref : entity_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY defined_type_reference (*\\*)',	'		SUBTYPE OF ( named_type_reference );(*\\*)',	'		SELF\named_type_reference.ref : defined_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY where_rule (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		label : OPTIONAL STRING;(*\\*)',	'		owner : type_or_rule;(*\\*)',	'		where_value : expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY select_type (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		selections : LIST [ 1 : ? ] OF named_type_reference;(*\\*)',	'		owner : defined_type;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_select_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY defined_type (*\\*)',	'		SUBTYPE OF ( named_type );(*\\*)',	'		domain : underlying_type;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_defined_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY entity_definition (*\\*)',	'		SUBTYPE OF ( named_type );(*\\*)',	'		supertype_constraint : OPTIONAL supertype_constraint;(*\\*)',	'		supertypes : LIST OF UNIQUE entity_definition_reference;(*\\*)',	'		attributes : LIST OF UNIQUE attribute;(*\\*)',	'		uniqueness_rules : LIST OF UNIQUE uniqueness_rule;(*\\*)',	'		complex : BOOLEAN;(*\\*)',	'		instantiable : BOOLEAN;(*\\*)',	'		independent : BOOLEAN;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_entity_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY supertype_constraint (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		constrained : entity_definition_reference;(*\\*)',	'		expr : OPTIONAL supertype_expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY supertype_expression (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( sub_entity_ref_expression, binary_supertype_expression, oneof_supertype_expression ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY sub_entity_ref_expression (*\\*)',	'		SUBTYPE OF ( supertype_expression );(*\\*)',	'		entity_ref : entity_definition_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY binary_supertype_expression (*\\*)',	'		SUBTYPE OF ( supertype_expression );(*\\*)',	'		parenthesis : OPTIONAL BOOLEAN;(*\\*)',	'		left_expr : supertype_expression;(*\\*)',	'		right_expr : supertype_expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY andor_supertype (*\\*)',	'		SUBTYPE OF ( binary_supertype_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY and_supertype (*\\*)',	'		SUBTYPE OF ( binary_supertype_expression );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY oneof_supertype_expression (*\\*)',	'		SUBTYPE OF ( supertype_expression );(*\\*)',	'		expr_list : LIST OF supertype_expression;(*\\*)',	'	END_ENTITY;(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCode6 [	^	'(*\\*)',	'	ENTITY uniqueness_rule (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		label : OPTIONAL STRING;(*\\*)',	'		attributes : LIST [ 1 : ? ] OF UNIQUE uniqueness_rule_attribute_identifier;(*\\*)',	'		owner : entity_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY attribute (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( derived_attribute, explicit_attribute, inverse_attribute ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		owner : entity_definition;(*\\*)',	'		domain : base_type;(*\\*)',	'		redeclaring : OPTIONAL attribute_reference;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_initializer_domain (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		types : LIST [ 1 : ? ] OF parameter_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregate_type (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( aggregation_type, general_aggregate_type ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		element_type : parameter_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY general_aggregate_type (*\\*)',	'		SUBTYPE OF ( aggregate_type );(*\\*)',	'		type_label : OPTIONAL STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY aggregation_type (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( variable_size_aggregation_type, array_type ) ) (*\\*)',	'		SUBTYPE OF ( aggregate_type );(*\\*)',	'		lower_bound : OPTIONAL bound;(*\\*)',	'		upper_bound : OPTIONAL bound;(*\\*)',	'		is_general_type : BOOLEAN;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY array_type (*\\*)',	'		SUBTYPE OF ( aggregation_type );(*\\*)',	'		unique_flag : BOOLEAN;(*\\*)',	'		optional_flag : BOOLEAN;(*\\*)',	'		SELF\aggregation_type.lower_bound : bound;(*\\*)',	'		SELF\aggregation_type.upper_bound : bound;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_array_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY variable_size_aggregation_type (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( set_type, bag_type, list_type ) ) (*\\*)',	'		SUBTYPE OF ( aggregation_type );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY list_type (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_type );(*\\*)',	'		unique_flag : BOOLEAN;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_list_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY bag_type (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_type );(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_bag_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY set_type (*\\*)',	'		SUBTYPE OF ( variable_size_aggregation_type );(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_set_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY simple_type (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( string_type, binary_type, logical_type, number_type ) ) (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY string_type (*\\*)',	'		SUBTYPE OF ( simple_type );(*\\*)',	'		width : OPTIONAL bound;(*\\*)',	'		fixed_width : BOOLEAN;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_string_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY binary_type (*\\*)',	'		SUBTYPE OF ( simple_type );(*\\*)',	'		width : OPTIONAL bound;(*\\*)',	'		fixed_width : BOOLEAN;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_binary_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY number_type (*\\*)',	'		SUBTYPE OF ( simple_type );(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_number_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY real_type (*\\*)',	'		SUBTYPE OF ( number_type );(*\\*)',	'		precision : OPTIONAL bound;(*\\*)',	'	DERIVE(*\\*)',	'		SELF\number_type.accepted : entity_instance := SELF.accept_real_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY integer_type (*\\*)',	'		SUBTYPE OF ( number_type );(*\\*)',	'		precision : OPTIONAL bound;(*\\*)',	'	DERIVE(*\\*)',	'		SELF\number_type.accepted : entity_instance := SELF.accept_integer_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY logical_type (*\\*)',	'		SUBTYPE OF ( simple_type );(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_logical_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY boolean_type (*\\*)',	'		SUBTYPE OF ( logical_type );(*\\*)',	'	DERIVE(*\\*)',	'		SELF\logical_type.accepted : entity_instance := SELF.accept_boolean_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY constant_definition (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		name : STRING;(*\\*)',	'		domain : base_type;(*\\*)',	'		initializer : expression;(*\\*)',	'		owner : context_definition;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY local_variable (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		owner : statements_container;(*\\*)',	'		name : STRING;(*\\*)',	'		domain : parameter_type;(*\\*)',	'		initializer : OPTIONAL expression;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY parameter_definition (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		owner : algorithm_declaration;(*\\*)',	'		name : STRING;(*\\*)',	'		by_copy : BOOLEAN;(*\\*)',	'		domain : parameter_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY generic_type (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		type_label : OPTIONAL STRING;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_generic_type;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY remark (*\\*)',	'		ABSTRACT SUPERTYPE OF ( ONEOF ( tail_remark, embedded_remark ) ) (*\\*)',	'		SUBTYPE OF ( entity_instance );(*\\*)',	'		text : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY tail_remark (*\\*)',	'		SUBTYPE OF ( remark );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY embedded_remark (*\\*)',	'		SUBTYPE OF ( remark );(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY remark_reference (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		prefix : STRING;(*\\*)',	'		suffix : OPTIONAL STRING;(*\\*)',	'		inside : dictionary_instance_reference;(*\\*)',	'		referenced : dictionary_instance_reference;(*\\*)',	'		remark : remark;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY meta_concept_definition (*\\*)',	'		SUBTYPE OF ( dictionary_instance );(*\\*)',	'		definition : dictionary_instance;(*\\*)',	'		expression : STRING;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY derived_attribute (*\\*)',	'		SUBTYPE OF ( attribute );(*\\*)',	'		assign : expression;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_derived_attribute;(*\\*)',	'	END_ENTITY;(*\\*)',	'(*\\*)',	'	ENTITY explicit_attribute (*\\*)',	'		SUBTYPE OF ( attribute );(*\\*)',	'		optional_flag : BOOLEAN;(*\\*)',	'	DERIVE(*\\*)',	'		accepted : entity_instance := SELF.accept_explicit_attribute;(*\\*)',	''


]

{ #category : #'platypus-generated-schema-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> expressSchemaCodePartsCount [ ^7


]

{ #category : #'platypus-generated-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> externalSchemaInstanceClassNames [
  ^#()


]

{ #category : #'platypus-generated-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> namesBuilder [
  | namesBuilder |
  namesBuilder := self namesBuilderClass new.
  namesBuilder classPrefix: #Plt.
  namesBuilder systemCategoryPrefix: #Platypus.
  namesBuilder rootClassName: #PltEntityInstance.
  namesBuilder rootClassSystemCategory: #'Platypus-PlatypusDictionarySchemaSchema'.
  ^namesBuilder


]

{ #category : #'platypus-generated-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> namesBuilderClassName [
  ^#PlatypusNamesBuilder


]

{ #category : #'platypus-generated-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> repositoryClassName [
  ^#PltPlatypusMetaSchemasRepository


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition1 [
  ^#(#Platypus_expressions_schema #PltPlatypusExpressionsSchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition2 [
  ^#(#Platypus_statements_schema #PltPlatypusStatementsSchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition3 [
  ^#(#Platypus_aggregate_data_schema #PltPlatypusAggregateDataSchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition4 [
  ^#(#Platypus_population_schema #PltPlatypusPopulationSchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition5 [
  ^#(#Platypus_environment_schema #PltPlatypusEnvironmentSchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition6 [
  ^#(#Platypus_dictionary_schema #PltPlatypusDictionarySchemaSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinition7 [

^ #( #'Platypus_dictionary_schema' #PltPlatypusDictionarySchemaSchemaDefinition )
]

{ #category : #'platypus-generated-schemata-accessing' }
PltPlatypusMetaSchemasSchemaInstance >> schemaDefinitionCount [
  ^6


]
