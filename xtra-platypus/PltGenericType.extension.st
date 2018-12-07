Extension { #name : #PltGenericType }

{ #category : #'*xtra-platypus-testing' }
PltGenericType >> canBeAssignedWith: otherType [ 
	^ true
]

{ #category : #'*xtra-platypus-type-infering' }
PltGenericType >> elementType [ 
	^ self
]

{ #category : #'*xtra-platypus-testing' }
PltGenericType >> isAssignableTo: otherType [ 
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltGenericType >> isCompatibleWith: otherType [ 
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltGenericType >> isCompatibleWithEntityDefinition:  otherType [ 
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltGenericType >> isGeneralizationOf: otherType [ 
	^ true
]

{ #category : #'*xtra-platypus-type-infering' }
PltGenericType >> staticDomain [
	^ self class asDomain
]
