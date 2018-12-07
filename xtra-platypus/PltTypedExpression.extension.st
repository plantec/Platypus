Extension { #name : #PltTypedExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltTypedExpression >> inferedDomain [
	^ self domain computedDomain

]
