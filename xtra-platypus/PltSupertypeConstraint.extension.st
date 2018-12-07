Extension { #name : #PltSupertypeConstraint }

{ #category : #'*xtra-platypus-checking' }
PltSupertypeConstraint >> checksInheritance: mySuper [ 
	^ self expr
		ifNil: [OrderedCollection new]
		ifNotNil: [self expr checksSubtypesInheritance: mySuper]
]
