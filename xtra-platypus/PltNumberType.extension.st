Extension { #name : #PltNumberType }

{ #category : #'*xtra-platypus-testing' }
PltNumberType >> isGeneralizationOf: otherType [ 
	^ otherType isKindOf: self class
]

{ #category : #'*xtra-platypus-classification' }
PltNumberType >> isPltNumberOrStringType [
	^ true
]
