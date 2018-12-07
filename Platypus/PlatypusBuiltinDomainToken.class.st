Class {
	#name : #PlatypusBuiltinDomainToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusBuiltinDomainToken >> accept: aVisitor [ 
	^ aVisitor acceptDomain: self
]
