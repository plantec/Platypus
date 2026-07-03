Class {
	#name : 'PTsSetToAggregateFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'input'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsSetToAggregateFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsSetToAggregateFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsSetToAggregateFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsSetToAggregateFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsSetToAggregateFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
PTsSetToAggregateFunction >> input [
	^ input


]

{ #category : 'platypus-generated-accessing' }
PTsSetToAggregateFunction >> input: aCollectionOfObject [
	input := aCollectionOfObject


]

{ #category : 'platypus-generated-invoking' }
PTsSetToAggregateFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self return: self input


]
