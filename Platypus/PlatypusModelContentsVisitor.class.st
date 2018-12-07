Class {
	#name : #PlatypusModelContentsVisitor,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'modelContents'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #checking }
PlatypusModelContentsVisitor class >> checks: metaData [ 
	^ self
		checks: metaData
		owners: metaData ownerPath

]

{ #category : #checking }
PlatypusModelContentsVisitor class >> checks: metaData owners: ownerPath [ 
	| checker |
	checker := self new visitContexts: ownerPath.
	^ checker checks: metaData
]

{ #category : #'instance creation' }
PlatypusModelContentsVisitor class >> modelContents: aModelContents [
	^ self new modelContents: aModelContents
	
]

{ #category : #accessing }
PlatypusModelContentsVisitor >> checks: data [ 
	data acceptTry: self.

]

{ #category : #accessing }
PlatypusModelContentsVisitor >> modelContents [
	^ modelContents
]

{ #category : #accessing }
PlatypusModelContentsVisitor >> modelContents: aModelContents [
	modelContents := aModelContents
]
