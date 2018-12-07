Extension { #name : #OrderedCollection }

{ #category : #'*xtra-platypus-express-compat' }
OrderedCollection >> pltAdd: newObject beforeIndex: index [ 
	index <= 0
		ifTrue: [self addFirst: newObject]
		ifFalse: [index >= self size
				ifTrue: [self  addLast: newObject]
				ifFalse: [self  add: newObject afterIndex: index]]
]
