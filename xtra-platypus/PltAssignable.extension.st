Extension { #name : #PltAssignable }

{ #category : #'*xtra-platypus-type-infering' }
PltAssignable >> staticDomain [
	| currDomain |
	currDomain := self head computedDomain.
	self qualifiers
		do: [:qual | currDomain := qual inferedDomainWith: currDomain].
	^ currDomain

]
