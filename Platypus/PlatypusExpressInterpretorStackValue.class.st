Class {
	#name : #PlatypusExpressInterpretorStackValue,
	#superclass : #Object,
	#instVars : [
		'interpretor'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackValue class >> interpretor: anExpressInterpreter [
	^ self new interpretor: anExpressInterpreter
]

{ #category : #copying }
PlatypusExpressInterpretorStackValue >> deepCopy [
	| n |
	n := self copy.
	^ n
]

{ #category : #accessing }
PlatypusExpressInterpretorStackValue >> interpretor [
	^interpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorStackValue >> interpretor: anObject [
	interpretor := anObject
]

{ #category : #accessing }
PlatypusExpressInterpretorStackValue >> val [
	^ self subclassResponsibility 
]

{ #category : #copying }
PlatypusExpressInterpretorStackValue >> veryDeepCopy [
	| n |
	n := self copy.
	^ n
]
