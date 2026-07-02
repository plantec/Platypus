"
SmaCCDuplicateNodeEliminator removes duplicate nodes in a SmaCCNode graph.

Instance Variables:
	comparisonState	<Dictionary>	dictionary mapping equivalent nodes
	root	<SmaCCNode>	the root of the graph


"
Class {
	#name : #SmaCCDuplicateNodeEliminator,
	#superclass : #SmaCCGraphAlgorithm,
	#instVars : [
		'comparisonState',
		'root'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #accessing }
SmaCCDuplicateNodeEliminator class >> removeDuplicateNodesIn: aSmaCCNode [ 
	^self new removeDuplicateNodesIn: aSmaCCNode
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> isNode: firstSmaCCNode equivalentTo: secondSmaCCNode [ 
	| firstTransitions secondTransitions |
	firstSmaCCNode = secondSmaCCNode ifTrue: [^true].
	firstSmaCCNode transitions size = secondSmaCCNode transitions size 
		ifFalse: [^false].
	firstSmaCCNode action = secondSmaCCNode action ifFalse: [^false].
	((comparisonState at: firstSmaCCNode ifAbsent: [#()]) 
		includes: secondSmaCCNode) ifTrue: [^true].
	(comparisonState at: firstSmaCCNode ifAbsentPut: [Set new]) 
		add: secondSmaCCNode.
	(comparisonState at: secondSmaCCNode ifAbsentPut: [Set new]) 
		add: firstSmaCCNode.
	firstTransitions := firstSmaCCNode transitions 
				asSortedCollection: [:a :b | a transitionObjects first <= b transitionObjects first].
	secondTransitions := secondSmaCCNode transitions 
				asSortedCollection: [:a :b | a transitionObjects first <= b transitionObjects first].
	firstTransitions with: secondTransitions
		do: 
			[:first :second | 
			first transitionObjects = second transitionObjects ifFalse: [^false].
			(self isNode: first to equivalentTo: second to) ifFalse: [^false]].
	^true
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> mergeAllTransitions [
	root allStates do: [:each | each mergeTransitions]
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> pairsDo: aBlock [ 
	| nodes |
	nodes := root allStates asOrderedCollection.
	1 to: nodes size - 1
		do: 
			[:i | 
			i + 1 to: nodes size
				do: [:j | aBlock value: (nodes at: i) value: (nodes at: j)]]
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> removeDuplicateNodesIn: aSmaCCNode [ 
	root := aSmaCCNode.
	self removeDuplicates.
	^root
]

{ #category : #algorithm }
SmaCCDuplicateNodeEliminator >> removeDuplicates [
	| changed iterations |
	changed := true.
	iterations := root allStates size.
	[changed and: [iterations > 0]] whileTrue: 
			[changed := false.
			iterations := iterations - 1.
			self mergeAllTransitions.
			self pairsDo: 
					[:firstNode :secondNode | 
					comparisonState := Dictionary new.
					(self isNode: firstNode equivalentTo: secondNode) 
						ifTrue: 
							[firstNode mergeWith: secondNode.
							changed := true]]]
]
