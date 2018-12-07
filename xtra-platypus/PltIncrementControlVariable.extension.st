Extension { #name : #PltIncrementControlVariable }

{ #category : #'*xtra-platypus-type-infering' }
PltIncrementControlVariable >> computedDomain [
	^ self inferedDomain

]

{ #category : #'*xtra-platypus-type-infering' }
PltIncrementControlVariable >> inferedDomain [
	^ PltIntegerType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltIncrementControlVariable >> name [
	^ self variableId
]
