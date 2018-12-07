Class {
	#name : #PlatypusStepCheckerError,
	#superclass : #PlatypusVisitorError,
	#instVars : [
		'stepFolder'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'instance creation' }
PlatypusStepCheckerError class >> error: aMessage oid: anInteger folder: aStepFolder [ 
	| instance err |
	instance := aStepFolder instanceAt: anInteger.
	err := self metaData: instance message: aMessage.
	err stepFolder: aStepFolder.
	^ err
]

{ #category : #'instance creation' }
PlatypusStepCheckerError class >> error: aMessage oid: anInteger 	repository: aPlatypusRepository [
	^ self error: aMessage oid: anInteger folder: aPlatypusRepository
]

{ #category : #accessing }
PlatypusStepCheckerError >> stepFolder [
	^stepFolder
]

{ #category : #accessing }
PlatypusStepCheckerError >> stepFolder: anObject [
	stepFolder := anObject
]
