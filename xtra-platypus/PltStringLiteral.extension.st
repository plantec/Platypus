Extension { #name : #PltStringLiteral }

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> + op [ 
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltStringLiteral
				ifTrue: [^ PltStringLiteral val: self val , op val]
				ifFalse: [op isPltAggregateData
						ifTrue: [^ op addFirst: self]
						ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]]
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> < anotherLiteral [ 
		^PltLogicalLiteral 
		val: self val < anotherLiteral val 

]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> <= anotherLiteral [ 
		^PltLogicalLiteral 
		val: self val <= anotherLiteral val 
	
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> > anotherLiteral [ 
		^PltLogicalLiteral 
		val: self val > anotherLiteral val 

]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> >= anotherLiteral [ 
		^PltLogicalLiteral 
		val: self val >= anotherLiteral val 

]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> asClearText [
	^self unformattedString
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> asStringLiteralCompatibleTo: aStringType interpretor: anInterpretor [ 
	| width |
	aStringType width isNil
		ifTrue: [^ self].
	anInterpretor acceptTry: aStringType width.
	width := anInterpretor popVal val.
	aStringType fixedWidth
		ifFalse: [self size <= width
				ifTrue: [^ self].
			^ self class
				val: (self val copyFrom: 1 to: width)].
	self size > width
		ifTrue: [^ self class
				val: (self val copyFrom: 1 to: width)].
	^ self class
		val: (self val
				padded: #right
				to: width
				with: $ )
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> at: anIndex [ 
	^ self copyFrom: anIndex to: anIndex
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> at: anIndex put: aSubString [ 
	self val: (self val
		copyReplaceFrom: anIndex
		to: anIndex
		with: aSubString val).
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> copyFrom: idx1 to: idx2 [ 
	^ self class val: (self val copyFrom: idx1 to: idx2).

]

{ #category : #'*xtra-platypus-type-infering' }
PltStringLiteral >> inferedDomain [
	^ PltStringType asDomain
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> plus: op interpretor: anInterpretor [ 
	op isPltAggregateData
		ifTrue: [^ op addFirst: self interpretor: anInterpretor].
	^ self + op
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> range: anInterval [
	^ self copyFrom: anInterval first to: anInterval last
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> range: anInterval interpretor: anInterpretor [ 
	^ self copyFrom: anInterval first to: anInterval last 
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> range: anInterval put: aSubString [ 
	
		self val: (self val
				copyReplaceFrom: anInterval first
				to: anInterval last
				with: aSubString val)
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> range: anInterval put: aSubString interpretor: anInterpretor [
	self
		val: (self val
				copyReplaceFrom: anInterval first
				to: anInterval last
				with: aSubString val)
]

{ #category : #'*xtra-platypus-accessing' }
PltStringLiteral >> size [
	^ self val size
]

{ #category : #'*xtra-platypus-evaluating' }
PltStringLiteral >> unformattedString [
	val ifNil: [^ '**nil**'].
	^ val unformattedString
]
