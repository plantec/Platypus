"
<ISO10303-11-EXPRESS>
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

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusAggregateDataSchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusAggregateDataSchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusAggregateDataSchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusAggregateDataSchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusAggregateDataSchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition1 [
  ^#(#aggregate_data #PltAggregateData)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition2 [
  ^#(#aggregate_initializer #PltAggregateInitializer)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition3 [
  ^#(#aggregate_initializer_element #PltAggregateInitializerElement)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition4 [
  ^#(#aggregate_instance #PltAggregateInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition5 [
  ^#(#array_instance #PltArrayInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition6 [
  ^#(#variable_size_aggregation_instance #PltVariableSizeAggregationInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition7 [
  ^#(#list_instance #PltListInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition8 [
  ^#(#bag_instance #PltBagInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinition9 [
  ^#(#set_instance #PltSetInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> entityDefinitionCount [
  ^9


]

{ #category : #'platypus-generated-functions' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusAggregateDataSchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
