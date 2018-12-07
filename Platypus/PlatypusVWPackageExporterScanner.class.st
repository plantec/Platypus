Class {
	#name : #PlatypusVWPackageExporterScanner,
	#superclass : #ScannerFromPharo4,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'public access' }
PlatypusVWPackageExporterScanner >> canOutputSpaceAfterToken: aToken [ 
	^ ((#(':' '-' '+' ) includes: aToken)
		or: [aToken size > 1
				and: [aToken first = $"
						and: [aToken last = $"]]]) not
]

{ #category : #'public access' }
PlatypusVWPackageExporterScanner >> outPut: aString [ 
	| tokens |
	tokens := self tokenize: aString.
	^ self outPutTokens: tokens
]

{ #category : #'public access' }
PlatypusVWPackageExporterScanner >> outPutTokens: tokens [ 
	| prettPrinted |
	prettPrinted := WriteStream on: String new.
	tokens
		do: [:t | (t isKindOf: Array)
				ifTrue: [prettPrinted nextPutAll: '#( '.
					prettPrinted
						nextPutAll: (self outPutTokens: t).
					prettPrinted nextPutAll: ') ']
				ifFalse: [prettPrinted nextPutAll: t.
					(self canOutputSpaceAfterToken: t)
						ifTrue: [prettPrinted nextPut: $ ]]].
	^ prettPrinted contents
]

{ #category : #'expression types' }
PlatypusVWPackageExporterScanner >> scanToken [
	super scanToken.
	tokenType = #leftArrow
		ifTrue: [token := ':='].
	^ token
]

{ #category : #'public access' }
PlatypusVWPackageExporterScanner >> tokenize: sourceString [ 
	| coll |
	coll := OrderedCollection new.
	self
		scan: (ReadStream on: sourceString asString).
	[tokenType = #doIt]
		whileFalse: [(currentComment notNil
					and: [currentComment notEmpty])
				ifTrue: [[currentComment isEmpty]
						whileFalse: [coll addLast: '"' , currentComment removeFirst , '"']].
			token isSymbol
				ifTrue: [token := token asString].
			coll addLast: token.
			self scanToken].
	(currentComment notNil
			and: [currentComment notEmpty])
		ifTrue: [[currentComment isEmpty]
				whileFalse: [
					coll addLast: '"' , currentComment removeFirst , '"']].
	^ coll
]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xBinary [
	super xBinary.

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xColon [
	super xColon.
	tokenType = #leftArrow
		ifTrue: [token := ':=']
		ifFalse: [token := token asString]
]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xDelimiter [
	super xDelimiter.

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xDigit [
	super xDigit.
	token := token asString.

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xDollar [
	super xDollar.
	token := token printString
]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xDoubleQuote [
	super xDoubleQuote.

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xLetter [
	super xLetter.
	token := token asString.

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xLitQuote [
	super xLitQuote.
	(token isKindOf: Array)
		ifFalse: [token := '#' , token asString].

]

{ #category : #'multi-character scans' }
PlatypusVWPackageExporterScanner >> xSingleQuote [
	super xSingleQuote.
	token := token printString
]
