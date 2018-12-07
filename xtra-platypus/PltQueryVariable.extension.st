Extension { #name : #PltQueryVariable }

{ #category : #'*xtra-platypus-type-infering' }
PltQueryVariable >> computedDomain [
	^ self inferedDomain

]

{ #category : #'*xtra-platypus-type-infering' }
PltQueryVariable >> domain [
	^ self inferedDomain

]

{ #category : #'*xtra-platypus-type-infering' }
PltQueryVariable >> inferedDomain [
	^ PltGenericType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltQueryVariable >> name [
	^ self variableId
]

{ #category : #'*xtra-platypus-code-generating' }
PltQueryVariable >> variableHolders [
	^ OrderedCollection with:  self
]
