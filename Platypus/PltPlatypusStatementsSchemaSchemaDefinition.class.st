"
<ISO10303-11-EXPRESS>
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

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusStatementsSchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusStatementsSchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusStatementsSchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusStatementsSchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusStatementsSchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition1 [
  ^#(#assignable #PltAssignable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition10 [
  ^#(#compound_statement #PltCompoundStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition11 [
  ^#(#escape_statement #PltEscapeStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition12 [
  ^#(#if_statement #PltIfStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition13 [
  ^#(#repeat_statement #PltRepeatStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition14 [
  ^#(#increment_control_variable #PltIncrementControlVariable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition15 [
  ^#(#increment_control #PltIncrementControl)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition16 [
  ^#(#return_statement #PltReturnStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition17 [
  ^#(#procedure_call_statement #PltProcedureCallStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition18 [
  ^#(#skip_statement #PltSkipStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition19 [
  ^#(#output_statement #PltOutputStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition2 [
  ^#(#statement #PltStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition20 [
  ^#(#splitmark_statement #PltSplitmarkStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition21 [
  ^#(#end_splitmark_statement #PltEndSplitmarkStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition22 [
  ^#(#anonymous_variable #PltAnonymousVariable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition3 [
  ^#(#null_statement #PltNullStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition4 [
  ^#(#native_statement #PltNativeStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition5 [
  ^#(#alias_statement_variable #PltAliasStatementVariable)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition6 [
  ^#(#alias_statement #PltAliasStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition7 [
  ^#(#assignment_statement #PltAssignmentStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition8 [
  ^#(#case_statement #PltCaseStatement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinition9 [
  ^#(#case_action #PltCaseAction)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusStatementsSchemaSchemaDefinition >> entityDefinitionCount [
  ^22


]

{ #category : #'platypus-generated-functions' }
PltPlatypusStatementsSchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusStatementsSchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
