Extension { #name : #PltSimpleUnaryExpression }

{ #category : #'*xtra-platypus-instance-creation' }
PltSimpleUnaryExpression class >> expr: anExpression [
	^ self new expr: anExpression
]

{ #category : #'*xtra-platypus-type-infering' }
PltSimpleUnaryExpression >> inferedDomain [
	^ self expr computedDomain

]
