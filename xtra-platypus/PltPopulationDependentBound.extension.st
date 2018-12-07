Extension { #name : #PltPopulationDependentBound }

{ #category : #'*xtra-platypus-converting' }
PltPopulationDependentBound >> asInteger [
	^ nil
]

{ #category : #'*xtra-platypus-type-infering' }
PltPopulationDependentBound >> inferedDomain [
	^ self boundValue computedDomain

]
