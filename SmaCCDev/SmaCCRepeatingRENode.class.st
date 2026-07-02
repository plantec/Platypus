"
SmaCCRepeatingRENode represents a repeating node in a regular expression.

Instance Variables:
	maximumMatches	<Integer>	the minimum number of matches required
	minimumMatches	<Integer>	the maximum number of matches allowed. An infinite amount of matches is represented by (SmaCCRepeatingRENode finiteInfinity).
	node	<SmaCCRegularExpressionNode>	what we need to match
"
Class {
	#name : #SmaCCRepeatingRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'node',
		'minimumMatches',
		'maximumMatches'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode [ 
	^self component: aSmaCCRegularExpressionNode minimum: 0
]

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode minimum: anInteger [ 
	^self 
		component: aSmaCCRegularExpressionNode
		minimum: anInteger
		maximum: self finiteInfinity
]

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode minimum: minInteger maximum: maxInteger [ 
	^(self new)
		component: aSmaCCRegularExpressionNode
			minimum: minInteger
			maximum: maxInteger;
		yourself
]

{ #category : #constants }
SmaCCRepeatingRENode class >> finiteInfinity [
	"The number that we consider to be 'infinite'"

	^2147483648
]

{ #category : #private }
SmaCCRepeatingRENode >> asNFAStartingWith: aSmaCCNode [ 
	| endNode start |
	start := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	minimumMatches timesRepeat: [start := node asNFAStartingWith: start].
	start addEdgeTo: endNode.
	maximumMatches < self class finiteInfinity 
		ifTrue: 
			[maximumMatches - minimumMatches timesRepeat: 
					[start := node asNFAStartingWith: start.
					start addEdgeTo: endNode]]
		ifFalse: [(node asNFAStartingWith: start) addEdgeTo: start].
	^endNode
]

{ #category : #'initialize-release' }
SmaCCRepeatingRENode >> component: aSmaCCRegularExpressionNode minimum: minInteger maximum: maxInteger [ 
	node := aSmaCCRegularExpressionNode.
	minimumMatches := minInteger.
	maximumMatches := maxInteger
]

{ #category : #private }
SmaCCRepeatingRENode >> possibleMatchesDo: aBlock on: aStream [ 
	self 
		possibleMatchesDo: aBlock
		on: aStream
		startingAt: 0
]

{ #category : #private }
SmaCCRepeatingRENode >> possibleMatchesDo: aBlock on: aStream startingAt: anInteger [ 
	(anInteger between: minimumMatches and: maximumMatches) 
		ifTrue: [aBlock value].
	anInteger < maximumMatches 
		ifTrue: 
			[node possibleMatchesDo: 
					[self 
						possibleMatchesDo: aBlock
						on: aStream
						startingAt: anInteger + 1]
				on: aStream]
]

{ #category : #accessing }
SmaCCRepeatingRENode >> possibleMatchesSize [
	^node possibleMatchesSize * (maximumMatches - minimumMatches + 1)
]

{ #category : #printing }
SmaCCRepeatingRENode >> printOn: aStream [ 
	node printOn: aStream.
	maximumMatches = (1 bitShift: 31) 
		ifTrue: 
			[minimumMatches = 0 ifTrue: [^aStream nextPut: $*].
			minimumMatches = 1 ifTrue: [^aStream nextPut: $+].
			^aStream
				nextPut: ${;
				nextPutAll: minimumMatches printString;
				nextPutAll: ',}'].
	aStream
		nextPut: ${;
		nextPutAll: minimumMatches printString;
		nextPut: $,;
		nextPutAll: maximumMatches printString;
		nextPut: $}
]
