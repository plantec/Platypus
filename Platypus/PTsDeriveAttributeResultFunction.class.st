Class {
	#name : #PTsDeriveAttributeResultFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'd'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsDeriveAttributeResultFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsDeriveAttributeResultFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsDeriveAttributeResultFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsDeriveAttributeResultFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsDeriveAttributeResultFunction >> d [
	^ d


]

{ #category : #'platypus-generated-accessing' }
PTsDeriveAttributeResultFunction >> d: aPTsDerivedAttribute [
	d := aPTsDerivedAttribute


]

{ #category : #'platypus-generated-accessing' }
PTsDeriveAttributeResultFunction >> fromValues: values [
	self d: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsDeriveAttributeResultFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	| r e interpreter evalResult |
	r := self d valueOfExplicitAttributeNamed: 'assign'.	"instDefinition := self d valueOfExplicitAttributeNamed: 'owner'."
	interpreter := PlatypusExpressInterpretor new.
	evalResult := interpreter
		evaluate: r ref val
		in: self d mySchemaInstance
		to: nil
		notifying: nil
		ifFail: [ self halt ].
	self halt.
	self return: evalResult


]
