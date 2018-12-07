Extension { #name : #PltGreaterThanExpression }

{ #category : #'*xtra-platypus-accessing' }
PltGreaterThanExpression >> operatorSymbol [
	^ #>
]

{ #category : #'*xtra-platypus-express-compat' }
PltGreaterThanExpression >> pltOperator [
	^ '>'
]
