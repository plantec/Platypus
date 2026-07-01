Class {
	#name : #StepSimpleRecord,
	#superclass : #StepCoreObject,
	#instVars : [
		'entityName',
		'values'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'instance creation' }
StepSimpleRecord class >> entityName: entName values: aCollection [ 
	^ self new entityName: entName values: aCollection 
]

{ #category : #converting }
StepSimpleRecord >> asInternalRepresentationLabelled: aLabel [
	^ StepInternalRepresentation label: aLabel entityName: self entityName values: self values

]

{ #category : #accessing }
StepSimpleRecord >> entityName [
	^entityName
]

{ #category : #accessing }
StepSimpleRecord >> entityName: anObject [
	entityName := anObject
]

{ #category : #accessing }
StepSimpleRecord >> entityName: entName values: aCollection [ 
	self entityName: entName.
	self values: aCollection
]

{ #category : #accessing }
StepSimpleRecord >> values [
	^values
]

{ #category : #accessing }
StepSimpleRecord >> values: anObject [
	values := anObject
]
