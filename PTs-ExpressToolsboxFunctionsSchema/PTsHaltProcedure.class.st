Class {
	#name : #PTsHaltProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsHaltProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsHaltProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHaltProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHaltProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-invoking' }
PTsHaltProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	self halt


]
