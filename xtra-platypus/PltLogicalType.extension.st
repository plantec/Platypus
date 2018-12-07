Extension { #name : #PltLogicalType }

{ #category : #'*xtra-platypus-accessing' }
PltLogicalType >> initializedValue [
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-testing' }
PltLogicalType >> isGeneralizationOf: otherType [ 
	^ otherType isKindOf: self class
]
