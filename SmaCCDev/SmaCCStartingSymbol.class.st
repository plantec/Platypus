"
SmaCCStartingSymbol is the starting symbol in the grammar. A grammar can only have one starting symbol, but it can have may different starting item sets.
"
Class {
	#name : #SmaCCStartingSymbol,
	#superclass : #SmaCCNonTerminalSymbol,
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #accessing }
SmaCCStartingSymbol >> asLRItemSet [
	| itemSet |
	itemSet := SmaCCItemSet new.
	productions do: 
			[:each | 
			itemSet add: (SmaCCLR1Item 
						symbol: self
						rhs: each
						follow: ((SmaCCSymbolSet new)
								add: self class empty;
								yourself))].
	^itemSet
]

{ #category : #accessing }
SmaCCStartingSymbol >> compileName [
	^(productions first at: 1) safeMethodName
]

{ #category : #testing }
SmaCCStartingSymbol >> isStartingSymbol [
	^true
]
