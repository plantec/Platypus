Class {
	#name : #PlatypusExpressExpression2AdaTranslater,
	#superclass : #PlatypusExpressTranslater,
	#instVars : [
		'receiverName'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAggregateInitializer: e [ 
	self flag: 'Not implemented'.
	e contents isEmpty ifTrue: [self nextPutAll: ' Array new']
	ifFalse: [
	self nextPutAll: ' ( PlatypusCoreAggregateInitializer collectionFrom: ((OrderedCollection new) '.
	e contents
		do: [:c | self nextPutAll: 'add: '. self acceptTry: c] separatedBy: [self nextPutAll: '; '].
	self nextPutAll: '; yourself) ) ']
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAggregateInitializerElement: e [ 
	| vname |
	self flag: 'Not implemented'.
	vname := self namesBuilder uniqueBlockVarName: 'p' owner: e.
	
	e repetition
		ifNil: [self nextPutAll: '('.
			self acceptTry: e val.
			self nextPutAll: ')']
		ifNotNil: [self nextPutAll: '[((1 to: ('.
			self acceptTry: e repetition.
			self nextPutAll: ')) collect: [:' , vname , '| '.
			self acceptTry: e val.
			self nextPutAll: '])]'].

]

{ #category : #'visit statements schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAliasStatementVariable: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAndExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' and '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit statements schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAssignable: e [ 
	e qualifiers
		ifEmpty: [self nextPutAll: '( '.
			e head acceptTry: self.
			self nextPutAll: ') ']
		ifNotEmpty: [:quals | 
			quals
				do: [:q | 
					self nextPutAll: '( '.
					q isPltGroupQualifier
						ifTrue: [self nextPutAll: '( ']].
			e head acceptTry: self.
			e qualifiers
				do: [:q | 
					self acceptTry: q.
					self nextPutAll: ') ']]
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptAttributeQualifier: e [ 
	| contextvn selector tmpAttr |
	self flag: 'Not implemented'.
	contextvn := (self namesBuilder contextArgNameFromQualifier: e) 
				ifNil: [' (self class context) '].
	tmpAttr := PltExplicitAttribute new name: e attributeName.
	selector := tmpAttr 
				getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	self nextPutAll: selector , ' ' , contextvn
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptBinaryExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' ', e pltOperator, ' '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptConstantDefinition: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptDerivedAttribute: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptEConstant: e [ 
	self nextPutAll: ' 2.71828 '

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptElementQualifier: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: '  pltAt:  '.
	self acceptTry: e index
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptEntityInstanceConstructor: e [ 
	self error: 'deprecated'
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptEntityInstancesSet: e [
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptEnumerationValue: e [ 
	self nextPutAll: e element
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptExplicitAttribute: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptFalseConstant: e [ 
	^ self nextPutAll: 'False'
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptGroupQualifier: e [ 
	| grpname grpref |
	self flag: 'Not implemented'.
	grpref := self schemaInstance lookUpNamedTypeBN: e groupName.
	grpname := grpref generatedClassName.
	self nextPutAll: 'asPlatypusComplexInstance \ #' , grpname , ')  pltAsObject '

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptIdentifier: e [ 
	e referenced isPltEntityDefinition 
		ifTrue: 
			[self nextPutAll: '(' , e referenced generatedClassName , ' new'.
			(e parameters notNil and: [e parameters notEmpty]) 
				ifTrue: 
					[self nextPutAll: ' ', (self namesBuilder localFromValuesMethodNameFromEntity:  e referenced), ' ((OrderedCollection new)'.
					e parameters do: 
							[:p | 
							self nextPutAll: ' add: '.
							self acceptTry: p]
						separatedBy: [self nextPutAll: ';'].
					self nextPutAll: ' ; yourself); yourself'].
			self nextPutAll: ')']
		ifFalse: 
			[e referenced isPltAlgorithmDeclaration 
				ifTrue: 
					[(e parameters isNil or: [e parameters isEmpty]) 
						ifTrue: 
							[self nextPutAll: '(' , e referenced generatedClassName , '  invoke) ']
						ifFalse: 
							[self nextPutAll: '(' , e referenced generatedClassName 
										, '  invokeFromValues: ((OrderedCollection new)'.
							e parameters do: 
									[:p | 
									self nextPutAll: ' add: '.
									self acceptTry: p]
								separatedBy: [self nextPutAll: ';'].
							self nextPutAll: ' ; yourself))']]
				ifFalse: [self acceptTry: e referenced]]
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptInExpression: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: ' ( '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' includes: '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit statements schema' }
PlatypusExpressExpression2AdaTranslater >> acceptIncrementControlVariable: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptInstanceConstructionExpression: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: ' ((PlatypusComplexInstance fromRecords: ( (OrderedCollection new) add: '.
	self acceptTry: e leftExpr.
	self nextPutAll: '; add: '.
	self acceptTry: e rightExpr.
	self nextPutAll: '; yourself)) pltAsObject )'
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptInterval: e [ 
	self acceptTry: e expr.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptInverseAttribute: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptLikeExpression: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: ' ( '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' match:  '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptLiteral: e [ 
	^ self nextPutAll: e val printString
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptLocalVariable: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptMissingValue: e [ 
	self nextPutAll: 'null'.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptNativeAlgorithm: e [ 
	self subclassResponsibility 
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptNativeCode: e [ 
	| stmt |
	self flag: 'Not implemented'.
	self nextPutAllCr: '"---------- native statement ---------- "'.
	stmt := e code trimBoth.
	(stmt endsWith: '.')
		ifFalse: [stmt := stmt , '.'].
	self nextPutAllCr: stmt
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptNegativeExpression: e [ 
	self nextPutAll: '( ('. 
	self acceptTry: e expr.
	self nextPutAll: ') * -1) '. 

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptNotExpression: e [ 
	self nextPutAll: '( Not ('.
	self acceptTry: e expr.
	self nextPutAll: ') ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptOrExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' OR '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2AdaTranslater >> acceptParameterDefinition: e [ 
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptPiConstant: e [ 
	self nextPutAll: ' 3.14159 '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptPositiveExpression: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: '( ('.
	self acceptTry: e expr.
	self nextPutAll: ') ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptQualifiedExpression: e [ 
	self flag: 'Not implemented'.

	e qualifiers do: 
			[:q | 
			self nextPutAll: '( '.
			q isPltGroupQualifier ifTrue: [self nextPutAll: '( ']].
	e head acceptTry: self.
	e qualifiers do: 
			[:q | 
			self acceptTry: q.
			self nextPutAll: ') ']
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptQueryExpression: e [ 
	self flag: 'Not implemented'.
	self nextPutAll: '('.
	self acceptTry: e aggregateSource.
	e aggregateSource computedDomain isPltArrayType
		ifTrue: [self nextPutAll: ' collect: [ :'.
			self acceptTry: e variable.
			self nextPutAll: ' | ('.
			self acceptTry: e suchThat.
			self nextPutAll: ' ) ifTrue: [ '.
			self acceptTry: e variable.
			self nextPutAll: ' ] ifFalse: [ nil ]']
		ifFalse: [self nextPutAll: ' select: [ :'.
			self acceptTry: e variable.
			self nextPutAll: ' | '.
			self acceptTry: e suchThat].
	self nextPutAll: '])'
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptQueryVariable: e [ 
	| vn |
	self flag: 'Not implemented'.
	vn := self namesBuilder uniqueBlockVarName: e variableId owner: e.
	self nextPutAll: vn, ' '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptRangeQualifier: e [ 
	self flag: 'Not implemented'.

	self nextPutAll: '  pltCopyFrom:  '.
	self acceptTry: e index1.
	self nextPutAll: '  to:  '.
	self acceptTry: e index2
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptSelfIdentifier: e [ 
	self flag: 'Not implemented'.
	receiverName
		ifNil: [self nextPutAll: ' self ']
		ifNotNil: [self nextPutAll: receiverName, ' ']
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptStringLiteral: e [ 

	self nextPutAll: (self unshunkedString: e val) printString
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptTrueConstant: e [ 
	^ self nextPutAll: 'True'
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptUnknownConstant: e [ 
	^ self acceptLiteral: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2AdaTranslater >> acceptXorExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' XOR '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' )  '
]

{ #category : #accessing }
PlatypusExpressExpression2AdaTranslater >> translate: a [
	self halt.
	^super translate: a
]
