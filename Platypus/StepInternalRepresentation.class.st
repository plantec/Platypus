Class {
	#name : 'StepInternalRepresentation',
	#superclass : 'StepInstance',
	#instVars : [
		'entityName',
		'values'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'instance creation' }
StepInternalRepresentation class >> label: aString entityName: entName values: aCollection [ 
	^ self new label: aString entityName: entName values: aCollection 

]

{ #category : 'accessing' }
StepInternalRepresentation >> entityName [
	^entityName
]

{ #category : 'accessing' }
StepInternalRepresentation >> entityName: anObject [
	entityName := anObject
]

{ #category : 'classification' }
StepInternalRepresentation >> isInternalRepresentation [
	^ true
]

{ #category : 'accessing' }
StepInternalRepresentation >> label: aString entityName: entName values: aCollection [ 
	self label: aString.
	self entityName: entName.
	self values: aCollection
]

{ #category : 'accessing' }
StepInternalRepresentation >> values [
	^values
]

{ #category : 'accessing' }
StepInternalRepresentation >> values: anObject [
	values := anObject
]
