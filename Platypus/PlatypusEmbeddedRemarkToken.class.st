Class {
	#name : #PlatypusEmbeddedRemarkToken,
	#superclass : #PlatypusRemarkToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusEmbeddedRemarkToken class >> token: anObject [ 
	^ self new lexicalElement: anObject
]

{ #category : #visiting }
PlatypusEmbeddedRemarkToken >> accept: aVisitor [ 
	^ aVisitor acceptEmbeddedRemark: self
]

{ #category : #converting }
PlatypusEmbeddedRemarkToken >> asPltRemark [
	| pltRem |
	pltRem := PltEmbeddedRemark new.
	pltRem setText: self lexicalElement.
	^ pltRem
]

{ #category : #converting }
PlatypusEmbeddedRemarkToken >> asString [
	self lexicalElement size > 0
		ifTrue: [(self lexicalElement first == $"
					or: [self lexicalElement first == $<])
				ifTrue: [^ '(*' ,self lexicalElement , '*)']].
	^ '(*' ,self lexicalElement , '*)'
]

{ #category : #formating }
PlatypusEmbeddedRemarkToken >> formatWithIndentString: aString [ 
	| newLex lines |
	newLex := ''.
	lines := OrderedCollection new.
	self lexicalElement
		linesDo: [:l | lines add: l].
	lines
		do: [:l | newLex := newLex , l]
		separatedBy: [newLex := newLex , String cr, aString ].
	self lexicalElement: newLex
]

{ #category : #testing }
PlatypusEmbeddedRemarkToken >> isEmbeddedRemark [
	^ true
]
