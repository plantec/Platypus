Class {
	#name : #PTsInspectProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'arg'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsInspectProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsInspectProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInspectProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInspectProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsInspectProcedure >> arg [
	^ arg


]

{ #category : #'platypus-generated-accessing' }
PTsInspectProcedure >> arg: anObject [
	arg := anObject


]

{ #category : #'platypus-generated-accessing' }
PTsInspectProcedure >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsInspectProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	self arg inspect


]
