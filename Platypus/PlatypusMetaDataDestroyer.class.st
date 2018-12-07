Class {
	#name : #PlatypusMetaDataDestroyer,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'modelContents'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit aggregate data schema' }
PlatypusMetaDataDestroyer >> acceptAggregateData: e [ 
	super acceptAggregateData: e.
	e fastSetContents: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptAggregateInitializer: e [ 
	super acceptAggregateInitializer: e .
	e fastSetContents: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptAggregateInitializerElement: e [ 
	super acceptAggregateInitializerElement: e.
	e val: nil.
	e repetition: nil
]

{ #category : #'visit aggregate data schema' }
PlatypusMetaDataDestroyer >> acceptAggregateInstance: e [ 
	super acceptAggregateInstance: e. 
	e lowerBound: nil.
	e upperBound: nil.

]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptAlgorithmDeclaration: e [ 
	super acceptAlgorithmDeclaration: e.
	e fastSetFormalParameters: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptAliasStatement: e [
	super  acceptAliasStatement: e.
	e variable: nil.
	e fastSetStatements: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptAliasStatementVariable: e [ 
	super acceptAliasStatementVariable: e .
	e ref: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptAnonymousVariable: e [ 
	e domain acceptTry: self.
	e domain: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptArrayType: e [ 
	super acceptArrayType: e. 
	e elementType: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptAssignable: e [ 
	super acceptAssignable: e.
	e head: nil.
	e fastSetQualifiers: nil.
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptAssignmentStatement: e [ 
	super acceptAssignmentStatement: e .
	e left: nil.
	e rightExpr: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptAttributeQualifier: e [ 
	super  acceptAttributeQualifier: e.
	e owner: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptAttributeReference: e [ 
	e ref: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptBagType: e [ 
	super acceptBagType: e. 
	e elementType: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptBinaryExpression: e [ 
	super acceptBinaryExpression: e .
	e leftExpr: nil.
	e rightExpr: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptBinarySupertypeExpression: e [ 
	super acceptBinarySupertypeExpression: e.
	e leftExpr: nil.
	e rightExpr: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptBinaryType: e [ 
	super acceptBinaryType: e.
	e width: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptCardinalityExpression: e [ 
	super acceptCardinalityExpression: e.
	e leftExpr: nil.
	e card1: nil.
	e card2: nil.
	e rightExpr: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptCaseAction: e [ 
	super acceptCaseAction: e.
	e fastSetLabels: nil.
	e action: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptCaseStatement: e [ 
	super acceptCaseStatement: e.
	e selector: nil.
	e fastSetCaseActions: nil.
	e caseOtherwise: nil

]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptCompoundStatement: e [ 
	super acceptCompoundStatement: e .
	e statements: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptConstantDefinition: e [ 
	super acceptConstantDefinition: e. 
	e domain: nil.
	e initializer: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptContextDefinition: e [ 
	super acceptContextDefinition: e.
	e removeMetaConcept.
	e owner: nil.
	e fastSetConstants: nil.
	e fastSetTypes: nil.
	e fastSetEntities: nil.
	e fastSetAlgorithmes: nil.
	e namedTypesCache: nil.
	e identifiersCache: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptDefinedType: e [ 
	super acceptDefinedType: e.
	e domain: nil.

]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptDerivedAttribute: e [ 
	super acceptDerivedAttribute: e.
	e domain: nil.
	e assign: nil.
	e redeclaring: nil

]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptDictionaryInstanceReference: e [ 
	e setRef: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptDomainEquivalentItem: e [ 
	super acceptDomainEquivalentItem: e.
	e nativeItem: nil.

]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptElementQualifier: e [ 
	super acceptElementQualifier: e. 
	e index: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptEntityDefinition: e [
	super acceptEntityDefinition: e.
	self acceptNamedType: e.
	e destroySubtypes.
	e supertypeConstraint: nil.
	e fastSetSupertypes: nil.
	e fastSetAttributes: nil.
	e fastSetUniquenessRules: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptEntityDefinitionReference: e [ 
	self acceptNamedTypeReference: e
		
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptEntityInstancesSet: e [ 
	super acceptEntityInstancesSet: e .
	e entityRef: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptEnumerationType: e [ 
	super acceptEnumerationType: e.
	e owner: nil.
	e fastSetElements: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptEnumerationValue: e [ 
	super acceptEnumerationValue: e.
	e domain: nil.
	e element: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptEscapedExpression: e [ 
	super acceptEscapedExpression: e.
	e expr: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptExplicitAttribute: e [ 
	super acceptExplicitAttribute: e.
	e domain: nil.
	e redeclaring: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptExternalMetaSchema: e [ 
	e nativeSchema: nil
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptExternalRepresentation: e [ 
	super acceptExternalRepresentation: e.
	e fastSetRecords: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptExternalSchema: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptFunctionDeclaration: e [ 
	super acceptFunctionDeclaration: e. 
	e returnType: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptGeneralAggregateType: e [ 
	super acceptGeneralAggregateType: e.
	e elementType: nil.
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptGenericInstance: e [ 
	super acceptGenericInstance: e.
	e instanceScope: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptGlobalRule: e [ 
	super acceptGlobalRule: e. 
	e fastSetForEntities: nil.
	e fastSetWhereRules: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptIdentifier: e [ 
	e ref: nil.
	e parameters acceptTry: self.
	e fastSetParameters: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptIfStatement: e [ 
	super acceptIfStatement: e.
	e selector: nil.
	e fastSetThenStatements: nil.
	e fastSetElseStatements: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptIncludeSchema: e [ 
	e fastSetExplicitlyImportedItems: nil.
	e fastSetImplicitlyImportedItems: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptIncrementControl: e [ 
	super acceptIncrementControl: e .
	e variable: nil.
	e first: nil.
	e last: nil.
	e step: nil
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptInstanceScope: e [ 
	super acceptInstanceScope: e.
	e owned: nil.
	e fastSetExportList: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptIntegerType: e [ 
	super acceptIntegerType: e.
	e precision: nil. 
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptInternalRepresentation: e [ 
	super acceptInternalRepresentation: e.
	e fastSetParameters: nil 
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptInterval: e [ 
	super acceptInterval: e. 
	e expr: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptInverseAttribute: e [ 
	super acceptInverseAttribute: e.
	e invertedAttr: nil.
	e minCardinality: nil.
	e maxCardinality: nil.
	e redeclaring: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptListType: e [ 
	super acceptListType: e .
	e elementType: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptLiteral: e [ 
	e val: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptLocalVariable: e [ 
	super acceptLocalVariable: e.
	e domain: nil.
	e initializer: nil.
 
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptMetaConceptDefinition: e [ 
	super acceptMetaConceptDefinition: e.
	e metaExpression acceptTry: self.
	e metaExpression: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptMetaMappingDefinition: e [ 
	super acceptMetaMappingDefinition: e.
	e definition: nil.
	e metaExpression acceptTry: self.
	e metaExpression: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptMetaMappingRule: e [ 
	super acceptMetaMappingRule: e.
	e metaExpression acceptTry: self.
	e metaExpression: nil.
	e metaCondition acceptTry: self.
	e metaCondition: nil
]

{ #category : #'visit environment schema' }
PlatypusMetaDataDestroyer >> acceptModelContents: e [ 
	self modelContents: e.
	e dataInstances
		do: [:v | v acceptTry: self].
	e headerInstances: nil.
	e dataInstances: nil.
	e dataInstancesByLabelIndex: nil.
	e entitiesByInstanceIndex: nil.
	e dataInstancesByEntityIndex: nil.
	e positionByDataInstanceIndex: nil.
	e owner: nil.

]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptNamedType: e [ 
	super acceptNamedType: e.
	e removeMetaConcept.
	e owner: nil.
	e identifiersCache: nil.
	e setWhereRules: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptNamedTypeReference: e [ 
	e setRef: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptNativeAlgorithm: e [ 
	super acceptNativeAlgorithm: e.
	e fastSetImplementations: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptNativeCode: e [ 
	e code: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptNativeExpression: e [ 
	super acceptNativeExpression: e .
	e source: nil.
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptNativeStatement: e [ 
	super acceptNativeStatement: e.
	e source: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptOneofSupertypeExpression: e [ 
	super acceptOneofSupertypeExpression: e.
	e fastSetExprList: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptOutputStatement: e [ 
	super acceptOutputStatement: e .
	e output: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptParameterDefinition: e [ 
	super acceptParameterDefinition: e.
	e domain: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptPopulationDependentBound: e [
	super  acceptPopulationDependentBound: e.
	e boundValue: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptProcedureCallStatement: e [ 
	super acceptProcedureCallStatement: e.
	e call: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptProcedureDeclaration: e [ 
	super acceptProcedureDeclaration: e 
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptQualifiedExpression: e [ 
	super acceptQualifiedExpression: e. 
	e head: nil.
	e fastSetQualifiers: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptQueryExpression: e [ 
	super acceptQueryExpression: e. 
	e variable: nil.
	e aggregateSource: nil.
	e suchThat: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptRangeQualifier: e [ 
	super acceptRangeQualifier: e.
	e index1: nil.
	e index2: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptRealType: e [ 
	super acceptRealType: e.
	e precision: nil 
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptRemarkReference: e [ 
	e inside acceptTry: self.
	e remark acceptTry: self.
	e inside: nil.
	e remark: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptRepeatStatement: e [ 
	super acceptRepeatStatement: e.
	e incrControl: nil.
	e untilControl: nil.
	e whileControl: nil.
	e fastSetStatements: nil
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptReturnStatement: e [ 
	super acceptReturnStatement: e.
	e returned: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptSchemaDefinition: e [
	super acceptSchemaDefinition: e.
	e interface: nil.
	e fastSetGlobalRules: nil.
	e fastSetRemarkReferences: nil
]

{ #category : #'visit environment schema' }
PlatypusMetaDataDestroyer >> acceptSchemaInstance: e [ 
	e internalSchemata acceptTry: self.
	e fastSetSchemata: nil.
	e associatedModels acceptTry: self.
	e fastSetAssociatedModels: nil.
	e removeTamarisItemReferencesIndex.
	e removeMetaConceptsIndex
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptSelectType: e [
	super  acceptSelectType: e.
	e fastSetSelections: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptSetType: e [ 
	super acceptSetType: e.
	e elementType: nil.

]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptSimpleRecord: e [ 
	super acceptSimpleRecord: e.
	e fastSetParameters: nil
]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptSimpleUnaryExpression: e [ 
	super acceptSimpleUnaryExpression: e.
	e expr: nil.
]

{ #category : #'visit statements schema' }
PlatypusMetaDataDestroyer >> acceptSplitmarkStatement: e [ 
	e filename: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptStatementsContainer: e [ 
	super acceptStatementsContainer: e.
	e fastSetLocals: nil.
	e fastSetStatements: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptStringType: e [ 
	super acceptStringType: e.
	e width: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptSubEntityRefExpression: e [ 
super acceptSubEntityRefExpression: e. 
	e entityRef: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptSupertypeConstraint: e [ 
	super acceptSupertypeConstraint: e.
	e constrained: nil.
	e expr: nil.

]

{ #category : #'visit expressions schema' }
PlatypusMetaDataDestroyer >> acceptTypedExpression: e [ 
	super acceptTypedExpression: e.
	e expr: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptUniquenessRule: e [
	super  acceptUniquenessRule: e.
	e fastSetAttributes: nil
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptUnresolvedSymbol: e [
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptUserDefinedApplicationInstance: e [ 
	super acceptUserDefinedApplicationInstance: e.
	e fastSetParameters: nil.
]

{ #category : #'visit population schema' }
PlatypusMetaDataDestroyer >> acceptUserDefinedHeaderInstance: e [
	super  acceptUserDefinedHeaderInstance: e.
	e fastSetParameters: nil.
]

{ #category : #'visit dictionary schema' }
PlatypusMetaDataDestroyer >> acceptWhereRule: e [ 
	super acceptWhereRule: e.
	e whereValue: nil
]

{ #category : #accessing }
PlatypusMetaDataDestroyer >> modelContents: anObject [
	modelContents := anObject
]
