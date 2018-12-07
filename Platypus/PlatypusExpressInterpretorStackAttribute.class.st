Class {
	#name : #PlatypusExpressInterpretorStackAttribute,
	#superclass : #PlatypusExpressInterpretorStackElement,
	#instVars : [
		'record',
		'pos'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackAttribute class >> var: aData record: aRecord pos: anInteger interpretor: anInterpretor [ 
	^ self new
		var: aData
		record: aRecord
		pos: anInteger
		interpretor: anInterpretor
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackAttribute >> assign: aValue [ 
	| varDomain assigned |
	self interpretor checkAssignmentOf: aValue to: self var.
	varDomain := self var computedDomain.
	self interpretor asValOfSelf:  record while: [
	assigned := self interpretor valueFromDomain: varDomain assignCompatibleWith: aValue].
	^ self fastAssign: assigned
]

{ #category : #copying }
PlatypusExpressInterpretorStackAttribute >> deepCopy [
	| n |
	n := super deepCopy.
	n record: self record deepCopy.
	^ n
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackAttribute >> fastAssign: aValue [ 
	self record parameters at: self pos put: aValue.
	^ aValue
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> pos [
	^pos
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> pos: anObject [
	pos := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> record [
	^record
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> record: anObject [
	record := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> val [
	| fetched attrDef |
	(fetched := self record parameters at: pos)
		ifNil: [attrDef := self record definition attributes at: pos.
			^ PlatypusExpressInvalidAttributeException signal: 'attribute : ''' , attrDef name , ''' is not computable'].
	^ fetched
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAttribute >> var: aData record: aRecord pos: anInteger interpretor: anInterpretor [ 
	super var: aData interpretor: anInterpretor.
	self record: aRecord.
	self pos: anInteger
]

{ #category : #copying }
PlatypusExpressInterpretorStackAttribute >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n record: self record veryDeepCopy.
	^ n
]
