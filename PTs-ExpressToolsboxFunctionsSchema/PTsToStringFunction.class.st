Class {
	#name : #PTsToStringFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'arg'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsToStringFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsToStringFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsToStringFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsToStringFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsToStringFunction >> arg [
	^ arg


]

{ #category : #'platypus-generated-accessing' }
PTsToStringFunction >> arg: anObject [
	arg := anObject


]

{ #category : #'platypus-generated-accessing' }
PTsToStringFunction >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsToStringFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	^ self return: self arg printableCode


]
