"
SmaCCTerminalSymbol represents a terminal symbol in our grammar.

Instance Variables:
	createIdMethod	<Boolean>	should we create a symbolNameId method for this symbol.
	regularExpression	<SmaCCRegularExpression>	our regular expression that we must match for this terminal symbol
"
Class {
	#name : #SmaCCTerminalSymbol,
	#superclass : #SmaCCSymbol,
	#instVars : [
		'regularExpression',
		'createIdMethod'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #private }
SmaCCTerminalSymbol >> calculateFirstTerminals [
	^false
]

{ #category : #accessing }
SmaCCTerminalSymbol >> createIdMethod [
	^createIdMethod
]

{ #category : #accessing }
SmaCCTerminalSymbol >> createIdMethod: aBoolean [
	createIdMethod := aBoolean
]

{ #category : #testing }
SmaCCTerminalSymbol >> isTerminal [
	^true
]

{ #category : #'initialize-release' }
SmaCCTerminalSymbol >> name: aString [ 
	super name: aString.
	firstItems add: self.
	createIdMethod := false
]

{ #category : #accessing }
SmaCCTerminalSymbol >> regularExpression [
	^regularExpression
]

{ #category : #accessing }
SmaCCTerminalSymbol >> regularExpression: aSmaCCRegularExpressionNode [
	regularExpression := aSmaCCRegularExpressionNode
]

{ #category : #private }
SmaCCTerminalSymbol >> unsafeMethodName [
	^name copyFrom: 2 to: name size - 1
]
