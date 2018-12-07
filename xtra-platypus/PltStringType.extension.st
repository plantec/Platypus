Extension { #name : #PltStringType }

{ #category : #'*xtra-platypus-evaluating' }
PltStringType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue asStringLiteralCompatibleTo: self interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-type-infering' }
PltStringType >> elementType [
	^ self computedDomain

]

{ #category : #'*xtra-platypus-accessing' }
PltStringType >> initializedValue [
	^ PltStringLiteral val: ''
]

{ #category : #'*xtra-platypus-classification' }
PltStringType >> isPltNumberOrStringType [
	^ true
]
