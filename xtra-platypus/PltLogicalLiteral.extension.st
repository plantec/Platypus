Extension { #name : #PltLogicalLiteral }

{ #category : #'*xtra-platypus-evaluating' }
PltLogicalLiteral >> < op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifTrue: [^ PltLogicalLiteral val: self ordering < op ordering]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltLogicalLiteral >> <= op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifTrue: [^ PltLogicalLiteral val: self ordering <= op ordering]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltLogicalLiteral >> > op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifTrue: [^ PltLogicalLiteral val: self ordering > op ordering]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-evaluating' }
PltLogicalLiteral >> >= op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifTrue: [^ PltLogicalLiteral val: self ordering >= op ordering]
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid right argument']]
]

{ #category : #'*xtra-platypus-type-infering' }
PltLogicalLiteral >> inferedDomain [
	^ PltLogicalType asDomain
]

{ #category : #'*xtra-platypus-classification' }
PltLogicalLiteral >> isPltOrderedLiteral [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltLogicalLiteral >> ordering [
	^ self subclassResponsibility
]

{ #category : #'*xtra-platypus-instance creation' }
PltLogicalLiteral class >> val: aBoolean [ 
	^aBoolean == #unknown 
		ifTrue: [PltUnknownConstant new]
		ifFalse: 
			[aBoolean ifTrue: [PltTrueConstant new] ifFalse: [PltFalseConstant new]]
]
