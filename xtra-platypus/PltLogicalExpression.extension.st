Extension { #name : #PltLogicalExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltLogicalExpression >> inferedDomain [
	^ PltLogicalType asDomain
]
