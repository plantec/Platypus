"
<ISO10303-11-EXPRESS>
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

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusPopulationSchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusPopulationSchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusPopulationSchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusPopulationSchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusPopulationSchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition1 [
  ^#(#instance_scope #PltInstanceScope)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition10 [
  ^#(#simple_record #PltSimpleRecord)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition11 [
  ^#(#header_instance #PltHeaderInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition12 [
  ^#(#user_defined_header_instance #PltUserDefinedHeaderInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition13 [
  ^#(#file_description #PltFileDescription)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition14 [
  ^#(#file_name #PltFileName)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition15 [
  ^#(#file_schema #PltFileSchema)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition16^ [ #( #'file_schema' #PltFileSchema )


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition2 [
  ^#(#application_instance #PltApplicationInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition3 [
  ^#(#generic_instance #PltGenericInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition4 [
  ^#(#internal_representation #PltInternalRepresentation)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition5 [
  ^#(#external_representation #PltExternalRepresentation)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition6 [
  ^#(#group_representation #PltGroupRepresentation)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition7 [
  ^#(#external_group_representation #PltExternalGroupRepresentation)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition8 [
  ^#(#internal_group_representation #PltInternalGroupRepresentation)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinition9 [
  ^#(#user_defined_application_instance #PltUserDefinedApplicationInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusPopulationSchemaSchemaDefinition >> entityDefinitionCount [
  ^15


]

{ #category : #'platypus-generated-functions' }
PltPlatypusPopulationSchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusPopulationSchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
