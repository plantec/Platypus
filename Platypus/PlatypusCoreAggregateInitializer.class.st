Class {
	#name : #PlatypusCoreAggregateInitializer,
	#superclass : #PlatypusCoreExpression,
	#instVars : [
		'contentBlocks'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreAggregateInitializer class >> collectionFrom: aListOfBlocks [ 
	^ (self contentBlocks: aListOfBlocks) asOrderedCollection
]

{ #category : #'instance creation' }
PlatypusCoreAggregateInitializer class >> contentBlocks: aListOfBlocks [ 
	^ self new contentBlocks: aListOfBlocks 
]

{ #category : #converting }
PlatypusCoreAggregateInitializer >> asArray [
	^ self asOrderedCollection asArray
]

{ #category : #converting }
PlatypusCoreAggregateInitializer >> asOrderedCollection [
	| col |
	col := OrderedCollection new.
	(contentBlocks
		collect: [:b | b isBlock
				ifTrue: [b value]
				ifFalse: [b]])
		do: [:elem | (elem isCollection and: [elem isString not])
				ifTrue: [col addAll: elem]
				ifFalse: [col add: elem]].
	^ col
]

{ #category : #accessing }
PlatypusCoreAggregateInitializer >> contentBlocks: aListOfBlocks [
	contentBlocks:= aListOfBlocks
]
