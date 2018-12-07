Extension { #name : #PltQueryExpression }

{ #category : #'*xtra-platypus-accessing' }
PltQueryExpression >> identifiersCache [
	^ identifiersCache
		ifNil: [identifiersCache := Dictionary new]
]

{ #category : #'*xtra-platypus-evaluating' }
PltQueryExpression >> initializeContextInInterpretor: anInterpretor [ 
	self aggregateSource acceptTry: anInterpretor.
	anInterpretor currentContext aggregateSource: anInterpretor pop.
	anInterpretor declareQueryVariable: self variable
]

{ #category : #'*xtra-platypus-evaluating' }
PltQueryExpression >> interpretorContextClass [
	^ PlatypusExpressInterpretorQueryContext
]

{ #category : #'*xtra-platypus-accessing' }
PltQueryExpression >> lookUpIdentifierBN: aName [
	| upper |
	upper := aName asUppercase.
	^ self variable name asUppercase = upper ifTrue: [self variable]
 
]

{ #category : #'*xtra-platypus-code-generating' }
PltQueryExpression >> variableHolders [
	^ OrderedCollection with: variable 
]
