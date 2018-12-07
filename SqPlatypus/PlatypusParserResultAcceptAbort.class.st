Class {
	#name : #PlatypusParserResultAcceptAbort,
	#superclass : #Error,
	#instVars : [
		'requestor',
		'metaData',
		'position'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'instance creation' }
PlatypusParserResultAcceptAbort class >> requestor: aRequestor metaData: aMetaData message: aMessage position: aPosition [ 
	^ self new
		requestor: aRequestor
		metaData: aMetaData
		message: aMessage
		position: aPosition
]

{ #category : #exceptionDescription }
PlatypusParserResultAcceptAbort >> defaultAction [
	requestor
		ifNil: [^ super defaultAction]
		ifNotNil: [requestor notify: self messageText at: position]
]

{ #category : #acessing }
PlatypusParserResultAcceptAbort >> requestor: aRequestor metaData: aMetaData message: aMessage position: aPosition [ 
	requestor := aRequestor.
	metaData := aMetaData.
	self messageText: aMessage.
	position := aPosition
]
