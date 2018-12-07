Extension { #name : #PltEnumerationValue }

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> < other [ 
	| elements |
	^ PltLogicalLiteral val: ((elements := self domain referenced domain elements) indexOf: self element)
			< (elements indexOf: other element)
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> <= other [ 
	^ PltLogicalLiteral
		val: (self = other
				or: [(self < other) isPltTrueConstant])
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> = other [ 
	other class = self class
		ifFalse: [^ false].
	"self
		assert: [self domain name asUppercase = other domain name asUppercase
				ifTrue: [self domain ref == other domain ref]
				ifFalse: [true]]."
	^ self domain ref = other domain ref
		and: [self element = other element]
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> > other [ 
	| elements |
	^ PltLogicalLiteral val: ((elements := self domain referenced domain elements) indexOf: self element)
			> (elements indexOf: other element)
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> >= other [ 
	^ PltLogicalLiteral
		val: (self = other
				or: [(self > other) isPltTrueConstant])
]

{ #category : #'*xtra-platypus-copying' }
PltEnumerationValue >> deepCopy [
	^ self copy
]

{ #category : #'*xtra-platypus-instance-creation' }
PltEnumerationValue class >> domain: aDefinedType element: anElement [
	| e |
	e := self new.
	e domain: aDefinedType.
	e element: anElement.
	^ e
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> equal: other [ 
	^ PltLogicalLiteral val: self = other
]

{ #category : #'*xtra-platypus-comparing' }
PltEnumerationValue >> hash [
	^ self domain hash + self element hash
]

{ #category : #'*xtra-platypus-type-infering' }
PltEnumerationValue >> inferedDomain [
	^ self domain ifNotNil: [self domain computedDomain ]
]

{ #category : #'*xtra-platypus-type-infering' }
PltEnumerationValue >> inferedDomainWith: currDomain [ 
	^ self inferedDomain
]

{ #category : #'*xtra-platypus-classification' }
PltEnumerationValue >> isPltOrderedLiteral [
	^ true
]

{ #category : #'*xtra-platypus-classification' }
PltEnumerationValue >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltEnumerationValue >> name [
	^ self element
]

{ #category : #'*xtra-platypus-accessing' }
PltEnumerationValue >> val [
	^ self element asSymbol
]
