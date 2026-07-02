"
SmaCCNonTerminalSymbol represents a non-terminal symbol in our grammar.

Instance Variables:
	productions	<SequenceableCollection of: SmaCCRHS>	our rhs' for the symbol
"
Class {
	#name : #SmaCCNonTerminalSymbol,
	#superclass : #SmaCCSymbol,
	#instVars : [
		'productions'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #accessing }
SmaCCNonTerminalSymbol >> addProduction: aSmaCCRHS [
	productions add: aSmaCCRHS
]

{ #category : #accessing }
SmaCCNonTerminalSymbol >> calculateFirstTerminals [
	| initialSize |
	initialSize := firstItems size.
	productions isEmpty 
		ifTrue: [firstItems add: self class empty]
		ifFalse: [productions do: [:each | firstItems addAll: each firstTerminals]].
	^initialSize ~= firstItems size
]

{ #category : #testing }
SmaCCNonTerminalSymbol >> isEmpty [
	^productions isEmpty
]

{ #category : #testing }
SmaCCNonTerminalSymbol >> isTerminal [
	^false
]

{ #category : #'initialize-release' }
SmaCCNonTerminalSymbol >> name: aString [ 
	super name: aString.
	productions := OrderedCollection new
]

{ #category : #accessing }
SmaCCNonTerminalSymbol >> positionOf: aSmaCCRHS [ 
	^productions indexOf: aSmaCCRHS
]

{ #category : #accessing }
SmaCCNonTerminalSymbol >> productionsDo: aBlock [ 
	productions do: aBlock
]

{ #category : #accessing }
SmaCCNonTerminalSymbol >> size [
	^productions size
]
