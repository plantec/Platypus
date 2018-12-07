Extension { #name : #PltAnonymousVariable }

{ #category : #'*xtra-platypus-instance-creation' }
PltAnonymousVariable class >> default [
	^ PltAnonymousVariable domain: PltMissingValue new
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAnonymousVariable class >> domain: aDomain [
	^ self new domain: aDomain
]

{ #category : #'*xtra-platypus-interpreting' }
PltAnonymousVariable >> platypusVariable [
	^ self
]

{ #category : #'*xtra-platypus-type-infering' }
PltAnonymousVariable >> staticDomain [
	^ domain computedDomain

]
