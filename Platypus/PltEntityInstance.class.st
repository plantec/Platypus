"
<ISO10303-11-EXPRESS>
ENTITY entity_instance 
	ABSTRACT SUPERTYPE;
	owner : OPTIONAL entity_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityInstance,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityInstance class >> context [
	^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> platypusMetaData [
	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaDefinition [
	^ PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaInstance [
	^ PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstance class >> vwNamespaceName [
	^ #Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityInstance >> accept: aVisitor [
	^ aVisitor acceptEntityInstance: self


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> entityInstanceCopyTo: another [
	another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setOwner: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceToValues: values [
	values add: self owner.
	^ values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstance >> fastSetOwner: aPltEntityInstance [
	owner := aPltEntityInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> fromValues: values [
	^ self entityInstanceFromValues: (super fromValues: values)


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltAggrUnaryExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateData [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateInitializer [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateInitializerDomain [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateInitializerElement [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAggregateType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAggregationType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAlgorithmDeclaration [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAlgorithmRef [ ^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltAliasStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltAliasStatementVariable [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltAndExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAndSupertype [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAndorSupertype [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltAnonymousVariable [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltApplicationInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltArithmeticExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltArrayInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltArrayType [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltAssignable [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltAssignmentStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAttribute [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltAttributeIdentifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltAttributeQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltAttributeReference [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltBagInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltBagType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltBinaryExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltBinaryLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltBinarySupertypeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltBinaryType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltBooleanType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltBound [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltCardinalityExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltCaseAction [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltCaseStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltComparisonExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltCompoundStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltConstantDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltContextDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltContextRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDefinedType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDefinedTypeReference [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDerivedAttribute [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDictionaryInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDictionaryInstanceReference [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltDivExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltDomainEquivalentItem [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEConstant [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltElementQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltElementRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltEmbeddedRemark [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltEndSplitmarkStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltEntityDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltEntityDefinitionReference [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltEntityInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEntityInstanceConstructor [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEntityInstanceReference [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEntityInstancesSet [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltEnumerationType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEnumerationValue [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltEscapeStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltEscapedExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltExplicitAttribute [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltExpoExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltExternalGroupRepresentation [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltExternalMetaSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltExternalRepresentation [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltExternalSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltFalseConstant [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltFileDescription [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltFileName [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltFileSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltFunctionDeclaration [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltGeneralAggregateType [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltGenericInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltGenericType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltGlobalRule [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltGreaterEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltGreaterThanExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltGroupQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltGroupRepresentation [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltHeaderInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltIdentifier [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltIfStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltImplicitlyDeclaredIdentifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltIncludeSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltIncrementControl [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltIncrementControlVariable [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltIndexQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInstComparisonExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInstEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInstNotEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInstanceConstructionExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltInstanceScope [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltIntegerBound [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltIntegerLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltIntegerType [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltInternalGroupRepresentation [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltInternalRepresentation [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltInterval [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltInverseAttribute [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLessEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLessThanExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLikeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltListInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltListType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltLocalVariable [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLogicalExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltLogicalLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltLogicalType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltMetaConceptDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltMetaMappingDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltMetaMappingRule [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltMinusExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltMissingValue [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltModExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusEnvironmentSchemaSchema-classifying' }
PltEntityInstance >> isPltModelContents [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltMultExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNamedType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNamedTypeRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNamedTypeReference [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNativeAlgorithm [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNativeCode [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltNativeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltNativeStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltNegativeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltNotEqualExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltNotExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltNullStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltNumberType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltNumericLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltOneofSupertypeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltOrExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltOutputStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltParameterDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltPiConstant [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltPlusExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltPopulationDependentBound [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltPositiveExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltProcedureCallStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltProcedureDeclaration [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltQualifiedExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltQueryExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltQueryVariable [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltRangeQualifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltRealDivExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltRealLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltRealType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltRedefinedAttributeValue [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltReferencedSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltRemark [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltRemarkReference [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltRepeatStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltReturnStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltRuleRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSchemaDefinition [
	^ false


]

{ #category : #'*Platypus-PlatypusEnvironmentSchemaSchema-classifying' }
PltEntityInstance >> isPltSchemaInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSchemaInstanceRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSchemaRef [ ^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSdaiInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSelectType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltSelfIdentifier [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSessionInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltSetInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSetType [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltSimpleRecord [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSimpleType [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltSimpleUnaryExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltSkipStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltSplitmarkStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusStatementsSchemaSchema-classifying' }
PltEntityInstance >> isPltStatement [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltStatementsContainer [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltStringLiteral [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltStringType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSubEntityRefExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSupertypeConstraint [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltSupertypeExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltTailRemark [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltTrueConstant [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltTypedExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltUnaryExpression [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltUniquenessRule [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltUniquenessRuleAttributeIdentifier [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltUnknownConstant [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltUsedSchema [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltUserDefinedApplicationInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusPopulationSchemaSchema-classifying' }
PltEntityInstance >> isPltUserDefinedHeaderInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusAggregateDataSchemaSchema-classifying' }
PltEntityInstance >> isPltVariableSizeAggregationInstance [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltVariableSizeAggregationType [
	^ false


]

{ #category : #'*Platypus-PlatypusDictionarySchemaSchema-classifying' }
PltEntityInstance >> isPltWhereRule [
	^ false


]

{ #category : #'*Platypus-PlatypusExpressionsSchemaSchema-classifying' }
PltEntityInstance >> isPltXorExpression [
	^ false


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> localFromValues: values [
	^ self entityInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> localToValues: values [
	^ self entityInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstance >> owner [
	^ owner


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstance >> owner: aPltEntityInstance [
	owner := aPltEntityInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstance >> ownerUsingContext: aContext [
	^ self owner


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstance >> platypusMetaData [
	^ self class platypusMetaData


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltCopyTo: another [
	super pltCopyTo: another.
	self entityInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityInstance >> pltLocalCopyTo: another [
	self entityInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstance >> setOwner: aPltEntityInstance [
	self owner: aPltEntityInstance


]

{ #category : #'platypus-generated-initializing' }
PltEntityInstance >> stepInitialize [
	super stepInitialize.
	owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstance >> toValues: values [
	^ self entityInstanceToValues: (super toValues: values)


]
