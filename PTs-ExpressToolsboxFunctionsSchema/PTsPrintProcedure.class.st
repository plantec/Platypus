Class {
	#name : #PTsPrintProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'arg'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsPrintProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsPrintProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsPrintProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsPrintProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsPrintProcedure >> arg [
	^ arg


]

{ #category : #'platypus-generated-accessing' }
PTsPrintProcedure >> arg: anObject [
	arg := anObject


]

{ #category : #'platypus-generated-accessing' }
PTsPrintProcedure >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsPrintProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	Transcript show: self arg printString


]
