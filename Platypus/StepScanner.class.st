Class {
	#name : 'StepScanner',
	#superclass : 'SmaCCScanner',
	#category : 'Platypus-STEP-core',
	#package : 'Platypus',
	#tag : 'STEP-core'
}

{ #category : 'generated-initialization' }
StepScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(25 'END_SCOPE' 5) #(25 'SCOPE' 2) #(26 '.F.' 13) #(26 '.T.' 16) #(26 '.U.' 11))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : 'generated-comments' }
StepScanner class >> scannerDefinitionComment [

	"<annotation>		: 		[\<] ;
<integer>		:		\d+;
<real>			:		<integer>\.<integer>?(e[\+\-]?<integer>+)?	;
<binary>		:		%[01]+	;
<string>			:		'([^']|'')*' ;
<encodedString>	:		\""[^\""]*\""	;
<identifier>		:		[A-Za-z]\w*	;
<enum>			:		\.\w*\.	;
<comment>		: 		\/ \* ( \w | \W )* \* \/	;
<tailRemark>		:		[\-][\-][^\n\r\f]* ;
<whitespace>		:		\s+	;"
]

{ #category : 'scanning' }
StepScanner >> annotation [
	[ 
	self step.
	currentCharacter ~= $> ] whileTrue.
	^ self whitespace 
]

{ #category : 'generated-tokens' }
StepScanner >> emptySymbolTokenId [
	^58
]

{ #category : 'generated-tokens' }
StepScanner >> errorTokenId [
	^59
]

{ #category : 'generated-scanner' }
StepScanner >> keywordFor: aString [ 
	^aString asUppercase
]

{ #category : 'generated-scanner' }
StepScanner >> scan1 [
	[ 
	self step.
	(currentCharacter <= $) or: [ (currentCharacter between: $+ and: $.) or: [ currentCharacter >= $0 ] ])
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $* ] whileTrue.
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #comment.
			self step.
			currentCharacter ~= $*
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $*
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : 'generated-scanner' }
StepScanner >> scan2 [
	[ 
	self step.
	currentCharacter ~= $* ] whileTrue.
	currentCharacter = $*
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : 'generated-scanner' }
StepScanner >> scan3 [
	[ 
	self step.
	currentCharacter ~= $' ] whileTrue.
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(24).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : 'generated-scanner' }
StepScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $D)
		or: [ 
			(currentCharacter between: $F and: $H)
				or: [ 
					(currentCharacter between: $J and: $Z)
						or: [ 
							(currentCharacter between: $a and: $d)
								or: [ (currentCharacter between: $f and: $h) or: [ currentCharacter between: $j and: $z ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(25).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ 
			[ 
			self recordMatch: #(21).
			self step.
			currentCharacter between: $0 and: $9 ] whileTrue.
			currentCharacter = $.
				ifTrue: [ 
					[ 
					self recordMatch: #(22).
					self step.
					currentCharacter between: $0 and: $9 ] whileTrue.
					(currentCharacter = $E or: [ currentCharacter = $e ])
						ifTrue: [ 
							self step.
							(currentCharacter between: $0 and: $9)
								ifTrue: [ 
									[ 
									self recordMatch: #(22).
									self step.
									currentCharacter between: $0 and: $9 ] whileTrue.
									^ self reportLastMatch ].
							(currentCharacter = $+ or: [ currentCharacter = $- ])
								ifTrue: [ 
									self step.
									(currentCharacter between: $0 and: $9)
										ifTrue: [ 
											[ 
											self recordMatch: #(22).
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
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $M)
						or: [ 
							(currentCharacter between: $O and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $m) or: [ currentCharacter between: $o and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(25).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			(currentCharacter = $N or: [ currentCharacter = $n ])
				ifTrue: [ 
					self recordMatch: #(25).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $C)
								or: [ 
									(currentCharacter between: $E and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $c) or: [ currentCharacter between: $e and: $z ] ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(25).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					(currentCharacter = $D or: [ currentCharacter = $d ])
						ifTrue: [ 
							self recordMatch: #(25).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(25).
									self step.
									(currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue.
									^ self reportLastMatch ].
							currentCharacter = $-
								ifTrue: [ 
									self step.
									(currentCharacter = $I or: [ currentCharacter = $i ])
										ifTrue: [ 
											self step.
											(currentCharacter = $S or: [ currentCharacter = $s ])
												ifTrue: [ 
													self step.
													(currentCharacter = $O or: [ currentCharacter = $o ])
														ifTrue: [ 
															self step.
															currentCharacter = $-
																ifTrue: [ 
																	self step.
																	currentCharacter = $1
																		ifTrue: [ 
																			self step.
																			currentCharacter = $0
																				ifTrue: [ 
																					self step.
																					currentCharacter = $3
																						ifTrue: [ 
																							self step.
																							currentCharacter = $0
																								ifTrue: [ 
																									self step.
																									currentCharacter = $3
																										ifTrue: [ 
																											self step.
																											currentCharacter = $-
																												ifTrue: [ 
																													self step.
																													currentCharacter = $2
																														ifTrue: [ 
																															self step.
																															currentCharacter = $1
																																ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																															^ self reportLastMatch ].
																													^ self reportLastMatch ].
																											^ self reportLastMatch ].
																									^ self reportLastMatch ].
																							^ self reportLastMatch ].
																					^ self reportLastMatch ].
																			^ self reportLastMatch ].
																	^ self reportLastMatch ].
															^ self reportLastMatch ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	(currentCharacter = $I or: [ currentCharacter = $i ])
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $R)
						or: [ 
							(currentCharacter between: $T and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(25).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			(currentCharacter = $S or: [ currentCharacter = $s ])
				ifTrue: [ 
					self recordMatch: #(25).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $N)
								or: [ 
									(currentCharacter between: $P and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $n) or: [ currentCharacter between: $p and: $z ] ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(25).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					(currentCharacter = $O or: [ currentCharacter = $o ])
						ifTrue: [ 
							self recordMatch: #(25).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(25).
									self step.
									(currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue.
									^ self reportLastMatch ].
							currentCharacter = $-
								ifTrue: [ 
									self step.
									currentCharacter = $1
										ifTrue: [ 
											self step.
											currentCharacter = $0
												ifTrue: [ 
													self step.
													currentCharacter = $3
														ifTrue: [ 
															self step.
															currentCharacter = $0
																ifTrue: [ 
																	self step.
																	currentCharacter = $3
																		ifTrue: [ 
																			self step.
																			currentCharacter = $-
																				ifTrue: [ 
																					self step.
																					currentCharacter = $2
																						ifTrue: [ 
																							self step.
																							currentCharacter = $1
																								ifTrue: [ ^ self recordAndReportMatch: #(6) ].
																							^ self reportLastMatch ].
																					^ self reportLastMatch ].
																			^ self reportLastMatch ].
																	^ self reportLastMatch ].
															^ self reportLastMatch ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter = $$
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter = $%
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ 
					[ 
					self recordMatch: #(23).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(14).
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
		ifTrue: [ 
			[ 
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			currentCharacter = $.
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $<
		ifTrue: [ ^ self recordAndReportMatch: #annotation ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch
]

{ #category : 'scanning' }
StepScanner >> tailRemark [
	^ self whitespace
]
