Extension { #name : #PltRealDivExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltRealDivExpression >> inferedDomain [
	^ PltRealType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltRealDivExpression >> operatorSymbol [
	^ #div
]

{ #category : #'*xtra-platypus-express-compat' }
PltRealDivExpression >> pltOperator [
	^ '/'
]
