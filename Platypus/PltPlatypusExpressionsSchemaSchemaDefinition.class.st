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

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusExpressionsSchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusExpressionsSchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusExpressionsSchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusExpressionsSchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusExpressionsSchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition1 [
  ^#(#expression #PltExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition10 [
  ^#(#div_expression #PltDivExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition11 [
  ^#(#real_div_expression #PltRealDivExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition12 [
  ^#(#mod_expression #PltModExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition13 [
  ^#(#plus_expression #PltPlusExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition14 [
  ^#(#minus_expression #PltMinusExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition15 [
  ^#(#and_expression #PltAndExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition16 [
  ^#(#or_expression #PltOrExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition17 [
  ^#(#xor_expression #PltXorExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition18 [
  ^#(#comparison_expression #PltComparisonExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition19 [
  ^#(#less_than_expression #PltLessThanExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition2 [
  ^#(#unary_expression #PltUnaryExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition20 [
  ^#(#greater_than_expression #PltGreaterThanExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition21 [
  ^#(#equal_expression #PltEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition22 [
  ^#(#less_equal_expression #PltLessEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition23 [
  ^#(#greater_equal_expression #PltGreaterEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition24 [
  ^#(#not_equal_expression #PltNotEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition25 [
  ^#(#inst_comparison_expression #PltInstComparisonExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition26 [
  ^#(#inst_equal_expression #PltInstEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition27 [
  ^#(#inst_not_equal_expression #PltInstNotEqualExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition28 [
  ^#(#in_expression #PltInExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition29 [
  ^#(#like_expression #PltLikeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition3 [
  ^#(#binary_expression #PltBinaryExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition30 [
  ^#(#cardinality_expression #PltCardinalityExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition31 [
  ^#(#simple_unary_expression #PltSimpleUnaryExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition32 [
  ^#(#not_expression #PltNotExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition33 [
  ^#(#positive_expression #PltPositiveExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition34 [
  ^#(#negative_expression #PltNegativeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition35 [
  ^#(#typed_expression #PltTypedExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition36 [
  ^#(#enumeration_value #PltEnumerationValue)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition37 [
  ^#(#entity_instances_set #PltEntityInstancesSet)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition38 [
  ^#(#qualified_expression #PltQualifiedExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition39 [
  ^#(#literal #PltLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition4 [
  ^#(#logical_expression #PltLogicalExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition40 [
  ^#(#identifier #PltIdentifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition41 [
  ^#(#attribute_identifier #PltAttributeIdentifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition42 [
  ^#(#self_identifier #PltSelfIdentifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition43 [
  ^#(#uniqueness_rule_attribute_identifier #PltUniquenessRuleAttributeIdentifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition44 [
  ^#(#missing_value #PltMissingValue)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition45 [
  ^#(#redefined_attribute_value #PltRedefinedAttributeValue)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition46 [
  ^#(#implicitly_declared_identifier #PltImplicitlyDeclaredIdentifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition47 [
  ^#(#interval #PltInterval)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition48 [
  ^#(#aggr_unary_expression #PltAggrUnaryExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition49 [
  ^#(#query_variable #PltQueryVariable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition5 [
  ^#(#entity_instance_reference #PltEntityInstanceReference)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition50 [
  ^#(#query_expression #PltQueryExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition51 [
  ^#(#entity_instance_constructor #PltEntityInstanceConstructor)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition52 [
  ^#(#qualifier #PltQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition53 [
  ^#(#attribute_qualifier #PltAttributeQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition54 [
  ^#(#group_qualifier #PltGroupQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition55 [
  ^#(#index_qualifier #PltIndexQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition56 [
  ^#(#element_qualifier #PltElementQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition57 [
  ^#(#range_qualifier #PltRangeQualifier)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition58 [
  ^#(#numeric_literal #PltNumericLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition59 [
  ^#(#logical_literal #PltLogicalLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition6 [
  ^#(#instance_construction_expression #PltInstanceConstructionExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition60 [
  ^#(#true_constant #PltTrueConstant)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition61 [
  ^#(#false_constant #PltFalseConstant)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition62 [
  ^#(#unknown_constant #PltUnknownConstant)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition63 [
  ^#(#integer_literal #PltIntegerLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition64 [
  ^#(#real_literal #PltRealLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition65 [
  ^#(#pi_constant #PltPiConstant)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition66 [
  ^#(#e_constant #PltEConstant)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition67 [
  ^#(#string_literal #PltStringLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition68 [
  ^#(#binary_literal #PltBinaryLiteral)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition69 [
  ^#(#native_expression #PltNativeExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition7 [
  ^#(#arithmetic_expression #PltArithmeticExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition70 [
  ^#(#escaped_expression #PltEscapedExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition8 [
  ^#(#expo_expression #PltExpoExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinition9 [
  ^#(#mult_expression #PltMultExpression)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusExpressionsSchemaSchemaDefinition >> entityDefinitionCount [
  ^70


]

{ #category : #'platypus-generated-functions' }
PltPlatypusExpressionsSchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusExpressionsSchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
