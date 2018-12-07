Class {
	#name : #PlatypusNumberToken,
	#superclass : #PlatypusLiteralToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusNumberToken >> accept: aVisitor [ 
	^ aVisitor acceptNumber: self
]

{ #category : #testing }
PlatypusNumberToken >> isNumber [
	^ true
]
