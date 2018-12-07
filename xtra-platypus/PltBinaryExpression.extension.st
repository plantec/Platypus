Extension { #name : #PltBinaryExpression }

{ #category : #'*xtra-platypus-accessing' }
PltBinaryExpression >> left: lexpr right: rexpr [ 
	self leftExpr: lexpr.
	self rightExpr: rexpr
]

{ #category : #'*xtra-platypus-instance-creation' }
PltBinaryExpression class >> left: lexpr right: rexpr [
	^ self new left: lexpr right: rexpr
]

{ #category : #'*xtra-platypus-accessing' }
PltBinaryExpression >> operatorSymbol [
	^ self subclassResponsibility 
]

{ #category : #'*xtra-platypus-express-compat' }
PltBinaryExpression >> pltOperator [
	^ self subclassResponsibility
]
