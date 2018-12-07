Class {
	#name : #PlatypusExpressWrapper,
	#superclass : #Object,
	#instVars : [
		'owner',
		'wrapped'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'instance creation' }
PlatypusExpressWrapper class >> linked: anExpressReference [ ^ self new linked: anExpressReference owner: nil 
]

{ #category : #'instance creation' }
PlatypusExpressWrapper class >> linked: anExpressReference owner: anotherExpressReference [ ^ self new linked: anExpressReference owner: anotherExpressReference 
]

{ #category : #visiting }
PlatypusExpressWrapper >> accept: aVisitor [ ^ self linked accept: aVisitor 
]

{ #category : #visiting }
PlatypusExpressWrapper >> acceptTry: aVisitor [ 
	^ self linkedMetaData ifNotNil: [ self linkedMetaData acceptTry: aVisitor ] 
]

{ #category : #accessing }
PlatypusExpressWrapper >> asStringOrText [ 
	^ self linked asStringOrText 
]

{ #category : #'error handling' }
PlatypusExpressWrapper >> doesNotUnderstand: aMessage [ 
	^ wrapped perform: aMessage selector withArguments: aMessage arguments 
]

{ #category : #accessing }
PlatypusExpressWrapper >> fullCodeString [ 
	^ self linked fullCodeString 
]

{ #category : #testing }
PlatypusExpressWrapper >> isLink [ ^ true 
]

{ #category : #accessing }
PlatypusExpressWrapper >> linked [ ^ wrapped 
]

{ #category : #accessing }
PlatypusExpressWrapper >> linked: anObject [ wrapped := anObject 
]

{ #category : #accessing }
PlatypusExpressWrapper >> linked: anExpressReference owner: anotherExpressReference [ self linked: anExpressReference . self owner: anotherExpressReference 
]

{ #category : #accessing }
PlatypusExpressWrapper >> linkedMetaData [ 
	^ self linked metaData 
]

{ #category : #accessing }
PlatypusExpressWrapper >> owner [ ^ owner 
]

{ #category : #accessing }
PlatypusExpressWrapper >> owner: anObject [
	owner := anObject 
]
