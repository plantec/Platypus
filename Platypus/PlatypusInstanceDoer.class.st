Class {
	#name : #PlatypusInstanceDoer,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'modelContents',
		'action',
		'sourceCollection'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit population schema' }
PlatypusInstanceDoer >> acceptAggregateData: e [ 
	e contents 	
		doWithIndex: [:v :p |
			action value: e contents value: p.
			self acceptTry: v]
]

{ #category : #'visit population schema' }
PlatypusInstanceDoer >> acceptExternalRepresentation: e [ 
	e records
		doWithIndex: [:v :p |
			action value: e records value: p.
			self acceptTry: v]
]

{ #category : #'visit population schema' }
PlatypusInstanceDoer >> acceptInternalRepresentation: e [ 
	e parameters 
		doWithIndex: [:v :p |
			action value: e parameters value: p.
			self acceptTry: v]
]

{ #category : #'visit population schema' }
PlatypusInstanceDoer >> acceptModelContents: e [ 
	self modelContents: e.
	e dataInstances  
		doWithIndex: [:v :p |
			(sourceCollection includes: v)
				ifTrue: [
					action value: e dataInstances value: p.
					self acceptTry: v]]
]

{ #category : #'visit population schema' }
PlatypusInstanceDoer >> acceptSimpleRecord: e [ 
	e parameters 
		doWithIndex: [:v :p |
			action value: e parameters value: p.
			self acceptTry: v]
]

{ #category : #accessing }
PlatypusInstanceDoer >> do: aBlock from: aCollection in: aModelContents [
	action := aBlock.
	sourceCollection := aCollection.
	self acceptTry: aModelContents.

]

{ #category : #accessing }
PlatypusInstanceDoer >> modelContents: anObject [
	modelContents := anObject
]
