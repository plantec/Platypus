Class {
	#name : #PlatypusExpressInterpretorCallArguments,
	#superclass : #PlatypusExpressInterpretorStackValue,
	#instVars : [
		'arguments'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #accessing }
PlatypusExpressInterpretorCallArguments >> addValue: aValue [
	arguments add: aValue
]

{ #category : #accessing }
PlatypusExpressInterpretorCallArguments >> arguments [
	^ arguments 
]

{ #category : #'initialize-release' }
PlatypusExpressInterpretorCallArguments >> initialize [
	super initialize.
	arguments := OrderedCollection new.
]
