Class {
	#name : 'PlatypusExpressInterpretorRepeatContext',
	#superclass : 'PlatypusExpressInterpretorContext',
	#instVars : [
		'step',
		'last'
	],
	#category : 'Platypus-HW-interpreter',
	#package : 'Platypus',
	#tag : 'HW-interpreter'
}

{ #category : 'accessing' }
PlatypusExpressInterpretorRepeatContext >> last [
	^last
]

{ #category : 'accessing' }
PlatypusExpressInterpretorRepeatContext >> last: anObject [
	last := anObject
]

{ #category : 'accessing' }
PlatypusExpressInterpretorRepeatContext >> step [
	^step
]

{ #category : 'accessing' }
PlatypusExpressInterpretorRepeatContext >> step: anObject [
	step := anObject
]
