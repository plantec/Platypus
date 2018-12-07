Class {
	#name : #PlatypusExpressExpression2SmalltalkTranslater,
	#superclass : #PlatypusExpressTranslater,
	#instVars : [
		'receiverName'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'instance creation' }
PlatypusExpressExpression2SmalltalkTranslater class >> receiverName: aNameForReceiver accept: aMetaData fromTranslater: aTranslater [ 
	(self new receiverName: aNameForReceiver fromTranslater: aTranslater)
		acceptTry: aMetaData
]

{ #category : #'instance creation' }
PlatypusExpressExpression2SmalltalkTranslater class >> receiverName: aNameForReceiver accept: aMetaData fromTranslater: aTranslater resultStream: aStream [ 
	| translater |
	(translater := self new 
		receiverName: aNameForReceiver
		fromTranslater: aTranslater
		resultStream: aStream) acceptTry: aMetaData.
		^ translater
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptAggregateInitializer: e [ 
	e contents isEmpty ifTrue: [self nextPutAll: ' Array new']
	ifFalse: [
	self nextPutAll: ' ( PlatypusCoreAggregateInitializer collectionFrom: ((OrderedCollection new) '.
	e contents
		do: [:c | self nextPutAll: 'add: '. self acceptTry: c] separatedBy: [self nextPutAll: '; '].
	self nextPutAll: '; yourself) ) ']
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptAggregateInitializerElement: e [ 
	| vname |
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
PlatypusExpressExpression2SmalltalkTranslater >> acceptAliasStatementVariable: e [ 
	| vn |
	vn := self namesBuilder
				uniqueBlockVarName: (self namesBuilder normalizedNameFrom: e aliasIdent first: false)
				owner: e.
	self nextPutAll: vn , ' '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptAndExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' and: ['.
	self acceptTry: e rightExpr.
	self nextPutAll: ' ])  '
]

{ #category : #'visit statements schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptAssignable: e [ 
	e qualifiers
		ifEmpty: [self nextPutAll: '( '.
			e head acceptTry: self.
			"self acceptTry: PltSelfIdentifier new.
			self nextPutAll: (self namesBuilder
			normalizedVarNameFrom: e head name)."
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
PlatypusExpressExpression2SmalltalkTranslater >> acceptAttributeQualifier: e [ 
	| contextvn selector tmpAttr |
	contextvn := (self namesBuilder contextArgNameFromQualifier: e) 
				ifNil: [' (self class context) '].
	tmpAttr := PltExplicitAttribute new name: e attributeName.
	selector := tmpAttr 
				getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	self nextPutAll: selector , ' ' , contextvn
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptBinaryExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' ', e pltOperator, ' '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptDerivedAttribute: e [ 
	| contextvn |
	contextvn := self namesBuilder contextArgNameFromAttribute: e.
	self nextPutAll: '( '.
	self acceptTry: PltSelfIdentifier new.
	self 
		nextPutAll: (e getSelectorWithContextArgFromNamesBuilder: self namesBuilder) 
				, ' ' , contextvn 
				, ' ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptEConstant: e [ 
	self nextPutAll: ' 2.71828 '

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptElementQualifier: e [ 
	self nextPutAll: '  pltAt:  '.
	self acceptTry: e index
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptEntityInstanceConstructor: e [ 
	self error: 'deprecated'
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptEntityInstancesSet: e [
	self nextPutAll: '( ', e name, ' )'.

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptEnumerationValue: e [ 
	self nextPutAll: '#''' , e element asUppercase, ''''
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptExplicitAttribute: e [ 
	self nextPutAll: '( '.
	self acceptTry: PltSelfIdentifier new.
	self nextPutAll: (e getSelectorFromNamesBuilder: self namesBuilder) , ') '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptFalseConstant: e [ 
	^ self acceptLiteral:e
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptGroupQualifier: e [ 
	| grpname grpref |
	grpref := self schemaInstance lookUpNamedTypeBN: e groupName.
	grpname := grpref generatedClassName.
	self nextPutAll: 'asPlatypusComplexInstance \ #' , grpname , ')  pltAsObject '

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptIdentifier: e [ 
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
PlatypusExpressExpression2SmalltalkTranslater >> acceptInExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' includes: '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit statements schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptIncrementControlVariable: e [ 
	| vn |
	vn := self namesBuilder uniqueBlockVarName: e variableId
				owner: e.
	self nextPutAll: vn
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptInstanceConstructionExpression: e [ 
	self nextPutAll: ' ((PlatypusComplexInstance fromRecords: ( (OrderedCollection new) add: '.
	self acceptTry: e leftExpr.
	self nextPutAll: '; add: '.
	self acceptTry: e rightExpr.
	self nextPutAll: '; yourself)) pltAsObject )'
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptInterval: e [ 
	self acceptTry: e expr.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptInverseAttribute: e [ 
	| contextvn |
	contextvn := self namesBuilder contextArgNameFromAttribute: e.
	self nextPutAll: '( '.
	self acceptTry: PltSelfIdentifier new.
	self 
		nextPutAll: (e getSelectorWithContextArgFromNamesBuilder: self namesBuilder) 
				, ' ' , contextvn 
				, ' ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptLikeExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e rightExpr.
	self nextPutAll: ' match:  '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' )  '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptLiteral: e [ 
	^ self nextPutAll: e val printString
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptLocalVariable: e [ 
	self nextPutAll: '( '.
	self acceptTry: PltSelfIdentifier new.
	self nextPutAll: (self namesBuilder normalizedVarNameFrom: e name)
			, ' ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptMissingValue: e [ 
	self nextPutAll: 'nil'.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptNativeAlgorithm: e [ 
	self subclassResponsibility 
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptNativeCode: e [ 
	| stmt |
	self nextPutAllCr: '"---------- native statement ---------- "'.
	stmt := e code trimBoth.
	(stmt endsWith: '.')
		ifFalse: [stmt := stmt , '.'].
	self nextPutAllCr: stmt
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptNegativeExpression: e [ 
	self nextPutAll: '( ('. 
	self acceptTry: e expr.
	self nextPutAll: ') negated) '. 

]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptNotExpression: e [ 
	self nextPutAll: '( ('.
	self acceptTry: e expr.
	self nextPutAll: ') not) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptOrExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' or: ['.
	self acceptTry: e rightExpr.
	self nextPutAll: ' ])  '
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptParameterDefinition: e [ 
	self nextPutAll: '( '.
	self acceptTry: PltSelfIdentifier new.
	self nextPutAll: (self namesBuilder normalizedVarNameFrom: e name) , ' ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptPiConstant: e [ 
	self nextPutAll: ' 3.14159 '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptPositiveExpression: e [ 
	self nextPutAll: '( ('.
	self acceptTry: e expr.
	self nextPutAll: ') abs ) '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptQualifiedExpression: e [ 

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
PlatypusExpressExpression2SmalltalkTranslater >> acceptQueryExpression: e [ 
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
PlatypusExpressExpression2SmalltalkTranslater >> acceptQueryVariable: e [ 
	| vn |
	vn := self namesBuilder uniqueBlockVarName: e variableId owner: e.
	self nextPutAll: vn, ' '
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptRangeQualifier: e [ 

	self nextPutAll: '  pltCopyFrom:  '.
	self acceptTry: e index1.
	self nextPutAll: '  to:  '.
	self acceptTry: e index2
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptSelfIdentifier: e [ 
	receiverName
		ifNil: [self nextPutAll: ' self ']
		ifNotNil: [self nextPutAll: receiverName, ' ']
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptStringLiteral: e [ 

	self nextPutAll: (self unshunkedString: e val) printString
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptTrueConstant: e [ 
	^ self acceptLiteral: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptUnknownConstant: e [ 
	^ self acceptLiteral: e
]

{ #category : #'visit expressions schema' }
PlatypusExpressExpression2SmalltalkTranslater >> acceptXorExpression: e [ 
	self nextPutAll: ' ( '.
	self acceptTry: e leftExpr.
	self nextPutAll: ' xor: ['.
	self acceptTry: e rightExpr.
	self nextPutAll: ' ])  '
]

{ #category : #accessing }
PlatypusExpressExpression2SmalltalkTranslater >> namesBuilder [
	^ self requestor namesBuilder
]

{ #category : #accessing }
PlatypusExpressExpression2SmalltalkTranslater >> receiverName: aNameForReceiver [ 
	receiverName := aNameForReceiver.

]

{ #category : #accessing }
PlatypusExpressExpression2SmalltalkTranslater >> receiverName: aNameForReceiver fromTranslater: aTranslater [ 
	self receiverName: aNameForReceiver.
	self fromTranslater: aTranslater 
]

{ #category : #accessing }
PlatypusExpressExpression2SmalltalkTranslater >> receiverName: aNameForReceiver fromTranslater: aTranslater resultStream: aStream [ 
	self receiverName: aNameForReceiver.
	self fromTranslater: aTranslater resultStream: aStream
]
