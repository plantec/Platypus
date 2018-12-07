Extension { #name : #PltMinusExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltMinusExpression >> inferedDomain [
	^ self arithmeticOperatorInferedDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltMinusExpression >> operatorSymbol [
	^ #-
]

{ #category : #'*xtra-platypus-express-compat' }
PltMinusExpression >> pltOperator [
	^ 'pltMinus:'
]
