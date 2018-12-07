Class {
	#name : #PlatypusStepChecker,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#category : #'Platypus-HW-visitors'
}

{ #category : #checking }
PlatypusStepChecker class >> checks: metaData [ 
	^ self new checks: metaData
]

{ #category : #'visit generic' }
PlatypusStepChecker >> checks: aMetaData [ 
	self subclassResponsibility
]
