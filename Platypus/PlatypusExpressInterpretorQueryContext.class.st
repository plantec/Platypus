Class {
	#name : #PlatypusExpressInterpretorQueryContext,
	#superclass : #PlatypusExpressInterpretorContext,
	#instVars : [
		'aggregateSource',
		'sourceStream',
		'resultStream',
		'current'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> aggregateSource [
	^aggregateSource
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> aggregateSource: anObject [ 
	aggregateSource := anObject.
	sourceStream := ReadStream on: (aggregateSource val nativeCollection) asArray.
	resultStream := WriteStream
				on: (Array new: 100).
	current := PltMissingValue new
]

{ #category : #testing }
PlatypusExpressInterpretorQueryContext >> atEnd [
	^ self sourceStream atEnd
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> current [
	^ current
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> current: anObject [
	current := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> dontKeep [
	aggregateSource val isPltArrayInstance
		ifTrue: [self resultStream nextPut: PltMissingValue new]
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> keep [
	self resultStream nextPut: self current 
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> next [
	^ current := self sourceStream next
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> result [
	| result |
	result := self aggregateSource val copyEmpty.
	result setQueryBoundsFromSource: self aggregateSource val.
	result contents: self resultStream contents.
	^ result
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> resultStream [
	^resultStream
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> resultStream: anObject [
	resultStream := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> sourceStream [
	^sourceStream
]

{ #category : #accessing }
PlatypusExpressInterpretorQueryContext >> sourceStream: anObject [
	sourceStream := anObject
]
