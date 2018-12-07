Class {
	#name : #PlatypusBuiltinFunctionToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #accessing }
PlatypusBuiltinFunctionToken class >> tokenStyle [
	^#(#blue #normal)
]

{ #category : #visiting }
PlatypusBuiltinFunctionToken >> accept: aVisitor [ 
	^ aVisitor acceptBuiltinFunction: self
]

{ #category : #testing }
PlatypusBuiltinFunctionToken >> isBuiltinFunction [
	^true
]
