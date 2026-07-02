"
SmaCCShiftAction represents a shift action in the parser's tables.
"
Class {
	#name : #SmaCCShiftAction,
	#superclass : #SmaCCAction,
	#classVars : [
		'Shift'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'class initialization' }
SmaCCShiftAction class >> initialize [
	Shift := self basicNew
]

{ #category : #'instance creation' }
SmaCCShiftAction class >> new [
	^Shift
]

{ #category : #'class initialization' }
SmaCCShiftAction class >> releaseObjects [
	Shift := nil
]

{ #category : #accessing }
SmaCCShiftAction >> id [
	^2r01
]

{ #category : #testing }
SmaCCShiftAction >> isShift [
	^true
]
