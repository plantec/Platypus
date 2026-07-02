"
SmaCCGrammarScanner is the scanner for the grammar parser
"
Class {
	#name : #SmaCCGrammarScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'generated-initialization' }
SmaCCGrammarScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(20 'error' 15))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #testing }
SmaCCGrammarScanner class >> needsLineNumbers [
	^true
]

{ #category : #'generated-comments' }
SmaCCGrammarScanner class >> scannerDefinitionComment [

	"<name> : [a-zA-Z_] \w* ;
<whitespace>	:	\s+ ;
<tokenname>	:	\< <name> \> ;
<symbolname>	:	<name>	 ;
<keyword>	:	(\"" [^\""]* \"") + ;
<comment>	:	(\# [^\r\n]*) | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/) ;
<code>:	\{ [^\}]+ \} ;
<variablename> :	\' <name> \' ;
<production> : \: (\: \=)? ;"
]

{ #category : #'generated-tokens' }
SmaCCGrammarScanner >> emptySymbolTokenId [
	^43
]

{ #category : #'generated-tokens' }
SmaCCGrammarScanner >> errorTokenId [
	^44
]

{ #category : #'generated-scanner' }
SmaCCGrammarScanner >> scan1 [
	self step.
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ ^ self recordAndReportMatch: #(6) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self step.
											currentCharacter = $s
												ifTrue: [ 
													self step.
													currentCharacter = $o
														ifTrue: [ 
															self step.
															currentCharacter = $c
																ifTrue: [ ^ self recordAndReportMatch: #(3) ].
															^ self reportLastMatch ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ 
							self step.
							currentCharacter = $h
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ ^ self recordAndReportMatch: #(8) ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ ^ self recordAndReportMatch: #(1) ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCGrammarScanner >> scan2 [
	[ 
	self step.
	currentCharacter ~= $" ] whileTrue.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(21).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCGrammarScanner >> scan3 [
	[ 
	self step.
	currentCharacter ~= $* ] whileTrue.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			(currentCharacter <= $) or: [ (currentCharacter between: $+ and: $.) or: [ currentCharacter >= $0 ] ])
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCGrammarScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(20).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #comment.
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $'
						ifTrue: [ ^ self recordAndReportMatch: #(24) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter = $/
		ifTrue: [ 
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			currentCharacter = $:
				ifTrue: [ 
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(25) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $<
		ifTrue: [ 
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $>
						ifTrue: [ ^ self recordAndReportMatch: #(19) ].
					^ self reportLastMatch ].
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = ${
		ifTrue: [ 
			self step.
			currentCharacter ~= $}
				ifTrue: [ 
					[ 
					self step.
					currentCharacter ~= $} ] whileTrue.
					currentCharacter = $}
						ifTrue: [ ^ self recordAndReportMatch: #(23) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch
]
