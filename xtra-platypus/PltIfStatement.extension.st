Extension { #name : #PltIfStatement }

{ #category : #'*xtra-platypus-testing' }
PltIfStatement >> alwaysReturn [
	self elseStatements
		ifNotNil: [
			(self elseStatements
					anySatisfy: [:stmt | stmt alwaysReturn])
				ifFalse: [^ false].
			^ self thenStatements
				anySatisfy: [:stmt | stmt alwaysReturn]].
	^ false
]
