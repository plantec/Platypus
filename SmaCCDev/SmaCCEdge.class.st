"
SmaCCEdge represents a transition in a Finite Automata (directed graph). It is labeled with the characters or states (possibly none, indicating an epsilon transition) that cause the transition.

Instance Variables:
	toNode	<SmaCCNode>	The node that this is transitioning to.
	transitionObjects	<SortedCollection of: (Character | Symbol)>	The characters or symbols that cause the transition. Note that there are no duplicates and all characters/symbols are sorted.
"
Class {
	#name : #SmaCCEdge,
	#superclass : #Object,
	#instVars : [
		'toNode',
		'transitionObjects'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'instance creation' }
SmaCCEdge class >> to: aSmaCCNode on: aCollectionOrNil [ 
	| edge |
	edge := self new.
	edge to: aSmaCCNode on: aCollectionOrNil.
	^edge
]

{ #category : #comparing }
SmaCCEdge >> <= aSmaCCEdge [ 
	^true
]

{ #category : #comparing }
SmaCCEdge >> = aSmaCCEdge [ 
	self class = aSmaCCEdge class ifFalse: [^false].
	^self to = aSmaCCEdge to and: [self transitionObjects = aSmaCCEdge transitionObjects]
]

{ #category : #testing }
SmaCCEdge >> canMergeWith: aSmaCCEdge [ 
	^self class = aSmaCCEdge class
]

{ #category : #private }
SmaCCEdge >> does: aSequenceableCollection include: anObject [ 
	^aSequenceableCollection includes: anObject
]

{ #category : #compiling }
SmaCCEdge >> edgeFrequencyUsingTable: frequencyTable [ 
	^0
]

{ #category : #printing }
SmaCCEdge >> edgeLabel [
	^transitionObjects isNil 
		ifTrue: ['epsilon']
		ifFalse: 
			[transitionObjects inject: '' into: [:sum :each | sum , each printString]]
]

{ #category : #comparing }
SmaCCEdge >> hash [
	^(self to hash bitShift: 14) bitXor: transitionObjects hash
]

{ #category : #testing }
SmaCCEdge >> includes: anObject [ 
	^self does: transitionObjects include: anObject
]

{ #category : #testing }
SmaCCEdge >> isCharacterTransition [
	^false
]

{ #category : #testing }
SmaCCEdge >> isEmpty [
	^transitionObjects isEmpty
]

{ #category : #testing }
SmaCCEdge >> isEpsilonTransition [
	^transitionObjects isNil
]

{ #category : #accessing }
SmaCCEdge >> mergeWith: aSmaCCEdge [ 
	transitionObjects := Array 
				withAll: (transitionObjects , aSmaCCEdge transitionObjects) asSet 
						asSortedCollection
]

{ #category : #printing }
SmaCCEdge >> printOn: aStream [ 
	aStream
		nextPutAll: '---';
		nextPutAll: self edgeLabel;
		nextPutAll: '--->';
		nextPutAll: toNode printString
]

{ #category : #private }
SmaCCEdge >> remove: aCollection [ 
	transitionObjects := transitionObjects 
				reject: [:each | self does: aCollection include: each]
]

{ #category : #accessing }
SmaCCEdge >> to [
	^toNode
]

{ #category : #'initialize-release' }
SmaCCEdge >> to: aSmaCCNode [ 
	toNode := aSmaCCNode
]

{ #category : #'initialize-release' }
SmaCCEdge >> to: aSmaCCNode on: aStringOrNil [ 
	toNode := aSmaCCNode.
	transitionObjects := aStringOrNil
]

{ #category : #private }
SmaCCEdge >> transitionObjects [
	^transitionObjects
]
