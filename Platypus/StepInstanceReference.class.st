Class {
	#name : #StepInstanceReference,
	#superclass : #StepCoreObject,
	#instVars : [
		'id',
		'ref'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'instance creation' }
StepInstanceReference class >> id: anInteger [  ^self new id: anInteger
]

{ #category : #accessing }
StepInstanceReference >> id [	^id
]

{ #category : #accessing }
StepInstanceReference >> id: anObject [	id := anObject
]

{ #category : #printing }
StepInstanceReference >> printOn: aStream [  aStream nextPut: $#.  id printOn: aStream.
]

{ #category : #accessing }
StepInstanceReference >> ref [
	^ref
]

{ #category : #accessing }
StepInstanceReference >> ref: anObject [
	ref := anObject
]
