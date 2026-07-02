Class {
	#name : #PTsListToSetFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'input',
		'result'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsListToSetFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsListToSetFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsListToSetFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsListToSetFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsListToSetFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
PTsListToSetFunction >> input [
	^ input


]

{ #category : #'platypus-generated-accessing' }
PTsListToSetFunction >> input: aListOfObject [
	input := aListOfObject ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfObject as: OrderedCollection ]


]

{ #category : #'platypus-generated-invoking' }
PTsListToSetFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"	"---------- native statement ---------- "
	self input do: [ :el | self result add: el ].
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
PTsListToSetFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
PTsListToSetFunction >> result: aSetOfObject [
	result := aSetOfObject ifNil: [ Set new ] ifNotNil: [ aSetOfObject as: Set ]


]
