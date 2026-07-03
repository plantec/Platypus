Class {
	#name : #PTsCleanRemarkTextOfFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'rem',
		'foundMarkPos'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsCleanRemarkTextOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsCleanRemarkTextOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsCleanRemarkTextOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsCleanRemarkTextOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsCleanRemarkTextOfFunction >> foundMarkPos [
	^ foundMarkPos


]

{ #category : #'platypus-generated-accessing' }
PTsCleanRemarkTextOfFunction >> foundMarkPos: anInteger [
	foundMarkPos := anInteger


]

{ #category : #'platypus-generated-accessing' }
PTsCleanRemarkTextOfFunction >> fromValues: values [
	self rem: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsCleanRemarkTextOfFunction >> invoke [
	" ---------- locals assignments ----------"

	self foundMarkPos: 0.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no516 | 
			(((self rem textUsingContext: self class context) pltAt: no516) = '"'
				or: [ ((self rem textUsingContext: self class context) pltAt: no516) = '<' ])
				ifTrue: [ 
					self foundMarkPos: no516.
					PlatypusExpressEscapeStatementException signal ]
				ifFalse: [ 
					((self rem textUsingContext: self class context) pltAt: no516) ~= ' '
						ifTrue: [ PlatypusExpressEscapeStatementException signal ] ] ]
		from: 1
		to:
			(PltLENGTHFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self rem textUsingContext: self class context);
						yourself)).
	self foundMarkPos > 0
		ifTrue: [ 
			PlatypusCoreRepeatStatement
				repeat: [ :no2651 | 
					(((self rem textUsingContext: self class context) pltAt: no2651) = '"'
						or: [ ((self rem textUsingContext: self class context) pltAt: no2651) = '>' ])
						ifTrue: [ 
							^ self
								return:
									((self rem textUsingContext: self class context)
										pltCopyFrom: (no2651 pltPlus: 1)
										to:
											(PltLENGTHFunction
												invokeFromValues:
													(OrderedCollection new
														add: (self rem textUsingContext: self class context);
														yourself))) ] ]
				from: (self foundMarkPos pltPlus: 1)
				to:
					(PltLENGTHFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self rem textUsingContext: self class context);
								yourself)) ].
	^ self return: (self rem textUsingContext: self class context)


]

{ #category : #'platypus-generated-accessing' }
PTsCleanRemarkTextOfFunction >> rem [
	^ rem


]

{ #category : #'platypus-generated-accessing' }
PTsCleanRemarkTextOfFunction >> rem: aPTsRemark [
	rem := aPTsRemark


]
