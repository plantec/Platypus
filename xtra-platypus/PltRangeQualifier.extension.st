Extension { #name : #PltRangeQualifier }

{ #category : #'*xtra-platypus-type-infering' }
PltRangeQualifier >> inferedDomainWith: currDomain [ 
	currDomain isPltAggregateOrStringType
		ifFalse: [^ PltGenericType asDomain].
	currDomain isPltStringType
		ifTrue: [^ PltStringType asDomain].
	^ currDomain computedDomain
]
