Extension { #name : #Collection }

{ #category : #'*xtra-platypus-visiting' }
Collection >> acceptTry: aVisitor [
	self do: [:el | el acceptTry: aVisitor]
]

{ #category : #'*xtra-platypus-visiting' }
Collection >> acceptTry: aVisitor separatedBy: aBlock [ 
	self
		do: [:el | el acceptTry: aVisitor]
		separatedBy: aBlock 

]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> lowerBound [
	^ 1
]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> pltAdd: newObject beforeIndex: index [ 
	self add: newObject
]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> pltAt: anIndex [ 
	^ self at: anIndex
]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> pltMinus: aCollectionOrElement [ 
	aCollectionOrElement isCollection
		ifTrue: [
			^ self copyWithoutAll: aCollectionOrElement]
		ifFalse: [
			^ self copyWithout: aCollectionOrElement].

]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> pltMult: aCollection [
	^ self intersection: aCollection

]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> pltPlus: aCollectionOrElement [ 
	| result |
	(aCollectionOrElement isCollection
			and: [aCollectionOrElement isString not])
		ifTrue: [result := (self isKindOf: Array) ifTrue: [OrderedCollection withAll: self] ifFalse: [self copy].
			result addAll: aCollectionOrElement]
		ifFalse: [result := self.
			result add: aCollectionOrElement].
	^ result
]

{ #category : #'*xtra-platypus-express-compat' }
Collection >> upperBound [
	^ self size
]
