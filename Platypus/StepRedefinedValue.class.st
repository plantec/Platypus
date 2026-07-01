Class {
	#name : #StepRedefinedValue,
	#superclass : #StepCoreObject,
	#classVars : [
		'Singleton'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #accessing }
StepRedefinedValue class >> new [
	^ self singleton

]

{ #category : #accessing }
StepRedefinedValue class >> singleton [
	^ Singleton
		ifNil: [Singleton := self basicNew]
]

{ #category : #printing }
StepRedefinedValue >> printOn: aStream [ 
	aStream nextPut: $*.

]
