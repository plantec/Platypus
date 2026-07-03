Class {
	#name : 'PTsRunAll0ArgProcsOfProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'schemaName',
		'haltIt'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsRunAll0ArgProcsOfProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsRunAll0ArgProcsOfProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsRunAll0ArgProcsOfProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsRunAll0ArgProcsOfProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> fromValues: values [
	self schemaName: (values at: 1).
	self haltIt: (values at: 2)


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> haltIt [
	^ haltIt


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> haltIt: aBoolean [
	haltIt := aBoolean


]

{ #category : 'platypus-generated-invoking' }
PTsRunAll0ArgProcsOfProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	self error: 'not implemented'


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> schemaName [
	^ schemaName


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> schemaName: aString [
	schemaName := aString


]

{ #category : 'platypus-generated-accessing' }
PTsRunAll0ArgProcsOfProcedure >> schemaName: aString haltIt: aBoolean [
	self schemaName: aString.
	self haltIt: aBoolean


]
