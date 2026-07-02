"
SmaCCStateEdge is a SmaCCEdge for Symbol (state) transitions

"
Class {
	#name : #SmaCCStateEdge,
	#superclass : #SmaCCEdge,
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #comparing }
SmaCCStateEdge >> <= aSmaCCEdge [ 
	^self class ~= aSmaCCEdge class 
		or: [self transitionObjects first <= aSmaCCEdge transitionObjects first]
]

{ #category : #compiling }
SmaCCStateEdge >> edgeFrequencyUsingTable: frequencyTable [ 
	^SmallInteger maxVal * transitionObjects size
]

{ #category : #compiling }
SmaCCStateEdge >> expression [
	^transitionObjects size = 1 
		ifTrue: ['state == #' , transitionObjects asArray first]
		ifFalse: ['(' , transitionObjects asArray storeString , ' includes: state)']
]
