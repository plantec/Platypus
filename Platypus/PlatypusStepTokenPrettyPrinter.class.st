Class {
	#name : #PlatypusStepTokenPrettyPrinter,
	#superclass : #PlatypusTokenPrettyPrinter,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'public pretty printing' }
PlatypusStepTokenPrettyPrinter class >> prettyPrint: aSource [ 
	^ self prettyPrint: aSource startLevel: 0 

]

{ #category : #'public pretty printing' }
PlatypusStepTokenPrettyPrinter class >> prettyPrint: aSource startLevel: anIndentLevel [
	| srcTokenList ppTokenList code |
	srcTokenList := (PlatypusExpressScanner on: aSource readStream) buildTokenList.
	ppTokenList := PlatypusStepTokenPrettyPrinter new
				prettyPrint: srcTokenList
				from: srcTokenList first
				to: srcTokenList last
				startLevel: anIndentLevel
				font: nil
				maxLineWidth: 80.
	code := ppTokenList textWithStreamClass: ReadWriteStream.
	^ code
]

{ #category : #visiting }
PlatypusStepTokenPrettyPrinter >> acceptEmbeddedRemark: n [ 
	| printEolBefore |
	printEolBefore := true.
	currentNode previous notNil
		ifTrue: [currentNode previous isEmbeddedRemark
				ifTrue: [printEolBefore := false]].
	(currentLevel > 1
			or: [(startNode  is: #schema) not])
		ifTrue: [printEolBefore := false].
	printEolBefore
		ifTrue: [self printEol].
	currentLine add: n level: currentLevel.
	currentLineno := currentLineno
				+ (n asString
						count: [:c | c == Character cr]).
	self printEol
]

{ #category : #visiting }
PlatypusStepTokenPrettyPrinter >> acceptGroupKeyword: n [ 
	currentLevel := currentLevel - 1.
	self acceptToken: n.
	currentLevel := currentLevel + 1.
	(n is: #unique)
		ifTrue: [currentNode previous  isSemicolon
				ifTrue: [self printEol]
				ifFalse: [self printWhiteSpace]]
		ifFalse: [self printEol]
]

{ #category : #visiting }
PlatypusStepTokenPrettyPrinter >> acceptNativeCode: n [ 
	| printEolBefore |
	printEolBefore := true.
	(currentLevel > 1
			or: [(startNode is: #schema) not])
		ifTrue: [printEolBefore := false].
	printEolBefore
		ifTrue: [self printEol].
	currentLine add: n level: currentLevel.
	currentLineno := currentLineno
				+ (n asString
						count: [:c | c == Character cr]).
	(n next is: ';' asSymbol)
		ifFalse: [self printEol]
]

{ #category : #visiting }
PlatypusStepTokenPrettyPrinter >> acceptOpenKeyword: n [ 
	| printeol |
	printeol := true.
	currentLevel > 2
		ifTrue: [printeol := false]
		ifFalse: [currentNode previous isNil
				ifTrue: [printeol := false]
				ifFalse: [currentNode previous isEmbeddedRemark
						ifTrue: [printeol := false]
						ifFalse: [(n is: #local)
								ifTrue: [printeol := false]]]].
	printeol
		ifTrue: [self printEol].
	self acceptToken: n.
	self printWhiteSpace.
	(n is: #(#begin #local #constant ))
		ifTrue: [self printEol].
	currentLevel := currentLevel + 1
]
