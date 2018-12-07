Class {
	#name : #PlatypusWhiteSpaceToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusWhiteSpaceToken >> accept: aVisitor [
	^aVisitor acceptWhiteSpace: self
]

{ #category : #testing }
PlatypusWhiteSpaceToken >> isWhiteSpace [

	^ true
]
