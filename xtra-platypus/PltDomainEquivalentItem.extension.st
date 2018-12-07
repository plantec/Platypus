Extension { #name : #PltDomainEquivalentItem }

{ #category : #'*xtra-platypus-accessing' }
PltDomainEquivalentItem >> unwrappedItem [
	^ self nativeItem
		ifNotNil: [self nativeItem unwrappedItem]
]
