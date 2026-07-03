Class {
	#name : #PTsAggregateToSetFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'input',
		'result'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAggregateToSetFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAggregateToSetFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAggregateToSetFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAggregateToSetFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAggregateToSetFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
PTsAggregateToSetFunction >> input [
	^ input


]

{ #category : #'platypus-generated-accessing' }
PTsAggregateToSetFunction >> input: aCollectionOfObject [
	input := aCollectionOfObject


]

{ #category : #'platypus-generated-invoking' }
PTsAggregateToSetFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"	"---------- native statement ---------- "
	self input do: [ :el | self result add: el ].
	^ self return: self result


]

{ #category : #'platypus-generated-accessing' }
PTsAggregateToSetFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
PTsAggregateToSetFunction >> result: aSetOfObject [
	result := aSetOfObject ifNil: [ Set new ] ifNotNil: [ aSetOfObject as: Set ]


]
