Class {
	#name : #Logical,
	#superclass : #Object,
	#category : #'SqPlatypus-HW-unimplemented'
}

{ #category : #'instance creation' }
Logical class >> initializedInstance [
	^ nil
]

{ #category : #'instance creation' }
Logical class >> new [
	self error: 'You may not create any more Logical - this is three-valued logic'
]

{ #category : #'logical operations' }
Logical >> & aLogical [ 
	"Evaluating conjunction. Evaluate the argument. Then answer true if  
	both the receiver and the argument are true."
	self subclassResponsibility
]

{ #category : #'logical operations' }
Logical >> ==> aBlock [
	"this is material implication, a ==> b, also known as:
			b if a 
			a implies b
			if a then b
			b is a consequence of a
			a therefore b (but note: 'it is raining therefore it is cloudy' is implication; 'it is autumn therefore the leaves are falling' is equivalence).
		
	Here is the truth table for material implication (view in a monospaced font):
	
	   p   |   q   |   p ==> q
	-------|-------|-------------
	   T   |   T   |      T
	   T   |   F   |      F
	   F   |   T   |      T
	   F   |   F   |      T
	"

	^self not or: [aBlock value]
]

{ #category : #controlling }
Logical >> and: alternativeBlock [ 
	"Nonevaluating conjunction. If the receiver is true, answer the value of 
	the argument, alternativeBlock; otherwise answer false without 
	evaluating the argument."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> and: block1 and: block2 [
	"Nonevaluating conjunction without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as false, then return false immediately,
		without evaluating any further blocks.
	If all return true, then return true."

	self ifFalse: [^ false].
	block1 value ifFalse: [^ false].
	block2 value ifFalse: [^ false].
	^ true
]

{ #category : #controlling }
Logical >> and: block1 and: block2 and: block3 [
	"Nonevaluating conjunction without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as false, then return false immediately,
		without evaluating any further blocks.
	If all return true, then return true."

	self ifFalse: [^ false].
	block1 value ifFalse: [^ false].
	block2 value ifFalse: [^ false].
	block3 value ifFalse: [^ false].
	^ true
]

{ #category : #controlling }
Logical >> and: block1 and: block2 and: block3 and: block4 [
	"Nonevaluating conjunction without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as false, then return false immediately,
		without evaluating any further blocks.
	If all return true, then return true."

	self ifFalse: [^ false].
	block1 value ifFalse: [^ false].
	block2 value ifFalse: [^ false].
	block3 value ifFalse: [^ false].
	block4 value ifFalse: [^ false].
	^ true
]

{ #category : #printing }
Logical >> basicType [
	"Answer a symbol representing the inherent type of the receiver"
	^ #Logical
]

{ #category : #copying }
Logical >> clone [ 
	"Receiver has two concrete subclasses, True and False.
	Only one instance of each should be made, so return self."
]

{ #category : #copying }
Logical >> deepCopy [ 
	"Receiver has two concrete subclasses, True and False.
	Only one instance of each should be made, so return self."
]

{ #category : #'logical operations' }
Logical >> eqv: aLogical [
	"Answer true if the receiver is equivalent to aBoolean."
	^ self == aLogical
]

{ #category : #controlling }
Logical >> ifFalse: alternativeBlock [ 
	"If the receiver is true (i.e., the condition is true), then the value is the 
	true alternative, which is nil. Otherwise answer the result of evaluating 
	the argument, alternativeBlock. Create an error notification if the 
	receiver is nonBoolean. Execution does not actually reach here because 
	the expression is compiled in-line."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock [ 
	"Same as ifTrue:ifFalse:."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock ifUnknown: unknownAlternativeBlock [ 
	"Same as ifTrue:ifFalse:."
	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifTrue: alternativeBlock [ 
	"If the receiver is false (i.e., the condition is false), then the value is the 
	false alternative, which is nil. Otherwise answer the result of evaluating 
	the argument, alternativeBlock. Create an error notification if the 
	receiver is nonBoolean. Execution does not actually reach here because 
	the expression is compiled in-line."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock [
	"If the receiver is true (i.e., the condition is true), then answer the value 
	of the argument trueAlternativeBlock. If the receiver is false, answer the 
	result of evaluating the argument falseAlternativeBlock. If the receiver 
	is a nonBoolean then create an error notification. Execution does not 
	actually reach here because the expression is compiled in-line."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock ifUnknown: unknownAlternativeBlock [
	"If the receiver is true (i.e., the condition is true), then answer the value  
	of the argument trueAlternativeBlock. If the receiver is false, answer the 
	result of evaluating the argument falseAlternativeBlock. If the receiver  
	is a nonBoolean then create an error notification. Execution does not  
	actually reach here because the expression is compiled in-line."
	self subclassResponsibility
]

{ #category : #controlling }
Logical >> ifUnknown: alternativeBlock [ 
	"If the receiver is true (i.e., the condition is true), then the value is the  
	true alternative, which is nil. Otherwise answer the result of evaluating  
	the argument, alternativeBlock. Create an error notification if the  
	receiver is nonBoolean. Execution does not actually reach here because  
	the expression is compiled in-line."
	self subclassResponsibility
]

{ #category : #misc }
Logical >> newTileMorphRepresentative [
	^ TileMorph new addArrows; setLiteral: self

]

{ #category : #'logical operations' }
Logical >> not [
	"Negation. Answer true if the receiver is false, answer false if the 
	receiver is true."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> or: alternativeBlock [ 
	"Nonevaluating disjunction. If the receiver is false, answer the value of 
	the argument, alternativeBlock; otherwise answer true without 
	evaluating the argument."

	self subclassResponsibility
]

{ #category : #controlling }
Logical >> or: block1 or: block2 [
	"Nonevaluating alternation without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as true, then return true immediately,
		without evaluating any further blocks.
	If all return false, then return false."

	self ifTrue: [^ true].
	block1 value ifTrue: [^ true].
	block2 value ifTrue: [^ true].
	^ false
]

{ #category : #controlling }
Logical >> or: block1 or: block2 or: block3 [
	"Nonevaluating alternation without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as true, then return true immediately,
		without evaluating any further blocks.
	If all return false, then return false."

	self ifTrue: [^ true].
	block1 value ifTrue: [^ true].
	block2 value ifTrue: [^ true].
	block3 value ifTrue: [^ true].
	^ false
]

{ #category : #controlling }
Logical >> or: block1 or: block2 or: block3 or: block4 [
	"Nonevaluating alternation without deep nesting.
	The receiver is evaluated, followed by the blocks in order.
	If any of these evaluates as true, then return true immediately,
		without evaluating any further blocks.
	If all return false, then return false."

	self ifTrue: [^ true].
	block1 value ifTrue: [^ true].
	block2 value ifTrue: [^ true].
	block3 value ifTrue: [^ true].
	block4 value ifTrue: [^ true].
	^ false
]

{ #category : #copying }
Logical >> shallowCopy [ 
	"Receiver has two concrete subclasses, True and False.
	Only one instance of each should be made, so return self."
]

{ #category : #'printing-sixx' }
Logical >> sixxContentOn: aStream indent: level context: dictionary [
	aStream nextPutAll: self storeString
]

{ #category : #printing }
Logical >> storeOn: aStream [ 
	"Refer to the comment in Object|storeOn:."

	self printOn: aStream
]

{ #category : #copying }
Logical >> veryDeepCopyWith: deepCopier [
	"Return self.  I can't be copied.  Do not record me."
]

{ #category : #'logical operations' }
Logical >> xor: aLogical [ 
	"Exclusive OR. Answer true if the receiver is not equivalent to aBoolean."
	^ (self == aLogical) not
]

{ #category : #'logical operations' }
Logical >> | aLogical [ 
	"Evaluating disjunction (OR). Evaluate the argument. Then answer true  
	if either the receiver or the argument is true."
	self subclassResponsibility
]
