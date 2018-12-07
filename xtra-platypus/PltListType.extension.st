Extension { #name : #PltListType }

{ #category : #'*xtra-platypus-evaluating' }
PltListType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asListInstanceCompatibleTo: self interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-classification' }
PltListType >> isListType [
	^ true
]
