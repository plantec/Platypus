Extension { #name : #PltAggrUnaryExpression }

{ #category : #'*xtra-platypus-type-infering' }
PltAggrUnaryExpression >> inferedDomain [
	| aggr |
	aggr := PltGeneralAggregateType new.
	aggr elementType: PltGenericType asDomain.
	^ aggr
]
