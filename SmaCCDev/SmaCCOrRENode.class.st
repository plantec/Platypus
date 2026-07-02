"
SmaCCOrRENode is a SmaCCRegularExpressionNode that represents an alternative.

Instance Variables:
	nodes	<Collection of: SmaCCRegularExpressionNode>	our possible choices
"
Class {
	#name : #SmaCCOrRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'nodes'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'instance creation' }
SmaCCOrRENode class >> nodes: aCollection [ 
	^(self new)
		nodes: aCollection;
		yourself
]

{ #category : #private }
SmaCCOrRENode >> asNFAStartingWith: aSmaCCNode [ 
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	nodes do: 
			[:each | 
			| componentStart |
			componentStart := SmaCCNode new.
			startNode addEdgeTo: componentStart.
			(each asNFAStartingWith: componentStart) addEdgeTo: endNode].
	^endNode
]

{ #category : #'initialize-release' }
SmaCCOrRENode >> nodes: aCollection [ 
	nodes := aCollection
]

{ #category : #private }
SmaCCOrRENode >> possibleMatchesDo: aBlock on: aStream [ 
	nodes do: 
			[:each | 
			| pos |
			pos := aStream position.
			each possibleMatchesDo: aBlock on: aStream.
			aStream position: pos]
]

{ #category : #accessing }
SmaCCOrRENode >> possibleMatchesSize [
	^nodes inject: 0 into: [:sum :each | sum + each possibleMatchesSize]
]

{ #category : #copying }
SmaCCOrRENode >> postCopy [
	super postCopy.
	nodes := nodes copy
]

{ #category : #printing }
SmaCCOrRENode >> printOn: aStream [ 
	aStream nextPut: $(.
	nodes do: [:each | each printOn: aStream]
		separatedBy: [aStream nextPutAll: ' | '].
	aStream nextPut: $)
]

{ #category : #accessing }
SmaCCOrRENode >> | aSmaCCRegularExpressionNode [ 
	self action = aSmaCCRegularExpressionNode action 
		ifFalse: [^super | aSmaCCRegularExpressionNode].
	nodes add: aSmaCCRegularExpressionNode.
	^self
]
