Class {
	#name : #PlatypusStepOnePassAbstractVisitor,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'visited'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit dictionary schema' }
PlatypusStepOnePassAbstractVisitor >> acceptAttributeReference: e [ 
	e ref ifNotNil: [e ref acceptTry: self].
	e entityRef acceptTry: self.
]

{ #category : #'visit dictionary schema' }
PlatypusStepOnePassAbstractVisitor >> acceptDictionaryInstanceReference: e [ 
	e ref ifNotNil: [e ref acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusStepOnePassAbstractVisitor >> acceptEntityDefinitionReference: e [ 
	e ref
		ifNotNil: [e ref acceptTry: self]
]

{ #category : #'visit expressions schema' }
PlatypusStepOnePassAbstractVisitor >> acceptIdentifier: e [ 
	 e ref acceptTry: self.
	 e parameters acceptTry: self
]

{ #category : #'visit environment schema' }
PlatypusStepOnePassAbstractVisitor >> acceptModelContents: e [ 
	e dataInstances
		do: [:v | v acceptTry: self]

]

{ #category : #'visit dictionary schema' }
PlatypusStepOnePassAbstractVisitor >> acceptNamedTypeReference: e [ 
	e ref
		ifNotNil: [e ref acceptTry: self]
]

{ #category : #'visit generic' }
PlatypusStepOnePassAbstractVisitor >> acceptTry: anObject [ 
	(self alreadyDoneFor: anObject)
		ifFalse: [self doneFor: anObject.
			^ super acceptTry: anObject]
]

{ #category : #'visit generic' }
PlatypusStepOnePassAbstractVisitor >> alreadyDoneFor: anObject [ 
	visited
		at: anObject
		ifAbsent: [^ false].
	^ true
]

{ #category : #'visit generic' }
PlatypusStepOnePassAbstractVisitor >> doneFor: anObject [ 
	visited at: anObject put: anObject
]

{ #category : #'visit generic' }
PlatypusStepOnePassAbstractVisitor >> forceNotdoneFor: anObject [ 
	visited
		removeKey: anObject
		ifAbsent: []
]

{ #category : #'initialize/release' }
PlatypusStepOnePassAbstractVisitor >> forget [
	super forget.
	self initializeVisited
]

{ #category : #'initialize/release' }
PlatypusStepOnePassAbstractVisitor >> initialize [
	super initialize.
	self initializeVisited 
]

{ #category : #'initialize/release' }
PlatypusStepOnePassAbstractVisitor >> initializeVisited [
	visited := IdentityDictionary new
]
