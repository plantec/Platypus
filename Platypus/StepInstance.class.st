Class {
	#name : 'StepInstance',
	#superclass : 'StepCoreObject',
	#instVars : [
		'label'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'classification' }
StepInstance >> isExternalRepresentation [
	^ false
]

{ #category : 'classification' }
StepInstance >> isInternalRepresentation [
	^ false
]

{ #category : 'accessing' }
StepInstance >> label [
	^label
]

{ #category : 'accessing' }
StepInstance >> label: anObject [
	label := anObject
]
