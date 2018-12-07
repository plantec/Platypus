Class {
	#name : #LTrue,
	#superclass : #Logical,
	#category : #'SqPlatypus-HW-unimplemented'
}

{ #category : #initialization }
LTrue class >> initializedInstance [

	^ Smalltalk
		at: #Ltrue
		ifAbsentPut: [self basicNew]
]

{ #category : #'logical operations' }
LTrue >> & alternativeObject [ 
	"Evaluating conjunction -- answer alternativeObject since receiver is true."

	^alternativeObject
]

{ #category : #controlling }
LTrue >> and: alternativeBlock [ 
	"Nonevaluating conjunction -- answer the value of alternativeBlock since
	the receiver is true."

	^alternativeBlock value
]

{ #category : #controlling }
LTrue >> ifFalse: alternativeBlock [ 
	"Since the condition is true, the value is the true alternative, which is nil. 
	Execution does not actually reach here because the expression is compiled 
	in-line."

	^nil
]

{ #category : #controlling }
LTrue >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock [ 
	"Answer the value of trueAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."

	^trueAlternativeBlock value
]

{ #category : #controlling }
LTrue >> ifTrue: alternativeBlock [ 
	"Answer the value of alternativeBlock. Execution does not actually 
	reach here because the expression is compiled in-line."

	^alternativeBlock value
]

{ #category : #controlling }
LTrue >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock [ 
	"Answer with the value of trueAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."

	^trueAlternativeBlock value
]

{ #category : #'logical operations' }
LTrue >> not [
	"Negation--answer false since the receiver is true."

	^false
]

{ #category : #controlling }
LTrue >> or: alternativeBlock [ 
	"Nonevaluating disjunction -- answer true since the receiver is true."

	^self
]

{ #category : #printing }
LTrue >> printOn: aStream [ 

	aStream nextPutAll: 'true'
]

{ #category : #'logical operations' }
LTrue >> | aBoolean [ 
	"Evaluating disjunction (OR) -- answer true since the receiver is true."

	^self
]
