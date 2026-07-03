Class {
	#name : 'PTsStringReplaceFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'src',
		'replWhat',
		'replWith'
	],
	#category : 'Platypus-ExpressToolsboxFunctionsSchema',
	#package : 'Platypus',
	#tag : 'ExpressToolsboxFunctionsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsStringReplaceFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsStringReplaceFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsStringReplaceFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsStringReplaceFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> fromValues: values [
	self src: (values at: 1).
	self replWhat: (values at: 2).
	self replWith: (values at: 3)


]

{ #category : 'platypus-generated-invoking' }
PTsStringReplaceFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	| r |
	r := self src copyReplaceAll: self replWhat with: self replWith asTokens: false.
	^ self return: r


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> replWhat [
	^ replWhat


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> replWhat: aString1 [
	replWhat := aString1


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> replWith [
	^ replWith


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> replWith: aString2 [
	replWith := aString2


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> src [
	^ src


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> src: aString [
	src := aString


]

{ #category : 'platypus-generated-accessing' }
PTsStringReplaceFunction >> src: aString replWhat: aString1 replWith: aString2 [
	self src: aString.
	self replWhat: aString1.
	self replWith: aString2


]
