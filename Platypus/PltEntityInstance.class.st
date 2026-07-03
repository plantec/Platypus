"
<ISO10303-11-EXPRESS>
ENTITY entity_instance 
	ABSTRACT SUPERTYPE;
	owner : OPTIONAL entity_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'PltEntityInstance',
	#superclass : 'Object',
	#instVars : [
		'owner'
	],
	#category : 'Platypus-PlatypusDictionarySchemaSchema',
	#package : 'Platypus',
	#tag : 'PlatypusDictionarySchemaSchema'
}

{ #category : 'platypus-generated-context-accessing' }
PltEntityInstance class >> context [
	^ self schemaDefinition context


]

{ #category : 'platypus-generated-platypus-signature' }
PltEntityInstance class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> platypusMetaData [
	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : 'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaDefinition [
	^ PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
PltEntityInstance class >> schemaInstance [
	^ PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PltEntityInstance class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PltEntityInstance class >> vwNamespaceName [
	^ #Platypus


]

{ #category : 'platypus-generated-visiting' }
PltEntityInstance >> accept: aVisitor [
	^ aVisitor acceptEntityInstance: self


]

{ #category : 'platypus-generated-copying' }
PltEntityInstance >> entityInstanceCopyTo: another [
	another fastSetOwner: self owner


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setOwner: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> entityInstanceToValues: values [
	values add: self owner.
	^ values


]

{ #category : 'platypus-generated-fast-set-accessing' }
PltEntityInstance >> fastSetOwner: aPltEntityInstance [
	owner := aPltEntityInstance


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> fromValues: values [
	^ self entityInstanceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggrUnaryExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateData [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateInitializer [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateInitializerDomain [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateInitializerElement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregateType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAggregationType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAlgorithmDeclaration [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAlgorithmRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAliasStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAliasStatementVariable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAndExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAndSupertype [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAndorSupertype [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAnonymousVariable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltApplicationInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltArithmeticExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltArrayInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltArrayType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAssignable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAssignmentStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAttribute [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAttributeIdentifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAttributeQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltAttributeReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBagInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBagType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBinaryExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBinaryLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBinarySupertypeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBinaryType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBooleanType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltBound [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltCardinalityExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltCaseAction [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltCaseStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltComparisonExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltCompoundStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltConstantDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltContextDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltContextRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDefinedType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDefinedTypeReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDerivedAttribute [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDictionaryInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDictionaryInstanceReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDivExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltDomainEquivalentItem [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEConstant [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltElementQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltElementRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEmbeddedRemark [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEndSplitmarkStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityDefinitionReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityInstanceConstructor [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityInstanceReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEntityInstancesSet [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEnumerationType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEnumerationValue [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEscapeStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltEscapedExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExplicitAttribute [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExpoExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExternalGroupRepresentation [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExternalMetaSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExternalRepresentation [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltExternalSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltFalseConstant [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltFileDescription [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltFileName [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltFileSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltFunctionDeclaration [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGeneralAggregateType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGenericInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGenericType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGlobalRule [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGreaterEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGreaterThanExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGroupQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltGroupRepresentation [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltHeaderInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIdentifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIfStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltImplicitlyDeclaredIdentifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIncludeSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIncrementControl [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIncrementControlVariable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIndexQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInstComparisonExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInstEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInstNotEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInstanceConstructionExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInstanceScope [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIntegerBound [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIntegerLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltIntegerType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInternalGroupRepresentation [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInternalRepresentation [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInterval [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltInverseAttribute [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLessEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLessThanExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLikeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltListInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltListType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLocalVariable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLogicalExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLogicalLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltLogicalType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMetaConceptDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMetaMappingDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMetaMappingRule [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMinusExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMissingValue [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltModExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltModelContents [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltMultExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNamedType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNamedTypeRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNamedTypeReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNativeAlgorithm [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNativeCode [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNativeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNativeStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNegativeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNotEqualExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNotExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNullStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNumberType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltNumericLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltOneofSupertypeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltOrExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltOutputStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltParameterDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltPiConstant [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltPlusExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltPopulationDependentBound [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltPositiveExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltProcedureCallStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltProcedureDeclaration [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltQualifiedExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltQueryExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltQueryVariable [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRangeQualifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRealDivExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRealLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRealType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRedefinedAttributeValue [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltReferencedSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRemark [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRemarkReference [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRepeatStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltReturnStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltRuleRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSchemaDefinition [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSchemaInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSchemaInstanceRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSchemaRef [ ^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSdaiInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSelectType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSelfIdentifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSessionInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSetInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSetType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSimpleRecord [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSimpleType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSimpleUnaryExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSkipStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSplitmarkStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltStatement [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltStatementsContainer [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltStringLiteral [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltStringType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSubEntityRefExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSupertypeConstraint [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltSupertypeExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltTailRemark [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltTrueConstant [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltTypedExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUnaryExpression [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUniquenessRule [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUniquenessRuleAttributeIdentifier [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUnknownConstant [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUsedSchema [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUserDefinedApplicationInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltUserDefinedHeaderInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltVariableSizeAggregationInstance [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltVariableSizeAggregationType [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltWhereRule [
	^ false


]

{ #category : 'platypus-generated-testing' }
PltEntityInstance >> isPltXorExpression [
	^ false


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> localFromValues: values [
	^ self entityInstanceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> localToValues: values [
	^ self entityInstanceToValues: values


]

{ #category : 'platypus-generated-accessing' }
PltEntityInstance >> owner [
	^ owner


]

{ #category : 'platypus-generated-accessing' }
PltEntityInstance >> owner: aPltEntityInstance [
	owner := aPltEntityInstance


]

{ #category : 'platypus-generated-with-context-accessing' }
PltEntityInstance >> ownerUsingContext: aContext [
	^ self owner


]

{ #category : 'platypus-generated-meta-data-accessing' }
PltEntityInstance >> platypusMetaData [
	^ self class platypusMetaData


]

{ #category : 'platypus-generated-copying' }
PltEntityInstance >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
PltEntityInstance >> pltCopyTo: another [
	super pltCopyTo: another.
	self entityInstanceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
PltEntityInstance >> pltLocalCopyTo: another [
	self entityInstanceCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
PltEntityInstance >> setOwner: aPltEntityInstance [
	self owner: aPltEntityInstance


]

{ #category : 'platypus-generated-initializing' }
PltEntityInstance >> stepInitialize [
	super stepInitialize.
	owner := nil


]

{ #category : 'platypus-generated-group-accessing' }
PltEntityInstance >> toValues: values [
	^ self entityInstanceToValues: (super toValues: values)


]
