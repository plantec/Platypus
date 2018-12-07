Extension { #name : #PltSubEntityRefExpression }

{ #category : #'*xtra-platypus-checking' }
PltSubEntityRefExpression >> checksSubtypesInheritance: mySuper [ 
	| err |
	self entityRef referenced ifNotNil: [(self entityRef referenced isDirectSubtypeOf: mySuper)
		ifFalse: [err := self entityRef referenced -> ('must be a subtype of entity ''' , mySuper name , '''').
			^ OrderedCollection with: err]].
	^ OrderedCollection new
]
