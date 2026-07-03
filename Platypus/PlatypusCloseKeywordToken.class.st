Class {
	#name : 'PlatypusCloseKeywordToken',
	#superclass : 'PlatypusKeywordToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusCloseKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptCloseKeyword: self
]

{ #category : 'testing' }
PlatypusCloseKeywordToken >> isCloseKeyword [
	^true
]
