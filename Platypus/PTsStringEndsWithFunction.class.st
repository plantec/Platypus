Class {
	#name : #PTsStringEndsWithFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		's',
		'token'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsStringEndsWithFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsStringEndsWithFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsStringEndsWithFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsStringEndsWithFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> fromValues: values [
	self s: (values at: 1).
	self token: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsStringEndsWithFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	(PltLENGTHFunction
		invokeFromValues:
			(OrderedCollection new
				add: self s;
				yourself))
		>=
			(PltLENGTHFunction
				invokeFromValues:
					(OrderedCollection new
						add: self token;
						yourself))
		ifTrue: [ 
			(self s
				pltCopyFrom:
					(((PltLENGTHFunction
						invokeFromValues:
							(OrderedCollection new
								add: self s;
								yourself))
						pltMinus:
							(PltLENGTHFunction
								invokeFromValues:
									(OrderedCollection new
										add: self token;
										yourself))) pltPlus: 1)
				to:
					(PltLENGTHFunction
						invokeFromValues:
							(OrderedCollection new
								add: self s;
								yourself))) = self token
				ifTrue: [ ^ self return: true ] ].
	^ self return: false


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> s [
	^ s


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> s: aString [
	s := aString


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> s: aString token: aString1 [
	self s: aString.
	self token: aString1


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> token [
	^ token


]

{ #category : #'platypus-generated-accessing' }
PTsStringEndsWithFunction >> token: aString1 [
	token := aString1


]
