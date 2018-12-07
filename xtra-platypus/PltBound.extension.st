Extension { #name : #PltBound }

{ #category : #'*xtra-platypus-converting' }
PltBound >> asInteger [
	^ nil
	
]

{ #category : #'*xtra-platypus-type-infering' }
PltBound >> staticDomain [
	^ PltIntegerType asDomain
]
