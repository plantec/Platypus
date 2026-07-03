Class {
	#name : 'PlatypusOneWhiteSpaceToken',
	#superclass : 'PlatypusWhiteSpaceToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'instance creation' }
PlatypusOneWhiteSpaceToken class >> new [
	^ super new lexicalElement: Character space
]
