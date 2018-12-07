Extension { #name : #PltBagInstance }

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> addAll: aCollection [ 
	super addAll: aCollection.

]

{ #category : #'*xtra-platypus-evaluating' }
PltBagInstance >> addElementsTo: anotherAggregate elementType: aType if: ifBlock interpretor: anInterpretor [ 
	self contents
		do: [:el | (ifBlock value: el)
				ifTrue: [anotherAggregate
						add: (anInterpretor valueFromDomain: aType assignCompatibleWith: el)]].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltBagInstance >> addElementsTo: anotherAggregate elementType: aType interpretor: anInterpretor [ 
	^ self
		addElementsTo: anotherAggregate
		elementType: aType
		if: [:el | true]
		interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-evaluating' }
PltBagInstance >> asBagInstance [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltBagInstance >> asBagInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	(self isCompatibleWith: aType) ifTrue: [^self].
	^ super asBagInstanceCompatibleTo: aType interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> at: anIndex [ 
	^ self contentsList at: anIndex
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> at: anIndex put: anObject [ 
	self contentsList at: anIndex put: anObject.
	self setContents: self contentsList
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> contentsList [
	^ OrderedCollection newFrom: contents
]

{ #category : #'*xtra-platypus-evaluating' }
PltBagInstance >> equal: other [ 
	| res |
	(res := super equal: other)
		ifFalseOrUnknownConstant: [^ res].
	self contents
		do: [:el | (other contents occurrencesOf: el)
					= (self contents occurrencesOf: el)
				ifFalse: [^ PltLogicalLiteral val: false]].
	other contents
		do: [:el | (self contents occurrencesOf: el)
					= (other contents occurrencesOf: el)
				ifFalse: [^ PltLogicalLiteral val: false]].
	^ PltLogicalLiteral val: true
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> indexOf: anObject [ 
	^ self contentsList indexOf: anObject
]

{ #category : #'*xtra-platypus-type-infering' }
PltBagInstance >> inferedDomain [
	| aggr |
	aggr := PltBagType new.
	aggr isGeneralType: self general.
	aggr lowerBound: self lowerBound.
	aggr upperBound: self upperBound.
	aggr elementType: self inferedElementType.
	^ aggr
]

{ #category : #'*xtra-platypus-testing' }
PltBagInstance >> isSequenceable [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> pltAdd: newObject beforeIndex: index [ 
	self add: newObject
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> razContentsList [
	self removeGenericProperty: #contentsList
]

{ #category : #'*xtra-platypus-accessing' }
PltBagInstance >> remove: anElement [ 
	super remove: anElement.

]
