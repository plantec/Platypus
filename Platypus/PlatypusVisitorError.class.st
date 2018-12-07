Class {
	#name : #PlatypusVisitorError,
	#superclass : #Object,
	#instVars : [
		'message',
		'data',
		'path',
		'metaData'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'instance creation' }
PlatypusVisitorError class >> metaData: anEntityInstance message: aMessage [ 
	^ self new
		message: aMessage;
		metaData: anEntityInstance

]

{ #category : #accessing }
PlatypusVisitorError >> asString [
	| s named p |
	s := WriteStream on: ''.
	p := self path.
	p isEmptyOrNil 
		ifFalse: [
			named := p allButLast
						select: [:elem | elem isPltContextDefinition
								or: [elem isPltNamedType]].
			named
				do: [:elem | s nextPutAll: elem name]
				separatedBy: [s nextPutAll: '\']].
	s nextPutAll: ': '.
	s 
		nextPutAll: (self metaData ifNil: ['?'] ifNotNil: [:md | md errorQualifier contractTo: 90]);
		nextPutAll: ': '.
	s nextPutAll: message.
	^ s contents
]

{ #category : #accessing }
PlatypusVisitorError >> message [
	^message
]

{ #category : #accessing }
PlatypusVisitorError >> message: anObject [
	message := anObject
]

{ #category : #accessing }
PlatypusVisitorError >> metaData [
	^ metaData
]

{ #category : #accessing }
PlatypusVisitorError >> metaData: anEntityInstance [ 
	metaData := anEntityInstance
]

{ #category : #accessing }
PlatypusVisitorError >> path [
	^ metaData ifNotNil: [ metaData inclusiveOwnerPath ]
]
