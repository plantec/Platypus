Class {
	#name : #PTsLinesFromStringFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'source',
		'lines'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsLinesFromStringFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsLinesFromStringFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsLinesFromStringFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsLinesFromStringFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsLinesFromStringFunction >> fromValues: values [
	self source: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsLinesFromStringFunction >> invoke [
	" ---------- locals assignments ----------"

	self lines: Array new.	" ---------- statements ----------"	"---------- native statement ---------- "
	self lines addAll: self source lines.
	^ self return: self lines


]

{ #category : #'platypus-generated-accessing' }
PTsLinesFromStringFunction >> lines [
	^ lines


]

{ #category : #'platypus-generated-accessing' }
PTsLinesFromStringFunction >> lines: aListOfString [
	lines := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsLinesFromStringFunction >> source [
	^ source


]

{ #category : #'platypus-generated-accessing' }
PTsLinesFromStringFunction >> source: aString [
	source := aString


]
