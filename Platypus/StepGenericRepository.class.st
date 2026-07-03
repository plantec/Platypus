Class {
	#name : 'StepGenericRepository',
	#superclass : 'StepAbstractRepository',
	#instVars : [
		'header'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'accessing' }
StepGenericRepository class >> dataParserClass [
	^ StepParser
]

{ #category : 'accessing' }
StepGenericRepository >> dataParserClass [
	^ self class dataParserClass
]

{ #category : 'accessing' }
StepGenericRepository >> header [
	^header
]

{ #category : 'initialize/release' }
StepGenericRepository >> initialize [
	super initialize.
	header := OrderedCollection new.
]

{ #category : 'file in/out' }
StepGenericRepository >> notify: error at: location in: stream [ 
	| contentsWithError errorOut errFilename |
	contentsWithError := stream contents 
				copyReplaceFrom: location
				to: location - 1
				with: '******' , error , '->'.
	(errorOut := (Filename named: (errFilename := self class name , '.error')) 
				writeStream) ifNotNil: 
				[
				[errorOut nextPutAll: contentsWithError.
				Transcript show: 'Error found in a STEP stream, see into ' , errFilename] 
						ensure: [errorOut close]].
	^ (StepGenericRepositoryFileError 
		messageText: error
		contents: stream contents
		pos: location
		folder: self) signal
]

{ #category : 'file in/out' }
StepGenericRepository >> parseDataStream: in onError: aBlock [ 
	| id result |
	result := self dataParserClass 
		parseStream: in 
		startingAt: StepParser startingStateForDataEntities 
		onError: aBlock.
	self registerAllInstances: result
]

{ #category : 'file in/out' }
StepGenericRepository >> parseStream: in [ 
	^ self parseStream: in onError: [:d :l | self notify: d at: l in: in].
]

{ #category : 'file in/out' }
StepGenericRepository >> parseStream: in onError: aBlock [ 
	| id result |
	result := self dataParserClass parseStream: in onError: aBlock.
	header := result first.
	self registerAllInstances: (result second)
]

{ #category : 'file in/out' }
StepGenericRepository >> parseStream: in startingAt: startingState onError: aBlock [ 
	| id result |
	result := self dataParserClass parseStream: in startingAt: startingState onError: aBlock.
	header := result first.
	self registerAllInstances: (result second)
]

{ #category : 'file in/out' }
StepGenericRepository >> registerAllInstances: aCollection [
	aCollection
		do: [:inst | 
			self registerInstance: inst withId: inst label].
	self resolvesInstanceReferences
]

{ #category : 'instance registering' }
StepGenericRepository >> registerHeaderInstance: headerInst [ 
	header add: headerInst
]

{ #category : 'accessing' }
StepGenericRepository >> resolvedTokenOf: t [ 
	(t isKindOf: StepInstanceReference)
		ifTrue: [ t ref: (self instanceAt: t id)]
		ifFalse: [
			(t isKindOf: StepSimpleRecord)
				ifTrue: [ t values: (self resolvedTokenOf: t values)]
				ifFalse: [((t isKindOf: Collection) and: [(t isKindOf: String) not])
					ifTrue: [^ t collect: [:e | self resolvedTokenOf: e]]]].
	^ t
]

{ #category : 'checking' }
StepGenericRepository >> resolvesInstanceReferencesOf: instance [ 
	1
		to: instance class instSize
		do: [:i | instance
				instVarAt: i
				put: ( (self
						resolvedTokenOf:  (instance instVarAt: i)))]
]
