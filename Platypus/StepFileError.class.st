Class {
	#name : 'StepFileError',
	#superclass : 'StepError',
	#instVars : [
		'contents',
		'pos'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'exceptionInstantiator' }
StepFileError class >> messageText: signalerText contents: fileContents pos: aPositionInFileContents [ 
	"Signal the occurrence of an exceptional condition with a specified
	textual description."
	| err |
	err := self new messageText: signalerText.
	err pos: aPositionInFileContents.
	err contents: fileContents.
	^ err
]

{ #category : 'accessing' }
StepFileError >> contents [
	^contents
]

{ #category : 'accessing' }
StepFileError >> contents: anObject [
	contents := anObject
]

{ #category : 'accessing' }
StepFileError >> pos [
	^pos
]

{ #category : 'accessing' }
StepFileError >> pos: anObject [
	pos := anObject
]
