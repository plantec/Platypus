"
<ISO10303-11-EXPRESS>
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

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPlatypusEnvironmentSchemaSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-PlatypusEnvironmentSchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusEnvironmentSchemaSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusEnvironmentSchemaSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPlatypusEnvironmentSchemaSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> entityDefinition1 [
  ^#(#model_contents #PltModelContents)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> entityDefinition2 [
  ^#(#schema_instance #PltSchemaInstance)


]

{ #category : #'platypus-generated-entities' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> entityDefinitionCount [
  ^2


]

{ #category : #'platypus-generated-functions' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> functionDeclarationCount [
  ^0


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPlatypusEnvironmentSchemaSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusMetaSchemasSchemaInstance


]
