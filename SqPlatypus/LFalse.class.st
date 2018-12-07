Class {
	#name : #LFalse,
	#superclass : #Logical,
	#category : #'SqPlatypus-HW-unimplemented'
}

{ #category : #initialization }
LFalse class >> initializedInstance [
	^ Smalltalk at: #Lfalse ifAbsentPut: [self basicNew]
]

{ #category : #'logical operations' }
LFalse >> & alternativeObject [ 
	"Evaluating conjunction -- answer false since receiver is false."

	^self
]

{ #category : #controlling }
LFalse >> and: alternativeBlock [ 
	"Nonevaluating conjunction -- answer with false since the receiver is false."

	^self
]

{ #category : #controlling }
LFalse >> ifFalse: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually
	reach here because the expression is compiled in-line."

	^alternativeBlock value
]

{ #category : #controlling }
LFalse >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not
	actually reach here because the expression is compiled in-line."

	^falseAlternativeBlock value
]

{ #category : #controlling }
LFalse >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock ifUnknown: unknownAlternativeBlock [
	"Answer the value of falseAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value
]

{ #category : #controlling }
LFalse >> ifTrue: alternativeBlock [ 
	"Since the condition is false, answer the value of the false alternative, 
	which is nil. Execution does not actually reach here because the
	expression is compiled in-line."

	^nil
]

{ #category : #controlling }
LFalse >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not
	actually reach here because the expression is compiled in-line."

	^falseAlternativeBlock value
]

{ #category : #controlling }
LFalse >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock ifUnknown: unknownAlternativeBlock [ 
	"Answer the value of falseAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."
	^ falseAlternativeBlock value
]

{ #category : #'logical operations' }
LFalse >> not [
	"Negation -- answer true since the receiver is false."
	^ LTrue
]

{ #category : #controlling }
LFalse >> or: alternativeBlock [ 
	"Nonevaluating disjunction -- answer value of alternativeBlock."

	^alternativeBlock value
]

{ #category : #printing }
LFalse >> printOn: aStream [ 
	aStream nextPutAll: 'Lfalse'
]

{ #category : #'logical operations' }
LFalse >> | aLogical [
	"Evaluating disjunction (OR) -- answer with the argument, aBoolean."
	^ aLogical
]
