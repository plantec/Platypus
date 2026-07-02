"
SmaCCSymbol is an abstract class that represents a symbol in the grammar.

Subclasses must implement the following messages:
	accessing
		calculateFirstTerminals
	testing
		isTerminal

Instance Variables:
	firstItems	<Collection of: SmaCCTerminalSymbol>	the first terminals that can be produced from us
	name	<String>	our name
	precedence	<Integer>	our precedence (in case of shift/reduce conflicts)


"
Class {
	#name : #SmaCCSymbol,
	#superclass : #Object,
	#instVars : [
		'name',
		'precedence',
		'firstItems'
	],
	#classVars : [
		'EmptySymbol',
		'ErrorSymbol',
		'SentinelSymbol'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'instance creation' }
SmaCCSymbol class >> empty [
	EmptySymbol isNil 
		ifTrue: [EmptySymbol := SmaCCTerminalSymbol name: 'E O F'].
	^EmptySymbol
]

{ #category : #'instance creation' }
SmaCCSymbol class >> error [
	ErrorSymbol isNil 
		ifTrue: [ErrorSymbol := SmaCCTerminalSymbol name: 'error'].
	^ErrorSymbol
]

{ #category : #'instance creation' }
SmaCCSymbol class >> name: aString [ 
	^(self new)
		name: aString;
		yourself
]

{ #category : #'instance creation' }
SmaCCSymbol class >> releaseObjects [
	EmptySymbol := nil.
	SentinelSymbol := nil.
	ErrorSymbol := nil
]

{ #category : #'instance creation' }
SmaCCSymbol class >> sentinel [
	SentinelSymbol isNil 
		ifTrue: [SentinelSymbol := SmaCCTerminalSymbol name: 'S e n t i n e l'].
	^SentinelSymbol
]

{ #category : #accessing }
SmaCCSymbol >> calculateFirstTerminals [
	^self subclassResponsibility
]

{ #category : #accessing }
SmaCCSymbol >> createIdMethod [
	^false
]

{ #category : #accessing }
SmaCCSymbol >> firstTerminals [
	^firstItems
]

{ #category : #accessing }
SmaCCSymbol >> isEmptySymbol [
	^self = self class empty
]

{ #category : #testing }
SmaCCSymbol >> isStartingSymbol [
	^false
]

{ #category : #testing }
SmaCCSymbol >> isTerminal [
	^self subclassResponsibility
]

{ #category : #accessing }
SmaCCSymbol >> name [
	^name
]

{ #category : #'initialize-release' }
SmaCCSymbol >> name: aString [ 
	name := aString.
	firstItems := Set new
]

{ #category : #accessing }
SmaCCSymbol >> precedence [
	^precedence
]

{ #category : #accessing }
SmaCCSymbol >> precedence: anInteger [
	precedence := anInteger
]

{ #category : #printing }
SmaCCSymbol >> printOn: aStream [ 
	aStream nextPutAll: name
]

{ #category : #accessing }
SmaCCSymbol >> productionsDo: aBlock [
]

{ #category : #accessing }
SmaCCSymbol >> regularExpression [
	^nil
]

{ #category : #accessing }
SmaCCSymbol >> safeMethodName [
	^self unsafeMethodName 
		collect: [:each | each isAlphaNumeric ifTrue: [each] ifFalse: [$X]]
]

{ #category : #accessing }
SmaCCSymbol >> size [
	^0
]

{ #category : #private }
SmaCCSymbol >> unsafeMethodName [
	^self printString
]
