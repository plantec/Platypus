Class {
	#name : #PlatypusExpressNativeAlgorithmToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusExpressNativeAlgorithmToken >> accept: aVisitor [ 
	^ aVisitor acceptNativeCode: self
]

{ #category : #converting }
PlatypusExpressNativeAlgorithmToken >> asPltRemark [
	| pltRem |
	pltRem := PltEmbeddedRemark new.
	pltRem setText: self lexicalElement.
	^ pltRem
]

{ #category : #converting }
PlatypusExpressNativeAlgorithmToken >> asString [
	^ '(*#' , self lexicalElement , '#*)'
]

{ #category : #formating }
PlatypusExpressNativeAlgorithmToken >> formatWithIndentString: aString [ 
	| newsub newLex |
	newsub := String cr , aString , '(*# '.
	newLex := ''.
	self lexicalElement
		linesDo: [:l | newLex isEmpty
				ifTrue: [newLex := l]
				ifFalse: [newLex := newLex , '#*)' , newsub , l]].
	self lexicalElement: newLex
]

{ #category : #testing }
PlatypusExpressNativeAlgorithmToken >> isNativeCode [
	^ true
]
