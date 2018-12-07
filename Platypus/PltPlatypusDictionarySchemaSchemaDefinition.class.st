"
<ISO10303-11-EXPRESS>
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
	#name : #PltPlatypusDictionarySchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusDictionarySchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusDictionarySchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusDictionarySchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusDictionarySchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition1 [
  ^#(#entity_instance #PltEntityInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition10 [
  ^#(#include_schema #PltIncludeSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition11 [
  ^#(#used_schema #PltUsedSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition12 [
  ^#(#referenced_schema #PltReferencedSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition13 [
  ^#(#external_meta_schema #PltExternalMetaSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition14 [
  ^#(#algorithm_declaration #PltAlgorithmDeclaration)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition15 [
  ^#(#native_code #PltNativeCode)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition16 [
  ^#(#native_algorithm #PltNativeAlgorithm)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition17 [
  ^#(#procedure_declaration #PltProcedureDeclaration)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition18 [
  ^#(#function_declaration #PltFunctionDeclaration)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition19 [
  ^#(#bound #PltBound)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition2 [
  ^#(#sdai_instance #PltSdaiInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition20 [
  ^#(#integer_bound #PltIntegerBound)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition21 [
  ^#(#population_dependent_bound #PltPopulationDependentBound)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition22 [
  ^#(#enumeration_type #PltEnumerationType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition23 [
  ^#(#named_type #PltNamedType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition24 [
  ^#(#dictionary_instance_reference #PltDictionaryInstanceReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition25 [
  ^#(#named_type_reference #PltNamedTypeReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition26 [
  ^#(#attribute_reference #PltAttributeReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition27 [
  ^#(#entity_definition_reference #PltEntityDefinitionReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition28 [
  ^#(#defined_type_reference #PltDefinedTypeReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition29 [
  ^#(#where_rule #PltWhereRule)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition3 [
  ^#(#dictionary_instance #PltDictionaryInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition30 [
  ^#(#select_type #PltSelectType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition31 [
  ^#(#defined_type #PltDefinedType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition32 [
  ^#(#entity_definition #PltEntityDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition33 [
  ^#(#supertype_constraint #PltSupertypeConstraint)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition34 [
  ^#(#supertype_expression #PltSupertypeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition35 [
  ^#(#sub_entity_ref_expression #PltSubEntityRefExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition36 [
  ^#(#binary_supertype_expression #PltBinarySupertypeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition37 [
  ^#(#andor_supertype #PltAndorSupertype)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition38 [
  ^#(#and_supertype #PltAndSupertype)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition39 [
  ^#(#oneof_supertype_expression #PltOneofSupertypeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition4 [
  ^#(#session_instance #PltSessionInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition40 [
  ^#(#uniqueness_rule #PltUniquenessRule)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition41 [
  ^#(#attribute #PltAttribute)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition42 [
  ^#(#aggregate_initializer_domain #PltAggregateInitializerDomain)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition43 [
  ^#(#aggregate_type #PltAggregateType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition44 [
  ^#(#general_aggregate_type #PltGeneralAggregateType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition45 [
  ^#(#aggregation_type #PltAggregationType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition46 [
  ^#(#array_type #PltArrayType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition47 [
  ^#(#variable_size_aggregation_type #PltVariableSizeAggregationType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition48 [
  ^#(#list_type #PltListType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition49 [
  ^#(#bag_type #PltBagType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition5 [
  ^#(#domain_equivalent_item #PltDomainEquivalentItem)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition50 [
  ^#(#set_type #PltSetType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition51 [
  ^#(#simple_type #PltSimpleType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition52 [
  ^#(#string_type #PltStringType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition53 [
  ^#(#binary_type #PltBinaryType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition54 [
  ^#(#number_type #PltNumberType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition55 [
  ^#(#real_type #PltRealType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition56 [
  ^#(#integer_type #PltIntegerType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition57 [
  ^#(#logical_type #PltLogicalType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition58 [
  ^#(#boolean_type #PltBooleanType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition59 [
  ^#(#constant_definition #PltConstantDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition6 [
  ^#(#context_definition #PltContextDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition60 [
  ^#(#local_variable #PltLocalVariable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition61 [
  ^#(#parameter_definition #PltParameterDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition62 [
  ^#(#generic_type #PltGenericType)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition63 [
  ^#(#remark #PltRemark)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition64 [
  ^#(#tail_remark #PltTailRemark)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition65 [
  ^#(#embedded_remark #PltEmbeddedRemark)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition66 [
  ^#(#remark_reference #PltRemarkReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition67 [
  ^#(#meta_concept_definition #PltMetaConceptDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition68 [
  ^#(#derived_attribute #PltDerivedAttribute)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition69 [
  ^#(#explicit_attribute #PltExplicitAttribute)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition7 [
  ^#(#statements_container #PltStatementsContainer)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition70 [
  ^#(#inverse_attribute #PltInverseAttribute)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition71 [
  ^#(#meta_mapping_rule #PltMetaMappingRule)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition72 [
  ^#(#meta_mapping_definition #PltMetaMappingDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition73 [
  ^#(#schema_definition #PltSchemaDefinition)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition74^ [ #( #'meta_concept_definition' #PltMetaConceptDefinition )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition75^ [ #( #'derived_attribute' #PltDerivedAttribute )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition76^ [ #( #'explicit_attribute' #PltExplicitAttribute )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition77^ [ #( #'inverse_attribute' #PltInverseAttribute )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition78^ [ #( #'meta_mapping_rule' #PltMetaMappingRule )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition79^ [ #( #'meta_mapping_definition' #PltMetaMappingDefinition )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition8 [
  ^#(#global_rule #PltGlobalRule)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition80^ [ #( #'schema_definition' #PltSchemaDefinition )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinition9 [
  ^#(#external_schema #PltExternalSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusDictionarySchemaSchemaDefinition >> entityDefinitionCount [
  ^73


]

{ #category : #'platypus-generated-functions' }
PltPlatypusDictionarySchemaSchemaDefinition >> functionDeclaration1 [ ^ #( #'schema_instance_from_ref' #PltSchemaInstanceFromRefFunction )


]

{ #category : #'platypus-generated-functions' }
PltPlatypusDictionarySchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusDictionarySchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
