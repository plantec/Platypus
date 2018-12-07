Extension { #name : #PltEnumerationType }

{ #category : #'*xtra-platypus-accessing' }
PltEnumerationType >> annotation [
	^ String streamContents: [:strm |
		self elements
			do: [:e | 
				strm nextPut: $..
				strm nextPutAll: e asUppercase.
				strm nextPut: $..]
			separatedBy: [strm nextPutAll: ' or '] ]
]

{ #category : #'*xtra-platypus-copying' }
PltEnumerationType >> deepCopy [
	^ self copy
]

{ #category : #'*xtra-platypus-testing' }
PltEnumerationType >> elementSymbolCorrespondingTo: aString [
	| key |
	key := aString asUppercase.
	^ self elements
		detect: [:e | e asUppercase = key]
		ifNone: []
]

{ #category : #'*xtra-platypus-testing' }
PltEnumerationType >> hasElementNamed: aString [ 
	^ (self elementSymbolCorrespondingTo: aString) notNil

]

{ #category : #'*xtra-platypus-accessing' }
PltEnumerationType >> initializedValue [
	^ PltEnumerationValue 
			domain: (PltDefinedTypeReference ref: self owner)
			element: (self elements first)
]

{ #category : #'*xtra-platypus-accessing' }
PltEnumerationType >> lookUpIdentifierBN: aName [ 
	| el key found |
	key := aName asUppercase.
	(el := self elements
				detect: [:e | e asUppercase = key]
				ifNone: [])
		ifNotNil: [found := PltEnumerationValue new stepInitialize.
			found
				domain: (PltDefinedTypeReference ref: self).
								found domain owner: self owner.

			found element: el].
	^ found
]
