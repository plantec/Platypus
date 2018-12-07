Extension { #name : #PltInstanceConstructionExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltInstanceConstructionExpression >> inferedDomain [
	| type elementsDomains |
	elementsDomains := Set new.
	elementsDomains add: self leftExpr computedDomain.
	elementsDomains add: self rightExpr computedDomain.
	type := PltSelectType new.
	type selections: elementsDomains.
	^ type

]

{ #category : #'*xtra-platypus-accessing' }
PltInstanceConstructionExpression >> operatorSymbol [
	^ #'||'
]
