Class {
	#name : 'PlatypusLiteralToken',
	#superclass : 'PlatypusGenericToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusLiteralToken >> accept: aVisitor [ 
	^ aVisitor acceptLiteral: self
]

{ #category : 'testing' }
PlatypusLiteralToken >> isStepLiteral [
	^ true
]
