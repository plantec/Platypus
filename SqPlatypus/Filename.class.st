Class {
	#name : #Filename,
	#superclass : #Object,
	#instVars : [
		'publicName'
	],
	#category : #'SqPlatypus-VW-Compatibility'
}

{ #category : #'instance creation' }
Filename class >> named: str [ 
	^ self new publicName: str
]

{ #category : #accessing }
Filename >> publicName [
	^publicName
]

{ #category : #accessing }
Filename >> publicName: aName [ 
	publicName := aName
]

{ #category : #'stream creation' }
Filename >> readStream [
	^ FileStream fileNamed: self publicName
]

{ #category : #'stream creation' }
Filename >> writeStream [

	^ FileStream forceNewFileNamed: self publicName
]
