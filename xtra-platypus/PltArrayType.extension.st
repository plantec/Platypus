Extension { #name : #PltArrayType }

{ #category : #'*xtra-platypus-evaluating' }
PltArrayType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asArrayInstanceCompatibleTo: self interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-testing' }
PltArrayType >> elementsAreOptional [
	^ self optionalFlag
]
