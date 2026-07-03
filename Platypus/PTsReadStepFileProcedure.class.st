Class {
	#name : #PTsReadStepFileProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'filePath'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsReadStepFileProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsReadStepFileProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsReadStepFileProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsReadStepFileProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsReadStepFileProcedure >> filePath [
	^ filePath


]

{ #category : #'platypus-generated-accessing' }
PTsReadStepFileProcedure >> filePath: aString [
	filePath := aString


]

{ #category : #'platypus-generated-accessing' }
PTsReadStepFileProcedure >> fromValues: values [
	self filePath: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsReadStepFileProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	Transcript show: 'reading ' , self filePath , '...'.
	self myContext stepFileIn: self filePath.
	Transcript show: 'done' , String cr


]
