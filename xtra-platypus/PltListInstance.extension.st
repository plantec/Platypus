Extension { #name : #PltListInstance }

{ #category : #'*xtra-platypus-accessing' }
PltListInstance >> add: newObject beforeIndex: index [ 
	index <= 0
		ifTrue: [self contents addFirst: newObject]
		ifFalse: [index >= self size
				ifTrue: [self contents addLast: newObject]
				ifFalse: [self contents add: newObject afterIndex: index]]
]

{ #category : #'*xtra-platypus-converting' }
PltListInstance >> asListInstance [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltListInstance >> asListInstanceCompatibleTo: aType interpretor: anInterpretor [ 
	(self isCompatibleWith: aType)
		ifTrue: [^ self].
	^ super asListInstanceCompatibleTo: aType interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-accessing' }
PltListInstance >> contentsList [
	^ OrderedCollection newFrom: contents
]

{ #category : #'*xtra-platypus-type-infering' }
PltListInstance >> inferedDomain [
	| aggr |
	aggr := PltListType new.
	aggr isGeneralType: self general.
	aggr lowerBound: self lowerBound.
	aggr upperBound: self upperBound.
	aggr elementType: self inferedElementType.
	^ aggr
]

{ #category : #'*xtra-platypus-accessing' }
PltListInstance >> removeAt: index [ 
	^ self contents removeAt: index 

]
