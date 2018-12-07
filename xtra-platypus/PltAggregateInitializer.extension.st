Extension { #name : #PltAggregateInitializer }

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> add: anElement [ 
	| el |
	el := PltAggregateInitializerElement val: anElement.
	self contents add: el
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> add: anElement beforeIndex: index [ 
	| nelem elPos updatedElem updatedElemRep |
	nelem := PltAggregateInitializerElement val: anElement.
	index <= 0
		ifTrue: [self contents addFirst: nelem]
		ifFalse: [index > self size
				ifTrue: [self contents addLast: nelem]
				ifFalse: [elPos := self elementPositionForIndex: index.
					updatedElem := self contents at: elPos key.
					updatedElemRep := updatedElem repetitionValue.
					updatedElemRep = 1
						ifFalse: [updatedElem repetition val: elPos value - 1.
							self contents
								add: (PltAggregateInitializerElement
										val: updatedElem val
										repetition: (PltIntegerLiteral val: updatedElemRep - elPos value + 1))
								afterIndex: elPos key].
					self contents add: nelem afterIndex: elPos key - 1]]
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> addAll: aCollection [ 
	aCollection do: [ :el | self add: el]

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializer >> addElementsTo: anotherAggregate elementType: aType if: ifBlock interpretor: anInterpretor [ 
	self contents
		do: [:e | e
				addElementsTo: anotherAggregate
				elementType: aType
				 if: ifBlock
				interpretor: anInterpretor].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializer >> addElementsTo: anotherAggregate elementType: aType  interpretor: anInterpretor [
	self contents
		do: [:e | e addElementsTo: anotherAggregate elementType: aType  interpretor: anInterpretor].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializer >> addElementsTo: anotherAggregate from: idx1 to: idx2 elementType: aType if: ifBlock interpretor: anInterpretor [ 
	| passed pos element taken takenHere oldSize newSize |
	passed := 0.
	pos := 1.
	[passed < idx1
		and: [pos <= self contents size]]
		whileTrue: [element := self contents at: pos.
			passed := passed + element repetitionValue.
			passed < idx1
				ifTrue: [pos := pos + 1]].
	taken := idx1.
	takenHere := passed - idx1 + 1.
	[(oldSize := anotherAggregate size) < idx2
		and: [pos <= self contents size]]
		whileTrue: [element := self contents at: pos.
			element
				addElementsTo: anotherAggregate
				upTo: takenHere
				elementType: aType
				if: ifBlock
				interpretor: anInterpretor.
			newSize := anotherAggregate size.
			taken := taken + (newSize - oldSize).
			takenHere := idx2 - taken + 1.
			pos := pos + 1].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializer >> addElementsTo: anotherAggregate from: idx1 to: idx2 elementType: aType interpretor: anInterpretor [ 
	| passed pos element taken takenHere oldSize newSize |
	passed := 0.
	pos := 1.
	[passed < idx1
		and: [pos <= self contents size]]
		whileTrue: [element := self contents at: pos.
			passed := passed + element repetitionValue.
			passed < idx1
				ifTrue: [pos := pos + 1]].
	taken := idx1.
	takenHere := passed - idx1 + 1.
	[(oldSize := anotherAggregate size) < idx2
		and: [pos <= self contents size]]
		whileTrue: [element := self contents at: pos.
			element
				addElementsTo: anotherAggregate
				upTo: takenHere
				elementType: aType
				interpretor: anInterpretor.
			newSize := anotherAggregate size.
			taken := taken + (newSize - oldSize).
			takenHere := idx2 - taken + 1.
			pos := pos + 1].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-updating' }
PltAggregateInitializer >> adjustLowerAndUpperBounds [

]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> at: anIndex [ 
	| elem |
	elem := self elementAt: anIndex.
	^ elem val
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> at: index put: anObject [ 
	self removeAt: index.
	self add: anObject beforeIndex: index
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> contentsList [
	| list |
	list := OrderedCollection new.
	self do: [ :el | list add: el assignableValue].
	^ list
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInitializer >> do: aBlock [ 
	^ self contents do: [ :el | el do: aBlock]
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> elementAt: anIndex [ 
	| pos |
	pos := self elementPositionForIndex: anIndex.
	^ self contents at: pos key
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> elementPositionForIndex: anIndex [ 
	| pos idx elem rep remainder |
	remainder := anIndex.
	pos := 0.
	idx := 0.
	rep := 0.
	[pos < anIndex]
		whileTrue: [idx := idx + 1.
			remainder := remainder - rep.
			elem := self contents at: idx.
			pos := pos + (rep := elem repetitionValue)].
	^ idx -> remainder
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializer >> equal: other [ 
	| res |
	other isPltAggregateData
		ifFalse: [^ PltLogicalLiteral val: false].
	(self contents
			anySatisfy: [:el | el isPltMissingValue])
		ifTrue: [^ PltLogicalLiteral val: #unknown].
	(other contents
			anySatisfy: [:el | el isPltMissingValue])
		ifTrue: [^ PltLogicalLiteral val: #unknown].
	1
		to: self contents size
		do: [:pos | 
			res := (contents at: pos)
						equal: (other contents at: pos) asAggregateInitializerElement.
			res
				ifFalseOrUnknownConstant: [^ res]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-type-infering' }
PltAggregateInitializer >> inferedDomain [
	| elType elementsDomains |
	elementsDomains := Set new.
	self contents
		do: [:exp | elementsDomains add: exp computedDomain].
	elType := PltAggregateInitializerDomain new.
	elType
		types: (elementsDomains isEmpty
				ifTrue: [Set with: PltGenericType asDomain]
				ifFalse: [elementsDomains]).
	^ elType

]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> occurrencesOf: anElement [ 
	| e count |
	e := anElement isPltAggregateInitializerElement
				ifTrue: [anElement val]
				ifFalse: [anElement].
	count := 0.
	self contents
		do: [:el | (el val instEqual: e)
				ifTrueConstant: [count := count + el repetitionValue]].
	^ count
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> pltNativeValue [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> removeAt: index [ 
	| elPos elem |
	elPos := self elementPositionForIndex: index.
	elem := self contents at: elPos key.
	elem repetitionValue = 1
		ifTrue: [^ self contents removeAt: elPos key].
	elem repetitionValue: elem repetitionValue - 1
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializer >> size [
	| size pos elem |
	size := 0.
	pos := 0.
	[pos < self contents size]
		whileTrue: [pos := pos + 1.
			elem := self contents at: pos.
			size := size + elem repetitionValue].
	^ size
]
