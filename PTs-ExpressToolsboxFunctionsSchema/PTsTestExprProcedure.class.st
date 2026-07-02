Class {
	#name : #PTsTestExprProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'expr',
		'shouldBe'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsTestExprProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsTestExprProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsTestExprProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsTestExprProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> expr [
	^ expr


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> expr: anObject [
	expr := anObject


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> expr: anObject shouldBe: anObject1 [
	self expr: anObject.
	self shouldBe: anObject1


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> fromValues: values [
	self expr: (values at: 1).
	self shouldBe: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsTestExprProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	Transcript show: ('[' , self expr printString , ']' , ' [' , self shouldBe printString , ']\') withCRs


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> shouldBe [
	^ shouldBe


]

{ #category : #'platypus-generated-accessing' }
PTsTestExprProcedure >> shouldBe: anObject1 [
	shouldBe := anObject1


]
