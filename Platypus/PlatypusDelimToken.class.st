Class {
	#name : #PlatypusDelimToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusDelimToken class >> token: anObject [ 
	^ super token: anObject  asSymbol
]

{ #category : #visiting }
PlatypusDelimToken >> accept: aVisitor [ 
	^ aVisitor acceptDelim: self
]
