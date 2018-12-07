Class {
	#name : #PlatypusExpressExpression2PharoTranslater,
	#superclass : #PlatypusExpressExpression2SmalltalkTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #accessing }
PlatypusExpressExpression2PharoTranslater class >> expressionTranslaterClassName [
	^ #PlatypusExpressExpression2PharoTranslater
]

{ #category : #accessing }
PlatypusExpressExpression2PharoTranslater class >> statementTranslaterClassName [
	^ #PlatypusExpressStatement2PharoTranslater
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2PharoTranslater >> acceptNativeAlgorithm: e [ 
	| code |
	(code := e pharoCode)
		ifNil: [code := e platypusInterpreterCode.
			code
				ifNil: [Error signal: 'no pharo code in native algorithm']
				ifNotNil: [Transcript show: 'Platypus: Warning: ' , self class name , '>>acceptNativeAlgorithm: "no pharo code, taking platypus interpreter code instead"' withCRs.
					Transcript show: e asClearText withCRs]].
	^ code acceptTry: self
]
