Extension { #name : #PltRepeatStatement }

{ #category : #'*xtra-platypus-evaluating' }
PltRepeatStatement >> initializeContextInInterpretor: anInterpretor [ 
	self incrControl
		ifNotNil: [anInterpretor prepareIncrControl: self incrControl].
]

{ #category : #'*xtra-platypus-evaluating' }
PltRepeatStatement >> interpretorContextClass [
	^ PlatypusExpressInterpretorRepeatContext
]

{ #category : #'*xtra-platypus-accessing' }
PltRepeatStatement >> lookUpIdentifierBN: aName [ 
	| upper |
	^ self incrControl
		ifNotNil: [
			upper := aName asUppercase.
			self incrControl variable name asUppercase = upper
				ifTrue: [self incrControl variable]]
]

{ #category : #'*xtra-platypus-accessing' }
PltRepeatStatement >> variableHolders [ 
	^ self incrControl
		ifNil: [OrderedCollection new]
		ifNotNil: [OrderedCollection with: self incrControl variable]
]
