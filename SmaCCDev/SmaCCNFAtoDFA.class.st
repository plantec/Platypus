"
SmaCCNFAtoDFAAlgorithm converts an NFA without epsilon transitions into a DFA. If a node contains edges that lead to multiple nodes for the same character, then a new state is created that merges all states for the given character. 

Instance Variables:
	mergedStates	<Dictionary>	dictionary that maps a collection of states to the resulting merged state

"
Class {
	#name : #SmaCCNFAtoDFA,
	#superclass : #SmaCCGraphAlgorithm,
	#instVars : [
		'mergedStates'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #accessing }
SmaCCNFAtoDFA class >> convertToDFA: aSmaCCNode [ 
	"Returns an equivalent DFA from the NFA specified by aSmaCCNode -- the NFA must not contain epsilon edges."

	^self new convertToDFA: aSmaCCNode
]

{ #category : #'private-edges' }
SmaCCNFAtoDFA >> commonTransitionObjectsForEdges: edgeCollection [ 
	^edgeCollection inject: edgeCollection first transitionObjects
		into: [:sum :each | sum select: [:char | each includes: char]]
]

{ #category : #algorithm }
SmaCCNFAtoDFA >> convertToDFA: aSmaCCNode [ 
	^self mergedNodeFor: (Array with: aSmaCCNode)
]

{ #category : #'private-edges' }
SmaCCNFAtoDFA >> createEdgeMerging: conflictingEdgeCollection [ 
	| newNode common newEdge |
	newNode := self 
				mergedNodeFor: (conflictingEdgeCollection collect: [:each | each to]).
	common := self commonTransitionObjectsForEdges: conflictingEdgeCollection.
	newEdge := conflictingEdgeCollection first class to: newNode on: common.
	conflictingEdgeCollection do: [:each | each remove: common].
	^newEdge
]

{ #category : #'private-merging nodes' }
SmaCCNFAtoDFA >> eliminateDuplicateTransitionsIn: aSmaCCNode [ 
	| newTransitions conflictingObject |
	newTransitions := aSmaCCNode transitions collect: [:each | each copy].
	
	[conflictingObject := self someDuplicateIn: newTransitions.
	conflictingObject notNil] 
			whileTrue: 
				[| conflictingEdges newEdge |
				conflictingEdges := newTransitions 
							select: [:each | each includes: conflictingObject].
				newEdge := self createEdgeMerging: conflictingEdges.
				newTransitions add: newEdge].
	self setTransitionsOn: aSmaCCNode to: newTransitions
]

{ #category : #'initialize-release' }
SmaCCNFAtoDFA >> initialize [
	super initialize.
	mergedStates := Dictionary new
]

{ #category : #'private-merging nodes' }
SmaCCNFAtoDFA >> mergedNodeFor: nodeCollection [ 
	| mergedNodes |
	mergedNodes := nodeCollection asSortedCollection asArray.
	^mergedStates at: mergedNodes
		ifAbsent: 
			[| newNode |
			newNode := self createMergedNodeFrom: mergedNodes.
			mergedStates
				at: mergedNodes put: newNode;
				at: (Array with: newNode) put: newNode.
			self eliminateDuplicateTransitionsIn: newNode.
			newNode]
]

{ #category : #'private-edges' }
SmaCCNFAtoDFA >> setTransitionsOn: aSmaCCNode to: edgeCollection [ 
	aSmaCCNode transitions: (edgeCollection reject: [:each | each isEmpty]).
	aSmaCCNode transitions do: [:each | each to: (self convertToDFA: each to)]
]

{ #category : #'private-edges' }
SmaCCNFAtoDFA >> someDuplicateIn: edgeCollection [ 
	| objects |
	objects := Set new.
	edgeCollection do: 
			[:edge | 
			edge transitionObjects do: [:each | (objects includes: each) ifTrue: [^each]].
			objects addAll: edge transitionObjects].
	^nil
]
