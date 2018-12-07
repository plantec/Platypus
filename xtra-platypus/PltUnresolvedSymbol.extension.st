Extension { #name : #PltUnresolvedSymbol }

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> name: aString [

	self token: aString
]

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> owner [

	^ owner
]

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> resolver [

	^ resolver
]

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> resolver: aBlock [

	resolver := aBlock
]

{ #category : #'*xtra-platypus-resolving' }
PltUnresolvedSymbol >> resolvesFrom: aChecker [
	^ self resolver value: aChecker
]

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> token [

	^ token
]

{ #category : #'*xtra-platypus-accessing' }
PltUnresolvedSymbol >> token: aString [

	token := aString
]
