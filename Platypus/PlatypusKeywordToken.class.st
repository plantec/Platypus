Class {
	#name : #PlatypusKeywordToken,
	#superclass : #PlatypusGenericToken,
	#classVars : [
		'ForceToUppercase'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #accessing }
PlatypusKeywordToken class >> forceToUppercase [
	^ ForceToUppercase ifNil: [ForceToUppercase := true]
]

{ #category : #accessing }
PlatypusKeywordToken class >> forceToUppercase: aBoolean [ 
	ForceToUppercase := aBoolean
]

{ #category : #'class initialization' }
PlatypusKeywordToken class >> initialize [
	"self initialize"

	ForceToUppercase := true
]

{ #category : #'instance creation' }
PlatypusKeywordToken class >> token: anObject [ 
	^ super token: anObject asLowercase asSymbol
]

{ #category : #visiting }
PlatypusKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptKeyword: self
]

{ #category : #converting }
PlatypusKeywordToken >> asString [
	self forceToUppercase
		ifTrue: [^ self lexicalElement asString asUppercase].
	^ self lexicalElement asString
]

{ #category : #accessing }
PlatypusKeywordToken >> forceToUppercase [
	^ self class forceToUppercase
]

{ #category : #testing }
PlatypusKeywordToken >> isKeyword [ 
	^true
]
