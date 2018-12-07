Extension { #name : #PltAliasStatement }

{ #category : #'*xtra-platypus-testing' }
PltAliasStatement >> alwaysReturn [
	^ self statements anySatisfy: [ :stmt | stmt alwaysReturn]

]

{ #category : #'*xtra-platypus-accessing' }
PltAliasStatement >> identifiersCache [
	^ identifiersCache
		ifNil: [identifiersCache := Dictionary new]
]

{ #category : #'*xtra-platypus-evaluating' }
PltAliasStatement >> initializeContextInInterpretor: anInterpretor [ 
	self variable acceptTry: anInterpretor.
	anInterpretor pop
]

{ #category : #'*xtra-platypus-accessing' }
PltAliasStatement >> lookUpIdentifierBN: aName [
	^ self variable name asUppercase = aName asUppercase ifTrue: [ self variable] 
]

{ #category : #'*xtra-platypus-code-generating' }
PltAliasStatement >> variableHolders [
	^ OrderedCollection with:  variable 
]
