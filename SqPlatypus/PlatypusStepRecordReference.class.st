Class {
	#name : #PlatypusStepRecordReference,
	#superclass : #PlatypusStepReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusStepRecordReference >> elementTag [
	^ #simpleRecord
]

{ #category : #testing }
PlatypusStepRecordReference >> isChangeable [ 
	^ true
]

{ #category : #accessing }
PlatypusStepRecordReference >> parserStartingState [
	^ StepParser startingStateForSimpleRecordEntry
]

{ #category : #accessing }
PlatypusStepRecordReference >> shortName [
	^ self codeText asString contractTo: 100
]

{ #category : #accessing }
PlatypusStepRecordReference >> value [
	^ self owner at: pos
]
