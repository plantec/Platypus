Class {
	#name : #PlatypusOpenKeywordToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusOpenKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptOpenKeyword: self
]

{ #category : #testing }
PlatypusOpenKeywordToken >> isOpenKeyword [
	^true
]
