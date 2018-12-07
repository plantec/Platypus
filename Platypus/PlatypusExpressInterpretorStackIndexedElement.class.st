Class {
	#name : #PlatypusExpressInterpretorStackIndexedElement,
	#superclass : #PlatypusExpressInterpretorStackElement,
	#instVars : [
		'aggr',
		'idx'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackIndexedElement class >> var: aData aggr: anAggregateData idx: anInteger interpretor: anInterpretor [ 
	^ self new
		var: aData
		aggr: anAggregateData
		idx: anInteger
		interpretor: anInterpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> aggr [
	^aggr
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> aggr: anObject [
	aggr := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> aggrPosition [
	^ self aggrPositionFromIndex: self idx
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> aggrPositionFromIndex: anInteger [ 
	^ self aggr: self aggr positionFromIndex: anInteger
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackIndexedElement >> assign: aValue [ 
	| varDomain assigned |
	self interpretor checkAssignmentOf: aValue to: self var.
	varDomain := self var computedDomain.
	assigned := self interpretor valueFromDomain: varDomain assignCompatibleWith: aValue.
	^ self fastAssign: assigned
]

{ #category : #copying }
PlatypusExpressInterpretorStackIndexedElement >> deepCopy [
	| n |
	n := super deepCopy.
	n aggr: self aggr deepCopy.
	^ n
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackIndexedElement >> fastAssign: aValue [ 
	self aggr at: idx put: aValue.
	^ aValue
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> idx [
	^idx
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> idx: anObject [
	idx := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> val [
	^ self aggr at: self aggrPosition
]

{ #category : #accessing }
PlatypusExpressInterpretorStackIndexedElement >> var: aData aggr: anAggregateData idx: anInteger interpretor: anInterpretor [ 
	super var: aData interpretor: anInterpretor.
	self aggr: anAggregateData.
	self idx: anInteger
]

{ #category : #copying }
PlatypusExpressInterpretorStackIndexedElement >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n aggr: self aggr veryDeepCopy.
	^ n
]
