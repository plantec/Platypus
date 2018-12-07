Class {
	#name : #PlatypusExpressStructure2PharoTranslater,
	#superclass : #PlatypusExpressStructure2SmalltalkTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #accessing }
PlatypusExpressStructure2PharoTranslater class >> expressionTranslaterClassName [
	^ #PlatypusExpressExpression2PharoTranslater
]

{ #category : #accessing }
PlatypusExpressStructure2PharoTranslater class >> statementTranslaterClassName [
	^ #PlatypusExpressStatement2PharoTranslater
]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> commentFromMetaData: e classname: aClassName [ 
	self nextPutAllCr: '!' , aClassName 
				, '  commentStamp: ''platypus comment'' prior:0!'.
	self nextPutAllCr: PlatypusCoreObject expressSchemaCodeStartMark.
	self nextPutAll: (self unshunkedString: e translatedSchemaCode).
	self nextPutAll: PlatypusCoreObject expressSchemaCodeStopMark , '!'
]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> fileOutClassDefinition: aClassName superClassName: superClassName instVars: instVars classVars: classVars namespace: namespace packageName: packageName category: aCategoryName [ 
	| pointPos supName |
	pointPos := superClassName indexOf: $..
	supName := superClassName copyFrom: pointPos + 1 to: superClassName size.
	self nextPutAllCr: ''.
	self nextPutAll: supName , ' subclass: #'.
	self nextPutAllCr: aClassName.
	self nextPutAllCr: ' instanceVariableNames: ''' , instVars , ''''.
	self nextPutAllCr: ' classVariableNames: ''' , classVars , ''''.
	self nextPutAllCr: ' poolDictionaries: '''''.
	self nextPutAll: ' category: '''.
	self nextPutAll: aCategoryName.
	self nextPutAllCrCr: '''!'.
	self buildPlatypusSignatureMethodForClass: aClassName namespace: namespace packageName: packageName category: aCategoryName
]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> fileOutDoIt: aSource [ 
	self
				nextPutAllCr: aSource, '!'
				

]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> fileOutMethodSource: aSource className: aClassName meta: isMeta packageName: packageName category: aCategorySymbol [ 
	| categoryCode |
	categoryCode := self namesBuilder 
				normalizedMethodCategory: aCategorySymbol
				className: aClassName
				meta: isMeta.
	self nextPutAllCrCr: categoryCode.
	self nextPutAllCrCr: (BISimpleFormatter new format: (RBParser parseMethod: aSource)).
	self nextPutAllCr: '! !'.

]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> fileOutNamespaceDefinition: aNamespaceName imports: imports environment: envName packageName: packageName category: aCategoryName [ 

]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> finalResultFrom: aString [ 
	^ (super finalResultFrom: aString)
]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> mcCategory: aCat [ 
	^ '*' , aCat
]

{ #category : #utilities }
PlatypusExpressStructure2PharoTranslater >> qualifiedClassNameOf: e [ 
	^ e generatedClassName
]
