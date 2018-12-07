Extension { #name : #PltEqualExpression }

{ #category : #'*xtra-platypus-accessing' }
PltEqualExpression >> operatorSymbol [
	^ #=
]

{ #category : #'*xtra-platypus-express-compat' }
PltEqualExpression >> pltOperator [
	^ '='
]
