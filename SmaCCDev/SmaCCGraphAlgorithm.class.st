"
SmaCCGraphAlgorithm is an abstract class that has support for the graph transformation algorithms.


"
Class {
	#name : #SmaCCGraphAlgorithm,
	#superclass : #Object,
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #nodes }
SmaCCGraphAlgorithm >> createMergedNodeFrom: nodeCollection [ 
	| newNode |
	newNode := SmaCCNode new.
	self mergeTransitionsFrom: nodeCollection into: newNode.
	self mergeActionsFrom: nodeCollection into: newNode.
	^newNode
]

{ #category : #'initialize-release' }
SmaCCGraphAlgorithm >> initialize [
]

{ #category : #nodes }
SmaCCGraphAlgorithm >> mergeActionsFrom: nodeCollection into: aSmaCCNode [ 
	nodeCollection do: [:each | aSmaCCNode addActions: each action]
]

{ #category : #nodes }
SmaCCGraphAlgorithm >> mergeTransitionsFrom: nodeCollection into: aSmaCCNode [ 
	| transitions |
	transitions := Set new.
	nodeCollection 
		do: [:each | each transitions do: [:edge | transitions add: edge copy]].
	aSmaCCNode transitions: transitions.
	aSmaCCNode mergeTransitions
]
