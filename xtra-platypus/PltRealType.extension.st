Extension { #name : #PltRealType }

{ #category : #'*xtra-platypus-evaluating' }
PltRealType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asRealLiteralCompatibleTo: self interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-accessing' }
PltRealType >> initializedValue [
	^ PltRealLiteral val: 0.0
]
