Class {
	#name : 'PlatypusBuiltinDomainToken',
	#superclass : 'PlatypusKeywordToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusBuiltinDomainToken >> accept: aVisitor [ 
	^ aVisitor acceptDomain: self
]
