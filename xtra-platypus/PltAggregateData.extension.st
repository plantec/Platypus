Extension { #name : #PltAggregateData }

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> addElementsTo: anotherAggregate elementType: aType if: ifBlock interpretor: anInterpretor [ 
	^ self
		addElementsTo: anotherAggregate
		from: 1
		to: self size
		elementType: aType
		if: ifBlock
		interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> addElementsTo: anotherAggregate elementType: aType  interpretor: anInterpretor [
	^ self
		addElementsTo: anotherAggregate
		from: 1
		to: self size
		elementType: aType
		 interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> addElementsTo: anotherAggregate from: idx1 to: idx2 elementType: aType if: ifBlock interpretor: anInterpretor [ 
	| pos maxi mySize curr |
	pos := 1.
	maxi := idx2 > (mySize := self contents size)
				ifTrue: [mySize]
				ifFalse: [idx2].
	[pos <= maxi]
		whileTrue: [((pos >= idx1) and: [ifBlock value: (curr := self contents at: pos)])
				ifTrue: [anotherAggregate add: (anInterpretor valueFromDomain: aType assignCompatibleWith: curr)].
			pos := pos + 1].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> addElementsTo: anotherAggregate from: idx1 to: idx2 elementType: aType interpretor: anInterpretor [ 
	^ self addElementsTo: anotherAggregate from: idx1 to: idx2 elementType: aType if: [:el | true] interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> addFirst: anElement interpretor: anInterpretor [ 
	| r |
	r := self class new.
	r add: anElement.
	self
		addElementsTo: r
		elementType: self inferedElementType
		interpretor: anInterpretor.
	^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> asArrayInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	| r fetchedLower lower fetchedUpper upper |
	r := PltArrayInstance new.
	aType lowerBound
		ifNil: [fetchedLower := PltMissingValue new]
		ifNotNil: [
			anInterpretor acceptTry: aType lowerBound.
			fetchedLower := anInterpretor popVal].
	lower := fetchedLower
				ifMissing: [PltIntegerLiteral val: 1]
				ifNotMissing: [fetchedLower].
	r lowerBound: lower.
	aType upperBound
		ifNil: [fetchedUpper := PltMissingValue new]
		ifNotNil: [anInterpretor acceptTry: aType upperBound.
			fetchedUpper := anInterpretor popVal].
	upper := fetchedUpper
				ifMissing: [PltIntegerLiteral val: self size]
				ifNotMissing: [fetchedUpper].
	r upperBound: upper.
	self
		addElementsTo: r
		from: 1
		to: upper val - lower val + 1
		elementType: aType elementType
		interpretor: anInterpretor.
	r size + 1
		to: upper val - lower val + 1
		do: [:n | r add: PltMissingValue new].
	^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> asBagInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	^ self 
	asVariableSizeAggregationInstanceOfClass: PltBagInstance 
	compatibleTo: aType 
	interpretor: anInterpretor

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> asListInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	^ self
		asVariableSizeAggregationInstanceOfClass: PltListInstance
		compatibleTo: aType
		interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> asSetInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	^ self  
	asVariableSizeAggregationInstanceOfClass: PltSetInstance  
	compatibleTo: aType  
	interpretor: anInterpretor

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> asVariableSizeAggregationInstanceOfClass: aClass compatibleTo: aType interpretor: anInterpretor [ 
	| r |
	r := aClass new.
	aType lowerBound
		ifNil: [r
				lowerBound: (PltIntegerLiteral val: 0)]
		ifNotNil: [anInterpretor acceptTry: aType lowerBound.
			r lowerBound: anInterpretor popVal].
	aType upperBound
		ifNil: [r upperBound: PltMissingValue new]
		ifNotNil: [anInterpretor acceptTry: aType upperBound.
			r upperBound: anInterpretor popVal].
	r upperBound ifMissing:
		 [self
				addElementsTo: r
				elementType: aType elementType
				interpretor: anInterpretor]
		ifNotMissing: [self
				addElementsTo: r
				from: 1
				to: r upperBound val
				elementType: aType elementType
				interpretor: anInterpretor].
	^ r

]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> contentsList [
	^ self contents
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> copyFrom: idx1 to: idx2 [ 
	| r |
	r := self class new.
	self
		addElementsTo: r
		from: idx1
		to: idx2
		elementType: nil.
	^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> equal: other [ 
	self class = other class
		ifFalse: [^ PltLogicalLiteral val: false].
	(self contents
			anySatisfy: [:el | el isPltMissingValue])
		ifTrue: [^ PltLogicalLiteral val: #unknown].
	(other contents
			anySatisfy: [:el | el isPltMissingValue])
		ifTrue: [^ PltLogicalLiteral val: #unknown].
	^ PltLogicalLiteral val: true
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> includesVal: aValue [
	| res | 
	self contents asOrderedCollection do: [ :e | (res := e instEqual: aValue) ifTrueConstant: [ ^ res ] ].
	self contents asOrderedCollection do: [ :e | e ifMissing: [ ^ PltLogicalLiteral val: #unknown ] ].
	^ PltFalseConstant new 
]

{ #category : #'*xtra-platypus-type-infering' }
PltAggregateData >> inferedElementType [
	| elType elementsDomains |
	elementsDomains := Set new.
	self contents
		do: [:exp | elementsDomains add: exp computedDomain].
	elementsDomains isEmpty
		ifTrue: [^ PltGenericType asDomain].
	elementsDomains size = 1
		ifTrue: [^ elementsDomains anyOne].
	elType := PltSelectType new.
	elType selections: elementsDomains.
	^ elType

]

{ #category : #'*xtra-platypus-classification' }
PltAggregateData >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> isSubsetOf: anotherAggregate interpretor: anInterpretor [ 
	"The receiver is a subset of anotherAggregate if and only if, for any  
	element e which occurs n times in the receiver, e occurs at least n times in  
	anotherAggregate"
	anotherAggregate isPltAggregateData
		ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
	self contents
		do: [:e | (self occurrencesOf: e)
					<= (anotherAggregate occurrencesOf: e)
				ifFalse: [^ PltFalseConstant new]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> isSupersetOf: anotherAggregate interpretor: anInterpretor [ 
	"The receiver is a superset of anotherAggregate if and only if, for any  
	element e which occurs n times in the anotherAggregate, e occurs at least 
	n  
	times in the receiver"
	anotherAggregate isPltAggregateData
		ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
	self contents
		do: [:e | (anotherAggregate occurrencesOf: e)
					<= (self occurrencesOf: e)
				ifFalse: [^ PltFalseConstant new]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> lowerBound [
	^ PltIntegerLiteral val: 0
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> minus: anotherAggregateOrElement interpretor: anInterpretor [ 
	"Answer the set theoretic difference of two collections."
	| r |
	r := self class new.
	self
		addElementsTo: r
		elementType: self inferedElementType
		if: [:el | (anotherAggregateOrElement includesVal: el) isPltFalseConstant]
		interpretor: anInterpretor.
	^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> mult: anotherAggregate interpretor: anInterpretor [ 
	"Answer the set theoretic difference of two collections."
	| r |
	anotherAggregate isPltAggregateData
		ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument'].
	r := self class new.
	self
		addElementsTo: r
		elementType: self inferedElementType
		if: [:el | (anotherAggregate includesVal: el) isPltTrueConstant]
		interpretor: anInterpretor.
	^ r
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> occurrencesOf: anElement [ 
	^ self contents occurrencesOf: anElement 
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> pltAdd: newObject beforeIndex: index [ 
	self add: newObject beforeIndex: index 
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> pltNativeValue [
	^ self contents
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> plus: anotherAggregateOrElement interpretor: anInterpretor [ 
	| r |
	r := self class new.
	self
		addElementsTo: r
		elementType: self inferedElementType
		interpretor: anInterpretor.
	anotherAggregateOrElement isPltAggregateData
		ifTrue: [anotherAggregateOrElement
				addElementsTo: r
				elementType: anotherAggregateOrElement inferedElementType
				interpretor: anInterpretor]
		ifFalse: [r add: anotherAggregateOrElement].
	r adjustLowerAndUpperBounds.
^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> range: interval [
	| r |
	r := self class new.
	self
		addElementsTo: r
		from: interval first
		to: interval last
		elementType: nil.
	^ r
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> range: interval interpretor: anInterpretor [ 
	| r |
	r := self class new.
	self
		addElementsTo: r
		from: interval first
		to: interval last
		elementType: self computedDomain elementType
		interpretor: anInterpretor.
	^ r

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> rolesOf: anInstanceReference in: aSetOfString [ 
	self contents
		do: [:e | e rolesOf: anInstanceReference in: aSetOfString]

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> rolesValue: anInstanceReference roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: resultSet [
	self contents
		do: [:e | (e
					rolesValue: anInstanceReference
					roleSchema: schemaKey
					roleEntity: entityKey
					roleAttribute: attributeKey
					in: resultSet)
				].

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateData >> setQueryBoundsFromSource: anotherAggregate [
	self lowerBound: (PltIntegerLiteral val: 0).
	self upperBound: anotherAggregate upperBound copy.

]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> size [
	^ self contents size
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateData >> upperBound [
	^ PltMissingValue new
]
