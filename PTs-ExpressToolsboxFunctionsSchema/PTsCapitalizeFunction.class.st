Class {
	#name : #PTsCapitalizeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'input',
		'capitalizeFirstChar'
	],
	#category : #'PTs-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsCapitalizeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsCapitalizeFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsCapitalizeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsCapitalizeFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> capitalizeFirstChar [
	^ capitalizeFirstChar


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> capitalizeFirstChar: aLogical [
	capitalizeFirstChar := aLogical


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> fromValues: values [
	self input: (values at: 1).
	self capitalizeFirstChar: (values at: 2)


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> input [
	^ input


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> input: aString [
	input := aString


]

{ #category : #'platypus-generated-accessing' }
PTsCapitalizeFunction >> input: aString capitalizeFirstChar: aLogical [
	self input: aString.
	self capitalizeFirstChar: aLogical


]

{ #category : #'platypus-generated-invoking' }
PTsCapitalizeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	| instr outstr resString curr |
	instr := ReadStream on: self input.
	outstr := WriteStream on: String new.
	[ instr atEnd ]
		whileFalse: [ 
			(curr := instr next) == $_
				ifTrue: [ 
					curr := instr next.
					instr atEnd
						ifFalse: [ outstr nextPut: curr asUppercase ] ]
				ifFalse: [ outstr nextPut: curr ] ].
	resString := outstr contents.
	self capitalizeFirstChar
		ifTrue: [ resString at: 1 put: resString first asUppercase ]
		ifFalse: [ resString at: 1 put: resString first asLowercase ].
	^ self return: resString


]
