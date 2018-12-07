Extension { #name : #PltNumericLiteral }

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> * op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val * op val.
					r isFloat
						ifTrue: [rl := PltRealLiteral val: r]
						ifFalse: [rl := PltIntegerLiteral val: r]]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> + op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val + op val.
					(r isKindOf: Float)
						ifTrue: [rl := PltRealLiteral val: r]
						ifFalse: [rl := PltIntegerLiteral val: r]]
				ifFalse: [op isPltAggregateData
						ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> - op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val - op val.
					(r isKindOf: Float)
						ifTrue: [rl := PltRealLiteral val: r]
						ifFalse: [rl := PltIntegerLiteral val: r]]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> / op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val / op val.
					rl := PltIntegerLiteral val: r asInteger]
				ifFalse: [op isPltAggregateData
						ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> < op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [^ PltLogicalLiteral val: self val < op val]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> <= op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [^ PltLogicalLiteral val: self val <= op val]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> > op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [^ PltLogicalLiteral val: self val > op val]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> >= op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [^ PltLogicalLiteral val: self val >= op val]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> abs [
	^ self val abs
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> asIntegerLiteral [
	^ PltIntegerLiteral val: self val asInteger.

]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> asRealLiteral [
	^ PltRealLiteral val: self val asFloat.

]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> asRealLiteralCompatibleTo: anType  interpretor: anInterpretor [
	^ PltRealLiteral val: self val asFloat
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> div: op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val / op val.
					rl := PltRealLiteral val: r asFloat]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> expo: op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val raisedTo: op val.
					(r isKindOf: Float)
						ifTrue: [rl := PltRealLiteral val: r]
						ifFalse: [rl := PltIntegerLiteral val: r]]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> minus: op interpretor: anInterpretor [ 
	^ self - op
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> mod: op [ 
	| r rl |
	op
		ifMissing: [^ op]
		ifNotMissing: [op isPltNumericLiteral
				ifTrue: [r := self val \\ op val.
					(r isKindOf: Float)
						ifTrue: [rl := PltRealLiteral val: r]
						ifFalse: [rl := PltIntegerLiteral val: r]]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
			^ rl]
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> mult: op interpretor: anInterpretor [ 
	^ self * op
]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> negated [
	^ self class val: self val negated.

]

{ #category : #'*xtra-platypus-evaluating' }
PltNumericLiteral >> plus: op interpretor: anInterpretor [ 
	op isPltAggregateData
		ifTrue: [^ op addFirst: self interpretor: anInterpretor].
	^ self + op
]
