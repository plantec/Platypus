Extension { #name : #PltAttributeQualifier }

{ #category : #'*xtra-platypus-type-infering' }
PltAttributeQualifier >> inferedDomainWith: currDomain [ 
	| attr |
	currDomain isPltEntityDefinition
		ifFalse: [^ PltGenericType asDomain].
	(attr := currDomain lookUpAttributeBN: attributeName)
		ifNil: [^ PltGenericType asDomain]
		ifNotNil: [^ attr computedDomain]
]

{ #category : #'*xtra-platypus-accessing' }
PltAttributeQualifier >> name [
	^ self attributeName
]
