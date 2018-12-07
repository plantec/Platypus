Class {
	#name : #PlatypusPlusToken,
	#superclass : #PlatypusOperatorToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusPlusToken >> accept: aVisitor [ 
	^ aVisitor acceptPlus: self
]
