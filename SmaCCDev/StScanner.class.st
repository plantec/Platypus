Class {
	#name : #StScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCCDev-Examples'
}

{ #category : #accessing }
StScanner class >> frequencyTable [
	^#(0.0 1.31372e-7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0481767 0.0 0.0 0.0 0.0252514 0.0 0.0 2.62743e-7 1.31372e-7 5.25487e-7 1.31372e-7 1.31372e-7 0.0 1.31372e-7 0.0 2.62743e-7 0.0 1.31372e-7 7.8823e-7 2.62743e-7 2.62743e-7 1.31372e-7 5.25487e-7 0.106011 5.13007e-5 0.004554 0.00655584 2.41133e-4 3.60615e-5 1.93248e-4 0.00410241 0.00463893 0.0046369 2.82712e-4 4.64268e-4 0.0011675 9.75895e-4 0.00982753 2.26945e-4 0.00795055 0.00590903 0.0036363 0.00220212 0.00180485 0.00224265 0.00183191 0.00138545 0.00146217 0.00115246 0.0248349 0.00129723 7.50395e-4 0.00496762 8.97532e-4 1.44378e-4 0.00164497 0.00403659 0.00332443 0.00587547 0.00266882 0.00223293 0.00382922 9.91266e-4 9.99673e-4 0.00418163 3.27773e-5 6.31044e-4 0.00271013 0.00248917 0.00292348 0.00278226 0.00359742 7.08751e-4 0.00239287 0.00749351 0.00486778 0.00145908 0.00167453 0.00112251 2.2458e-4 2.32856e-4 4.40752e-5 0.00467815 1.22701e-4 0.00470173 0.00298378 7.73451e-4 2.634e-4 0.0515694 0.00918972 0.0257636 0.0226939 0.09244 0.0167193 0.0108988 0.0138365 0.042864 9.52379e-4 0.00366494 0.0402202 0.0159142 0.0440905 0.0418992 0.0154463 5.66869e-4 0.043972 0.0443068 0.0543899 0.0180997 0.00593537 0.00725816 0.00494884 0.00808567 0.00128285 7.45009e-4 0.00281083 7.45206e-4 1.08907e-4 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6.56859e-8 3.28429e-7 0.0 0.0 1.97058e-7 0.0 0.0 0.0 0.0 3.94115e-7 6.56859e-8 0.0 2.62743e-7 1.31372e-7 0.0 1.31372e-7 1.31372e-7 0.0 0.0 1.97058e-7 1.31372e-7 6.56859e-8 1.31372e-7 0.0 0.0 7.8823e-7 0.0 0.0 1.31372e-7 1.31372e-7 4.59801e-7 7.8823e-7 0.0 9.85288e-7 5.25487e-7 1.31372e-7 6.56859e-8 1.05097e-6 0.0 2.62743e-7 0.0 1.97058e-7 4.59801e-7 1.97058e-7 5.25487e-7 2.62743e-7 0.0 1.51078e-6 5.91173e-7 1.11666e-6 0.0 1.97058e-7 8.53916e-7 1.57646e-6 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6.56859e-8 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 5.25487e-7 0.0 0.0 0.0 0.0 0.0 0.0 7.8823e-7 0.0 2.62743e-7 0.0 0.0 3.28429e-7 1.31372e-7 0.0 2.62743e-7 0.0 3.28429e-7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 2.62743e-7 0.0 5.25487e-7 0.0 0.0 1.31372e-7 0.0 0.0 0.0 0.0)
]

{ #category : #'generated-initialization' }
StScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(20 'false' 12) #(20 'nil' 14) #(20 'true' 11) #(26 '||' 15))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #'generated-comments' }
StScanner class >> scannerDefinitionComment [

	"<name>	:	(<isLetter> | \_) (<isLetter> | [\d\_]) *;
<number>:	\d	;
<negativeNumber>	:	\- <number>	;
<string>	:	\'  [^\']* \' (\' [^\']* \')*	;
<keyword>	:	<name> \:	;
<multikeyword>	:	<name> \: (<name> \: )+	;
<binarySymbol>	:	[\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,] [\~\!\@\%\&\*\+\=\\\|\?\/\>\<\,]?	;
<whitespace>	:	<isSeparator>+	;
<comment>	:	\"" [^\""]* \""	;
<dottedName>	:	<name> (\. <name>)+	;
<character>	:	\$ .	;
<variableAssignment> : <name> \: \=	;

<anyChar> : . ; # For VW literal arrays that handle #(;) -> #(#';')"
]

{ #category : #'generated-tokens' }
StScanner >> binarySymbolId [
	^26
]

{ #category : #'generated-tokens' }
StScanner >> emptySymbolTokenId [
	^64
]

{ #category : #'generated-tokens' }
StScanner >> errorTokenId [
	^65
]

{ #category : #'generated-tokens' }
StScanner >> nameId [
	^20
]

{ #category : #scanning }
StScanner >> negativeNumber [
	stream skip: -2.
	^self scanNumber: self negativeNumberId
]

{ #category : #'generated-tokens' }
StScanner >> negativeNumberId [
	^22
]

{ #category : #scanning }
StScanner >> number [
	stream skip: -1.
	^self scanNumber: self numberId
]

{ #category : #'generated-tokens' }
StScanner >> numberId [
	^21
]

{ #category : #'generated-scanner' }
StScanner >> scan1 [
	[ 
	self step.
	currentCharacter ~= $' ] whileTrue.
	currentCharacter = $'
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
StScanner >> scan2 [
	self recordMatch: #(23).
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
StScanner >> scan3 [
	self recordMatch: #(24).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ 
			currentCharacter = $_
				or: [ 
					(currentCharacter between: $a and: $z)
						or: [ 
							currentCharacter = $ª
								or: [ 
									currentCharacter = $µ
										or: [ 
											currentCharacter = $º
												or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #variableAssignment ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
StScanner >> scan4 [
	[ 
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $z)
								or: [ 
									currentCharacter = $ª
										or: [ 
											currentCharacter = $µ
												or: [ 
													currentCharacter = $º
														or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ] ]
		whileTrue.
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			((currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $z)
								or: [ 
									currentCharacter = $ª
										or: [ 
											currentCharacter = $µ
												or: [ 
													currentCharacter = $º
														or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
StScanner >> scan5 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ 
			currentCharacter = $_
				or: [ 
					(currentCharacter between: $a and: $z)
						or: [ 
							currentCharacter = $ª
								or: [ 
									currentCharacter = $µ
										or: [ 
											currentCharacter = $º
												or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(29).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $z)
										or: [ 
											currentCharacter = $ª
												or: [ 
													currentCharacter = $µ
														or: [ 
															currentCharacter = $º
																or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ] ]
				whileTrue.
			currentCharacter = $.
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #'generated-scanner' }
StScanner >> scanForToken [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ 
			currentCharacter = $_
				or: [ 
					(currentCharacter between: $a and: $z)
						or: [ 
							currentCharacter = $ª
								or: [ 
									currentCharacter = $µ
										or: [ 
											currentCharacter = $º
												or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
		ifTrue: [ 
			self recordMatch: #(20 32).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $z)
										or: [ 
											currentCharacter = $ª
												or: [ 
													currentCharacter = $µ
														or: [ 
															currentCharacter = $º
																or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(20).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ 
									currentCharacter = $_
										or: [ 
											(currentCharacter between: $a and: $z)
												or: [ 
													currentCharacter = $ª
														or: [ 
															currentCharacter = $µ
																or: [ 
																	currentCharacter = $º
																		or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ] ]
						whileTrue.
					currentCharacter = $:
						ifTrue: [ ^ self scan3 ].
					currentCharacter = $.
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $:
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $.
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf)
		or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ])
		ifTrue: [ 
			self recordMatch: #whitespace.
			self step.
			((currentCharacter between: Character tab and: Character lf)
				or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #whitespace.
					self step.
					(currentCharacter between: Character tab and: Character lf)
						or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self recordAndReportMatch: #number ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(18 32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	(currentCharacter = $!
		or: [ 
			(currentCharacter between: $% and: $&)
				or: [ 
					(currentCharacter between: $* and: $,)
						or: [ 
							currentCharacter = $/
								or: [ 
									currentCharacter = $=
										or: [ (currentCharacter between: $? and: $@) or: [ currentCharacter = $\ or: [ currentCharacter = $~ ] ] ] ] ] ] ])
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(19 32) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(17 32) ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter ~= $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter ~= $" ] whileTrue.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #comment ].
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter ~= $'
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $^
		ifTrue: [ ^ self recordAndReportMatch: #(16 32) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(9 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self recordAndReportMatch: #negativeNumber ].
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(7 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(6 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3 32) ].
	(currentCharacter <= Character backspace
		or: [ 
			currentCharacter = Character pageUp
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							currentCharacter = $`
								or: [ 
									(currentCharacter between: $ and: $©)
										or: [ 
											(currentCharacter between: $« and: $´)
												or: [ 
													(currentCharacter between: $¶ and: $¹)
														or: [ (currentCharacter between: $» and: $¿) or: [ currentCharacter = $× or: [ currentCharacter = $÷ ] ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $$
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter <= $ÿ
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	^ self reportLastMatch
]

{ #category : #scanning }
StScanner >> scanNumber: id [ 
	| number |
	number := Number readFrom: stream.
	outputStream reset.
	matchActions := Array with: id.
	^self createTokenFor: number
]

{ #category : #scanning }
StScanner >> variableAssignment [
	| token |
	outputStream skip: -2.
	stream skip: -2.
	matchActions := Array with: self nameId.
	token := self createTokenFor: outputStream contents.
	outputStream reset.
	^token
]
