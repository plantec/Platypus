"
I scan a string or text, picking out Smalltalk syntactic tokens. I look one character ahead. I put each token found into the instance variable, token, and its type (a Symbol) into the variable, tokenType. At the end of the input stream, I pretend to see an endless sequence of special characters called doits.
"
Class {
	#name : #ScannerFromPharo4,
	#superclass : #Object,
	#instVars : [
		'source',
		'mark',
		'hereChar',
		'aheadChar',
		'token',
		'tokenType',
		'currentComment',
		'buffer',
		'typeTable'
	],
	#classVars : [
		'DoItCharacter'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'class initialization' }
ScannerFromPharo4 class >> initialize [
	"The unicode ending with FFFE or FFFF are non characters and can be used by applications if they wish.
	We use last legal unicode 16r10FFFF to encode the end of source stream"
	DoItCharacter := Character value: 16r10FFFF
]

{ #category : #'instance creation' }
ScannerFromPharo4 class >> new [

	^self basicNew initScanner
]

{ #category : #'expression types' }
ScannerFromPharo4 >> advance [

	| prevToken |
	prevToken := token.
	self scanToken.
	^prevToken
]

{ #category : #'error handling' }
ScannerFromPharo4 >> ambiguousSelector: aString inRange: anInterval [
	"Warning: this methods breaks backward compatibility: $- is now part of literal argument.."
	
	token := aString asSymbol.
	^self
]

{ #category : #initialization }
ScannerFromPharo4 >> initScanner [

	buffer := (String new: 40) writeStream.
	typeTable := String typeTable
]

{ #category : #'initialize-release' }
ScannerFromPharo4 >> initScannerForTokenization [
	"Use a version of typeTable that doesn't raise xIllegal when enocuntering an :="
	| underscoreIndex |
	underscoreIndex := typeTable indexOf: #xUnderscore ifAbsent: [^self].
	typeTable := typeTable copy.
	typeTable at: underscoreIndex put: #xUnderscoreForTokenization
]

{ #category : #'error handling' }
ScannerFromPharo4 >> notify: string [ 
	"Refer to the comment in Object|notify:." 
	self error: string
]

{ #category : #'error handling' }
ScannerFromPharo4 >> notify: string at: posiiton [
	"Parser compatible message"
	 
	^self notify: string 
]

{ #category : #'error handling' }
ScannerFromPharo4 >> offEnd: aString [ 
	"Parser overrides this"

	^self notify: aString
]

{ #category : #initialization }
ScannerFromPharo4 >> scan: inputStream [ 
	"Bind the input stream, fill the character buffers and first token buffer."

	source := inputStream.
	self step.
	self step.
	self scanToken
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanAllTokenPositionsInto: aBlock [
	"Evaluate aBlock with the start and end positions of all separate non-white-space tokens, including comments."

	| lastMark |
	lastMark := 1.
	[currentComment ifNotNil:
		[currentComment do:
			[:cmnt| | idx |
			 idx := source originalContents indexOfSubCollection: cmnt startingAt: lastMark.
			 (idx > 0 and: [idx < mark]) ifTrue:
				[aBlock value: idx - 1 value: (lastMark := idx + cmnt size)]].
		 currentComment := nil].
	mark ifNotNil:
		[(token == #- 
		  and: [(self typeTableAt: hereChar) == #xDigit]) ifTrue:
			[| savedMark |
			 savedMark := mark.
			 self scanToken.
			 token := token negated.
			 mark := savedMark].
		"Compensate for the fact that the parser uses two character lookahead.  Normally we must
		  remove the extra two characters.  But this mustn't happen for the last token at the end of stream."
		 aBlock
			value: mark
			value: (source atEnd
					ifTrue: [tokenType := #doIt. "to cause an immediate ^self" source position]
					ifFalse: [source position - 2])].
	 (tokenType == #rightParenthesis
	  or: [tokenType == #doIt]) ifTrue:
		[^self].
	tokenType == #leftParenthesis
		ifTrue: 
			[self scanToken; scanAllTokenPositionsInto: aBlock]
		ifFalse: 
			[(tokenType == #word or: [tokenType == #keyword or: [tokenType == #colon]])
				ifTrue: 
					[self scanLitWord.
					 token == #true ifTrue: [token := true].
					 token == #false ifTrue: [token := false].
					 token == #nil ifTrue: [token := nil]]
				ifFalse:
					[(token == #- 
					  and: [(self typeTableAt: hereChar) == #xDigit])
						ifTrue: 
							[self scanToken.
							 token := token negated]]].
		self scanToken ] repeat
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanLitByte [
	| stream |
	stream := (ByteArray new: 16) writeStream.
	[ tokenType = #rightBracket or: [ tokenType = #doIt ] ] whileFalse: [
		tokenType = #word
			ifTrue: [ self scanLitWord ].
		(token isInteger and: [ token between: 0 and: 255 ])
			ifFalse: [ ^ self offEnd: '8-bit integer or right bracket expected' ].
		stream nextPut: token.
		self scanToken ].
	token := stream contents
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanLitVec [
	| s |
	s := (Array new: 16) writeStream.
	[tokenType == #rightParenthesis or: [tokenType == #doIt]] whileFalse:
		[tokenType == #leftParenthesis
			ifTrue: 
				[self scanToken; scanLitVec]
			ifFalse: 
				[(tokenType == #word or: [tokenType == #keyword or: [tokenType == #colon]])
					ifTrue: 
						[self scanLitWord.
						token == #true ifTrue: [token := true].
						token == #false ifTrue: [token := false].
						token == #nil ifTrue: [token := nil]]
					ifFalse:
						[(token == #- 
						  and: [(self typeTableAt: hereChar) == #xDigit]) ifTrue: 
							[self scanToken.
							 token := token negated]]].
		s nextPut: token.
		self scanToken].
	token := s contents
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanLitWord [
	"Accumulate keywords and asSymbol the result."

	| t |
	[(self typeTableAt: hereChar) = #xLetter]
		whileTrue: 
			[t := token.
			self xLetter.
			token := t , token].
	token := token asSymbol
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanStringStruct [

	| s |
	s := (Array new: 16) writeStream.
	[tokenType == #rightParenthesis or: [tokenType == #doIt]]
		whileFalse: 
			[tokenType == #leftParenthesis
				ifTrue: 
					[self scanToken; scanStringStruct]
				ifFalse: 
					[tokenType == #word ifFalse:
						[^self error: 'only words and parens allowed']].
			s nextPut: token.
			self scanToken].
	token := s contents
]

{ #category : #'expression types' }
ScannerFromPharo4 >> scanToken [

	[(tokenType := self typeTableAt: hereChar) == #xDelimiter]
		whileTrue: [self step].  "Skip delimiters fast, there almost always is one."
	mark := aheadChar == DoItCharacter
		ifTrue: [hereChar == DoItCharacter
			ifTrue: [source position + 1]
			ifFalse: [source position]]
		ifFalse: [source position - 1].
	(tokenType at: 1) == $x "x as first letter"
		ifTrue: [self perform: tokenType "means perform to compute token & type"]
		ifFalse: [token := self step asSymbol "else just unique the first char"].
	^token
]

{ #category : #'public access' }
ScannerFromPharo4 >> scanTokens: textOrString [ 
	"Answer an Array that has been tokenized as though the input text, 
	textOrString, had appeared between the array delimitors #( and ) in a 
	Smalltalk literal expression."

	self scan: textOrString asString readStream.
	self scanLitVec.
	^token

	"Scanner new scanTokens: 'identifier keyword: 8r31 ''string'' .'"
]

{ #category : #'expression types' }
ScannerFromPharo4 >> step [

	| c |
	c := hereChar.
	hereChar := aheadChar.
	source atEnd
		ifTrue: [aheadChar := DoItCharacter]
		ifFalse: [aheadChar := source next].
	^c
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> typeTableAt: aCharacter [
	^typeTable
		at: aCharacter charCode
		ifAbsent:
			[aCharacter == DoItCharacter
				ifTrue: [#doIt]
				ifFalse: [#xLetter]]
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xBinary [

	| startOfToken |
	tokenType := #binary.
	startOfToken := mark.
	token := String with: self step.
	[(self typeTableAt: hereChar) == #xBinary] whileTrue:
		[(hereChar == $- and: [(self typeTableAt: aheadChar) == #xDigit])
			ifTrue: [^self ambiguousSelector: (token , '-')
					inRange: (startOfToken to: source position - 1).].
		token := token, (String with: self step)].
	token := token asSymbol
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xColon [
	"Allow := for assignment"
	
	aheadChar == $= ifTrue:
		[self step.
		tokenType := #leftArrow.
		self step.
		^ token := #':='].
	"Otherwise, just do what normal scan of colon would do"
	tokenType := #colon.
	^ token := self step asSymbol
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xDelimiter [
	"Ignore blanks, etc."

	self scanToken
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xDigit [
	"Form a number."

	tokenType := #number.
	aheadChar == DoItCharacter
		ifTrue: [source skip: -1 "Read off the end last time"]
		ifFalse: [source skip: -2].
	token := (NumberParser on: source)
		failBlock: [:errorString :position | self notify: errorString at:position];
		nextNumber.
	self step; step
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xDollar [
	"Form a Character literal."

	aheadChar == DoItCharacter
		ifTrue:
			[mark := mark + 1. "Let the notification lie behind the dollar"
			^self offEnd: 'A Character was expected'].
	self step. "pass over $"
	token := self step.
	tokenType := #number
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xDoubleQuote [
	"Collect a comment."
	| aStream |

	aStream := (String new: 200) writeStream.
	self step.
	[hereChar == $"]
		whileFalse:
			[hereChar == DoItCharacter
				ifTrue: [^self offEnd: 'Unmatched comment quote'].
			aStream nextPut: self step.].
	self step.
	(currentComment ifNil: [ 
		currentComment := OrderedCollection new ])
			add: aStream contents.
	self scanToken
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xIllegal [
	"An illegal character was encountered"
	self notify: 'Illegal character (char code ' , hereChar charCode , ' ' , hereChar charCode storeStringHex , ')' at: mark
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xLetter [
	"Form a word or keyword."

	| type |
	buffer reset.
	[(type := self typeTableAt: hereChar) == #xLetter or: [type == #xDigit]]
		whileTrue:
			["open code step for speed"
			buffer nextPut: hereChar.
			hereChar := aheadChar.
			aheadChar := source atEnd
							ifTrue: [DoItCharacter]
							ifFalse: [source next]].
	tokenType := (type == #xColon and: [aheadChar ~~ $=])
					ifTrue: 
						[buffer nextPut: self step.
						"Allow any number of embedded colons in literal symbols"
						[(self typeTableAt: hereChar) == #xColon] whileTrue:
							[buffer nextPut: self step].
						#keyword]
					ifFalse: [#word].
	token := buffer contents
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xLitQuote [
	"Symbols and vectors: #(1 (4 5) 2 3) #ifTrue:ifFalse: #'abc'."
	| start |
	start := mark.
	self step.
	"litQuote"
	self scanToken.
	tokenType == #leftParenthesis
		ifTrue: [self scanToken; scanLitVec.
			mark := start + 1.
			tokenType == #doIt
				ifTrue: [self offEnd: 'Unmatched parenthesis']]
		ifFalse: [tokenType == #leftBracket
				ifTrue: [self scanToken; scanLitByte.
					mark := start + 1.
					tokenType == #doIt
						ifTrue: [self offEnd: 'Unmatched bracket']]
				ifFalse: [(tokenType == #word or: [tokenType == #keyword or: [tokenType == #colon]])
						ifTrue: [self scanLitWord]
						ifFalse: [tokenType == #literal
								ifTrue: [token isSymbol
										ifTrue: ["##word"
											token := token
											"May want to move toward ANSI
											here "]]
								ifFalse: [tokenType == #string
										ifTrue: [token := token asSymbol]]]]].
	mark := start.
	tokenType := #literal
	"#(Pen)
	#Pen
	#'Pen'
	##Pen
	###Pen
	"
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xSingleQuote [
	"String."

	self step.
	buffer reset.
	[hereChar == $' 
		and: [aheadChar == $' 
				ifTrue: [self step. false]
				ifFalse: [true]]]
		whileFalse: 
			[hereChar == DoItCharacter
				ifTrue: [^self offEnd: 'Unmatched string quote'].
			buffer nextPut: self step].
	self step.
	token := buffer contents.
	tokenType := #string
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xUnderscore [
	^ self xIllegal
]

{ #category : #'multi-character scans' }
ScannerFromPharo4 >> xUnderscoreForTokenization [
	self step.
	tokenType := #leftArrow.
	^token := #'_'
]
