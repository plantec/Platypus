Class {
	#name : #ParserRecompiler,
	#superclass : #Object,
	#category : #'SmaCCDev-Tests'
}

{ #category : #public }
ParserRecompiler class >> bootstrap [
	| scanner grammer |
	scanner := self
		buildScanner: SmaCCScannerScanner
		andParser: SmaCCScannerParser.
	grammer := self
		buildScanner: SmaCCGrammarScanner
		andParser: SmaCCGrammarParser.
	scanner compileChanges.
	grammer compileChanges
]

{ #category : #private }
ParserRecompiler class >> buildScanner: aScannerClass andParser: aParserClass [
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildScanner: (self
			definitionFrom: aScannerClass
			selector: #scannerDefinitionComment)
		andParser: (self
			definitionFrom: aParserClass
			selector: #parserDefinitionComment).
	parserCompiler
		scannerClass: aScannerClass;
		parserClass: aParserClass.
	[ parserCompiler
		createChanges;
		compileDefinitionComments ]
			on: SmaCCCompilationNotification
			do: [ :notification |
				Transcript show: notification messageText; cr.
				notification resume ].
	^ parserCompiler
]

{ #category : #private }
ParserRecompiler class >> definitionFrom: aClass selector: aSymbol [
	| source input output |
	source := aClass class sourceCodeAt: aSymbol.
	input := ReadStream on: source.
	output := WriteStream with: String new.
	input upTo: $".
	[ input atEnd ] whileFalse: [
		(input peekFor: $")
			ifTrue: [ output nextPut: $" ].
		output nextPutAll: (input upTo: $") ].
	^ output contents
]

{ #category : #public }
ParserRecompiler class >> examples [
	| class |
	#( CParser JavaParser StParser ) do: [ :each |
		class := Smalltalk classNamed: each.
		(self
			buildScanner: class scannerClass
			andParser: class)
				compileChanges ]
]
