Class {
	#name : 'PlatypusPlusToken',
	#superclass : 'PlatypusOperatorToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusPlusToken >> accept: aVisitor [ 
	^ aVisitor acceptPlus: self
]
