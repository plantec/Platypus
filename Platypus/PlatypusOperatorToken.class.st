Class {
	#name : #PlatypusOperatorToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusOperatorToken >> accept: aVisitor [ 
	^ aVisitor acceptOperator: self
]

{ #category : #testing }
PlatypusOperatorToken >> isOperator [
	^true
]
