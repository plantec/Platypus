Class {
	#name : #PTsSetToListFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'input',
		'result'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsSetToListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsSetToListFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSetToListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSetToListFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsSetToListFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
PTsSetToListFunction >> input [
	^ input


]

{ #category : #'platypus-generated-accessing' }
PTsSetToListFunction >> input: aSetOfObject [
	input := aSetOfObject ifNil: [ Set new ] ifNotNil: [ aSetOfObject as: Set ]


]

{ #category : #'platypus-generated-invoking' }
PTsSetToListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"	"---------- native statement ---------- "
	self input do: [ :el | self result add: el ].
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
PTsSetToListFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
PTsSetToListFunction >> result: aListOfObject [
	result := aListOfObject ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfObject as: OrderedCollection ]


]
