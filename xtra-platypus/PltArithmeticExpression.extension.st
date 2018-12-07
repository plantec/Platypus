Extension { #name : #PltArithmeticExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltArithmeticExpression >> arithmeticOperatorInferedDomain [
	| infered linfered rinfered elementsDomains theElementType theAggrType |
	linfered := self leftExpr computedDomain.
	rinfered := self rightExpr computedDomain.
	(linfered isPltGenericType or: [rinfered isPltGenericType]) ifTrue: [^PltGenericType asDomain].
	(linfered isPltAggregateCompatibleType
			or: [rinfered isPltAggregateCompatibleType])
		ifTrue: [infered := PltAggregateInitializerDomain new.
			elementsDomains := Set new.
			(linfered isPltAggregateCompatibleType
					and: [rinfered isPltAggregateCompatibleType])
				ifTrue: [elementsDomains add: linfered elementType computedDomain.
					elementsDomains add: rinfered elementType computedDomain]
				ifFalse: [linfered isPltAggregateCompatibleType
						ifTrue: [theElementType := rinfered.
							theAggrType := linfered]
						ifFalse: [theElementType := linfered.
							theAggrType := rinfered].
					elementsDomains add: theAggrType elementType computedDomain.
					elementsDomains add: theElementType computedDomain].
			infered types addAll: elementsDomains.
			^ infered].
	(infered := self leftExpr inferedDomain) isPltAggregateOrStringType
		ifTrue: [^ infered].
	(infered := self rightExpr inferedDomain) isPltAggregateOrStringType
		ifTrue: [^ infered].
	^ PltNumberType asDomain
]
