Class {
	#name : #PlatypusExpressScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'tokenList',
		'tokenClassifier'
	],
	#category : #'Platypus-HW-parsers'
}

{ #category : #'generated-initialization' }
PlatypusExpressScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(130 'ABSTRACT' 121) #(130 'AGGREGATE' 68) #(130 'ALIAS' 25) #(130 'AND' 61) #(130 'ANDOR' 59) #(130 'ARRAY' 62) #(130 'AS' 13) #(130 'BAG' 63) #(130 'BEGIN' 16) #(130 'BINARY' 69) #(130 'BOOLEAN' 91) #(130 'BY' 88) #(130 'CASE' 28) #(130 'CONSTANT' 14) #(130 'CONST_E' 81) #(130 'DERIVE' 110) #(130 'DIV' 56) #(130 'ELSE' 58) #(130 'END' 19) #(130 'END_ALIAS' 26) #(130 'END_CASE' 21) #(130 'END_CONSTANT' 6) #(130 'END_ENTITY' 118) #(130 'END_FUNCTION' 8) #(130 'END_IF' 20) #(130 'END_LOCAL' 104) #(130 'END_MAP' 70) #(130 'END_PROCEDURE' 24) #(130 'END_REPEAT' 105) #(130 'END_RULE' 7) #(130 'END_SCHEMA' 51) #(130 'END_SPLITMARK' 99) #(130 'END_TYPE' 92) #(130 'ENTITY' 116) #(130 'ENUMERATION' 72) #(130 'ESCAPE' 17) #(130 'FALSE' 78) #(130 'FIXED' 89) #(130 'FOR' 3) #(130 'FROM' 54) #(130 'FUNCTION' 5) #(130 'GENERIC' 74) #(130 'IF' 18) #(130 'IN' 46) #(130 'INTEGER' 86) #(130 'INVERSE' 114) #(130 'LIKE' 32) #(130 'LIST' 65) #(130 'LOCAL' 97) #(130 'LOGICAL' 87) #(130 'MAP' 84) #(130 'META' 23) #(130 'MOD' 55) #(130 'NOT' 50) #(130 'NUMBER' 73) #(130 'OF' 29) #(130 'ONEOF' 117) #(130 'OPTIONAL' 109) #(130 'OR' 36) #(130 'OTHERWISE' 30) #(130 'PI' 83) #(130 'PROCEDURE' 12) #(130 'QUERY' 82) #(130 'REAL' 85) #(130 'REFERENCE' 9) #(130 'REPEAT' 107) #(130 'RETURN' 106) #(130 'RULE' 2) #(130 'SCHEMA' 53) #(130 'SELECT' 76) #(130 'SELF' 115) #(130 'SET' 64) #(130 'SKIP' 98) #(130 'SPLITMARK' 94) #(130 'STRING' 66) #(130 'SUBTYPE' 119) #(130 'SUPERTYPE' 120) #(130 'THEN' 22) #(130 'TO' 101) #(130 'TRUE' 77) #(130 'TYPE' 100) #(130 'UNIQUE' 112) #(130 'UNKNOWN' 79) #(130 'UNTIL' 103) #(130 'USE' 27) #(130 'VAR' 111) #(130 'WHERE' 71) #(130 'WHILE' 102) #(130 'XOR' 39))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #'generated-comments' }
PlatypusExpressScanner class >> scannerDefinitionComment [

	"<tailRemark>		:		[\-][\-][^\n\r\f]* ;
<nativeAlgorithm>	: 		\( \* \# ;			
<embedRemark>	: 		\( \* ;			
<integer>			:		\d+	;
<real>				:		<integer>\.<integer>?(e(\+|-)?<integer>)?	;
<binary>			:		%[01]+	;
<string>			:		'([^']|'')*'	;
<encodedString>	:		\""[^\""]*\""	;
<identifier>			:		[A-Za-z0-9]\w*	;
<whitespace>		:		\s+ ;


"
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> binaryId [
	^127
]

{ #category : #scanning }
PlatypusExpressScanner >> buildTokenList [
	[self atEnd]
		whileFalse: [self next].
	^ self tokenList
]

{ #category : #scanning }
PlatypusExpressScanner >> embedRemark [
	| rem remarkToken smaccToken |
	rem := self readEmbedRemark.
	remarkToken := PlatypusEmbeddedRemarkToken token: rem.
	tokenList add: remarkToken.
	rem notEmpty
		ifTrue: [(rem first = $"
					or: [rem first = $<])
				ifTrue: [smaccToken := SmaCCToken
								value: remarkToken
								start: start
								id: (Array with: self remarkRefId).
					matchActions := nil.
					returnMatchBlock value: smaccToken]].
	outputStream reset.
	^ self whitespace
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> emptySymbolTokenId [
	^312
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> encodedStringId [
	^129
]

{ #category : #scanning }
PlatypusExpressScanner >> eol [
	outputStream reset.
	tokenList add: PlatypusEolToken new.
	^ self whitespace
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> errorTokenId [
	^313
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> identifierId [
	^130
]

{ #category : #scanning }
PlatypusExpressScanner >> indent [
	outputStream reset.
	tokenList add: PlatypusIndentToken new.
	^ self whitespace
]

{ #category : #'initialize-release' }
PlatypusExpressScanner >> initialize [
	super initialize.
	tokenList := PlatypusTokenList new.
	tokenClassifier := PlatypusExpressTokenClassifier new.

]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> integerId [
	^125
]

{ #category : #'generated-scanner' }
PlatypusExpressScanner >> keywordFor: aString [ 
	^aString asUppercase
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> logicalId [
	^314
]

{ #category : #scanning }
PlatypusExpressScanner >> nativeAlgorithm [
	| smaccToken nativeAlgorithmToken rem |
	rem := self readEmbedRemark.
	nativeAlgorithmToken := PlatypusExpressNativeAlgorithmToken token: rem allButLast.
	smaccToken := SmaCCToken
				value: nativeAlgorithmToken
				start: start
				id: (Array with: self nativeAlgorithmId).
	matchActions := nil.
	returnMatchBlock value: smaccToken.
	outputStream reset.
	^ self whitespace
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> nativeAlgorithmId [
	^123
]

{ #category : #accessing }
PlatypusExpressScanner >> next [
	| token tokenClass tokenNodeData precToken |
	token := super next.
	token value isString
		ifTrue: [token value isEmpty
				ifFalse: [tokenClass := tokenClassifier
								tokenClassFromString: token value
								ifAbsent: [((precToken := tokenList previousNonBlankFrom: tokenList last) notNil
											and: [precToken isPrimaryElementOpenKeyword])
										ifTrue: [PlatypusPrimaryElementIdentifierToken]
										ifFalse: [PlatypusIdentifierToken]].
					tokenNodeData := tokenClass token: token value]]
		ifFalse: [tokenNodeData := token value].
	tokenNodeData
		ifNotNil: [tokenList add: tokenNodeData].
	^ token
]

{ #category : #scanning }
PlatypusExpressScanner >> readEmbedRemark [
	| level loop rem endFound prevChar |
	level := 1.
	endFound := false.
	outputStream reset.
	self step.
	loop := stream atEnd not.
	[loop]
		whileTrue: [stream atEnd
				ifTrue: [Transcript show: 'End of input inside comment\' withCRs.
					loop := false]
				ifFalse: [prevChar := currentCharacter.
					self step.
					(prevChar == $(
							and: [currentCharacter == $*])
						ifTrue: [level := level + 1]
						ifFalse: [(prevChar == $*
									and: [currentCharacter == $)])
								ifTrue: [level := level - 1.
									level == 0
										ifTrue: [endFound := true.
											loop := false]]]]].
	rem := outputStream contents.
	endFound
		ifTrue: [rem := rem copyFrom: 1 to: rem size - 2].
	^ rem

]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> realId [
	^126
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> remarkRefId [
	^220
]

{ #category : #'generated-scanner' }
PlatypusExpressScanner >> scan1 [
	[ 
	self step.
	currentCharacter ~= $' ] whileTrue.
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(128).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
PlatypusExpressScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ 
			[ 
			self recordMatch: #(130).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ 
			[ 
			self recordMatch: #(125 130).
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(130).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter between: $0 and: $9 ] whileTrue.
			currentCharacter = $.
				ifTrue: [ 
					[ 
					self recordMatch: #(126).
					self step.
					currentCharacter between: $0 and: $9 ] whileTrue.
					(currentCharacter = $E or: [ currentCharacter = $e ])
						ifTrue: [ 
							self step.
							(currentCharacter between: $0 and: $9)
								ifTrue: [ 
									[ 
									self recordMatch: #(126).
									self step.
									currentCharacter between: $0 and: $9 ] whileTrue.
									^ self reportLastMatch ].
							(currentCharacter = $+ or: [ currentCharacter = $- ])
								ifTrue: [ 
									self step.
									(currentCharacter between: $0 and: $9)
										ifTrue: [ 
											[ 
											self recordMatch: #(126).
											self step.
											currentCharacter between: $0 and: $9 ] whileTrue.
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter ~= $" ] whileTrue.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(129) ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ 
					[ 
					self recordMatch: #(127).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $(
		ifTrue: [ 
			self recordMatch: #(10).
			self step.
			currentCharacter = $*
				ifTrue: [ 
					self recordMatch: #embedRemark.
					self step.
					currentCharacter = $#
						ifTrue: [ ^ self recordAndReportMatch: #nativeAlgorithm ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(57).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			currentCharacter = $}
				ifTrue: [ ^ self recordAndReportMatch: #(95) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $-
				ifTrue: [ 
					[ 
					self recordMatch: #tailRemark.
					self step.
					currentCharacter <= Character tab
						or: [ currentCharacter = Character pageUp or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(108) ].
	currentCharacter = $/
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self step.
					currentCharacter = $>
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(45) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ 
					self recordMatch: #(1).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(44) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(35).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(42).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(41) ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter = $\
		ifTrue: [ ^ self recordAndReportMatch: #(113) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(67) ].
	currentCharacter = ${
		ifTrue: [ 
			self recordMatch: #(47).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(96).
			self step.
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(48) ].
	^ self reportLastMatch
]

{ #category : #'generated-tokens' }
PlatypusExpressScanner >> stringId [
	^128
]

{ #category : #scanning }
PlatypusExpressScanner >> tailRemark [
	| rem remarkToken smaccToken |
	outputStream contents size > 2 
		ifTrue: 
			[rem := outputStream contents copyFrom: 3 to: outputStream contents size.
			remarkToken := PlatypusTailRemarkToken token: rem.
			rem notEmpty 
				ifTrue: 
					[(rem first = $" or: [rem first = $<]) 
						ifTrue: 
							[smaccToken := SmaCCToken 
										value: remarkToken
										start: start
										id: (Array with: self remarkRefId).
							matchActions := nil.
							returnMatchBlock value: smaccToken]]].
	outputStream reset.
	^ self whitespace
]

{ #category : #accessing }
PlatypusExpressScanner >> tokenList [
	^ tokenList
]

{ #category : #scanning }
PlatypusExpressScanner >> white [
	outputStream reset.
	tokenList add: PlatypusOneWhiteSpaceToken new.
	^ self whitespace
]

{ #category : #scanning }
PlatypusExpressScanner >> whitespace [
	| tokenClass |
	outputStream contents
		do: [:c | (tokenClass := tokenClassifier
						tokenClassFromCharacter: c
						ifAbsent: [PlatypusOneWhiteSpaceToken])
				ifNotNil: [tokenList add: tokenClass new]].
	outputStream reset.
	^ super whitespace
]
