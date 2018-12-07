Extension { #name : #PltIntegerBound }

{ #category : #'*xtra-platypus-converting' }
PltIntegerBound >> asInteger [
	^ self boundValue
]

{ #category : #'*xtra-platypus-type-infering' }
PltIntegerBound >> inferedDomain [
	^ PltIntegerType asDomain
]
