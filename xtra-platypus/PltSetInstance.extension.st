Extension { #name : #PltSetInstance }

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> add: anElement [ 
	contents
		detect: [:el | (el equal: anElement) isPltTrueConstant]
		ifNone: [super add: anElement]
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> add: newObject beforeIndex: index [ 
	self add: newObject
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> addAll: aCollection [ 
	super addAll: aCollection.

]

{ #category : #'*xtra-platypus-evaluating' }
PltSetInstance >> addElementsTo: anotherAggregate elementType: aType if: ifBlock interpretor: anInterpretor [ 
	self contents
		do: [:el | (ifBlock value: el)
				ifTrue: [anotherAggregate
						add: (anInterpretor valueFromDomain: aType assignCompatibleWith: el)]].
	^ anotherAggregate
]

{ #category : #'*xtra-platypus-evaluating' }
PltSetInstance >> addElementsTo: anotherAggregate elementType: aType interpretor: anInterpretor [ 
	^ self addElementsTo: anotherAggregate elementType: aType if: [:el | true]  interpretor: anInterpretor 

]

{ #category : #'*xtra-platypus-evaluating' }
PltSetInstance >> asSetInstance [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltSetInstance >> asSetInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	(self isCompatibleWith: aType)
		ifTrue: [^ self].
	^ super asSetInstanceCompatibleTo: aType interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> at: anIndex [ 
	^ self contentsList at: anIndex
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> at: anIndex put: anObject [ 
	self shouldNotBeRedefined 
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> contentsList [
	^ OrderedCollection newFrom: contents
]

{ #category : #'*xtra-platypus-evaluating' }
PltSetInstance >> equal: other [ 
	| res |
	res := super equal: other.
	res
		ifFalseOrUnknownConstant: [^ res].
	self contents
		do: [:el | (other contents
					anySatisfy: [:eli | (el equal: eli) isPltTrueConstant])
				ifFalse: [^ PltLogicalLiteral val: false]].
	other contents
		do: [:el | (self contents
					anySatisfy: [:eli | (el equal: eli) isPltTrueConstant])
				ifFalse: [^ PltLogicalLiteral val: false]].
	^ PltLogicalLiteral val: true
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> indexOf: anObject [ 
	^ self contentsList indexOf: anObject
]

{ #category : #'*xtra-platypus-type-infering' }
PltSetInstance >> inferedDomain [
	| aggr |
	aggr := PltSetType new.
	aggr isGeneralType: self general.
	aggr lowerBound: self lowerBound.
	aggr upperBound: self upperBound.
	aggr elementType: self inferedElementType.
	^ aggr
]

{ #category : #'*xtra-platypus-testing' }
PltSetInstance >> isSequenceable [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> razContentsList [
	(self removeGenericProperty: #contentsList)

]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> remove: anElement [ 
	super remove: anElement.

]

{ #category : #'*xtra-platypus-accessing' }
PltSetInstance >> replace: aValue with: another [
	self remove: aValue.
	another ifNotNil: [self add: another]
]
