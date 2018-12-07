Extension { #name : #PltQualifiedExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltQualifiedExpression >> inferedDomain [
	| currDomain |
	currDomain := self head computedDomain.
	self qualifiers
		do: [:qual | currDomain := qual inferedDomainWith: currDomain].
	^ currDomain

]
