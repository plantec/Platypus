Extension { #name : #PltIntegerType }

{ #category : #'*xtra-platypus-evaluating' }
PltIntegerType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asIntegerLiteralCompatibleTo: self interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-evaluating' }
PltIntegerType >> initializedValue [
	^ PltIntegerLiteral val: 0
]

{ #category : #'*xtra-platypus-testing' }
PltIntegerType >> isGeneralizationOf: otherType [ 
	^ (super isGeneralizationOf: otherType)
		or: [otherType isPltRealType]
]
