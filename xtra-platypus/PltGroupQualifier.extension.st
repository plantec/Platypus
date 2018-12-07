Extension { #name : #PltGroupQualifier }

{ #category : #'*xtra-platypus-type-infering' }
PltGroupQualifier >> inferedDomainWith: currDomain [ 
	currDomain referenced isPltEntityDefinition
		ifFalse: [^ PltGenericType asDomain].
	^ (currDomain lookUpSupertypeBN: groupName)
		ifNil: [PltGenericType asDomain]
]
