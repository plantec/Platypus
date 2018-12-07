Extension { #name : #PltArrayInstance }

{ #category : #'*xtra-platypus-updating' }
PltArrayInstance >> adjustLowerAndUpperBounds [
	self lowerBound ifNil: [
	self
		lowerBound: (PltIntegerLiteral val: 1)].
	self
		upperBound ifNil: [self
		upperBound: (PltIntegerLiteral val: self size)]
]

{ #category : #'*xtra-platypus-evaluating' }
PltArrayInstance >> asArrayInstance [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltArrayInstance >> asArrayInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	(self isCompatibleWith: aType)
		ifTrue: [^ self].
	^ super asArrayInstanceCompatibleTo: aType interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-evaluating' }
PltArrayInstance >> equal: other [ 
	| res |
	(res := super equal: other)
		ifFalseOrUnknownConstant: [^ res].
	1
		to: self contents size
		do: [:pos | 
			res := (contents at: pos)
						equal: (other contents at: pos).
			res
				ifFalseOrUnknownConstant: [^ res]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-type-infering' }
PltArrayInstance >> inferedDomain [
	| aggr |
	aggr := PltArrayType new.
	aggr isGeneralType: self general.
	aggr lowerBound: self lowerBound.
	aggr upperBound: self upperBound.
	aggr elementType: self inferedElementType.
	^ aggr
]

{ #category : #'*xtra-platypus-testing' }
PltArrayInstance >> isPltArray [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltArrayInstance >> setQueryBoundsFromSource: anotherAggregate [ 
	self
		lowerBound: anotherAggregate lowerBound copy.
	self upperBound: anotherAggregate upperBound copy
]
