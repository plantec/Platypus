Extension { #name : #PltBagType }

{ #category : #'*xtra-platypus-evaluating' }
PltBagType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asBagInstanceCompatibleTo: self interpretor: anInterpretor
]
