Class {
	#name : #PlatypusLogicalToken,
	#superclass : #PlatypusLiteralToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusLogicalToken class >> token: anObject [ 
	^ super token: anObject asLowercase asSymbol
]

{ #category : #visiting }
PlatypusLogicalToken >> accept: aVisitor [ 
	^ aVisitor acceptLogical: self
]

{ #category : #testing }
PlatypusLogicalToken >> isLogical [
	^true
]
