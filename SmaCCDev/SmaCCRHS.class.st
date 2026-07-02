"
SmaCCRHS represents the right hand side of the production.

Instance variables:
	collection	<OrderedCollection of: SmaCCSymbol> the collection of symbols that represent the rhs
	grammar <SmaCCGrammar> the grammar that the production is in
	variableNames	<Dictionary key: String value: Integer>	the name of each symbol in the rhs. These names can be used in the {} code blocks.
"
Class {
	#name : #SmaCCRHS,
	#superclass : #Object,
	#instVars : [
		'collection',
		'reduceAction',
		'variableNames'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #comparing }
SmaCCRHS >> = aSmaCCRHS [ 
	^self class = aSmaCCRHS class and: [collection = aSmaCCRHS collection]
]

{ #category : #accessing }
SmaCCRHS >> add: aSmaCCSymbol [ 
	collection add: aSmaCCSymbol
]

{ #category : #accessing }
SmaCCRHS >> at: anInteger [ 
	^collection at: anInteger
]

{ #category : #private }
SmaCCRHS >> collection [
	^collection
]

{ #category : #'reduction table' }
SmaCCRHS >> compileSourceFor: aSmaCCSymbol in: aClass [ 
	| action rewriter parseTree methodName |
	action := self reduceAction.
	action isNil ifTrue: [^self defaultReduceAction].
	parseTree := RBParser parseExpression: action
				onError: 
					[:s :p | 
					SmaCCCompilationNotification new
						tag: aSmaCCSymbol name , ' : ' , self printString 
								, '\\' withCRs , action;
						signal: 'Invalid Smalltalk code in reduction rule'.
					^self defaultReduceAction].
	(parseTree isLiteral and: 
			[parseTree value isSymbol and: 
					[parseTree value numArgs <= 1 and: [aClass definesMethod: parseTree value]]]) 
		ifTrue: [^parseTree value].
	rewriter := self parseTreeRewriter.
	rewriter executeTree: parseTree.
	parseTree := rewriter tree.
	methodName := ('reduceActionFor' , aSmaCCSymbol safeMethodName 
				, (aSmaCCSymbol positionOf: self) printString , ':') 
				asSymbol.
	parseTree isSequence 
		ifFalse: [parseTree := RBSequenceNode statements: (Array with: parseTree)].
	parseTree := RBMethodNode 
				selector: methodName
				arguments: (Array with: (RBVariableNode named: 'nodes'))
				body: parseTree.
	parseTree addReturn.
	aClass compile: parseTree formattedCode
		classified: 'generated-reduction actions'.
	^methodName
]

{ #category : #private }
SmaCCRHS >> defaultReduceAction [
	^#reduceFor:
]

{ #category : #accessing }
SmaCCRHS >> do: aBlock [
	collection do: aBlock
]

{ #category : #accessing }
SmaCCRHS >> firstTerminals [
	| items |
	collection isEmpty ifTrue: [^Set with: SmaCCSymbol empty].
	items := Set new.
	1 to: collection size
		do: 
			[:index | 
			items addAll: (collection at: index) firstTerminals.
			(items includes: SmaCCSymbol empty) 
				ifTrue: [index < collection size ifTrue: [items remove: SmaCCSymbol empty]]
				ifFalse: [^items]].
	^items
]

{ #category : #comparing }
SmaCCRHS >> hash [
	^self class hash bitXor: (collection hash bitShift: 14)
]

{ #category : #'initialize-release' }
SmaCCRHS >> initialize [
	collection := OrderedCollection new.
	reduceAction := nil.
	variableNames := Dictionary new
]

{ #category : #accessing }
SmaCCRHS >> nameLastItem: aString [ 
	variableNames at: aString put: collection size
]

{ #category : #'reduction table' }
SmaCCRHS >> parseTreeRewriter [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	1 to: self size
		do: 
			[:i | 
			rewriter replace: i printString storeString
				with: '(nodes at: ' , i printString , ')'].
	variableNames keysAndValuesDo: 
			[:key :value | 
			rewriter replace: key with: '(nodes at: ' , value printString , ')'].
	^rewriter
]

{ #category : #printing }
SmaCCRHS >> printOn: aStream [ 
	^collection do: [:each | each printOn: aStream]
		separatedBy: [aStream space]
]

{ #category : #accessing }
SmaCCRHS >> reduceAction [
	^reduceAction
]

{ #category : #accessing }
SmaCCRHS >> reduceAction: anObject [
	reduceAction := anObject
]

{ #category : #accessing }
SmaCCRHS >> size [
	^collection size
]
