Class {
	#name : #PlatypusIndentToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusIndentToken class >> new [
	^ super new lexicalElement: String tab
]

{ #category : #visiting }
PlatypusIndentToken >> accept: aVisitor [ 
	^ aVisitor acceptIndent: self
]

{ #category : #testing }
PlatypusIndentToken >> isIndent [
	^true
]

{ #category : #accessing }
PlatypusIndentToken >> widthOfStringForFont: textFont [ 
	textFont notNil
		ifTrue: [^ 50].
	^ 8
]
