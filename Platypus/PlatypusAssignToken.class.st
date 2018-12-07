Class {
	#name : #PlatypusAssignToken,
	#superclass : #PlatypusOperatorToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusAssignToken >> accept: aVisitor [
	^aVisitor acceptAssign: self
]

{ #category : #testing }
PlatypusAssignToken >> isAssign [
	^true
]
