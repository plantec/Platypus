Extension { #name : #PltLessEqualExpression }

{ #category : #'*xtra-platypus-accessing' }
PltLessEqualExpression >> operatorSymbol [
	^ #'<='
]

{ #category : #'*xtra-platypus-express-compat' }
PltLessEqualExpression >> pltOperator [
	^ '<='
]
