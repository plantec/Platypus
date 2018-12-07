Extension { #name : #PltFalseConstant }

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> and: op [ 
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> equal: op [ 
	^ PltLogicalLiteral val: op isPltFalseConstant
]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifFalseConstant: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifFalseConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifFalseOrUnknownConstant: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifTrueConstant: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltFalseConstant >> ifTrueConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Since the condition is false, answer the value of the false alternative,  
	which is nil. Execution does not actually reach here because the  
	expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> not [
	^PltTrueConstant new
]

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> or: op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ op]
]

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> ordering [
	^ 1
]

{ #category : #'*xtra-platypus-accessing' }
PltFalseConstant >> val [
	^ false
]

{ #category : #'*xtra-platypus-evaluating' }
PltFalseConstant >> xor: op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ op]
]
