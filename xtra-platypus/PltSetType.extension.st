Extension { #name : #PltSetType }

{ #category : #'*xtra-platypus-evaluating' }
PltSetType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asSetInstanceCompatibleTo: self interpretor: anInterpretor
]
