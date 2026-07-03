Class {
	#name : 'PTsUpperizeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'input'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsUpperizeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsUpperizeFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsUpperizeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsUpperizeFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsUpperizeFunction >> fromValues: values [
	self input: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
PTsUpperizeFunction >> input [
	^ input


]

{ #category : 'platypus-generated-accessing' }
PTsUpperizeFunction >> input: aString [
	input := aString


]

{ #category : 'platypus-generated-invoking' }
PTsUpperizeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	^ self return: self input asUppercase


]
