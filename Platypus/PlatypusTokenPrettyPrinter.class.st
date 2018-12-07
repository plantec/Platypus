Class {
	#name : #PlatypusTokenPrettyPrinter,
	#superclass : #Object,
	#instVars : [
		'delimLevel',
		'sourceTokenList',
		'resultTokenList',
		'startNode',
		'stopNode',
		'textFont',
		'maxLineWidth',
		'currentNode',
		'eolPrinted',
		'currentLevel',
		'currentLineno',
		'currentLine'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptAssign: n [ 
	self acceptOperator: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptBuiltinFunction: n [ 

	self acceptKeyword: n.

]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptBuiltinProcedure: n [ 
	self acceptKeyword: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptCloseDelim: n [ 
	currentLevel := currentLevel - 1.
	delimLevel := delimLevel - 1.
	self acceptToken: n.
	(n is: #'*}') ifTrue: [self printEol] ifFalse: [
	self printWhiteSpace]
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptCloseKeyword: n [ 
	currentLevel := currentLevel - 1.
	self acceptToken: n.
	self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptDelim: n [ 
	self acceptToken: n.
	self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptDomain: n [ 
	self acceptToken: n.
		self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptEol: n [ 
	currentLine dumpOn: resultTokenList.
	eolPrinted := eolPrinted + 1.
	currentLineno := currentLineno + 1.
	currentLine reset
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptIdentifier: n [ 
	| printit nextNode prevNonBlank prevOpen |
	prevNonBlank := sourceTokenList previousNonBlankFrom: currentNode previous.
	(prevNonBlank notNil
			and: [prevNonBlank is: #of])
		ifTrue: [prevOpen := sourceTokenList previousOpenKeywordFrom: prevNonBlank.
			(prevOpen notNil
					and: [prevOpen is: #case])
				ifTrue: [self printEol]].
	self acceptToken: n.
	printit := true.
	(nextNode := currentNode next) notNil
		ifTrue: [(nextNode is: ']' asSymbol)
				ifTrue: [printit := false]].
	printit
		ifTrue: [self printWhiteSpace]
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptIndent: n [ 
	currentLine add: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptKeyword: n [ 
	| prevKeyword |
	(n is: #(#subtype #abstract #realization))
		ifTrue: [self printEol]
		ifFalse: [(n is: #supertype)
				ifTrue: [prevKeyword := sourceTokenList previousKeywordFrom: currentNode previous.
					(prevKeyword is: #abstract)
						ifFalse: [self printEol]]].
	self acceptToken: n.
	self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptLiteral: n [ 
	| prevNonBlank prevOpen |
	(prevNonBlank := sourceTokenList previousNonBlankFrom: currentNode previous)
		ifNotNil: [(prevNonBlank is: #of)
				ifTrue: [prevOpen := sourceTokenList previousOpenKeywordFrom: prevNonBlank.
					(prevOpen is: #case)
						ifTrue: [self printEol]]].
	self acceptToken: n.
	self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptLogical: n [ 
	self acceptLiteral: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptNumber: n [ 
	self acceptLiteral: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptOpenDelim: n [ 
	self acceptToken: n.
	self printWhiteSpace.
	currentLevel := currentLevel + 1.
	delimLevel := delimLevel + 1
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptOperator: n [ 
	self acceptToken: n. self printWhiteSpace
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptPlus: n [ 
	(currentNode previous notNil
			and: [currentNode previous  isString])
		ifTrue: [(currentNode previous  lexicalElement endsWith: '\n''')
				ifTrue: [self printEol].
			(currentNode previous  lexicalElement endsWith: '\n\n''')
				ifTrue: [self printEol]].
	self acceptOperator: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptRemark: n [ 
	self acceptToken: n
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptSemicolon: n [ 
	self acceptToken: n.
	delimLevel == 0
		ifTrue: [self printEol] ifFalse: [self printWhiteSpace]
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptString: n [ 
	self acceptLiteral: n.

]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptTailRemark: n [ 
	| printspace |
	printspace := true.
	((currentNode previous notNil
				and: [currentNode previous isRemark])
			or: [currentNode next notNil
					and: [currentNode next  isRemark]])
		ifTrue: [self printEol.
			printspace := false].
	printspace
		ifTrue: [self printWhiteSpace].
	self acceptToken: n.
	(currentNode next notNil
			and: [currentNode next  isTailRemark])
		ifFalse: [self printEol]
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptToken: n [ 
	currentLine add: n level: currentLevel
]

{ #category : #visiting }
PlatypusTokenPrettyPrinter >> acceptWhiteSpace: n [ 
	currentLine add: n
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrint [
	| node |
	node := startNode.
	[node isNil
		ifFalse: [self prettyPrintNode: node].
	(node isNil
			or: [node == stopNode])
		ifTrue: [currentLine isEmpty
				ifFalse: [currentLine dumpOn: resultTokenList.
					resultTokenList tokens removeLast].
			^ resultTokenList].
	node := node next] repeat
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrint: aTokenList [ 
	^ self
		prettyPrint: aTokenList
		font: nil
		maxLineWidth: nil
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrint: aTokenList font: aFont maxLineWidth: aSize [ 
	^ self
		prettyPrint: aTokenList
		from: aTokenList first
		to: aTokenList last
		font: aFont
		maxLineWidth: aSize
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrint: aTokenList from: aStartNode to: aStopNode font: aFont maxLineWidth: aSize [ 
^ self prettyPrint: aTokenList from: aStartNode to: aStopNode startLevel: 0 font: aFont maxLineWidth: aSize 

]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrint: aTokenList from: aStartNode to: aStopNode startLevel: anInteger font: aFont maxLineWidth: aSize [ 
	sourceTokenList := aTokenList isNil 
				ifTrue: [PlatypusTokenList new]
				ifFalse: [aTokenList copyWithoutBlankFrom: aStartNode to: aStopNode].
	resultTokenList := sourceTokenList copyEmpty.
	startNode := sourceTokenList first.
	stopNode := sourceTokenList last.
	textFont := aFont.
	maxLineWidth := aSize.
	currentLevel := anInteger.
	delimLevel := 0.
	currentLineno := 1.
	eolPrinted := 0.
	currentLine := PlatypusSourceLine 
				font: aFont
				maxWidth: aSize
				level: currentLevel.
	^self prettyPrint
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> prettyPrintNode: aTokenListNode [ 
	currentNode := aTokenListNode.
	aTokenListNode  accept: self
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> printEol [
	| printit |
	printit := true.
	currentNode next notNil
		ifTrue: [(currentNode next  isTailRemark
					and: [currentNode  isTailRemark not])
				ifTrue: [printit := false]].
	printit
		ifTrue: [PlatypusEolToken new accept: self]
]

{ #category : #'pretty printing' }
PlatypusTokenPrettyPrinter >> printWhiteSpace [
	| printit nextNode |
	printit := true.
	(nextNode := currentNode next)
		ifNil: [printit := false]
		ifNotNil: [(nextNode is: (#(';' ',' '.' '\' ) collect: [:e | e asSymbol]) )
				ifTrue: [printit := false]].
	(currentNode is: (#('.' '\' ) collect: [:e | e asSymbol]))
		ifTrue: [printit := false].
	printit
		ifTrue: [PlatypusOneWhiteSpaceToken new accept: self]
]
