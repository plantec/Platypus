Class {
	#name : 'StepGenericRepositoryFileError',
	#superclass : 'StepFileError',
	#instVars : [
		'folder'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'exceptionInstantiator' }
StepGenericRepositoryFileError class >> messageText: signalerText contents: fileContents pos: aPositionInFileContents folder: aGenericFolder [
	| err |
	err := super messageText: signalerText contents: fileContents pos: aPositionInFileContents .
	err folder: aGenericFolder.
	^ err
]

{ #category : 'accessing' }
StepGenericRepositoryFileError >> folder [
	^folder
]

{ #category : 'accessing' }
StepGenericRepositoryFileError >> folder: anObject [
	folder := anObject
]
