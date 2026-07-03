Class {
	#name : 'StepRedefinedValue',
	#superclass : 'StepCoreObject',
	#classVars : [
		'Singleton'
	],
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'accessing' }
StepRedefinedValue class >> new [
	^ self singleton

]

{ #category : 'accessing' }
StepRedefinedValue class >> singleton [
	^ Singleton
		ifNil: [Singleton := self basicNew]
]

{ #category : 'printing' }
StepRedefinedValue >> printOn: aStream [ 
	aStream nextPut: $*.

]
