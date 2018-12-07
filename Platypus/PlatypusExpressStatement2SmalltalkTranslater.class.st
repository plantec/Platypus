Class {
	#name : #PlatypusExpressStatement2SmalltalkTranslater,
	#superclass : #PlatypusExpressTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptAliasStatement: e [ 
	self nextPutAll: '(PlatypusCoreAliasStatement alias: ('.
	self expressionTranslaterClass accept: e variable ref fromTranslater: self.
	self nextPutAllCr: ') '.
	self nextPutAll: 'statementsBlock: [ :'.
	self expressionTranslaterClass accept: e variable fromTranslater: self.
	self nextPutAll: ' | '.
	e statements
		do: [:stmt | self acceptTry: stmt].
	self nextPutAllCr: ']).'.

]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptAliasStatementVariable: e [ 
	| vn |
	vn := self namesBuilder
				uniqueBlockVarName: (self namesBuilder normalizedNameFrom: e aliasIdent first: false)
				owner: e.
	self nextPutAll: vn , ': '
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptAssignable: e [ 
	e qualifiers
		ifEmpty: [self nextPutAll: ' self '
					, (self namesBuilder normalizedVarNameFrom: e head name) , ': ']
		ifNotEmpty: [:quals | 
			quals
				do: [:q | q isPltGroupQualifier
						ifTrue: [self nextPutAll: '( ']].
			e qualifiers allButLast
				do: [:q | self nextPutAll: '( '].
			self expressionTranslaterClass accept: e head fromTranslater: self.
			e qualifiers allButLast
				do: [:q | 
					self expressionTranslaterClass accept: q fromTranslater: self.
					self nextPutAll: ')']
				separatedBy: [].
			e qualifiers last acceptTry: self]
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptAssignmentStatement: e [ 
	self acceptTry: e left.
	self expressionTranslaterClass accept: e rightExpr fromTranslater: self.
	self nextPutAllCr: ' .'
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptAttributeQualifier: e [ 
	| selector tmpAttr |
	tmpAttr := PltExplicitAttribute new name: e attributeName.
	selector := tmpAttr getSelectorFromNamesBuilder: self namesBuilder.
	self nextPutAll: ' ' , selector , ': '
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptCaseStatement: e [ 
	| guardBlocksAssocs otherWiseBlock selector |
	guardBlocksAssocs := '((OrderedCollection new) '.
	e caseActions
		do: [:ca | 
			guardBlocksAssocs := guardBlocksAssocs , ' add: ( ( (OrderedCollection new) '.
			ca labels
				do: [:lab | guardBlocksAssocs := guardBlocksAssocs , 'add: ['
								, (self expressionTranslaterClass translate: lab fromTranslater: self) , ']; '].
			guardBlocksAssocs := guardBlocksAssocs , 'yourself) -> [ '
						, (self class translate: ca action fromTranslater: self) , ']); '].
	guardBlocksAssocs := guardBlocksAssocs , 'yourself) '.
	otherWiseBlock := e caseOtherwise
				ifNil: ['[]']
				ifNotNil: ['['
						, (self class translate: e caseOtherwise fromTranslater: self) , ']'].
	selector := self expressionTranslaterClass translate: e selector fromTranslater: self.
	self nextPutAllCr: 'PlatypusCoreCaseStatement caseActionBlocks: ' , guardBlocksAssocs , ' otherwiseBlock: ' , otherWiseBlock , ' case: ' , selector , '.'
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptCompoundStatement: e [ 
	e statements do: [:stmt | self acceptTry: stmt].

]

{ #category : #'visit expressions schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptElementQualifier: e [ 
	self nextPutAll: '  at:  '.
	self expressionTranslaterClass accept: e index fromTranslater: self.
	self nextPutAll: '  put:  '
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptEndSplitmarkStatement: e [ 
	self nextPutAllCr: 'self class schemaInstance popSplitmark.'
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptEscapeStatement: e [ 
	self nextPutAllCr: 'PlatypusExpressEscapeStatementException signal. '
]

{ #category : #'visit expressions schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptIdentifier: e [ 
	e referenced isPltAlgorithmDeclaration
		ifTrue: [(e parameters isNil
					or: [e parameters isEmpty])
				ifTrue: [self nextPutAll: '(' , e referenced generatedClassName , '  invoke).']
				ifFalse: [self nextPutAll: '(' , e referenced generatedClassName , '  invokeFromValues: ((OrderedCollection new) '.
					(e parameters
						ifNil: [#()])
						do: [:p | 
							self nextPutAll: 'add: '.
							self expressionTranslaterClass accept: p fromTranslater: self]
						separatedBy: [self nextPutAll: '; '].
					self nextPutAllCr: '; yourself)).']]
		ifFalse: [self acceptTry: e referenced]
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptIfStatement: e [ 
	self nextPutAll: '('.
	self expressionTranslaterClass accept: e selector fromTranslater: self.
	self nextPutAllCr: ') ifTrue: ['.
	e thenStatements
		do: [:stmt | self acceptTry: stmt].
	e elseStatements
		ifNotNil: [self nextPutAllCr: '] ifFalse: ['.
			e elseStatements
				do: [:stmt | self acceptTry: stmt]].
	self nextPutAllCr: '].'
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptLocalVariable: e [ 
	self nextPutAll: ' self '
			, (self namesBuilder normalizedVarNameFrom: e name) , ': '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptNativeAlgorithm: e [ 
	self subclassResponsibility 
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptNativeCode: e [ 
	| stmt |
	self nextPutAllCr: '"---------- native statement ---------- "'.
	stmt := e code trimBoth.
	(stmt endsWith: '.')
		ifFalse: [stmt := stmt , '.'].
	self nextPutAllCr: stmt
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptOutputStatement: e [ 
	self nextPutAll: 'self class schemaInstance splitMarkOutput: ( '.
	self expressionTranslaterClass accept: e output fromTranslater: self.
	self nextPutAllCr: '). '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptParameterDefinition: e [ 
	self nextPutAll: ' self '
			, (self namesBuilder normalizedVarNameFrom: e name) , ': '
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptQualifiedExpression: e [ 
	e qualifiers
		do: [:q | 
			q isPltGroupQualifier
				ifTrue: [self nextPutAll: '( ']].
	e head acceptTry: self.
	e qualifiers
		do: [:q | 
			self acceptTry: q.] separatedBy: [
			self nextPutAll: ') ']
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptRepeatStatement: e [ 
	| whileBlock untilBlock statementsBlock first last incrVar blockHead novar |
	novar := 'r' , e basicIdentityHash asString.
	e incrControl
		ifNil: [blockHead := ' [:' , novar , ' | ']
		ifNotNil: [incrVar := self expressionTranslaterClass translate: e incrControl variable fromTranslater: self.
			first := self expressionTranslaterClass translate: e incrControl first fromTranslater: self.
			last := self expressionTranslaterClass translate: e incrControl last fromTranslater: self.
			blockHead := ' [ :' , incrVar , ' | '].
	whileBlock := e whileControl
				ifNil: ['']
				ifNotNil: ['whileControlBlock: ' , blockHead
						, (self expressionTranslaterClass translate: e whileControl fromTranslater: self) , ']'].
	untilBlock := e untilControl
				ifNil: ['']
				ifNotNil: ['untilControlBlock: ' , blockHead
						, (self expressionTranslaterClass translate: e untilControl fromTranslater: self) , ']'].
	statementsBlock := ''.
	e statements
		do: [:stmt | statementsBlock := statementsBlock
						, (self class translate: stmt fromTranslater: self)].
	statementsBlock := statementsBlock , ']'.
	e incrControl
		ifNil: [self nextPutAllCr: ' PlatypusCoreRepeatStatement ' , whileBlock , '  ' , untilBlock , ' repeat: [' , statementsBlock , '.']
		ifNotNil: [self nextPutAllCr: 'PlatypusCoreRepeatStatement ' , whileBlock , '  ' , untilBlock , ' repeat: ' , blockHead , statementsBlock , ' from: ' , first , ' to: ' , last , '.']
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptReturnStatement: e [ 
	self nextPutAll: '	^ self return: ('.
	e returned
		ifNil: [self nextPutAll: 'self']
		ifNotNil: [self expressionTranslaterClass accept: e returned fromTranslater: self].
	self nextPutAllCr: ').'
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptSkipStatement: e [ 
	self nextPutAllCr: 'PlatypusExpressSkipStatementException signal. '
]

{ #category : #'visit statements schema' }
PlatypusExpressStatement2SmalltalkTranslater >> acceptSplitmarkStatement: e [ 
	self nextPutAll: 'self class schemaInstance pushSplitmark: ( '.
	self expressionTranslaterClass accept: e filename fromTranslater: self.
	self nextPutAllCr: ') append: ' , e append printString , '. '
]

{ #category : #accessing }
PlatypusExpressStatement2SmalltalkTranslater >> namesBuilder [
	^ self requestor namesBuilder
]
