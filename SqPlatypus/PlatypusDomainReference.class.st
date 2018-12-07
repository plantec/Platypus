Class {
	#name : #PlatypusDomainReference,
	#superclass : #PlatypusExpressLinkReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #testing }
PlatypusDomainReference >> isMoveable [ 
	"can be moved"
	^ false 
]

{ #category : #testing }
PlatypusDomainReference >> isRemoveable [ ^ false 
]
