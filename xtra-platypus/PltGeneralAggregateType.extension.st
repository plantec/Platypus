Extension { #name : #PltGeneralAggregateType }

{ #category : #'*xtra-platypus-testing' }
PltGeneralAggregateType >> canBeAssignedWith: otherType [ 
	otherType isPltAggregateCompatibleType
		ifFalse: [^ false].
	^ otherType elementType isAssignableTo: self elementType
]

{ #category : #'*xtra-platypus-testing' }
PltGeneralAggregateType >> isGeneralizationOf: otherType [ 
	^ otherType isKindOf: PltAggregateType
]

{ #category : #'*xtra-platypus-type-infering' }
PltGeneralAggregateType >> staticDomain [
	| d |
	d := self class new.
	d elementType: self elementType computedDomain.
	^ d

]
