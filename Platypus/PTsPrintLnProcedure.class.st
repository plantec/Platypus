Class {
	#name : 'PTsPrintLnProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'arg'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsPrintLnProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsPrintLnProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsPrintLnProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsPrintLnProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsPrintLnProcedure >> arg [
	^ arg


]

{ #category : 'platypus-generated-accessing' }
PTsPrintLnProcedure >> arg: anObject [
	arg := anObject


]

{ #category : 'platypus-generated-accessing' }
PTsPrintLnProcedure >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
PTsPrintLnProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	Transcript show: self arg printString , '\' withCRs


]
