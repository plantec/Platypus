Extension { #name : #PltDivExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltDivExpression >> inferedDomain [
	^ PltIntegerType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltDivExpression >> operatorSymbol [
	^#'/'
]

{ #category : #'*xtra-platypus-express-compat' }
PltDivExpression >> pltOperator [
	^ '/'
]
