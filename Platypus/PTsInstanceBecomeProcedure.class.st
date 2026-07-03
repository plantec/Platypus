Class {
	#name : 'PTsInstanceBecomeProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'old',
		'new'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsInstanceBecomeProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsInstanceBecomeProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInstanceBecomeProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInstanceBecomeProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> fromValues: values [
	self old: (values at: 1).
	self new: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
PTsInstanceBecomeProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	self old becomeInstance: self new


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> new [
	^ new


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> new: anObject1 [
	new := anObject1


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> old [
	^ old


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> old: anObject [
	old := anObject


]

{ #category : 'platypus-generated-accessing' }
PTsInstanceBecomeProcedure >> old: anObject new: anObject1 [
	self old: anObject.
	self new: anObject1


]
