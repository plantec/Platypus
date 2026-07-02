"
SmaCCScannerScanner is the scanner for the scanner definition
"
Class {
	#name : #SmaCCScannerScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'generated-comments' }
SmaCCScannerScanner class >> scannerDefinitionComment [

	"<backslashcharacter>	:	\\ [^cx] | \\ c [A-Z] | \\ x [0-9A-Fa-f]{1,4} ;
<characterblock>	: \[ ([^\]\\] | <backslashcharacter> )+ \] ;
<whitespace>	:	[\ \t\v\r\n]+ ;
<tokenname>	:	\< [a-zA-Z_] \w* \> ;
<comment>	:	(\# [^\r\n]*) | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/) ;
<repeat>	:	\{ [0-9]* \, [0-9]* \} ;
<symbol> : [a-zA-Z_] \w* ;
<character>	:	[^\ \t\v\\\r\n\{\(\[\.] ; 
<anycharacter>	: \. ;"
]

{ #category : #'generated-tokens' }
SmaCCScannerScanner >> emptySymbolTokenId [
	^30
]

{ #category : #'generated-tokens' }
SmaCCScannerScanner >> errorTokenId [
	^31
]

{ #category : #'generated-scanner' }
SmaCCScannerScanner >> scan1 [
	[ 
	self step.
	currentCharacter ~= $* ] whileTrue.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			(currentCharacter <= $) or: [ (currentCharacter between: $+ and: $.) or: [ currentCharacter >= $0 ] ])
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCScannerScanner >> scan2 [
	self step.
	(currentCharacter <= $b or: [ (currentCharacter between: $d and: $w) or: [ currentCharacter >= $y ] ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCScannerScanner >> scan3 [
	[ 
	self step.
	currentCharacter <= $[ or: [ currentCharacter >= $^ ] ] whileTrue.
	currentCharacter = $\
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCScannerScanner >> scan4 [
	self step.
	(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
SmaCCScannerScanner >> scanForToken [
	self step.
	(currentCharacter <= Character backspace
		or: [ 
			currentCharacter = Character newPage
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							(currentCharacter between: $! and: $")
								or: [ 
									currentCharacter = $$
										or: [ 
											(currentCharacter between: $& and: $')
												or: [ 
													(currentCharacter between: $, and: $-)
														or: [ 
															(currentCharacter between: $0 and: $9)
																or: [ 
																	(currentCharacter between: $= and: $>)
																		or: [ 
																			currentCharacter = $@
																				or: [ (currentCharacter between: $] and: $^) or: [ currentCharacter = $` or: [ currentCharacter >= $} ] ] ] ] ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			self recordMatch: #(17 18).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(17).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character pageUp)
		or: [ currentCharacter = Character cr or: [ currentCharacter = Character space ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character pageUp)
				or: [ currentCharacter = Character cr or: [ currentCharacter = Character space ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #comment.
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #comment.
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self step.
													currentCharacter = $d
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $s
																		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
																	^ self reportLastMatch ].
															^ self reportLastMatch ].
													^ self reportLastMatch ].
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
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $s
														ifTrue: [ ^ self recordAndReportMatch: #(8) ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(1 18) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(4 18) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(3 18) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(10 18) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(9 18) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $>
						ifTrue: [ ^ self recordAndReportMatch: #(14) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 18) ].
	currentCharacter = $[
		ifTrue: [ 
			self step.
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $\
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			(currentCharacter <= $b or: [ (currentCharacter between: $d and: $w) or: [ currentCharacter >= $y ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter = $c
				ifTrue: [ 
					self step.
					(currentCharacter between: $A and: $Z)
						ifTrue: [ ^ self recordAndReportMatch: #(11) ].
					^ self reportLastMatch ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							self recordMatch: #(11).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ 
									self recordMatch: #(11).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ 
											self recordMatch: #(11).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self recordAndReportMatch: #(11) ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ 
			[ 
			self step.
			currentCharacter between: $0 and: $9 ] whileTrue.
			currentCharacter = $,
				ifTrue: [ 
					[ 
					self step.
					currentCharacter between: $0 and: $9 ] whileTrue.
					currentCharacter = $}
						ifTrue: [ ^ self recordAndReportMatch: #(16) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 18) ].
	^ self reportLastMatch
]
