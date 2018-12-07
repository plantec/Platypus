Class {
	#name : #PlatypusBuiltinProcedureToken,
	#superclass : #PlatypusKeywordToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #visiting }
PlatypusBuiltinProcedureToken >> accept: aVisitor [ 
	^ aVisitor acceptBuiltinProcedure: self
]

{ #category : #testing }
PlatypusBuiltinProcedureToken >> isBuiltinProcedure [
	^ true
]
