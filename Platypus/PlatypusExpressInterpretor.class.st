Class {
	#name : #PlatypusExpressInterpretor,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'modelContentsAccessBlock',
		'stack',
		'contextsStack',
		'argsStack',
		'requestor',
		'splitMarkStack',
		'checksAssignments',
		'selfStack',
		'debugger'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'visit aggregate data schema' }
PlatypusExpressInterpretor >> acceptAggregateData: e [ 
	| interpreted contents domain var |
	interpreted := e class new stepInitialize.
	contents := OrderedCollection new.
	domain := e computedDomain.
	var := PltAnonymousVariable domain: domain.
	e contents
		do: [:i | 
			i acceptTry: self.
			contents add: self popVal].
	interpreted contents: contents.
	^ self pushVar: var val: interpreted
]

{ #category : #'visit aggregate data schema' }
PlatypusExpressInterpretor >> acceptAggregateInitializer: e [ 
	| interpreted contents el domain var |
	interpreted := PltAggregateInitializer new.
	contents := OrderedCollection new.
	domain := e computedDomain.
	var := PltAnonymousVariable domain: domain.
	e contents
		do: [:i | 
			el := PltAggregateInitializerElement new.
			i val acceptTry: self.
			el val: self popVal.
			i repetition
				ifNotNil: [i repetition acceptTry: self.
					el repetition: self popVal].
			contents add: el].
	interpreted contents: contents.
	^ self pushVar: var val: interpreted

]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptAlgorithmDeclaration: e [ 
	self
		asContext: e
		while: [self acceptStatementsContainer: e]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptAliasStatement: e [ 
	^ self
		asContext: e
		while: [e statements
				do: [:stmt | stmt acceptTry: self]]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptAliasStatementVariable: e [ 
	| aliasStackElement |
	(aliasStackElement := self localData: e)
		ifNil: [e referenced acceptTry: self.
			aliasStackElement := self top.
			self localData: e value: aliasStackElement]
		ifNotNil: [self push: aliasStackElement]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptAndExpression: e [ 
	| right left |
	e leftExpr acceptTry: self.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [left isPltLogicalLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			left
				ifFalseOrUnknownConstant: [^ self pushVal: left].
			e rightExpr acceptTry: self.
			right := self popVal.
			^ self pushVal: right]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptAssignable: e [ 
	e head acceptTry: self.
	self doQualifiers: e qualifiers
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptAssignmentStatement: e [ 
	| rightValue currStackElement |
	e rightExpr acceptTry: self.
	rightValue := self popVal.
	e left acceptTry: self.
	currStackElement := self pop.
	currStackElement assign: rightValue
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptAttributeIdentifier: e [ 
self
	asValOfSelf: e selfInstance
	while: [self acceptIdentifier: e]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptAttributeQualifier: e [ 
	| stackElement |
	stackElement := self pop.
	stackElement pushAttribute: e attributeName
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptAttributeReference: e [ 
	| |
	self acceptTry: e ref.

]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptCaseAction: e [ 
	| selector |
	selector := self popVal.
	(e labels
			anySatisfy: [:l | 
				l acceptTry: self.
				(self popVal equal: selector) isPltTrueConstant])
		ifTrue: [e action acceptTry: self.
			self pushVal: PltTrueConstant new]
		ifFalse: [self pushVal: PltFalseConstant new]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptCaseStatement: e [ 
	| selector |
	e selector acceptTry: self.
	selector := self pop.
	e caseActions
		detect: [:ca | 
			self push: selector.
			ca acceptTry: self.
			self popVal isPltTrueConstant]
		ifNone: [e caseOtherwise
				ifNotNil: [e caseOtherwise acceptTry: self]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptConstantDefinition: e [ 
	self push: (self data: e)
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptDefinedType: e [ 

]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptDerivedAttribute: e [ 
	e assign acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptDivExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [left isPltNumericLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self pushVal: left / right]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptElementQualifier: e [ 
	| idx stackElement |
	e index acceptTry: self.
	idx := self popVal.
	stackElement := self pop.
	stackElement pushIndex: idx val 
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptEndSplitmarkStatement: e [ 
	Transcript show: 'Writing ' withCRs , splitMarkStack last name , '\' withCRs.
	splitMarkStack last close.
	splitMarkStack removeLast
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptEntityDefinition: e [ 
	| stackElem externalRep rec dataIndex attrIdentOrValue |
	self
		asContext: e
		while: [externalRep := PltExternalRepresentation new. 
			(rec := e emptyRecord) addRecordsToExternalRepresentation: externalRep.
			dataIndex := self currentContext dataIndex.
			rec definition referenced
				explicitAttributesWithIndexDo: [:ea :pos | 
					attrIdentOrValue := dataIndex at: ea.
					rec at: pos put: attrIdentOrValue].
			stackElem := PlatypusExpressInterpretorStackAppInst instance: externalRep interpretor: self.
			externalRep markAsComputed.
			self modelContents
				ifNotNil: [:mc | mc recordComputedInstances ifTrue: [mc add: externalRep]].
			externalRep owningModel: self modelContents.
			self push: stackElem]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptEntityInstancesSet: e [
	self
		push: (self data: e)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptEnumerationValue: e [ 
	^ self
		pushVar: (PltAnonymousVariable domain: e computedDomain)
		val: e

]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	left := self popVal.
	^ [self
		pushVal: (left equal: right)]
		on: MessageNotUnderstood
		do: [:ex | 
			Transcript show: ex printString , String cr.
			self pushVal: PltMissingValue new]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptEscapeStatement: e [ 
	PlatypusExpressEscapeStatementException signal
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptExplicitAttribute: e [ 
	| stackElement |
	stackElement := self valOfSelf stackElementOfExplicitAttribute: e interpretor: self.
	stackElement ifNil: [^ PlatypusExpressInvalidAttributeException signal: 'attribute : ''' , e name , ''' is not computable'].
	self push: stackElement
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptExpoExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [left isPltNumericLiteral
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left expo: right)]
]

{ #category : #'visit population schema' }
PlatypusExpressInterpretor >> acceptGenericInstance: e [
	| stackElem |
	stackElem := PlatypusExpressInterpretorStackAppInst instance:  e interpretor: self.
	self push: stackElem
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptGlobalRule: e [ 
	| result |
	result := PltListInstance new.
	self
		asContext: e
		while: [e statements
				do: [:stmt | stmt acceptTry: self].
			e whereRules
				do: [:wr | 
					wr acceptTry: self.
					result add: self popVal]].
	result adjustLowerAndUpperBounds.
	self pushVal: result
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptGreaterEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [left isPltOrderedLiteral
				ifTrue: [^ self pushVal: left >= right].
			left isPltAggregateData
				ifTrue: [^ self
						pushVal: (left isSupersetOf: right interpretor: self)].
			^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument']
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptGreaterThanExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [(left isPltOrderedLiteral
					or: [left isPltAggregateData])
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self pushVal: left > right]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptGroupQualifier: e [ 
	| stackElement domain anonymousVar group instRef |
	stackElement := self pop.
	(instRef := stackElement val)
		ifMissing: [^ self pushVal: instRef]
		ifNotMissing: [instRef isPltGenericInstance
				ifFalse: [^ PlatypusExpressInvalidQualifierException signal: 'group qualifier ' , e groupName , ' can''t be interpreted from here '].
			domain := instRef entityDefinitionOfGroupNamed: e groupName.
			domain
				ifNil: [^ PlatypusExpressInvalidGroupException signal: 'invalid group name ' , e groupName].
			anonymousVar := PltAnonymousVariable domain: domain.
			group := instRef buildGroup: domain.
			self pushVar: anonymousVar val: group]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptIdentifier: e [ 
	| args |
	e ref canHaveArguments
		ifTrue: [
			args := PlatypusExpressInterpretorCallArguments interpretor: self.
			self pushArgs: args.
			(e parameters notNil
					and: [e parameters notEmpty])
				ifTrue: [e parameters
						do: [:param | 
							self acceptTry: param.
							args addValue: self pop]]].
	e ref acceptTry: self.
	e ref canHaveArguments
		ifTrue: [self popArgs]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptIfStatement: e [ 
	e selector acceptTry: self.
	self popVal ifTrueConstant: [e thenStatements
				do: [:stmt | stmt acceptTry: self]]
		ifFalseConstant: [e elseStatements
				ifNotNil: [e elseStatements
						do: [:stmt | stmt acceptTry: self]]]

]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptInExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [right isPltAggregateData
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			"(left computedDomain isCompatibleWith: right computedDomain 
			elementType) ifFalse: [PlatypusExpressInvalidArgumentException 
			signal: 'invalid left argument']."
			^ self
				pushVal: (right includesVal: left)]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptIncrementControl: e [ 
	| counter step last |
	counter := self data: e variable.
	step := self currentContext step.
	last := self currentContext last.
	counter val val: counter val val + step.
	step = 0
		ifFalse: [^ step > 0
				ifTrue: [counter val val <= last]
				ifFalse: [counter val val >= last]].
	^ false
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptIncrementControlVariable: e [ 
	self
		push: (self data: e)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptInstEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [
	^ self
		pushVal: (left instEqual: right)]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptInstNotEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [
	^ self
		pushVal: (left instNotEqual: right)]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptInstanceConstructionExpression: e [ 
	| stackElem right left externalRep |
	self acceptBinaryExpression: e.
	right := self pop.
	left := self pop.
	externalRep := PltExternalRepresentation new.
	left addRecordsToExternalRepresentation: externalRep.
	right addRecordsToExternalRepresentation: externalRep.
	stackElem := PlatypusExpressInterpretorStackAppInst instance: externalRep interpretor: self.
	externalRep markAsComputed.
	self modelContents 
		ifNotNil: [	:mc | mc recordComputedInstances ifTrue: [mc add: externalRep].
			"left instance isTemporary
				ifTrue: [mc remove: left instance].
			right instance isTemporary 
				ifTrue: [mc remove: right instance]"].
	self push: stackElem.

				

]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptIntegerBound: e [ 
	| v var |
	v := PltIntegerLiteral val: e boundValue.
	var := PltAnonymousVariable domain: PltIntegerType new.
	self pushVar: var val: v
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptInterval: e [ 
	e expr acceptTry: self.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptInverseAttribute: e [ 
	| invertedAttrVal result var selfRef |
	selfRef := self valOfSelf.
	e minCardinality ifNil: 
			[result := (self allInstancesOf: e invertedAttr ref owner) detect: 
							[:d | 
							invertedAttrVal := d 
										stackElementOfExplicitAttribute: e invertedAttr ref
										interpretor: self.
							(invertedAttrVal val includesVal: selfRef) isPltTrueConstant]
						ifNone: [PltMissingValue new]]
		ifNotNil: 
			[result := e duplicates 
						ifTrue: [PltBagInstance new]
						ifFalse: [PltSetInstance new].
			(self allInstancesOf: e invertedAttr ref owner) do: 
					[:d | 
					invertedAttrVal := d  stackElementOfExplicitAttribute: e invertedAttr referenced
								interpretor: self.
					(invertedAttrVal val includesVal: selfRef) ifTrueConstant: [result add: d]].
			result adjustLowerAndUpperBounds].
	result 
		ifNotMissing: [result isPltAggregateInstance
			ifTrue: [result := result asListInstance]].
	var := PltAnonymousVariable domain: result computedDomain.
	self pushVar: var val: result.
	^ result
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptLessEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [left isPltOrderedLiteral
				ifTrue: [^ self pushVal: left <= right].
			left isPltAggregateData
				ifTrue: [^ self
						pushVal: (left isSubsetOf: right interpretor: self)].
			^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument']
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptLessThanExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [(left isPltOrderedLiteral
					or: [left isPltAggregateData])
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self pushVal: left < right]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptLiteral: e [ 
	^ self
		pushVar: (PltAnonymousVariable domain: e computedDomain)
		val: e copy
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptLocalVariable: e [ 
	self push: (self data: e)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptMinusExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [(left isPltNumericLiteral
					or: [left isPltAggregateData])
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left minus: right interpretor: self)]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptMissingValue: e [ 
	^ self
		pushVal: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptModExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [left isPltNumericLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left mod: right)]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptMultExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [(left isPltNumericLiteral
					or: [left isPltAggregateData])
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left mult: right interpretor: self)]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptNativeAlgorithm: e [ 
	| nativeCode |
	(nativeCode := e platypusInterpreterCode)
		ifNil: [Error signal: 'no platypus interpreter code'].
	^ self acceptTry: nativeCode
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptNativeCode: e [ 
	^ PlatypusNativeCodeInterpretor new
		evaluate: e
		interpretor: self
		requestor: requestor
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptNativeExpression: e [ 
	e source acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptNativeStatement: e [ 
	e source acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptNegativeExpression: e [ 
	| expr |
	e expr acceptTry: self.
	(expr := self popVal)
		ifMissing: [^ self pushVal: expr]
		ifNotMissing: [expr isPltNumericLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid argument'].
			^ self pushVal: expr negated]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptNotEqualExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	left := self popVal.
	^ [self
		pushVal: (left notEqual: right)]
		on: MessageNotUnderstood
		do: [:ex | 
			Transcript show: ex printString, String cr.
			self pushVal: PltMissingValue new]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptNotExpression: e [ 
	| expr |
	e expr acceptTry: self.
	(expr := self popVal)
		ifMissing: [^ self pushVal: expr]
		ifNotMissing: [expr isPltLogicalLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid argument'].
			^ self pushVal: expr not]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptNullStatement: e [
	^ self

]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptOrExpression: e [ 
	| right left |
	e leftExpr acceptTry: self.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [left isPltLogicalLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			left
				ifTrueConstant: [^ self pushVal: left].
			e rightExpr acceptTry: self.
			right := self popVal.
			^ self pushVal: right]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptOutputStatement: e [ 
	"Transcript show: '#'."
	e output acceptTry: self.
	splitMarkStack last nextPutAll: self popVal asClearText
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptParameterDefinition: e [ 
	self push: (self data: e)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptPlusExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [(left isPltNumericLiteral
					or: [left isPltStringLiteral
							or: [left isPltAggregateData]])
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left plus: right interpretor: self)]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptPopulationDependentBound: e [ 
	| |
	e boundValue acceptTry: self.

]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptProcedureCallStatement: e [ 
	e call acceptTry: self
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptQualifiedExpression: e [ 
	e head acceptTry: self.
	self doQualifiers: e qualifiers
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptQueryExpression: e [ 
	| resultVar resultVal |
	self
		asContext: e
		while: [[self currentContext atEnd]
				whileFalse: [self currentContext next.
					self pushVal: self currentContext current.
					self data: e variable value: self pop.
					e suchThat acceptTry: self.
					self popVal
						ifTrueConstant: [self currentContext keep]
						ifFalseConstant: [self currentContext dontKeep]
						 ifUnknownConstant: [self currentContext dontKeep] ].
			resultVal := self currentContext result].
	resultVar := PltAnonymousVariable domain: resultVal computedDomain.
	self pushVar: resultVar val: resultVal
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptQueryVariable: e [ 
	self push: (self data: e)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptRangeQualifier: e [ 
	| idx1 idx2 stackElement |
	e index1 acceptTry: self.
	idx1 := self popVal.
	e index2 acceptTry: self.
	idx2 := self popVal.
	stackElement := self pop.
	stackElement
		pushRange: (idx1 val to: idx2 val)
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptRealDivExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: left]
		ifNotMissing: [left isPltNumericLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left div: right)]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptRepeatStatement: e [ 
	| while untilControl skip |
	self
		asContext: e
		while: [
			untilControl := e untilControl.
			skip := false.
			[e incrControl
				ifNil: [while := true]
				ifNotNil: [while := e incrControl acceptTry: self].
			while
				and: [e whileControl
						ifNil: [while := true]
						ifNotNil: [e whileControl acceptTry: self.
							while := self popVal isPltTrueConstant]]]
				whileTrue: [[e statements
						do: [:stmt | [skip
								ifFalse: [stmt acceptTry: self]]
								on: PlatypusExpressSkipStatementException
								do: [skip := true]]]
						on: PlatypusExpressEscapeStatementException
						do: [^ nil].
					skip := false.
					untilControl
						ifNotNil: [untilControl acceptTry: self.
							self popVal isPltTrueConstant
								ifTrue: [^ nil]]]]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptReturnStatement: e [ 
	e returned acceptTry: self.
	PlatypusExpressReturnStatementException signal
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptSelfIdentifier: e [ 
	| anonymousVar |
	anonymousVar := PltAnonymousVariable domain: self valOfSelf computedDomain.
	self pushVar: anonymousVar val: self valOfSelf
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptSkipStatement: e [ 
	PlatypusExpressSkipStatementException signal
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptSplitmarkStatement: e [ 
	| contents fileName oldStream |
	contents := ''.
	e filename acceptTry: self.
	fileName := self popVal val.
	e append
		ifTrue: [(self isAFileNamed: fileName)
				ifTrue: [oldStream := self outputFileStreamNamed: fileName.
					[contents := oldStream contentsOfEntireFile]
						ensure: [oldStream close]]].
	splitMarkStack
		add: (self outputFileStreamNamed: fileName).
	e append
		ifTrue: [splitMarkStack last nextPutAll: contents]
]

{ #category : #'visit statements schema' }
PlatypusExpressInterpretor >> acceptStatementsContainer: e [ 
	[e statements
		do: [:stmt | stmt acceptTry: self]] on: PlatypusExpressReturnStatementException do: []
]

{ #category : #'visit generic' }
PlatypusExpressInterpretor >> acceptTry: e [ 
	e referenced
		ifNil: [^ PlatypusExpressUnresolvedIdentifierException signal: 'Unresolved symbol: ' , e name].
	debugger
		ifNotNil: [Transcript show: e prettyPrintedExpressCode , String cr.
			e isDebugged
				ifTrue: [debugger aboutToAccept: e]].
	^ super acceptTry: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterpretor >> acceptWhereRule: e [ 
	e whereValue acceptTry: self.
	self topVal
		ifTrueConstant: [Transcript show: e fullyQualifiedName , ': true\' withCRs]
		ifFalseConstant: [Transcript show: e fullyQualifiedName , ': false\' withCRs]
		ifUnknownConstant: [Transcript show: e fullyQualifiedName , ': unknown\' withCRs]
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> acceptXorExpression: e [ 
	| right left |
	self acceptBinaryExpression: e.
	right := self popVal.
	(left := self popVal)
		ifMissing: [^ self pushVal: PltUnknownConstant new]
		ifNotMissing: [left isPltLogicalLiteral
				ifFalse: [PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ self
				pushVal: (left xor: right)]
]

{ #category : #'data accessing' }
PlatypusExpressInterpretor >> allApplicationInstances [
	^ self applicationInstancesSelect: [:d | d notNil]
]

{ #category : #'data accessing' }
PlatypusExpressInterpretor >> allInstancesOf: anEntityDefinition [ 
	^ self applicationInstancesSelect: [:d | d computedDomain isSpecializationOf: anEntityDefinition]
]

{ #category : #'data accessing' }
PlatypusExpressInterpretor >> allPersistentApplicationInstances [
	^ self modelContents dataInstances 
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretor >> applicationInstancesSelect: aSelectionBlock [ 
	| selected context schemaInstance models ref |
	selected := OrderedCollection new.
	contextsStack 
		reverseDo: [:c | c applicationInstancesSelect: aSelectionBlock in: selected].
	self modelContents ifNotNil: [:mc | 
		selected addAll: (mc dataInstances select: aSelectionBlock)].
	^selected
]

{ #category : #accessing }
PlatypusExpressInterpretor >> argsStackSize [
	^ argsStack size
]

{ #category : #accessing }
PlatypusExpressInterpretor >> argsStackTop [
	^ argsStack top
]

{ #category : #accessing }
PlatypusExpressInterpretor >> asContext: contextInstance while: aBlock [ 
	contextInstance pushContextInInterpretor: self.
	aBlock
		ensure: [self popContext]
]

{ #category : #accessing }
PlatypusExpressInterpretor >> asContextsStack: aStack while: aBlock [
	| oldContexts |
	oldContexts := contextsStack.
	contextsStack := aStack.
	aBlock ensure: [contextsStack := oldContexts]
]

{ #category : #accessing }
PlatypusExpressInterpretor >> asValOfSelf: anInstance while: aBlock [
	| omc |
	omc := modelContentsAccessBlock.
	modelContentsAccessBlock :=  [anInstance owningModel].
	selfStack push: anInstance interpretingContext.
	aBlock
		ensure: [
			selfStack pop. 
			modelContentsAccessBlock := omc]
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> attributeOrRule: anAttributeOrLocalRule instance: anEntityInstance [ 
	| toBeEvaluated |
	toBeEvaluated := anAttributeOrLocalRule isPltWhereRule
		ifTrue: [anAttributeOrLocalRule whereValue]
		ifFalse: [anAttributeOrLocalRule].
	^ self expression: toBeEvaluated context: anAttributeOrLocalRule schemaDefinition instance: anEntityInstance 

]

{ #category : #accessing }
PlatypusExpressInterpretor >> checksAssignments [
	^ checksAssignments
]

{ #category : #accessing }
PlatypusExpressInterpretor >> checksAssignments: trueOrFalse [
	checksAssignments := trueOrFalse
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> compute: anExpressionOrStatement [ 
	[anExpressionOrStatement acceptTry: self]
		on: Error
		do: [:err | 
			PlatypusExpressDebugger interpretor: self statementOrExpression:   visitPath top.
			err signal]
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> compute: anArrayOfExpressionsOrStatements in: context to: receiver notifying: aRequestor ifFail: failBlock logged: isLogged [ 
	| owners |
	context isPltSchemaInstance
		ifTrue: [owners := context schemataLinkedMetaData]
		ifFalse: [owners := context inclusiveOwnerPath].
	self resolves: anArrayOfExpressionsOrStatements in: context to: receiver notifying: aRequestor owners: owners.
	modelContentsAccessBlock := [context schemaInstance interpreterScope].
	(owners "reject: [:o | o isNil]")
		do: [:own | own pushContextInInterpretor: self].
	(receiver isKindOf: PltGenericInstance)
		ifTrue: [
			self
				asValOfSelf: receiver
				while: [anArrayOfExpressionsOrStatements
						do: [:r | self compute: r]]]
		ifFalse: [anArrayOfExpressionsOrStatements
				do: [:r | | schi |
					schi := r schemaInstance.
					modelContentsAccessBlock := [schi interpreterScope]. 
					self compute: r]].
	^ stack size > 0
		ifTrue: [self pop]
		ifFalse: [self]
]

{ #category : #accessing }
PlatypusExpressInterpretor >> contextsStack [
	^ contextsStack
]

{ #category : #accessing }
PlatypusExpressInterpretor >> currentContext [
	^contextsStack top
]

{ #category : #accessing }
PlatypusExpressInterpretor >> currentSourceHandler [
	| tam |
	self contextsStack reverseDo: [:ctxt| (tam := ctxt contextInstance tamarisItemRef) ifNotNil: [^ tam]].
	^ nil 
]

{ #category : #accessing }
PlatypusExpressInterpretor >> data: aData [ 
	| found |
	 contextsStack 
		reverseDo: [:c | (found := c data: aData) ifNotNil: [^found]].
	^PlatypusExpressUnresolvedIdentifierException 
		signal: 'Unresolved symbol: ' , aData name
]

{ #category : #accessing }
PlatypusExpressInterpretor >> data: aData value: aValue [ 
	 contextsStack 
		reverseDo: [:c | (c includesData: aData) ifTrue: [^c data: aData value: aValue]].
	^self currentContext data: aData value: aValue
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretor >> dataDo: aBlock [ 
	contextsStack reverseDo: [:c | c dataDo: aBlock].
	self modelContents dataInstances do: aBlock.

]

{ #category : #accessing }
PlatypusExpressInterpretor >> dataNamed: anIdent [ 
	| found |
	 contextsStack 
		reverseDo: [:c | (found := c dataNamed: anIdent) ifNotNil: [^found]].
	^nil
]

{ #category : #accessing }
PlatypusExpressInterpretor >> dataNamed: anIdent value: aValue [ 
	| found |
	 contextsStack reverseDo: 
			[:c | 
			(found := c stackElementOfDataNamed: anIdent) ifNotNil: 
					[c data: found value: aValue.
					^true]].
	^false
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretor >> dataSelect: aSelectionBlock [
	| result |
	result := OrderedCollection new.
	contextsStack reverseDo: [:c | c dataSelect: aSelectionBlock in: result].
	result addAll: (self modelContents dataInstances select: aSelectionBlock).
	^ result

]

{ #category : #accessing }
PlatypusExpressInterpretor >> debugger: anExpressDebogger [ 
	debugger := anExpressDebogger.

]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> declareConstant: e [ 
	| varValue value |
	self pushVar: e val: e defaultValue.
	self localData: e value: (varValue := self pop).
	e initializer acceptTry: self.
	value := self valueFromDomain: e domain assignCompatibleWith: self popVal.
	varValue val: value copy
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> declareEntityInstancesSet: e [ 
	| instancesList |
	instancesList := PltListInstance new.
	instancesList contents: (self allInstancesOf: e entityRef).
	instancesList adjustLowerAndUpperBounds.
	self pushVar: e val: instancesList.
	self localData: e value: self pop
	
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> declareLocalVariable: e [ 
	| domain value varValue |
	self pushVar: e val: e defaultValue.
	self localData: e value: (varValue := self top).
	e initializer 
		ifNotNil: 
			[e initializer acceptTry: self.
			domain := e domain.
			value := self valueFromDomain: domain assignCompatibleWith: self popVal.
			varValue val: value copy].
	self pop
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> declareParameter: e [ 
	self pushVar: e val: e defaultValue.
	self localData: e value: (self pop)
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> declareQueryVariable: e [ 
	self pushVar: e val: e defaultValue.
	self localData: e value: self pop
]

{ #category : #'initialize/release' }
PlatypusExpressInterpretor >> destroy [
	super destroy.
	stack destroy.
	stack := nil.
	contextsStack destroy.
	contextsStack := nil
]

{ #category : #'visit expressions schema' }
PlatypusExpressInterpretor >> doQualifiers: quals [ 
	| first |
	quals isEmpty
		ifFalse: [(first := quals first) isPltAttributeQualifier
				ifTrue: [self
						asValOfSelf: self top val 
						while: [self acceptTry: first.
							self doQualifiers: quals allButFirst]]
				ifFalse: [self acceptTry: first.
					self doQualifiers: quals allButFirst]]
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> evaluate: textOrStream in: context to: receiver notifying: aRequestor ifFail: failBlock [ 
	^ self
		evaluate: textOrStream
		in: context
		to: receiver
		notifying: aRequestor
		ifFail: failBlock 
		logged: false
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> evaluate: textOrStream in: context to: receiver notifying: aRequestor ifFail: failBlock logged: isLogged [ 
	^ (self parse: textOrStream in: context notifying: aRequestor ifFail: failBlock)
		ifNotNil: [:result |
			self
				compute: result
				in: context
				to: receiver
				notifying: aRequestor
				ifFail: failBlock
				logged: isLogged]
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> expression: anExpression context: aContext instance: anEntityInstance [ 
	requestor := nil.
	aContext
		ifNotNil: [aContext pushContextInInterpretor: self].
	self
		asValOfSelf: anEntityInstance
		while: [self compute: anExpression.
			^ self pop val]
]

{ #category : #'initialize/release' }
PlatypusExpressInterpretor >> initialize [
	super initialize.
	stack := PlatypusStack new.
	contextsStack := PlatypusStack new.
	selfStack := PlatypusStack new.
	argsStack := PlatypusStack new.
	splitMarkStack := OrderedCollection new.
	checksAssignments := true
]

{ #category : #'result output' }
PlatypusExpressInterpretor >> isAFileNamed: aName [ 
	^ ( FileLocator workingDirectory / aName) exists
]

{ #category : #accessing }
PlatypusExpressInterpretor >> localData: aData [ 
	^ self currentContext data: aData
]

{ #category : #accessing }
PlatypusExpressInterpretor >> localData: aData value: aValue [ 
	^ self currentContext data: aData value: aValue
]

{ #category : #'visit generic' }
PlatypusExpressInterpretor >> lookUpAndCacheAcceptSelectorOfClass: aClass [ 
	| currClass selector str |
	currClass := aClass.
	str := WriteStream on: (String new:50).
	[currClass ~~ Object]
		whileTrue: [str nextPutAll: 'accept'.
			str
				next: currClass name size - 3
				putAll: currClass name
				startingAt: 4.
			str nextPut: $:.
			selector := str contents asSymbol.
			(self class includesSelector: selector)
				ifTrue: [self acceptSelectorsMap at: aClass put: selector.
					^ selector].
			str reset.
			currClass := currClass superclass].
	^ self error: 'unimplemented accept method for class ''' , aClass name , ''''
]

{ #category : #accessing }
PlatypusExpressInterpretor >> lookUpIdentifierBN: aName [ 
	| found |
	contextsStack
		reverseDo: [:ctx | (found := ctx lookUpIdentifierBN: aName)
				ifNotNil: [^ found]].
	^ PltPlatypusExpressPrimitivesSchemaInstance  lookUpIdentifierBN: aName
]

{ #category : #accessing }
PlatypusExpressInterpretor >> lookUpIdentifierBN: aName fromContext: aContext [ 
	| found |
	aContext inclusiveOwnerPath
		reverseDo: [:own | (found := own lookUpIdentifierBN: aName)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressInterpretor >> lookUpNamedTypeBN: aName [ 
	| found |
	contextsStack
		reverseDo: [:ctx | (found := ctx lookUpNamedTypeBN: aName)
				ifNotNil: [^ found]].
	^ PltPlatypusExpressPrimitivesSchemaInstance lookUpNamedTypeBN: aName
]

{ #category : #accessing }
PlatypusExpressInterpretor >> modelContents [ 
	^ modelContentsAccessBlock value 
]

{ #category : #accessing }
PlatypusExpressInterpretor >> modelContents: aModelContents [
	modelContentsAccessBlock := [aModelContents]
]

{ #category : #'result output' }
PlatypusExpressInterpretor >> outputFileStreamNamed: aName [ 
	| filename dir |
	(dir := ( FileLocator workingDirectory / self resultOutputDirectoryName) ) ensureCreateDirectory.
	(filename := dir / aName) ensureCreateFile.
	^ filename writeStream
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> parse: textOrStream in: context notifying: aRequestor ifFail: failBlock [
	| position descr repl contents start result stream |
	stream := textOrStream isStream
				ifTrue: [textOrStream]
				ifFalse: [ReadStream on: textOrStream].
	contents := stream upToEnd copy trimBoth.
	stream := ReadStream on: contents.
	start := (contents last = $;
					or: [contents size > 2
							and: [(contents copyFrom: contents size - 2 to: contents size)
									= '#*)']])
				ifTrue: [PlatypusExpressParser startingStateForStatementsEntry]
				ifFalse: [PlatypusExpressParser startingStateForExpressionEntry].
	result := [PlatypusExpressParser
				parseStream: stream
				startingAt: start
				owner: context]
				on: SmaCCParserError
				do: [:ex | 
					position := ex tag position.
					descr := ex description.
					aRequestor notNil
						ifTrue: [aRequestor selectFrom: position to: position - 1.
							repl := Text string: descr , '->' attribute: TextEmphasis bold.
							aRequestor replaceSelectionWith: repl].
					ex return: failBlock value.
					^ nil].
	result isCollection
		ifFalse: [result := Array with: result].
	result do: [:r | r owner: context].
	^ result

]

{ #category : #accessing }
PlatypusExpressInterpretor >> pop [
	^ stack pop.

]

{ #category : #accessing }
PlatypusExpressInterpretor >> popArgs [
	^ argsStack pop
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> popContext [
	contextsStack pop
]

{ #category : #accessing }
PlatypusExpressInterpretor >> popVal [
	| elem |
	elem := self pop.
	^ elem val
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> prepareIncrControl: e [ 
	| counter step last |
	e first acceptTry: self.
	counter := self pop deepCopy.
	e step
		ifNil: [step := 1]
		ifNotNil: [e step acceptTry: self.
			step := self popVal val].
	counter val val: counter val val - step.
	e last acceptTry: self.
	last := self popVal val.
	self localData: e variable value: counter.
	self currentContext step: step.
	self currentContext last: last
]

{ #category : #accessing }
PlatypusExpressInterpretor >> push: aStackElement [ 
	| |
	stack push: aStackElement 

]

{ #category : #accessing }
PlatypusExpressInterpretor >> pushArgs: aStackCallArgumentsElement [ 
	argsStack push: aStackCallArgumentsElement
]

{ #category : #'context initializing' }
PlatypusExpressInterpretor >> pushContext: anInterpretorContext [ 
	contextsStack push: anInterpretorContext.
	anInterpretorContext initializeContextInInterpretor: self
]

{ #category : #accessing }
PlatypusExpressInterpretor >> pushVal: anObject [ 
	self
		push: (PlatypusExpressInterpretorStackVar val: anObject interpretor: self)
]

{ #category : #accessing }
PlatypusExpressInterpretor >> pushVar: aVariable val: aValue [ 
	self
		push: (PlatypusExpressInterpretorStackVar
				var: aVariable
				val: aValue
				interpretor: self)
]

{ #category : #accessing }
PlatypusExpressInterpretor >> removeFromStackAt: pos [
	stack removeAt: pos
]

{ #category : #interpreting }
PlatypusExpressInterpretor >> resolves: anArrayOfExpressionsOrStatements in: context to: receiver notifying: aRequestor owners: owners [
	| resolutionOwners  checker |
	requestor := aRequestor.
	resolutionOwners := owners copy.
	(receiver isKindOf: PltGenericInstance)
		ifTrue: [resolutionOwners addAll: receiver definitionInclusiveOwnerPath].
	checker := PlatypusExpressResolver new visitContexts: resolutionOwners.
	anArrayOfExpressionsOrStatements
		do: [:r | [checker checks: r]
				on: PlatypusVisitorError
				do: [:err | 
					self showInterpreterErrorOnSource: err.
					err signal]].
	^ anArrayOfExpressionsOrStatements

]

{ #category : #'result output' }
PlatypusExpressInterpretor >> resultOutputDirectoryName [
	^ 'Platypus-output'
]

{ #category : #accessing }
PlatypusExpressInterpretor >> return: anObject [ 
	self pushVal: anObject 
]

{ #category : #accessing }
PlatypusExpressInterpretor >> schemaInstance [
	^ contextsStack first contextInstance schemaInstance
]

{ #category : #accessing }
PlatypusExpressInterpretor >> selfStack [
	^ selfStack 
]

{ #category : #accessing }
PlatypusExpressInterpretor >> selfStackSize [
	^ selfStack size
]

{ #category : #accessing }
PlatypusExpressInterpretor >> stack [
	^ stack
]

{ #category : #accessing }
PlatypusExpressInterpretor >> stackAt: aPos [
	^ stack at: aPos
]

{ #category : #accessing }
PlatypusExpressInterpretor >> stackSize [
	^ stack size
]

{ #category : #accessing }
PlatypusExpressInterpretor >> top [
	^ self stack top
]

{ #category : #accessing }
PlatypusExpressInterpretor >> topVal [
	^ self top val
]

{ #category : #accessing }
PlatypusExpressInterpretor >> valOfSelf [
	^ selfStack top
]

{ #category : #accessing }
PlatypusExpressInterpretor >> valueFromDomain: aDomain assignCompatibleWith: aValue [ 
	^ aValue 
		ifMissing: [aValue]
		ifNotMissing: 
			[[aDomain assignableValueFrom: aValue interpretor: self] on: Error
				do: 
					[
					PlatypusExpressIncompatibleDomainInAssignmentException 
						signal: 'domain : ' , aDomain prettyPrintedExpressCode , ';  value : ' 
								, aValue prettyPrintedExpressCode]]
]

{ #category : #accessing }
PlatypusExpressInterpretor >> valueOf: anIdent [ 
	| v result |
	result := (v := self dataNamed: anIdent)
		ifNil: [PltMissingValue new]
		ifNotNil: [v val].
	^ result ifNil: [PltMissingValue new]
]
