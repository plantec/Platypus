Extension { #name : #PltUniquenessRule }

{ #category : #'*xtra-platypus-accessing' }
PltUniquenessRule >> errorQualifier [
	^ self label isNil
		ifTrue: ['uniqueness rule #' , (self owner uniquenessRules indexOf: self) printString]
		ifFalse: ['uniqueness rule ''' , self label , '''']
]
