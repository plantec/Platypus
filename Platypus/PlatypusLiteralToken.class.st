Class {
	#name : #PlatypusLiteralToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusLiteralToken >> accept: aVisitor [ 
	^ aVisitor acceptLiteral: self
]

{ #category : #testing }
PlatypusLiteralToken >> isStepLiteral [
	^ true
]
