Class {
	#name : #StepExternalRepresentation,
	#superclass : #StepInstance,
	#instVars : [
		'records'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'instance creation' }
StepExternalRepresentation class >> label: aString records: aCollection [ 
	^ self new label: aString records: aCollection
]

{ #category : #classification }
StepExternalRepresentation >> isExternalRepresentation [
	^ true
]

{ #category : #accessing }
StepExternalRepresentation >> label: aString records: aCollection [
	self label: aString.
	self records: aCollection
]

{ #category : #accessing }
StepExternalRepresentation >> records [
	^records
]

{ #category : #accessing }
StepExternalRepresentation >> records: anObject [
	records := anObject
]
