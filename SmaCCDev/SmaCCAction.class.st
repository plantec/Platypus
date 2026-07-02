"
SmaCCAction is an abstract class that represents an action in the LR parsing table.

Subclasses must implement the following messages:
	accessing
		id
"
Class {
	#name : #SmaCCAction,
	#superclass : #Object,
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #accessing }
SmaCCAction >> id [
	^self subclassResponsibility
]

{ #category : #testing }
SmaCCAction >> isReduce [
	^false
]

{ #category : #testing }
SmaCCAction >> isShift [
	^false
]
