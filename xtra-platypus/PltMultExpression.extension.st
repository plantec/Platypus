Extension { #name : #PltMultExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltMultExpression >> inferedDomain [
	^ self arithmeticOperatorInferedDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltMultExpression >> operatorSymbol [
	^ #*
]

{ #category : #'*xtra-platypus-express-compat' }
PltMultExpression >> pltOperator [
	^ 'pltMult:'
]
