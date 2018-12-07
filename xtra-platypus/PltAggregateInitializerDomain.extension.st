Extension { #name : #PltAggregateInitializerDomain }

{ #category : #'*xtra-platypus-testing' }
PltAggregateInitializerDomain >> canAddElementOfType: elementDomain [ 
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializerDomain >> elementType [
	| t domains |
	domains := self types
				 asSet.
	domains add: PltGenericType asDomain.
	t := PltSelectType new.
	t selections addAll: domains.
	^ t
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializerDomain >> errorQualifier [
	^ super errorQualifier , ' ''' , self prettyPrintedExpressCode , ''''
]

{ #category : #'*xtra-platypus-classification' }
PltAggregateInitializerDomain >> isAggregateCompatibleType [
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateInitializerDomain >> isAssignableToAggregateType: otherType [ 
	^ self types
		allSatisfy: [:sl | sl isAssignableTo: otherType elementType]
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateInitializerDomain >> isGeneralizationOf: otherType [ 
	^ otherType isSpecializationOfAggregateType: self
]

{ #category : #'*xtra-platypus-classification' }
PltAggregateInitializerDomain >> isPltAggregateCompatibleType [
	^ true
]
