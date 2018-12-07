Class {
	#name : #PlatypusAttributeIdentification,
	#superclass : #Object,
	#instVars : [
		'definition',
		'globalPos',
		'localPos'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusAttributeIdentification class >> definition: aPltAttribute globalPos: gpos localPos: lpos [
	^ self new definition: aPltAttribute globalPos: gpos localPos: lpos
]

{ #category : #accessing }
PlatypusAttributeIdentification >> definition [
	^definition
]

{ #category : #accessing }
PlatypusAttributeIdentification >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
PlatypusAttributeIdentification >> definition: aPltAttribute globalPos: gpos localPos: lpos [ 
	self definition: aPltAttribute.
	self globalPos: gpos.
	self localPos: lpos 
]

{ #category : #accessing }
PlatypusAttributeIdentification >> globalPos [
	^globalPos
]

{ #category : #accessing }
PlatypusAttributeIdentification >> globalPos: anObject [
	globalPos := anObject
]

{ #category : #accessing }
PlatypusAttributeIdentification >> localPos [
	^localPos
]

{ #category : #accessing }
PlatypusAttributeIdentification >> localPos: anObject [
	localPos := anObject
]

{ #category : #printing }
PlatypusAttributeIdentification >> printOn: aStream [ 
	aStream nextPutAll: self class name , '('.
	self definition owner name printOn: aStream.
	aStream nextPutAll: '>>'.
	self definition name printOn: aStream.
	aStream nextPut: Character space.
	self globalPos printOn: aStream.
	aStream nextPut: Character space.
	self localPos printOn: aStream.
	aStream nextPut: $)
]
