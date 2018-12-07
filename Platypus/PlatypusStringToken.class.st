Class {
	#name : #PlatypusStringToken,
	#superclass : #PlatypusLiteralToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusStringToken >> accept: aVisitor [
	^ aVisitor acceptString: self
]

{ #category : #testing }
PlatypusStringToken >> isString [
	^ true
]
