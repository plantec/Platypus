"
SmaCCRegularExpressionNode represents a regular expression. The scanner is represented by a regular expression. These are the initial objects created in producing the scanner. From these nodes, we create a directed graph and then we compile the graph.

Subclasses must implement the following messages:
	accessing
		possibleMatchesSize
	private
		asNFAStartingWith:
		possibleMatchesDo:on:

Instance Variables:
	action	<SequenceableCollection>	the actions to be performed when we find a match
	position	<Integer>	the position of the RE in the scanner. If we have multiple matches, we prefer the ones listed first.
"
Class {
	#name : #SmaCCRegularExpressionNode,
	#superclass : #Object,
	#instVars : [
		'action',
		'position',
		'states'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #accessing }
SmaCCRegularExpressionNode >> , aSmaCCRegularExpressionNode [ 
	^SmaCCSequenceRENode 
		nodes: (OrderedCollection with: self with: aSmaCCRegularExpressionNode)
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> action [
	^action
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> action: aString [
	action := aString
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> addState: aSymbol [
	states add: aSymbol
]

{ #category : #private }
SmaCCRegularExpressionNode >> addStateTransitionsTo: aSmaCCNode [ 
	| endNode |
	states isEmpty ifTrue: [^aSmaCCNode].
	endNode := SmaCCNode new.
	aSmaCCNode addEdgeTo: endNode onStates: states asSortedCollection asArray.
	^endNode
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> addStates: aCollection [ 
	states addAll: aCollection
]

{ #category : #converting }
SmaCCRegularExpressionNode >> asDFA [
	| startNode |
	startNode := SmaCCNode new.
	self asNFAStartingWith: startNode.
	^startNode asDFA
]

{ #category : #private }
SmaCCRegularExpressionNode >> asNFAStartingWith: aSmaCCNode [ 
	^self subclassResponsibility
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> initialize [
	states := Set new
]

{ #category : #testing }
SmaCCRegularExpressionNode >> isKeywordLiteral [
	^self possibleMatchesSize < 50 and: 
			[self possibleMatchesDo: [:each | each size > 1 ifTrue: [^true]].
			false]
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> position [
	^position
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> position: anInteger [
	position := anInteger
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatches [
	| matches |
	matches := OrderedCollection new.
	self possibleMatchesDo: [:each | matches add: each].
	^matches
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatchesDo: aBlock [ 
	| stream |
	stream := WriteStream with: String new.
	self possibleMatchesDo: [aBlock value: stream contents] on: stream
]

{ #category : #private }
SmaCCRegularExpressionNode >> possibleMatchesDo: aBlock on: aStream [ 
	self subclassResponsibility
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatchesSize [
	^self subclassResponsibility
]

{ #category : #copying }
SmaCCRegularExpressionNode >> postCopy [
	super postCopy.
	states := Set new
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> repeat [
	^SmaCCRepeatingRENode component: self
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> repeatFor: minimum to: maximum [ 
	^SmaCCRepeatingRENode 
		component: self
		minimum: minimum
		maximum: maximum
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> repeatForAtLeast: minimum [ 
	^SmaCCRepeatingRENode component: self minimum: minimum
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> states [
	^states
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> | aSmaCCRegularExpressionNode [ 
	^SmaCCOrRENode 
		nodes: (OrderedCollection with: self with: aSmaCCRegularExpressionNode)
]
