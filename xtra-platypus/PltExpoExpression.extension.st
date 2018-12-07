Extension { #name : #PltExpoExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltExpoExpression >> inferedDomain [
	^ PltRealType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltExpoExpression >> operatorSymbol [
	^ #'**'
]

{ #category : #'*xtra-platypus-express-compat' }
PltExpoExpression >> pltOperator [
	^ 'raisedTo:'
]
