Extension { #name : #PltCompoundStatement }

{ #category : #'*xtra-platypus-testing' }
PltCompoundStatement >> alwaysReturn [
	^ self statements
		anySatisfy: [:stmt | stmt alwaysReturn]
]
