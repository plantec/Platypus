Extension { #name : #PltModExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltModExpression >> inferedDomain [
	^ PltIntegerType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltModExpression >> operatorSymbol [
	^ #mod
]

{ #category : #'*xtra-platypus-express-compat' }
PltModExpression >> pltOperator [
	^ '\\'
]
