Class {
	#name : #PTsExpressDictionaryQueriesSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressDictionaryQueriesSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressDictionaryQueriesSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressDictionaryQueriesSchemaDefinition class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-context-accessing' }
PTsExpressDictionaryQueriesSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PTsExpressDictionaryQueriesSchemaDefinition >> entityDefinitionCount [
	^ 0


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration1 [
	^ #(#expressionValueToString #PTsExpressionValueToStringFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration10 [
	^ #(#has_attribute_named #PTsHasAttributeNamedFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration11 [
	^ #(#inherited_attribute_named_from #PTsInheritedAttributeNamedFromFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration12 [
	^ #(#has_inherited_attribute_named #PTsHasInheritedAttributeNamedFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration13 [
	^ #(#query_attributes #PTsQueryAttributesFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration14 [
	^ #(#attribute_redeclared_by #PTsAttributeRedeclaredByFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration15 [
	^ #(#all_supertypes_of #PTsAllSupertypesOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration16 [
	^ #(#local_root_supertype_of #PTsLocalRootSupertypeOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration17 [
	^ #(#inherits_from_entity_named #PTsInheritsFromEntityNamedFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration18 [
	^ #(#inherited_attributes #PTsInheritedAttributesFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration19 [
	^ #(#inherited_explicit_attributes #PTsInheritedExplicitAttributesFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration2 [
	^ #(#typeof_as_string #PTsTypeofAsStringFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration20 [
	^ #(#derive_attribute_result #PTsDeriveAttributeResultFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration3 [
	^ #(#schema_definition_of #PTsSchemaDefinitionOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration4 [
	^ #(#schema_instance_of #PTsSchemaInstanceOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration5 [
	^ #(#remarks_for #PTsRemarksForFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration6 [
	^ #(#clean_remark_text_of #PTsCleanRemarkTextOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration7 [
	^ #(#root_entity_list #PTsRootEntityListFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration8 [
	^ #(#subtypes_of #PTsSubtypesOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclaration9 [
	^ #(#attribute_named_from #PTsAttributeNamedFromFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressDictionaryQueriesSchemaDefinition >> functionDeclarationCount [
	^ 20


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsExpressDictionaryQueriesSchemaDefinition >> schemaInstanceClassName [
	^ #PTsExpressToolsboxSchemaInstance


]
