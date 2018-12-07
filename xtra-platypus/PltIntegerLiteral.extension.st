Extension { #name : #PltIntegerLiteral }

{ #category : #'*xtra-platypus-parsing' }
PltIntegerLiteral >> asBound [
	| bound |
	bound := PltIntegerBound new.
	bound setBoundValue: self val.
	^ bound
]

{ #category : #'*xtra-platypus-evaluating' }
PltIntegerLiteral >> asIntegerLiteral [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltIntegerLiteral >> asIntegerLiteralCompatibleTo: anIntegerType interpretor: anInterpretor [ 
	^ PltIntegerLiteral val: self val asInteger
]

{ #category : #'*xtra-platypus-type-infering' }
PltIntegerLiteral >> inferedDomain [
	^ PltIntegerType asDomain
]
