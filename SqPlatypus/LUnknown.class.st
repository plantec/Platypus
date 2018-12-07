Class {
	#name : #LUnknown,
	#superclass : #Logical,
	#category : #'SqPlatypus-HW-unimplemented'
}

{ #category : #initialization }
LUnknown class >> initializedInstance [
	^ Smalltalk
		at: #Lunknown
		ifAbsentPut: [self basicNew]
]

{ #category : #'logical operations' }
LUnknown >> & alternativeObject [ 
	"Evaluating conjunction -- answer false since receiver is false."

	^self
]

{ #category : #controlling }
LUnknown >> and: alternativeBlock [ 
	"Nonevaluating conjunction -- answer with false since the receiver is false."

	^self
]

{ #category : #controlling }
LUnknown >> ifFalse: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually
	reach here because the expression is compiled in-line."

	^alternativeBlock value
]

{ #category : #controlling }
LUnknown >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not
	actually reach here because the expression is compiled in-line."

	^falseAlternativeBlock value
]

{ #category : #controlling }
LUnknown >> ifTrue: alternativeBlock [ 
	"Since the condition is false, answer the value of the false alternative, 
	which is nil. Execution does not actually reach here because the
	expression is compiled in-line."

	^nil
]

{ #category : #controlling }
LUnknown >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not
	actually reach here because the expression is compiled in-line."

	^falseAlternativeBlock value
]

{ #category : #'logical operations' }
LUnknown >> not [
	"Negation -- answer true since the receiver is false."

	^true
]

{ #category : #controlling }
LUnknown >> or: alternativeBlock [ 
	"Nonevaluating disjunction -- answer value of alternativeBlock."

	^alternativeBlock value
]

{ #category : #printing }
LUnknown >> printOn: aStream [ 

	aStream nextPutAll: 'false'
]

{ #category : #'logical operations' }
LUnknown >> | aBoolean [ 
	"Evaluating disjunction (OR) -- answer with the argument, aBoolean."

	^aBoolean
]
