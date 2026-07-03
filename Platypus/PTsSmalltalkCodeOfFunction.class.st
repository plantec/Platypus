Class {
	#name : #PTsSmalltalkCodeOfFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'arg'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsSmalltalkCodeOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsSmalltalkCodeOfFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSmalltalkCodeOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSmalltalkCodeOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsSmalltalkCodeOfFunction >> arg [
	^ arg


]

{ #category : #'platypus-generated-accessing' }
PTsSmalltalkCodeOfFunction >> arg: aString [
	arg := aString


]

{ #category : #'platypus-generated-accessing' }
PTsSmalltalkCodeOfFunction >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsSmalltalkCodeOfFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	^ self return: (PltStringLiteral val: self arg) asClearText


]
