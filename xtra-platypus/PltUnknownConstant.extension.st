Extension { #name : #PltUnknownConstant }

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> and: op [ 
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> equal: op [ 
	^ self
]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifFalseConstant: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifFalseConstant: falseAlternativeBlock ifTrueConstant: trueAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ unknBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifFalseConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ unknBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifFalseOrUnknownConstant: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually  
	reach here because the expression is compiled in-line."
	^ alternativeBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifTrueConstant: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ nil

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifTrueConstant: trueAlternativeBlock ifFalseConstant: falseAlternativeBlock ifUnknownConstant: unknBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not  
	actually reach here because the expression is compiled in-line."
	^ unknBlock value

]

{ #category : #'*xtra-platypus-logical-controlling' }
PltUnknownConstant >> ifTrueConstant: alternativeBlock ifUnknownConstant: unknBlock [ 
	"Since the condition is false, answer the value of the false alternative,  
	which is nil. Execution does not actually reach here because the  
	expression is compiled in-line."
	^ unknBlock value

]

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> not [
	^self
]

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> or: op [ 
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> ordering [
	^ 2
]

{ #category : #'*xtra-platypus-accessing' }
PltUnknownConstant >> val [
	^ #unknown
]

{ #category : #'*xtra-platypus-evaluating' }
PltUnknownConstant >> xor: op [ 
	^self
]
