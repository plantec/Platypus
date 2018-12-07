Extension { #name : #PltNotEqualExpression }

{ #category : #'*xtra-platypus-accessing' }
PltNotEqualExpression >> operatorSymbol [
	^ #'<>'
]

{ #category : #'*xtra-platypus-express-compat' }
PltNotEqualExpression >> pltOperator [
	^ '~='
]
