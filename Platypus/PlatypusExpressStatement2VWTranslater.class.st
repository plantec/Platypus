Class {
	#name : #PlatypusExpressStatement2VWTranslater,
	#superclass : #PlatypusExpressStatement2SmalltalkTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #accessing }
PlatypusExpressStatement2VWTranslater class >> expressionTranslaterClassName [
	^ #PlatypusExpressExpression2VWTranslater
]

{ #category : #accessing }
PlatypusExpressStatement2VWTranslater class >> statementTranslaterClassName [
	^ #PlatypusExpressStatement2VWTranslater
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStatement2VWTranslater >> acceptNativeAlgorithm: e [ 
	| code |
	(code := e visualWorksCode)
		ifNil: [code := e platypusInterpreterCode.
			code
				ifNil: [Error signal: 'no visualworks code in native algorithm']
				ifNotNil: [Transcript show: 'Platypus: Warning: ' , self class name , '>>acceptNativeAlgorithm: "no visualworks code, taking platypus interpreter code instead"' withCRs , e asClearText withCRs]].
	^ code acceptTry: self
]
