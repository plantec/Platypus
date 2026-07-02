"
SmaCCRejectAction represents a reject action in the parsing tables.
"
Class {
	#name : #SmaCCRejectAction,
	#superclass : #SmaCCAction,
	#classVars : [
		'Reject'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'class initialization' }
SmaCCRejectAction class >> initialize [
	Reject := self basicNew
]

{ #category : #'instance creation' }
SmaCCRejectAction class >> new [
	^Reject
]

{ #category : #'class initialization' }
SmaCCRejectAction class >> releaseObjects [
	Reject := nil
]

{ #category : #accessing }
SmaCCRejectAction >> id [
	^2r11
]
