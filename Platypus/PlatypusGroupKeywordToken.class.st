Class {
	#name : #PlatypusGroupKeywordToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusGroupKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptGroupKeyword: self
]

{ #category : #testing }
PlatypusGroupKeywordToken >> isGroupKeyword [
	^true
]
