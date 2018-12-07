Class {
	#name : #PlatypusModelContentsRecorder,
	#superclass : #PlatypusModelContentsVisitor,
	#instVars : [
		'checkingPass'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit population schema' }
PlatypusModelContentsRecorder >> acceptApplicationInstance: e [ 
	checkingPass = #recording
		ifTrue: [(e persistentLabel isNil or: [e persistentLabel isEmpty])
			ifTrue: [modelContents add: e]]
]

{ #category : #'visit population schema' }
PlatypusModelContentsRecorder >> acceptEntityInstanceReference: e [ 
	(e persistentLabel isNil or: [e persistentLabel isEmpty])
		ifTrue: [checkingPass = #referencing
			ifTrue: [(e ref notNil and: [e ref persistentLabel notNil and: [e ref persistentLabel notEmpty]])
				ifTrue: [e persistentLabel: e ref persistentLabel]]
		ifFalse: [e ref acceptTry: self]]
]

{ #category : #'visit population schema' }
PlatypusModelContentsRecorder >> acceptExternalRepresentation: e [ 
	self acceptApplicationInstance: e.
	super acceptExternalRepresentation: e 

]

{ #category : #'visit population schema' }
PlatypusModelContentsRecorder >> acceptInternalRepresentation: e [ 
	self acceptApplicationInstance: e.
	super acceptInternalRepresentation: e 
]

{ #category : #accessing }
PlatypusModelContentsRecorder >> checks: aMetaData [ 
	checkingPass := #recording.
	super checks: aMetaData.
	checkingPass := #referencing.
	super checks: modelContents
]

{ #category : #accessing }
PlatypusModelContentsRecorder >> checksAll: aMetaDataCollection [
	checkingPass := #recording.
	aMetaDataCollection do: [:el | super checks: el].
	checkingPass := #referencing.
	super checks: modelContents
]

{ #category : #'initialize-release' }
PlatypusModelContentsRecorder >> initialize [
	super initialize.
	checkingPass := #recording
]
