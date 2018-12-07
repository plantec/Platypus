Extension { #name : #PltTrueConstant }

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> and: op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ op]
]

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> equal: op [ 
	^ PltLogicalLiteral val: op isPltTrueConstant
]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifFalseConstant: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ trueAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ trueAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifFalseConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifFalseOrUnknownConstant: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifTrueConstant: alternativeBlock [ 
	"Since the condition is false, answer the value of the false alternative,  
	which is nil. Execution does not actually reach here because the  
	expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ trueAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ trueAlternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltTrueConstant >> ifTrueConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Since the condition is false, answer the value of the false alternative,  
	which is nil. Execution does not actually reach here because the  
	expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> not [
	^ PltFalseConstant new
]

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> or: op [ 
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> ordering [
	^ 3
]

{ #category : #'*xtra-platypus-accessing' }
PltTrueConstant >> val [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltTrueConstant >> xor: op [ 
	op
		ifMissing: [^ PltUnknownConstant new]
		ifNotMissing: [op isPltLogicalLiteral
				ifFalse: [^ PlatypusExpressInvalidArgumentException signal: 'invalid left argument'].
			^ PltLogicalLiteral val: op isPltFalseConstant]
]
