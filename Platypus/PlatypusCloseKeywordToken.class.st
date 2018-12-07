Class {
	#name : #PlatypusCloseKeywordToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusCloseKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptCloseKeyword: self
]

{ #category : #testing }
PlatypusCloseKeywordToken >> isCloseKeyword [
	^true
]
