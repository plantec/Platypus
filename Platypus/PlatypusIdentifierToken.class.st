Class {
	#name : #PlatypusIdentifierToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusIdentifierToken >> accept: aVisitor [ 
	^ aVisitor acceptIdentifier: self
]

{ #category : #testing }
PlatypusIdentifierToken >> isEquivalentTo: anotherToken [ 
	^ ((anotherToken isKindOf: self class)
			or: [self isKindOf: anotherToken class])
		and: [self asString asUppercase = anotherToken asString asUppercase]
]

{ #category : #testing }
PlatypusIdentifierToken >> isIdentifier [
	^true
]
