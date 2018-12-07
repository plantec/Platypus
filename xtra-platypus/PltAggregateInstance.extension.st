Extension { #name : #PltAggregateInstance }

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> add: anObject [
	self contents add: anObject
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> addAll: aCollection [
	self contents addAll: aCollection
]

{ #category : #'*xtra-platypus-updating' }
PltAggregateInstance >> adjustLowerAndUpperBounds [
	self
		lowerBound: (PltIntegerLiteral val: 1).
	self
		upperBound: (PltIntegerLiteral val: self size)
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> at: anIndex [ 
	^ self contents at: anIndex 
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> at: anIndex put: anObject [
	^ self contents at: anIndex put: anObject
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInstance class >> contents: anNativeCollection [ 
	| aggr |
	aggr := self new addAll: anNativeCollection.
	aggr adjustLowerAndUpperBounds.
	^ aggr
]

{ #category : #'*xtra-platypus-copying' }
PltAggregateInstance >> copyEmpty [
	^ self class new
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInstance >> detect: aBlock [ 
	^ self contents detect: aBlock
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInstance >> detect: aBlock ifNone: ifNoneBlock [
	^ self contents detect: aBlock ifNone: ifNoneBlock
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInstance >> do: aBlock [
	^ self contents do: aBlock
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInstance >> do: aBlock separatedBy: sepBlock [
	^ self contents do: aBlock separatedBy: sepBlock
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInstance >> equal: other [ 
	| res |
	(res := super equal: other)
		ifFalseOrUnknownConstant: [^ res].
	self lowerBound = other lowerBound
		ifFalse: [^ PltFalseConstant new].
	self upperBound
		ifMissing: [other upperBound isPltMissingValue
				ifFalse: [^ PltFalseConstant new]]
		ifNotMissing: [self upperBound = other upperBound
				ifFalse: [^ PltFalseConstant new]].
	self size = other size
		ifFalse: [^ PltFalseConstant new].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> general [
	^ general
		ifNil: [general := false]
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> general: aBoolean [ 
	general := aBoolean
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> includes: anObject [ 
	self contents includes: anObject
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> indexOf: anObject [
	^ self contents indexOf: anObject
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateInstance >> isCollection [
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltAggregateInstance >> isSequenceable [
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> nativeCollection [
	^ self contents
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> range: anInterval put: anObject [ 
	self contents: (self contents
		copyReplaceFrom: anInterval first
		to: anInterval last
		with: anObject)
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> range: anInterval put: anObject interpretor: anInterpretor [
	self
		contents: (self contents
				copyReplaceFrom: anInterval first
				to: anInterval last
				with: anObject)
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInstance >> remove: anObject [ 
	self contents remove: anObject
]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInstance >> select: aBlock [ 
	^ self contents select: aBlock
]

{ #category : #'*xtra-platypus-tamaris' }
PltAggregateInstance >> tamarisChildrenIntoOwner: anotherReference [ 
	| subs collection |
	subs := OrderedCollection new.
	collection := self nativeCollection.
	collection
		doWithIndex: [:el :pos | 
			subs add: (el tamarisStepValueReferenceClass owner: anotherReference position: pos)].
	^ subs
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInstance class >> with: anObject [
	^ self new add: anObject
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInstance class >> with: anObject with: aSecondObject [ 
	| arr |
	arr := self with: anObject.
	arr add: aSecondObject.
	^ arr
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInstance class >> withAll: anNativeCollection [
	^ self contents: anNativeCollection 
	
]
