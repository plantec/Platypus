Extension { #name : #PltBinarySupertypeExpression }

{ #category : #'*xtra-platypus-checking' }
PltBinarySupertypeExpression >> checksSubtypesInheritance: mySuper [
	^ (self leftExpr checksSubtypesInheritance: mySuper), (self rightExpr checksSubtypesInheritance: mySuper)
 
]
