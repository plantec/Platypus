Class {
	#name : 'Filename',
	#superclass : 'Object',
	#instVars : [
		'publicName'
	],
	#category : 'SqPlatypus-VW-Compatibility',
	#package : 'SqPlatypus',
	#tag : 'VW-Compatibility'
}

{ #category : 'instance creation' }
Filename class >> named: str [ 
	^ self new publicName: str
]

{ #category : 'accessing' }
Filename >> publicName [
	^publicName
]

{ #category : 'accessing' }
Filename >> publicName: aName [ 
	publicName := aName
]

{ #category : 'stream creation' }
Filename >> readStream [
	^ self publicName asFileReference readStream
]

{ #category : 'stream creation' }
Filename >> writeStream [

	^ self publicName asFileReference writeStream
]
