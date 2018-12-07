Extension { #name : #PltGroupRepresentation }

{ #category : #'*xtra-platypus-copying' }
PltGroupRepresentation >> deepCopy [
	| n |
	n := super copy.
	n instRef: n instRef deepCopy.
	^n
]
