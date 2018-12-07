Class {
	#name : #PlatypusExpressExpression2VWTranslater,
	#superclass : #PlatypusExpressExpression2SmalltalkTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #accessing }
PlatypusExpressExpression2VWTranslater class >> expressionTranslaterClassName [
	^ #PlatypusExpressExpression2VWTranslater
]

{ #category : #accessing }
PlatypusExpressExpression2VWTranslater class >> statementTranslaterClassName [
	^ #PlatypusExpressStatement2VWTranslater
]

{ #category : #'visit dictionary schema' }
PlatypusExpressExpression2VWTranslater >> acceptNativeAlgorithm: e [ 
	| code |
	(code := e visualWorksCode)
		ifNil: [code := e platypusInterpreterCode.
			code
				ifNil: [Error signal: 'no VisualWorks code in native algorithm']
				ifNotNil: [Transcript show: 'Platypus: Warning: ' , self class name , '>>acceptNativeAlgorithm: "no VisualWorks code, taking platypus interpreter code instead"' withCRs.
					Transcript show: e asClearText withCRs]].
	^ code acceptTry: self
]
