Class {
	#name : #PTsExpressionValueToStringFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'arg'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressionValueToStringFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsExpressionValueToStringFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressionValueToStringFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressionValueToStringFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsExpressionValueToStringFunction >> arg [
	^ arg


]

{ #category : #'platypus-generated-accessing' }
PTsExpressionValueToStringFunction >> arg: aPTsExpression [
	arg := aPTsExpression


]

{ #category : #'platypus-generated-accessing' }
PTsExpressionValueToStringFunction >> fromValues: values [
	self arg: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsExpressionValueToStringFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	^ self return: self arg printableCode


]
