Extension { #name : #PltIncrementControl }

{ #category : #'*xtra-platypus-accessing' }
PltIncrementControl >> identifiersCache [
	^ identifiersCache
		ifNil: [identifiersCache := Dictionary new]
]

{ #category : #'*xtra-platypus-code-generating' }
PltIncrementControl >> variableHolders [
	^ OrderedCollection with: self variable
]
