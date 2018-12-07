Extension { #name : #PltElementQualifier }

{ #category : #'*xtra-platypus-type-infering' }
PltElementQualifier >> inferedDomainWith: currDomain [ 
	currDomain isPltAggregateOrStringType
		ifFalse: [^ PltGenericType asDomain].
	currDomain isPltStringType
		ifTrue: [^ PltStringType asDomain].
	^ currDomain elementType computedDomain
]
