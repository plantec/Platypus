Class {
	#name : #PlatypusOneWhiteSpaceToken,
	#superclass : #PlatypusWhiteSpaceToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusOneWhiteSpaceToken class >> new [
	^ super new lexicalElement: Character space
]
