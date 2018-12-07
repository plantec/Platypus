Class {
	#name : #PlatypusTailRemarkToken,
	#superclass : #PlatypusRemarkToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusTailRemarkToken class >> token: anObject [ 
	^ self new lexicalElement: anObject
]

{ #category : #visiting }
PlatypusTailRemarkToken >> accept: aVisitor [ 
	^ aVisitor acceptTailRemark: self
]

{ #category : #converting }
PlatypusTailRemarkToken >> asPltRemark [
	| pltRem |
	pltRem :=  PltTailRemark new.
	pltRem setText: self lexicalElement.
	^pltRem
]

{ #category : #converting }
PlatypusTailRemarkToken >> asString [
	^ '--' , self lexicalElement
]

{ #category : #testing }
PlatypusTailRemarkToken >> isTailRemark [
	^ true
]
