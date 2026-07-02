"
SmaCCReduceAction represents a reduce action in our parser's table.

Instance Variables:
	rhs	<SmaCCRHS>	the rhs that is being reduced
	symbol	<SmaCCNonTerminalSymbol>	the symbol that has the rhs
"
Class {
	#name : #SmaCCReduceAction,
	#superclass : #SmaCCAction,
	#instVars : [
		'symbol',
		'rhs'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'instance creation' }
SmaCCReduceAction class >> symbol: aSmaCCSymbol rhs: aSmaCCRHS [ 
	^(self new)
		symbol: aSmaCCSymbol rhs: aSmaCCRHS;
		yourself
]

{ #category : #accessing }
SmaCCReduceAction >> id [
	^2r10
]

{ #category : #testing }
SmaCCReduceAction >> isReduce [
	^true
]

{ #category : #accessing }
SmaCCReduceAction >> rhs [
	^rhs
]

{ #category : #accessing }
SmaCCReduceAction >> size [
	^rhs size
]

{ #category : #accessing }
SmaCCReduceAction >> symbol [
	^symbol
]

{ #category : #'initialize-release' }
SmaCCReduceAction >> symbol: aSmaCCSymbol rhs: aSmaCCRHS [
	rhs := aSmaCCRHS.
	symbol := aSmaCCSymbol
]
