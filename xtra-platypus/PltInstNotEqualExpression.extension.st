Extension { #name : #PltInstNotEqualExpression }

{ #category : #'*xtra-platypus-accessing' }
PltInstNotEqualExpression >> operatorSymbol [
	^ #':<>:'
]

{ #category : #'*xtra-platypus-express-compat' }
PltInstNotEqualExpression >> pltOperator [
	^ '~~'
]
