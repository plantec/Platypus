Class {
	#name : #PlatypusPharoSmalltalk,
	#superclass : #Object,
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusPharoSmalltalk class >> at: aClassNameSymbol [ 
		^self at: aClassNameSymbol ifAbsent: []
]

{ #category : #accessing }
PlatypusPharoSmalltalk class >> at: aClassNameSymbol ifAbsent: aBlock [ 
	^ Smalltalk at: aClassNameSymbol  asSymbol ifAbsent: aBlock
]
