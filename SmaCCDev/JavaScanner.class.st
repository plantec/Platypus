Class {
	#name : #JavaScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCCDev-Examples'
}

{ #category : #'generated-initialization' }
JavaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(99 'abstract' 38) #(99 'boolean' 30) #(99 'break' 81) #(99 'byte' 31) #(99 'case' 41) #(99 'catch' 72) #(99 'char' 26) #(99 'class' 8) #(99 'continue' 80) #(99 'default' 47) #(99 'do' 77) #(99 'double' 25) #(99 'else' 14) #(99 'extends' 11) #(99 'false' 95) #(99 'final' 36) #(99 'finally' 75) #(99 'float' 24) #(99 'for' 78) #(99 'if' 35) #(99 'implements' 10) #(99 'import' 44) #(99 'instanceof' 58) #(99 'int' 33) #(99 'interface' 16) #(99 'long' 27) #(99 'native' 37) #(99 'new' 76) #(99 'null' 98) #(99 'package' 29) #(99 'private' 45) #(99 'protected' 46) #(99 'public' 43) #(99 'return' 74) #(99 'short' 34) #(99 'static' 39) #(99 'strictfp' 7) #(99 'super' 22) #(99 'switch' 17) #(99 'synchronized' 40) #(99 'this' 23) #(99 'throw' 73) #(99 'throws' 20) #(99 'transient' 18) #(99 'true' 95) #(99 'try' 79) #(99 'void' 9) #(99 'volatile' 12) #(99 'while' 57))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #'generated-comments' }
JavaScanner class >> scannerDefinitionComment [

	"<DECIMAL_INTEGER>: 0 | [1-9] [0-9]*	;
<HEX_INTEGER>: 0[xX][0-9a-fA-F]+	;
<OCTAL_INTEGER>: 0[0-7]+	;

<EXPONENT>: [eE] [\-\+]? [0-9]+ 	;
<FLOAT_TYPE>: [fFdD]	;

<ESCAPE_SEQUENCE>: \\ ([btnfr\""\'\\] | ([0-3] [0-7]{0,2} | [4-7][0-7]?))	;

<INTEGER_LITERAL>: (<DECIMAL_INTEGER> | <HEX_INTEGER> | <OCTAL_INTEGER>) [lL]?	;
<FLOATING_POINT_LITERAL>: [0-9]+ \. [0-9]* <EXPONENT>? <FLOAT_TYPE>? | \. [0-9]+ <EXPONENT>? <FLOAT_TYPE>? | [0-9]+ <EXPONENT> <FLOAT_TYPE>? | [0-9]+ <FLOAT_TYPE>	;
<BOOLEAN_LITERAL>: true | false	;
<CHARACTER_LITERAL>: \' ([^\\\'] | <ESCAPE_SEQUENCE> ) \'	;
<STRING_LITERAL>: \"" ([^\\\""] | <ESCAPE_SEQUENCE> )* \""	;
<NULL_LITERAL>: null	;

<IDENTIFIER>: [a-zA-Z_] \w*	;

<eol>: \r | \n | \r\n	;
<whitespace>: \s+	;
<comment>: \/\/ [^\r\n]* <eol>	;
<multipleLineComment>: \/ \* 	;"
]

{ #category : #'generated-tokens' }
JavaScanner >> emptySymbolTokenId [
	^255
]

{ #category : #'generated-tokens' }
JavaScanner >> errorTokenId [
	^256
]

{ #category : #scanning }
JavaScanner >> multipleLineComment [
	| char |
	
	[[(char := stream next) isNil or: [char == $*]] whileFalse.
	stream atEnd ifTrue: [self scannerError].
	stream peekFor: $/] 
			whileFalse.
	^self whitespace
]

{ #category : #'generated-scanner' }
JavaScanner >> scan1 [
	[ 
	self recordMatch: #(94).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan2 [
	self step.
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan4 ].
	(currentCharacter = $+ or: [ currentCharacter = $- ])
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan3 [
	[ 
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan4 [
	[ 
	self recordMatch: #(94).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan5 [
	[ 
	self step.
	currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] whileTrue.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(97) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			(currentCharacter = $"
				or: [ 
					currentCharacter = $'
						or: [ 
							(currentCharacter between: $0 and: $7)
								or: [ 
									currentCharacter = $\
										or: [ 
											currentCharacter = $b
												or: [ currentCharacter = $f or: [ currentCharacter = $n or: [ currentCharacter = $r or: [ currentCharacter = $t ] ] ] ] ] ] ] ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan6 [
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(96) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scan7 [
	self step.
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(96) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
JavaScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(99).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ 
			[ 
			self recordMatch: #(93).
			self step.
			currentCharacter between: $0 and: $9 ] whileTrue.
			(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter = $L or: [ currentCharacter = $l ])
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			currentCharacter = $.
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(91).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(51) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(85).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(50).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			(currentCharacter <= $& or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ])
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $\
				ifTrue: [ 
					self step.
					(currentCharacter = $"
						or: [ 
							currentCharacter = $'
								or: [ 
									currentCharacter = $\
										or: [ 
											currentCharacter = $b
												or: [ currentCharacter = $f or: [ currentCharacter = $n or: [ currentCharacter = $r or: [ currentCharacter = $t ] ] ] ] ] ] ])
						ifTrue: [ ^ self scan6 ].
					(currentCharacter between: $0 and: $3)
						ifTrue: [ 
							self step.
							(currentCharacter between: $0 and: $7)
								ifTrue: [ ^ self scan7 ].
							currentCharacter = $'
								ifTrue: [ ^ self recordAndReportMatch: #(96) ].
							^ self reportLastMatch ].
					(currentCharacter between: $4 and: $7)
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(42).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(89).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(70) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(87) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(88).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #multipleLineComment ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #comment ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #comment.
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #comment ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(66) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(93).
			self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ 
					[ 
					self recordMatch: #(93).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
						ifTrue: [ ^ self recordAndReportMatch: #(94) ].
					(currentCharacter between: $8 and: $9)
						ifTrue: [ ^ self scan3 ].
					(currentCharacter = $E or: [ currentCharacter = $e ])
						ifTrue: [ ^ self scan2 ].
					(currentCharacter = $L or: [ currentCharacter = $l ])
						ifTrue: [ ^ self recordAndReportMatch: #(93) ].
					currentCharacter = $.
						ifTrue: [ ^ self scan1 ].
					^ self reportLastMatch ].
			(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan3 ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter = $L or: [ currentCharacter = $l ])
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			(currentCharacter = $X or: [ currentCharacter = $x ])
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(93).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
							(currentCharacter = $L or: [ currentCharacter = $l ])
								ifTrue: [ ^ self recordAndReportMatch: #(93) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $.
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(83).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(63) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(59).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(55) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(84).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(62) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(86).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(60) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(49).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(53) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(92) ].
	^ self reportLastMatch
]
