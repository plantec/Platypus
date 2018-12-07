Class {
	#name : #PlatypusExpressInterpretorStackVar,
	#superclass : #PlatypusExpressInterpretorStackElement,
	#instVars : [
		'val'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackVar class >> interpretor: anInterpretor [ 
	^ self
		var: PltAnonymousVariable default
		val: PltMissingValue new
		interpretor: anInterpretor
]

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackVar class >> val: aValue interpretor: anInterpretor [ 
	^self 
		var: PltAnonymousVariable default
		val: aValue
		interpretor: anInterpretor
]

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackVar class >> var: aData val: aValue interpretor: anInterpretor [ 
	^ self new var: aData val: aValue interpretor: anInterpretor 
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackVar >> assign: aValue [ 
	| varDomain assigned |
	self interpretor checkAssignmentOf: aValue to: self var.
	varDomain := self var computedDomain.
	assigned := self interpretor valueFromDomain: varDomain assignCompatibleWith: aValue.
	^ self fastAssign: assigned
]

{ #category : #copying }
PlatypusExpressInterpretorStackVar >> deepCopy [
	| n |
	n := super deepCopy.
	n val: self val deepCopy.
	^ n
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackVar >> fastAssign: aValue [ 
	self val: aValue.
	^ aValue
]

{ #category : #accessing }
PlatypusExpressInterpretorStackVar >> val [
	val ifNotNil: [
		val isPltValue
			ifFalse: [val acceptTry: self interpretor.
				val := self interpretor popVal]].
	^ val
]

{ #category : #accessing }
PlatypusExpressInterpretorStackVar >> val: anObject [ 
	val := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackVar >> var: aData val: aValue interpretor: anInterpretor [ 
	super var: aData interpretor: anInterpretor.
	self val: aValue
]

{ #category : #copying }
PlatypusExpressInterpretorStackVar >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n val: self val veryDeepCopy.
	^ n
]
