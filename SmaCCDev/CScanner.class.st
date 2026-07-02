Class {
	#name : #CScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'typeNames'
	],
	#category : #'SmaCCDev-Examples'
}

{ #category : #'generated-initialization' }
CScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(#IDENTIFIER 'auto' 65) #(#IDENTIFIER 'break' 48) #(#IDENTIFIER 'case' 38) #(#IDENTIFIER 'char' 73) #(#IDENTIFIER 'const' 40) #(#IDENTIFIER 'continue' 47) #(#IDENTIFIER 'default' 39) #(#IDENTIFIER 'do' 54) #(#IDENTIFIER 'double' 70) #(#IDENTIFIER 'else' 46) #(#IDENTIFIER 'enum' 45) #(#IDENTIFIER 'extern' 58) #(#IDENTIFIER 'float' 67) #(#IDENTIFIER 'for' 49) #(#IDENTIFIER 'goto' 50) #(#IDENTIFIER 'if' 42) #(#IDENTIFIER 'int' 69) #(#IDENTIFIER 'long' 66) #(#IDENTIFIER 'register' 71) #(#IDENTIFIER 'return' 56) #(#IDENTIFIER 'short' 68) #(#IDENTIFIER 'signed' 51) #(#IDENTIFIER 'sizeof' 24) #(#IDENTIFIER 'static' 61) #(#IDENTIFIER 'struct' 43) #(#IDENTIFIER 'switch' 52) #(#IDENTIFIER 'typedef' 57) #(#IDENTIFIER 'union' 44) #(#IDENTIFIER 'unsigned' 55) #(#IDENTIFIER 'void' 72) #(#IDENTIFIER 'volatile' 41) #(#IDENTIFIER 'while' 53))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #testing }
CScanner class >> needsLineNumbers [
	^true
]

{ #category : #'generated-comments' }
CScanner class >> scannerDefinitionComment [

	"<H>: [a-fA-F0-9]	;
<IS>: [uUlL]	;
<D>: [0-9]	;
<E>: [Ee][\+\-]?<D>+	;
<FS>: [fFlL]	;
<ELLIPSIS> : \.\.\. ;
<comment>: \/ \*	;
<LETTER> : [a-zA-Z_] ;
<DIGIT> : [0-9] ;
<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
<CONSTANT>: (0[xX]<H>+<IS>?) | 
				(<D>+<IS>?) | 
				(<D>+<E><FS>?) | 
				<D>*\.<D>+<E>?<FS>? | 
				(L? \' ( (\\ .) | ([^\\\""]) )+ \')	;

<STRING_LITERAL>: L? \"" ( (\\ .) | ([^\\\""]) )* \""	;

<LEFT_BLOCK>: \[ | (\< \:)	;
<RIGHT_BLOCK>: \] | (\: \>)	;
<LEFT_BRACE>: \{ | (\< \%)	;
<RIGHT_BRACE>: \} | (\% \>)	;

<whitespace>: \s+	;"
]

{ #category : #'generated-tokens' }
CScanner >> CONSTANTId [
	^77
]

{ #category : #scanning }
CScanner >> IDENTIFIER [
	| name |
	name := outputStream contents.
	matchActions := (typeNames includes: name) 
				ifTrue: [Array with: self TypeNameId]
				ifFalse: [Array with: self IDENTIFIERId].
	outputStream reset.
	^SmaCCToken 
		value: name
		start: start
		id: matchActions
]

{ #category : #'generated-tokens' }
CScanner >> IDENTIFIERId [
	^76
]

{ #category : #'generated-tokens' }
CScanner >> TypeNameId [
	^132
]

{ #category : #scanning }
CScanner >> addTypeName: aString [ 
	typeNames add: aString
]

{ #category : #'default token handling' }
CScanner >> comment [
	| char |
	
	[[(char := stream next) isNil or: [char == $*]] whileFalse.
	stream atEnd ifTrue: [self scannerError].
	stream peekFor: $/] 
			whileFalse.
	^self whitespace
]

{ #category : #'generated-tokens' }
CScanner >> emptySymbolTokenId [
	^147
]

{ #category : #'generated-tokens' }
CScanner >> errorTokenId [
	^148
]

{ #category : #'initialize-release' }
CScanner >> initialize [
	super initialize.
	typeNames := Set new
]

{ #category : #'generated-scanner' }
CScanner >> scan1 [
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $F or: [ currentCharacter = $L or: [ currentCharacter = $f or: [ currentCharacter = $l ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan2 [
	self step.
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan3 [
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
CScanner >> scan4 [
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $F or: [ currentCharacter = $L or: [ currentCharacter = $f or: [ currentCharacter = $l ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan5 [
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan6 [
	[ 
	self step.
	currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] whileTrue.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter <= $ÿ
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan7 [
	self step.
	(currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan8 [
	[ 
	self step.
	currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $&) or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ] ]
		whileTrue.
	currentCharacter = $'
		ifTrue: [ 
			[ 
			self recordMatch: #(77).
			self step.
			(currentCharacter <= $!
				or: [ (currentCharacter between: $# and: $&) or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scan9 [
	self step.
	currentCharacter <= $ÿ
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
CScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $K)
		or: [ (currentCharacter between: $M and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #IDENTIFIER.
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ ^ self scan5 ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(63) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(35).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(36).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(20) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(27).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self recordAndReportMatch: #(74) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan5 ].
			(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(77) ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan3 ].
			(currentCharacter = $X or: [ currentCharacter = $x ])
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(77).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
							(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
								ifTrue: [ ^ self recordAndReportMatch: #(77) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $.
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(81) ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(33).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(37) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(6).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(14).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(62) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $L
		ifTrue: [ 
			self recordMatch: #IDENTIFIER.
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #IDENTIFIER.
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch
]
