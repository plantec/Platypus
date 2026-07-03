Class {
	#name : 'PlatypusOpenKeywordToken',
	#superclass : 'PlatypusKeywordToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusOpenKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptOpenKeyword: self
]

{ #category : 'testing' }
PlatypusOpenKeywordToken >> isOpenKeyword [
	^true
]
