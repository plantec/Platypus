Class {
	#name : 'PlatypusGroupKeywordToken',
	#superclass : 'PlatypusKeywordToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusGroupKeywordToken >> accept: aVisitor [ 
	^ aVisitor acceptGroupKeyword: self
]

{ #category : 'testing' }
PlatypusGroupKeywordToken >> isGroupKeyword [
	^true
]
