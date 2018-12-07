Class {
	#name : #PlatypusCoreAbstractVisitor,
	#superclass : #Object,
	#instVars : [
		'logClient',
		'logLevel',
		'visitPath',
		'visitErrors',
		'acceptSelectorsMap',
		'objectsWithErrorIndex'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreAbstractVisitor class >> accept: e [
	^ e accept: self new.
]

{ #category : #'instance creation' }
PlatypusCoreAbstractVisitor class >> visitPath: aStack [ 
	^self new visitPath: aStack 
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> acceptSelectorsMap [
	^ acceptSelectorsMap
]

{ #category : #'visit generic' }
PlatypusCoreAbstractVisitor >> acceptTry: anObject [
	self 
		asVisitPathTop: anObject 
		while: [^ self performAcceptFor: anObject]
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> addVisitorError: aVisitorError [ 
	(self visitErrors size < 30) 
		ifTrue: [
			(self visitErrors noneSatisfy: [:err | 
				err message = aVisitorError message and: [err path = aVisitorError path]])
				ifFalse: [^ false ].
			visitErrors add: aVisitorError.
			^ true].
	^ false
]

{ #category : #'visit generic' }
PlatypusCoreAbstractVisitor >> asVisitPathTop: anObjectOrCollection while: aBlock [
	anObjectOrCollection ifNil: [^self ].
	self pushIntoVisitPath: anObjectOrCollection.
	aBlock
		ensure: [self popFromVisitPath]
]

{ #category : #copying }
PlatypusCoreAbstractVisitor >> copy [
	| cpy |
	cpy := super copy.
	cpy forget.
	^ cpy
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> declareWithError: e [ 
	objectsWithErrorIndex add: e
				
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> declareWithoutError: e [ 
	objectsWithErrorIndex
		remove: e
		ifAbsent: []

]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> declaredWithError: e [ 
	^ objectsWithErrorIndex includes: e

]

{ #category : #'initialize/release' }
PlatypusCoreAbstractVisitor >> destroy [
	super destroy.
	logClient ifNotNil: 
			[logClient := nil].
	visitPath := nil.
	visitErrors do: [:e | e destroy].
	visitErrors := nil.
	acceptSelectorsMap := nil
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> errors [
	^ self visitErrors

]

{ #category : #'initialize/release' }
PlatypusCoreAbstractVisitor >> forget [
	self initializeVisitErrors.
	self initializeObjectsWithErrorIndex
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> haveError [
	^ visitErrors notEmpty
]

{ #category : #'initialize/release' }
PlatypusCoreAbstractVisitor >> initialize [
	| logClientClass |
	super initialize.
	logLevel := #NoLog.
	"logLevel := #debug."
	(logClientClass := Smalltalk
				at: #LogClient
				ifAbsent: [])
		ifNotNil: [logClient := logClientClass getInstance: self class name].
	visitPath := PlatypusStack new.
	visitErrors := OrderedCollection new.
	acceptSelectorsMap := SmallIdentityDictionary new.
	self initializeObjectsWithErrorIndex
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> initializeObjectsWithErrorIndex [
	objectsWithErrorIndex := IdentitySet new
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> initializeVisitErrors [
	visitErrors := OrderedCollection new.

]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> logClient [
	^ logClient
]

{ #category : #logging }
PlatypusCoreAbstractVisitor >> logInfo: aMessage [ 
	logLevel ~= #NoLog
		ifTrue: [self logClient
				ifNil: [Transcript show: Time now printString , ': ' , aMessage , '\' withCRs]
				ifNotNil: [self logClient info: aMessage asString]]
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> logLevel [
	^ logLevel
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> logLevel: aSymbol [
	logLevel := aSymbol
]

{ #category : #logging }
PlatypusCoreAbstractVisitor >> logPathAndInfo: aMessage [ 
	| mess contexts |
	logLevel == #debug
		ifTrue: [mess := WriteStream on: String new.
			contexts := visitPath asArray
						select: [:p | p isCollection not
								and: [p isPltContextDefinition]].
			contexts
				do: [:p | mess nextPutAll: p name]
				separatedBy: [mess nextPutAll: ' | '].
			self logInfo: mess contents , ': ' , aMessage]
]

{ #category : #'visit generic' }
PlatypusCoreAbstractVisitor >> lookUpAndCacheAcceptSelectorOfClass: aClass [ 
	| currClass str |
	currClass := aClass.
	str := WriteStream on: (String new: 50).
	[currClass ~~ Object]
		whileTrue: [ | n selector |
			n := currClass name.
			str nextPutAll: 'accept'.
			4 to: n size do: [:p | str nextPut: (n at: p) ].
			str nextPut: $:.
			selector := str contents asSymbol.
			(self class whichClassIncludesSelector: selector)
				ifNotNil: [:cls |
					self acceptSelectorsMap at: cls put: selector.
					^ selector].
			str reset.
			currClass := currClass superclass].
	^ self error: 'unimplemented accept method for class ''' , aClass name , ''''
]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> objectsWithErrorIndex [
	^ objectsWithErrorIndex

]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> pathTo: aDictionaryInstance [
	^ aDictionaryInstance inclusiveOwnerPath 
]

{ #category : #'visit generic' }
PlatypusCoreAbstractVisitor >> performAcceptFor: anObject [
	| selector |
	selector := 
		acceptSelectorsMap
			at: anObject class
			ifAbsent: [self lookUpAndCacheAcceptSelectorOfClass: anObject class].
	^ self perform: selector with: anObject
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> popFromVisitPath [
	^ visitPath pop

]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> pushIntoVisitPath: anObject [ 
	visitPath push: anObject

]

{ #category : #'error handling' }
PlatypusCoreAbstractVisitor >> registerError: aVisitorError [
	(self addVisitorError: aVisitorError)
		ifTrue: [ aVisitorError path last inclusiveOwnerPath do: [:p | p addError: aVisitorError]]
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> visitContexts: aCollection [ 
	aCollection
		do: [:el | self pushIntoVisitPath: el]
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> visitErrors [
	^ visitErrors
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> visitPath: aStack [
	visitPath := aStack
]

{ #category : #accessing }
PlatypusCoreAbstractVisitor >> visitedInstances [
	| |
	^ visitPath asArray
]
