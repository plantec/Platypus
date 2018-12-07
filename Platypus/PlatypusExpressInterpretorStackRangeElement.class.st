Class {
	#name : #PlatypusExpressInterpretorStackRangeElement,
	#superclass : #PlatypusExpressInterpretorStackElement,
	#instVars : [
		'aggr',
		'range'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackRangeElement class >> var: aData aggr: anAggregateData range: anInterval interpretor: anInterpretor [ 
	^ self new
		var: aData
		aggr: anAggregateData
		range: anInterval
		interpretor: anInterpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> aggr [
	^aggr
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> aggr: anObject [
	aggr := anObject
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackRangeElement >> assign: aValue [ 
	| varDomain assigned |
	self interpretor checkAssignmentOf: aValue to: self var.
	varDomain := self var computedDomain.
	assigned := self interpretor valueFromDomain: varDomain assignCompatibleWith: aValue.
	^ self fastAssign: assigned
]

{ #category : #copying }
PlatypusExpressInterpretorStackRangeElement >> deepCopy [
	| n |
	n := super deepCopy.
	n aggr: self aggr deepCopy.
	^ n
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> fastAssign: aValue [ 
	self aggr range: range put: aValue interpretor: self interpretor.
	^ aValue
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackRangeElement >> pushIndex: anInteger [ 
	| elementDomain anonymousVar |
	elementDomain := self var computedDomain elementType.
	anonymousVar := PltAnonymousVariable domain: elementDomain.
	self
		pushVar: anonymousVar
		aggr: self aggr
		index: range first + anInteger - 1

]

{ #category : #interpreting }
PlatypusExpressInterpretorStackRangeElement >> pushRange: anInterval [ 
	self
		pushVar: self var
		aggr: self aggr
		range: (range first + anInterval first - 1 to: anInterval last + range first - 1)
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> range [
	^range
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> range: anObject [
	range := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> val [
	| rng |
	self aggr isPltArrayInstance
		ifTrue: [rng := (self aggr: self aggr positionFromIndex: range first)
						to: (self aggr: self aggr positionFromIndex: range last)]
		ifFalse: [rng := range].
	^ self aggr range: rng interpretor: self interpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorStackRangeElement >> var: aData aggr: anAggregateData range: anInterval interpretor: anInterpretor [ 
	super var: aData interpretor: anInterpretor.
	self aggr: anAggregateData.
	self range: anInterval
]

{ #category : #copying }
PlatypusExpressInterpretorStackRangeElement >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n aggr: self aggr veryDeepCopy.
	^ n
]
