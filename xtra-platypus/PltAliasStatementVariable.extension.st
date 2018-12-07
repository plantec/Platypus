Extension { #name : #PltAliasStatementVariable }

{ #category : #'*xtra-platypus-accessing' }
PltAliasStatementVariable >> name [
	^ self aliasIdent
]

{ #category : #'*xtra-platypus-accessing' }
PltAliasStatementVariable >> referenced [
	^ self ref
]

{ #category : #'*xtra-platypus-type-infering' }
PltAliasStatementVariable >> staticDomain [
	^ self ref computedDomain

]

{ #category : #'*xtra-platypus-code-generating' }
PltAliasStatementVariable >> variableHolders [
	^ OrderedCollection with: self
]
