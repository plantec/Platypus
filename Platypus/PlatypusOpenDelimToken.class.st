Class {
	#name : #PlatypusOpenDelimToken,
	#superclass : #PlatypusDelimToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusOpenDelimToken >> accept: aVisitor [ 
	^ aVisitor acceptOpenDelim: self
]

{ #category : #testing }
PlatypusOpenDelimToken >> isOpenDelim [
	^ true
]
