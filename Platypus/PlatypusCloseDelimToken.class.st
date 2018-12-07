Class {
	#name : #PlatypusCloseDelimToken,
	#superclass : #PlatypusDelimToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusCloseDelimToken >> accept: aVisitor [ 
	^ aVisitor acceptCloseDelim: self
]

{ #category : #testing }
PlatypusCloseDelimToken >> isCloseDelim [
	^ true
]
