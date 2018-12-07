Class {
	#name : #PlatypusExpressSemanticChecker,
	#superclass : #PlatypusExpressChecker,
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptAggregationType: e [ 
	| low upper |
	self
		checksBound: e lowerBound
		messagePrefix: 'lower bound'
		from: e.
	self
		checksBound: e upperBound
		messagePrefix: 'upper bound'
		from: e.
	(e lowerBound notNil
			and: [e upperBound notNil])
		ifTrue: [((low := e lowerBound asInteger) notNil
					and: [(upper := e upperBound asInteger) notNil])
				ifTrue: [low <= upper
						ifFalse: [self
								registerError: (PlatypusExpressSemanticCheckerError message: 'low bound must be greater or equal than upper bound' path: visitPath asArray)]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptAndExpression: e [ 
	super acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltLogicalType
					and: [domain2 isPltLogicalType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptArrayType: e [ 
	super acceptArrayType: e.
	self acceptAggregationType: e.
	e isGeneralType
		ifFalse: [e lowerBound
				ifNil: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'low index must be set' path: visitPath asArray)].
			e upperBound
				ifNil: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'high index must be set' path: visitPath asArray)]]
]

{ #category : #'visit statements schema' }
PlatypusExpressSemanticChecker >> acceptAssignmentStatement: e [ 
	e left acceptTry: self.
	e rightExpr acceptTry: self.
	self
		checksAssignOf: e rightExpr
		to: e left
		from: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptBagType: e [ 
	super acceptBagType: e.
	self acceptAggregationType: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptBound: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptConstantDefinition: e [ 
	e initializer ifNotNil: [ 
		self
			checksAssignOf: e initializer
			to: e
			from: e]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptContextDefinition: e [ 
	self logPathAndInfo: e name.
			super acceptContextDefinition: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptDefinedType: e [ 
	| errPathStack errMess |
	super acceptDefinedType: e.
	errPathStack := OrderedCollection new.
	(e checksDomainPath: OrderedCollection new errorStack: errPathStack)
		ifFalse: [errMess := ''.
			errPathStack
				do: [:st | errMess := errMess , st name]
				separatedBy: [errMess := errMess , '->'].
			self
				registerError: (PlatypusExpressSemanticCheckerError message: 'cycle in domain path: ' , errMess path: visitPath asArray)]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptDerivedAttribute: e [ 
	super acceptDerivedAttribute: e.
	e redeclaring
		ifNotNil: [((e redeclaring ref isKindOf: e class)
					or: [e redeclaring ref isKindOf: PltExplicitAttribute])
				ifTrue: [self checksAttributeRedeclaring: e]
				ifFalse: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'redeclaring attribute ''' , e name , ''' should be an explicit or a derived attribute' path: visitPath asArray)]].
	self
		checksAssignOf: e assign
		to: e
		from: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptDivExpression: e [ 
	super acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
					and: [domain2 isPltNumberType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptDomainEquivalentItem: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptEntityDefinition: e [ 
	super acceptEntityDefinition: e.
	(e checksHierarchy: OrderedCollection new errorStack: OrderedCollection new)
		ifTrue: [e checksAttributesNames
				do: [:err | self registerError: err]]
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError message: 'cycle in hierarchy path' path: e inclusiveOwnerPath)]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptEnumerationType: e [ 
	| elements |
	super acceptEnumerationType: e.
	elements := Set new.
	e elements
		do: [:el | 
			(elements includes: el)
				ifTrue: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'enumeration type contains several occurences of ''' , el , '''' path: visitPath asArray)].
			elements add: el]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptEqualExpression: e [ 
	| |
	super acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptExplicitAttribute: e [ 
	super acceptExplicitAttribute: e.
	e redeclaring
		ifNotNil: [(e redeclaring ref isKindOf: e class)
				ifTrue: [self checksAttributeRedeclaring: e]
				ifFalse: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'redeclaring attribute ''' , e name , ''' should be an explicit attribute' path: visitPath asArray)]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptExpoExpression: e [ 
	super acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
					and: [domain2 isPltNumberType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptExternalMetaSchema: e [ 
	self acceptExternalSchema: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptExternalSchema: e [ 
	e nativeSchema = e owner
		ifTrue: [self
				registerError: (PlatypusExpressSemanticCheckerError message: 'used/referenced inside itself' path: e inclusiveOwnerPath)]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptFunctionDeclaration: e [ 
	super acceptFunctionDeclaration: e.
	(e statements anySatisfy: [:stmt | stmt alwaysReturn]) 
		ifFalse: [
			self registerError: (PlatypusExpressSemanticCheckerError
				metaData: e
				message: 'never return possibility')]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptGreaterEqualExpression: e [ 
	| |
	super acceptBinaryExpression: e.
	( self checksAggregateOperator: e)
		ifNil: [^ self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
		 
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptGreaterThanExpression: e [ 
	self acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptInExpression: e [ 
	| rinfered linfered |
	super acceptBinaryExpression: e.
	rinfered := e rightExpr computedDomain.
	rinfered isPltGenericType
		ifTrue: [^ true].
	linfered := e leftExpr computedDomain.
	rinfered isPltAggregateCompatibleType
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError  metaData: e  message: 'invalid right operande, should be an aggregate').
			^ false].
	(linfered isCompatibleWith: rinfered elementType)
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError metaData: e   message: 'operand domain incompatibility: ', ('aggregate domain : ' , rinfered errorQualifier), ('element domain : ' , linfered errorQualifier) ).
				
			^ false].
	^ true
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptIncludeSchema: e [ 
	self acceptExternalSchema: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptInstEqualExpression: e [ 
	super acceptBinaryExpression: e.
		( self checksAggregateOperator: e)
		ifNil: [ self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
		 
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptInstNotEqualExpression: e [ 
	super acceptBinaryExpression: e.
		(self checksAggregateOperator: e)
		ifNil: [^ self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]

]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptInstanceConstructionExpression: e [ 
	self acceptBinaryExpression: e.
	"(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]"
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptInverseAttribute: e [ 
	| elementType refedDomain |
	super acceptInverseAttribute: e.
	refedDomain := e invertedAttr entityRef referenced.
	(refedDomain isPltNamedType
			or: [refedDomain isPltAggregationType
					and: [refedDomain isPltSetType
							or: [refedDomain isPltBagType]]])
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError message: 'bad inverse attribute ''' , e name , ''' domain (should be an Entity, a Set or a Bag)' path: visitPath asArray)].
	refedDomain isPltAggregationType
		ifTrue: [elementType := refedDomain elementType.
			elementType isPltNamedType
				ifFalse: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'bad inverse attribute ''' , e name , ''' domain' path: visitPath asArray)]].
	e redeclaring
		ifNotNil: [(e redeclaring ref isKindOf: e class)
				ifTrue: [self checksAttributeRedeclaring: e]
				ifFalse: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'redeclaring attribute ''' , e name , ''' should be an inverse attribute' path: visitPath asArray)]].
	(refedDomain isSpecializationOf: e invertedAttr ref owner)
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError message: 'inversed attribute domain ''' , e invertedAttr name , ''' in entity ''' , e invertedAttr owner name , ''' should be a specialization of ''' , e owner name , '''' path: visitPath asArray)].
	self
		checksBound: e minCardinality
		messagePrefix: 'min cardinality'
		from: e.
	self
		checksBound: e maxCardinality
		messagePrefix: 'max cardinality'
		from: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptLessEqualExpression: e [ 
	| |
	self acceptBinaryExpression: e.
	( self checksAggregateOperator: e)
		ifNil: [ self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
		 
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptLessThanExpression: e [ 
	self acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptListType: e [ 
	super acceptListType: e.
	self acceptAggregationType: e.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptLocalVariable: e [ 
	e initializer
		ifNotNil: [self
				checksAssignOf: e initializer
				to: e
				from: e]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptMinusExpression: e [ 
	self acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
							and: [domain2 isPltNumberType])
						or: [domain1 isPltGenericType
								or: [domain2 isPltGenericType]]]]
		ifNotNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isPltAggregateCompatibleType
						or: [domain1 isPltGenericType]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptModExpression: e [ 
	self acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
					and: [domain2 isPltNumberType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptMultExpression: e [ 
	self acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
							and: [domain2 isPltNumberType])
						or: [domain1 isPltGenericType
								or: [domain2 isPltGenericType]]]]
		ifNotNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | (domain1 isPltAggregateCompatibleType
							or: [domain1 isPltGenericType])
						and: [domain2 isPltAggregateCompatibleType
								or: [domain2 isPltGenericType]]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptNotEqualExpression: e [ 
 	self acceptBinaryExpression: e.
	( self checksAggregateOperator: e)
		ifNil: [^ self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | domain1 isCompatibleWith: domain2]]
 
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptOrExpression: e [ 
	self acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltLogicalType
					and: [domain2 isPltLogicalType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptPlusExpression: e [ 
	self acceptBinaryExpression: e.
	(self checksAggregateOperator: e)
		ifNil: [self
				checksBinaryOperator: e
				testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
						and: [domain2 isPltNumberType])
						or: [(domain1 isPltStringType
								and: [domain2 isPltStringType])
						or: [domain1 isPltGenericType
								or: [domain2 isPltGenericType]]]]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptRealDivExpression: e [ 
	self acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltNumberType
					and: [domain2 isPltNumberType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptSchemaDefinition: e [ 
	self logInfo: 'schema ' , e name.
	super acceptSchemaDefinition: e
]

{ #category : #'visit environment schema' }
PlatypusExpressSemanticChecker >> acceptSchemaInstance: e [ 
	(e internalSchemata)
		acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptSetType: e [ 
	super acceptSetType: e.
	self acceptAggregationType: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptStatementsContainer: e [ 
	super acceptStatementsContainer: e.
	self statementNotReachTest: e 
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptSupertypeConstraint: e [ 
	super acceptSupertypeConstraint: e.
	(e checksInheritance: e constrained ref)
		ifNotEmpty: [:errs | self
				registerError: (PlatypusExpressSemanticCheckerError message: 'error in hierarchy specification'
				path: visitPath asArray)]
				
]

{ #category : #'visit dictionary schema' }
PlatypusExpressSemanticChecker >> acceptUniquenessRule: e [ 
	| attributes |
	super acceptUniquenessRule: e.
	attributes := Set new.
	e attributes
		do: [:attr | 
			(attributes includes: attr referenced)
				ifTrue: [self
						registerError: (PlatypusExpressSemanticCheckerError message: 'contains several occurences of ''' , attr name , '''' path: visitPath asArray)].
			attributes add: attr referenced]
]

{ #category : #'visit expressions schema' }
PlatypusExpressSemanticChecker >> acceptXorExpression: e [ 
	self acceptBinaryExpression: e.
	self
		checksBinaryOperator: e
		testBlock: [:domain1 :domain2 | (domain1 isPltLogicalType
					and: [domain2 isPltLogicalType])
				or: [domain1 isPltGenericType
						or: [domain2 isPltGenericType]]]
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checks: aMetaData [ 
	self logInfo: 'SEMANTIC CHECKING'.
	aMetaData acceptTry: self.
	self logInfo: 'SEMANTIC CHECKING DONE'
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checksAggregateOperator: e [ 
	| linfered rinfered theElementType theAggrType elType1 elType2 aggrExpr elExpr |
	linfered := e leftExpr computedDomain.
	rinfered := e rightExpr computedDomain.
	(linfered isPltAggregateCompatibleType
			or: [rinfered isPltAggregateCompatibleType])
		ifTrue: [(linfered isPltAggregateCompatibleType
					and: [rinfered isPltAggregateCompatibleType])
				ifTrue: [elType1 := linfered elementType computedDomain.
					elType2 := rinfered elementType computedDomain.
					((linfered canAddElementOfType: elType2)
							and: [rinfered canAddElementOfType: elType1])
						ifFalse: [self
								registerError: (PlatypusExpressSemanticCheckerError 
									metaData: e 
									message: 'aggregation operation domain incompatibility, ' , ('left element domain : ' , elType1 errorQualifier) , ' right element domain : ' , elType2 errorQualifier).
							^ false]]
				ifFalse: [linfered isPltAggregateCompatibleType
						ifTrue: [theElementType := rinfered.
							theAggrType := linfered.
							aggrExpr := e leftExpr.
							elExpr := e rightExpr]
						ifFalse: [theElementType := linfered.
							theAggrType := rinfered.
							aggrExpr := e rightExpr.
							elExpr := e leftExpr].
					elType1 := theAggrType elementType computedDomain.
					elType2 := theElementType.
					(theAggrType canAddElementOfType: elType2)
						ifFalse: [
self
								registerError: (PlatypusExpressSemanticCheckerError 
									metaData: e 
									message: 'aggregation operation domain incompatibility, ' , ('aggregate domain : ' , theAggrType errorQualifier) , ' element domain : ' , theElementType errorQualifier).


							^ false]].
			^ true]
		ifFalse: [^ nil]
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checksAssignOf: expr to: anAssignableOrAttribute from: e [ 
	| infered static |
	((infered := expr computedDomain) isAssignableTo: (static := anAssignableOrAttribute computedDomain))
		ifFalse: [self registerError: (PlatypusExpressSemanticCheckerError metaData: anAssignableOrAttribute message: 'domain incompatibility in assignment, ', 'lhs domain : ' , (static ifNil: ['? '] ifNotNil: [:s | s errorQualifier]), ', rhs domain : ' , infered errorQualifier)].
	(anAssignableOrAttribute isPltAssignable and: [anAssignableOrAttribute head referenced isPltAliasStatementVariable])
		ifTrue: [
			self registerError: 
				(PlatypusExpressSemanticCheckerError
					metaData: anAssignableOrAttribute head referenced  
					message: 'not implemented feature: writeable alias variable')].
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checksAttributeRedeclaring: attr [ 
	| redeclaredDomain redeclaringDomain |
	redeclaringDomain := attr domain referenced.
	redeclaredDomain := attr redeclaring ref domain referenced.
	(redeclaringDomain isSpecializationOf: redeclaredDomain) 
		ifFalse: 
			[self registerError: (PlatypusExpressSemanticCheckerError
					metaData: attr
						message: ('redeclaring domain must be a specialization of redeclared domain, ' 
								, ('invalid redeclaring domain : ' , redeclaringDomain errorQualifier 
										, ', redeclared attribute: domain : ' , redeclaredDomain errorQualifier)))]
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checksBinaryOperator: e testBlock: aBlock [ 
	| linfered rinfered |
	linfered := e leftExpr computedDomain.
	rinfered := e rightExpr computedDomain.
	(aBlock value: linfered value: rinfered)
		ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError metaData: e message: 'domain incompatibility in binary expression, ' , ('lhs domain : ' , linfered errorQualifier) , (' rhs domain : ' , rinfered errorQualifier)).
			^ false].
	^ true
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> checksBound: e messagePrefix: aString from: parent [ 
	e
		ifNotNil: [
			e inferedDomain ifNotNil: [:id | 
			(id isCompatibleWith: PltNumberType asDomain)
				ifFalse: [self
				registerError: (PlatypusExpressSemanticCheckerError message:  aString , ' should be a number, ', 'bound domain : ' , e inferedDomain errorQualifier)]]]
						
]

{ #category : #'visit generic' }
PlatypusExpressSemanticChecker >> statementNotReachTest: aStatementContainer [ 
	| stmt stmts |
	stmts := aStatementContainer statements.
	1
		to: stmts size - 1
		do: [:pos | 
			stmt := stmts at: pos.
			(stmt alwaysReturn
					and: [stmt isPltNativeStatement not])
				ifTrue: [self
						registerError: (PlatypusExpressSemanticCheckerError message:  'statement not reached: ', (stmts at: pos + 1) prettyPrintedExpressCode path: visitPath asArray)]].
						
]
