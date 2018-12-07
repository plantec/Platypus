Extension { #name : #PltInstEqualExpression }

{ #category : #'*xtra-platypus-accessing' }
PltInstEqualExpression >> operatorSymbol [
	^ #':=:'
]

{ #category : #'*xtra-platypus-express-compat' }
PltInstEqualExpression >> pltOperator [
	^ '=='
]
