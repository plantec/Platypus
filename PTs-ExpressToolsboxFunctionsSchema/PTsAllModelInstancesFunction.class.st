Class {
	#name : #PTsAllModelInstancesFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'founds'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAllModelInstancesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAllModelInstancesFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAllModelInstancesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAllModelInstancesFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAllModelInstancesFunction >> founds [
	^ founds


]

{ #category : #'platypus-generated-accessing' }
PTsAllModelInstancesFunction >> founds: aSetOfObject [
	founds := aSetOfObject ifNil: [ Set new ] ifNotNil: [ aSetOfObject as: Set ]


]

{ #category : #'platypus-generated-invoking' }
PTsAllModelInstancesFunction >> invoke [
	" ---------- locals assignments ----------"

	self founds: Array new.	" ---------- statements ----------"	"---------- native statement ---------- "
	self founds addAll: self myContext allApplicationInstances.
	^ self return: self founds


]
