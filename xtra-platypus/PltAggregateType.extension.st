Extension { #name : #PltAggregateType }

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateType >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue 
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> canAddElementOfType: elementDomain [
	^ elementDomain isAssignableTo: self elementType 
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> canBeAssignedWith: otherType [ 
	^ otherType isAssignableToAggregateType: self
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> elementsAreOptional [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateType >> errorQualifier [
	^ super errorQualifier , ' of ', (self elementType ifNil: ['?'] ifNotNil: [:e | e errorQualifier])
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateType >> initializedValue [
	^ PltListInstance new
]

{ #category : #'*xtra-platypus-classification' }
PltAggregateType >> isAggregateCompatibleType [
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> isAssignableToAggregateType: anAggregateType [ 
	^ ((self isKindOf: anAggregateType class)
			or: [self isPltGeneralAggregateType])
		and: [self elementType isAssignableTo: anAggregateType elementType]
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> isGeneralizationOf: otherType [ 
	^ otherType isSpecializationOfAggregateType: self
]

{ #category : #'*xtra-platypus-classification' }
PltAggregateType >> isPltAggregateCompatibleType [
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateType >> isSpecializationOfAggregateType: anAggregateType [ 
	^ anAggregateType isPltAggregateInitializerDomain
		or: [((self isKindOf: anAggregateType class)
					or: [anAggregateType isGeneralType])
				and: [self elementType isSpecializationOf: anAggregateType elementType]]
]

{ #category : #'*xtra-platypus-type-infering' }
PltAggregateType >> staticDomain [
	| d |
	d := self class new.
	d isGeneralType: self isGeneralType.
	d elementType: (self elementType ifNotNil: [:et | et computedDomain]).
	d lowerBound: self lowerBound.
	d upperBound: self upperBound.
	^ d
]
