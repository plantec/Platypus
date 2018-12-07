Extension { #name : #PltPlusExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltPlusExpression >> inferedDomain [
	^ self arithmeticOperatorInferedDomain

]

{ #category : #'*xtra-platypus-accessing' }
PltPlusExpression >> operatorSymbol [
	^ #+
]

{ #category : #'*xtra-platypus-express-compat' }
PltPlusExpression >> pltOperator [
	^ 'pltPlus:'
]
