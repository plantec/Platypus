Class {
	#name : 'PTsLowerizeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'input'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsLowerizeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsLowerizeFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsLowerizeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsLowerizeFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsLowerizeFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
PTsLowerizeFunction >> input [
	^ input


]

{ #category : 'platypus-generated-accessing' }
PTsLowerizeFunction >> input: aString [
	input := aString


]

{ #category : 'platypus-generated-invoking' }
PTsLowerizeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	^ self return: self input asLowercase


]
