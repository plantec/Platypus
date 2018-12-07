Class {
	#name : #PlatypusStepAbstractVisitor,
	#superclass : #PlatypusCoreAbstractVisitor,
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit aggregate data schema' }
PlatypusStepAbstractVisitor >> acceptAggregateData: e [ 
	e contents acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptAggregateInitializer: e [ 
	e contents acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptAggregateInitializerElement: e [ 
	self acceptTry: e val.
	e repetition acceptTry: self
]

{ #category : #'visit aggregate data schema' }
PlatypusStepAbstractVisitor >> acceptAggregateInstance: e [ 
	e lowerBound acceptTry: self.
	e upperBound acceptTry: self.
	self acceptAggregateData: e.
]

{ #category : #'visit generic' }
PlatypusStepAbstractVisitor >> acceptAggregationType: e lower: l upper: u symbol: subtype flags: aCollection [ 
	l notNil
		ifTrue: [l acceptTry: self.
			u notNil
				ifTrue: [u acceptTry: self]].
	self acceptTry: e elementType.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptAlgorithmDeclaration: e [ 
	e formalParameters acceptTry: self.
	self acceptStatementsContainer: e
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptAliasStatement: e [ 
	e variable acceptTry: self.
	e statements acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptAliasStatementVariable: e [ 
	e ref acceptTry: self

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptAnonymousVariable: e [ 
	^ self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptArrayType: e [ 
	| flags |
	flags := OrderedCollection new.
	e uniqueFlag
		ifTrue: [flags add: #unique].
	e optionalFlag
		ifTrue: [flags add: #optional].
	self
		acceptAggregationType: e
		lower: e lowerBound
		upper: e upperBound
		symbol: #array
		flags: flags

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptAssignable: e [
	e head acceptTry: self.
	e qualifiers acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptAssignmentStatement: e [ 
	
	e left acceptTry: self.
	e rightExpr acceptTry: self.

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptAttributeQualifier: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptAttributeReference: e [ 
	
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptBagType: e [ 
	self
		acceptVariableSizeAggregationType: e
		symbol: #bag
		flags: #()

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptBinaryExpression: e [ 
	e leftExpr acceptTry: self.
	e rightExpr acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptBinarySupertypeExpression: e [ 
	e leftExpr acceptTry: self.
	e rightExpr acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptBinaryType: e [ 
	e width acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptBooleanType: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptCardinalityExpression: e [ 
	e leftExpr acceptTry: self.
	e card1 acceptTry: self.
	e card2 acceptTry: self.
	e rightExpr acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptCaseAction: e [ 
	e labels acceptTry: self.
	e action acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptCaseStatement: e [ 
	e selector acceptTry: self.
	e caseActions acceptTry: self.
	e caseOtherwise notNil
		ifTrue: [e caseOtherwise acceptTry: self]
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptCompoundStatement: e [ 
	e statements acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptConstantDefinition: e [ 
	self acceptTry: e domain.
	e initializer acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptContextDefinition: e [ 
	e constants acceptTry: self.
	 e types acceptTry: self.
	 e entities acceptTry: self.
	 e algorithmes acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptDefinedType: e [ 
	e domain acceptTry: self.
	self acceptNamedType: e
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptDerivedAttribute: e [ 
	self acceptTry: e domain.
	e assign acceptTry: self.
	e redeclaring acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptDictionaryInstanceReference: e [ 
	
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptDomainEquivalentItem: e [ 
	e nativeItem acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptElementQualifier: e [ 
	e index acceptTry: self.

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptEndSplitmarkStatement: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptEntityDefinition: e [ 
	e supertypeConstraint acceptTry: self.
	e supertypes acceptTry: self.
	e attributes acceptTry: self.
	e uniquenessRules acceptTry: self.
	self acceptNamedType: e
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptEntityInstancesSet: e [ 
	^ self acceptTry: e entityRef
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptEnumerationType: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptEnumerationValue: e [
	^ e domain acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptEscapeStatement: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptEscapedExpression: e [ 
	e expr acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptExplicitAttribute: e [ 
	self acceptTry: e domain.
	e redeclaring acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptExternalMetaSchema: e [ 

]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptExternalRepresentation: e [ 
	self acceptGenericInstance: e.
	 e records acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptExternalSchema: e [ 
	^ self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptFalseConstant: e [ 

]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptFileDescription: e [
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptFileName: e [ 
	^ self
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptFileSchema: e [ 
	^ self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptFunctionDeclaration: e [ 
	self acceptAlgorithmDeclaration: e.
	e returnType acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptGeneralAggregateType: e [ 
	self acceptTry: e elementType
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptGenericInstance: e [ 
	e instanceScope acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptGenericType: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptGlobalRule: e [ 
	self acceptStatementsContainer: e.
	 e forEntities acceptTry: self.
	e whereRules acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptGroupQualifier: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptIdentifier: e [ 
	
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptIfStatement: e [ 
	e selector acceptTry: self.
	 e thenStatements acceptTry: self.
	e elseStatements acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptIncludeSchema: e [ 
	e explicitlyImportedItems acceptTry: self.
	e implicitlyImportedItems acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptIncrementControl: e [ 
	e variable acceptTry: self.
	e first acceptTry: self.
	e last acceptTry: self.
	e step acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptIncrementControlVariable: e [ 

]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptInstanceScope: e [ 
	 e owned acceptTry: self.
	 e exportList acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptIntegerBound: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptIntegerType: e [ 
	e precision acceptTry: self
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptInternalRepresentation: e [ 
	self acceptGenericInstance: e.
	  e parameters acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptInterval: e [ 
	e expr acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptInverseAttribute: e [ 
	e invertedAttr acceptTry: self.
	e minCardinality acceptTry: self.
			e maxCardinality acceptTry: self.
	e redeclaring acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptListType: e [ 
	e uniqueFlag
		ifTrue: [self
				acceptVariableSizeAggregationType: e
				symbol: #list
				flags: #(#unique )]
		ifFalse: [self
				acceptVariableSizeAggregationType: e
				symbol: #list
				flags: #()]

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptLiteral: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptLocalVariable: e [ 
	self acceptTry: e domain.
	e initializer acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptLogicalType: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptMetaConceptDefinition: e [ 
	^ self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptMetaMappingDefinition: e [ 
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptMetaMappingRule: e [ 
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptMissingValue: e [ 

]

{ #category : #'visit environment schema' }
PlatypusStepAbstractVisitor >> acceptModelContents: e [ 
	e headerInstances acceptTry: self.
	e dataInstances
		do: [:v | v acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptNamedType: e [ 
	e whereRules acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptNamedTypeReference: e [ 
 
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptNativeAlgorithm: e [ 
	 e implementations acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptNativeCode: e [ 
	^ self 
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptNativeExpression: e [ 
	e source acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptNativeStatement: e [
	e source acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptNullStatement: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptNumberType: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptOneofSupertypeExpression: e [ 
	e exprList acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptOutputStatement: e [ 
	e output acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptParameterDefinition: e [ 
	self acceptTry: e domain
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptPopulationDependentBound: e [ 
	e boundValue acceptTry: self

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptProcedureCallStatement: e [ 
	e call acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptProcedureDeclaration: e [ 
self acceptAlgorithmDeclaration: e
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptQualifiedExpression: e [ 
	e head acceptTry: self.
	e qualifiers acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptQueryExpression: e [ 
	e variable acceptTry: self.
	e aggregateSource acceptTry: self.
	e suchThat acceptTry: self 
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptQueryVariable: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptRangeQualifier: e [ 
	e index1 acceptTry: self.
	e index2 acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptRealType: e [ 
	e precision acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptRedefinedAttributeValue: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptReferencedSchema: e [ 
	self acceptIncludeSchema: e
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptRemark: e [ 
	
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptRemarkReference: e [ 
	e inside ref
		ifNil: [e inside
				ref: (self schemaInstance lookUpSchemaDefinitionBN: e inside name)].
	e remark acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptRepeatStatement: e [ 
	e incrControl acceptTry: self.
	e untilControl acceptTry: self.
	e whileControl acceptTry: self.
	e statements acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptReturnStatement: e [ 
	e returned acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptSchemaDefinition: e [ 
	e interface acceptTry: self.
	self acceptContextDefinition: e.
	e globalRules acceptTry: self.
	e remarkReferences acceptTry: self.
	e mappings acceptTry: self.
]

{ #category : #'visit environment schema' }
PlatypusStepAbstractVisitor >> acceptSchemaInstance: e [ 
	e schemataLinkedMetaData acceptTry: self.
	e metaConceptsIndex acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptSelectType: e [ 
	 e selections acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptSelfIdentifier: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptSetType: e [ 
	self
		acceptVariableSizeAggregationType: e
		symbol: #set
		flags: #()

]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptSimpleRecord: e [ 
	 e parameters acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptSimpleUnaryExpression: e [ 
	e expr acceptTry: self

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptSkipStatement: e [ 

]

{ #category : #'visit statements schema' }
PlatypusStepAbstractVisitor >> acceptSplitmarkStatement: e [ 
	e filename acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptStatementsContainer: e [ 
	e locals acceptTry: self.
	self acceptContextDefinition: e.
	 e statements acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptStringType: e [ 
	e width acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptSubEntityRefExpression: e [ 
	self acceptTry: e entityRef
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptSupertypeConstraint: e [ 
	e constrained acceptTry: self.
	e expr acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptTrueConstant: e [ 

]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptTypedExpression: e [ 
	e expr acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptUniquenessRule: e [ 
	 e attributes acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusStepAbstractVisitor >> acceptUnknownConstant: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptUsedSchema: e [ 
	self acceptIncludeSchema: e
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptUserDefinedApplicationInstance: e [ 
	 e parameters acceptTry: self
]

{ #category : #'visit population schema' }
PlatypusStepAbstractVisitor >> acceptUserDefinedHeaderInstance: e [ 
	 e parameters acceptTry: self
]

{ #category : #'visit generic' }
PlatypusStepAbstractVisitor >> acceptVariableSizeAggregationType: e symbol: aSymbol flags: aCollection [ 
	self
		acceptAggregationType: e
		lower: e lowerBound
		upper: e upperBound
		symbol: aSymbol
		flags: aCollection
]

{ #category : #'visit dictionary schema' }
PlatypusStepAbstractVisitor >> acceptWhereRule: e [ 
	e whereValue acceptTry: self.

]

{ #category : #'type checking' }
PlatypusStepAbstractVisitor >> checkAssignmentOf: aValue to: anAssignable [ 
	| leftDomain rightDomain |
	(self value: aValue isAssignableTo: anAssignable)
		ifFalse: [
			leftDomain := anAssignable computedDomain.
			rightDomain := aValue computedDomain.
			PlatypusExpressIncompatibleDomainInAssignmentException signal: 'lhs domain : ' , leftDomain prettyPrintedExpressCode , ';  rhs domain : ' , rightDomain prettyPrintedExpressCode].
	^ true
]

{ #category : #accessing }
PlatypusStepAbstractVisitor >> lookUpIdentifierBN: name [ 
	| found |
	visitPath
		reverseDo: [:el | (found := el lookUpIdentifierBN: name)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #accessing }
PlatypusStepAbstractVisitor >> lookUpNamedTypeBN: name [ 
	| found |
	visitPath 
		reverseDo: [:el | (found := el lookUpNamedTypeBN: name) ifNotNil: [^found]].
	^nil
]

{ #category : #accessing }
PlatypusStepAbstractVisitor >> schemaDefinition [
	^ visitPath asArray reversed detect: [:e | e isPltSchemaDefinition ]
]

{ #category : #accessing }
PlatypusStepAbstractVisitor >> schemaInstance [
	^ visitPath notEmpty
		ifTrue: [visitPath first schemaInstance]
		ifFalse: [nil]
]

{ #category : #'error handling' }
PlatypusStepAbstractVisitor >> showInterpreterErrorOnSource: error [
	| e |
	e := PlatypusExpressInterpretorError
		metaData: visitPath last
		message: error messageText.
	self registerError: e.
	self schemaInstance addError: e.
	PlatypusExpressEditor
		openWithSourceHandler: self schemaInstance tamarisItemRef
		windowLabel: 'Error: ' , error messageText
]

{ #category : #'type checking' }
PlatypusStepAbstractVisitor >> value: aValue isAssignableTo: anAssignable [ 
	| leftDomain rightDomain |
	self checksAssignments
		ifTrue: [leftDomain := anAssignable domain.
			rightDomain := aValue computedDomain.
			^ rightDomain isAssignableTo: leftDomain].
	^ true
]
