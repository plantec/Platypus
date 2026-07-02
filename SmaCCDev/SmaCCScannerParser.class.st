"
SmaCCScannerParser is the parser for the scanner definition.

Instance Variables:
	tokens	<Dictionary key: String value: SmaCCRegularExpressionNode>	the tokens that are parsed


"
Class {
	#name : #SmaCCScannerParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'scannerDefinition'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'generated-comments' }
SmaCCScannerParser class >> parserDefinitionComment [

	"%left	""|"";
%left ""("" <character> <backslashcharacter> <characterblock> <anycharacter> <tokenname> <symbol>;
%left ""*"" ""+"" ""?"" <repeat> ;

File: Rules	 {scannerDefinition} 
	|  {scannerDefinition};

Rules: Rule "";""
	| Rules Rule "";"" ;

Rule: RegexRule {'1' states isEmpty ifTrue: ['1' addStates: scannerDefinition nonExcludeStates]}
	| ExcludeStatesLine 
	| StatesLine ;

RegexRule : <tokenname> "":"" Regex {'3' position: '1' startPosition. scannerDefinition addToken: '3' withName: '1' value. '3'}
	| Symbol RegexRule {'2' addState: '1'; yourself};

StatesLine : ""%states"" States ;
States :
	| States Symbol {scannerDefinition addState: '2'};

ExcludeStatesLine : ""%excludes"" ExcludeStates ;
ExcludeStates : 
	| ExcludeStates Symbol {scannerDefinition addExcludeState: '2'};

Symbol : <symbol> {'1' value asSymbol};

Regex: RegexTerm {'1'}
	| Regex ""|"" Regex {'1' | '3'}
	| Regex RegexTerm {'1' , '2'};

RegexTerm:	<character> {SmaCCCharacterRENode characters: '1' value}
	| <anycharacter> {SmaCCCharacterRENode characters: self allCharacters}
	| <backslashcharacter> {self nodeFor: (ReadStream on: ('1' value copyFrom: 2 to: '1' value size))} 
	| ""("" Regex "")"" {'2'}
	| <characterblock> {SmaCCCharacterRENode characters: (self parseCharacterBlock: '1')}
	| <tokenname> {(scannerDefinition tokenNamed: '1' value ifAbsentPut: [self generateImplicitToken: '1']) copy}
	| <symbol> {SmaCCSequenceRENode nodes: ('1' value asOrderedCollection collect: [:each | SmaCCCharacterRENode characters: (String with: each)])}
	| RegexTerm ""*""	{'1' repeat}
	| RegexTerm ""+"" {'1' repeatForAtLeast: 1}
	| RegexTerm ""?"" {'1' repeatFor: 0 to: 1}
	| RegexTerm <repeat> {| readStream start stop | 
					readStream := ReadStream on: ('2' value copyFrom: 2 to: '2' value size - 1). 
					start := readStream upTo: $,. 
					stop := readStream upToEnd.
					'1' repeatFor: (start isEmpty ifTrue: [0] ifFalse: [start asNumber]) to: (stop isEmpty ifTrue: [(1 bitShift: 31)] ifFalse: [stop asNumber])} ;"
]

{ #category : #'generated-accessing' }
SmaCCScannerParser class >> scannerClass [
	^SmaCCScannerScanner
]

{ #category : #'generated-starting states' }
SmaCCScannerParser class >> startingStateForFile [
	^1
]

{ #category : #private }
SmaCCScannerParser >> allCharacters [
	^SmaCCGrammar allCharacters
]

{ #category : #private }
SmaCCScannerParser >> charactersFor: aStream in: aToken [ 
	| characters char endCharacters |
	aStream atEnd ifTrue: [self reportCharacterBlockErrorForToken: aToken].
	char := aStream next.
	characters := char == $\ 
				ifTrue: [(self nodeFor: aStream) characters]
				ifFalse: [OrderedCollection with: char].
	(characters size = 1 and: [aStream peekFor: $-]) ifFalse: [^characters].
	endCharacters := self charactersFor: aStream in: aToken.
	endCharacters size > 1 
		ifTrue: [self reportCharacterBlockErrorForToken: aToken].
	^(characters first asInteger to: endCharacters first asInteger) 
		collect: [:each | Character value: each]
]

{ #category : #private }
SmaCCScannerParser >> generateImplicitToken: aSmaCCToken [ 
	| node |
	node := SmaCCGrammar implicitToken: aSmaCCToken value.
	node isNil 
		ifTrue: 
			[currentToken := aSmaCCToken.
			self reportErrorMessage: 'Token not specified'].
	^node
]

{ #category : #'initialize-release' }
SmaCCScannerParser >> initialize [
	super initialize.
	scannerDefinition := SmaCCScannerDefinition new
]

{ #category : #private }
SmaCCScannerParser >> nodeFor: aStream [ 
	| block char value count |
	char := aStream next.
	char == $f 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 12))].
	char == $n 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 10))].
	char == $r 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 13))].
	char == $t ifTrue: [^SmaCCCharacterRENode characters: '	'].
	char == $v 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 11))].
	char == $c 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String 
						with: (Character value: aStream next asInteger - $A asInteger))].
	char == $x 
		ifTrue: 
			[count := value := 0.
			
			[aStream atEnd not and: 
					[count < 4 and: 
							[char := aStream peek.
							(char between: $0 and: $9) 
								or: [(char between: $A and: $F) or: [char between: $a and: $f]]]]] 
					whileTrue: 
						[count := count + 1.
						value := value * 16 + aStream next digitValue].
			^SmaCCCharacterRENode characters: (String with: (Character value: value))].
	char == $d ifTrue: [block := [:each | each between: $0 and: $9]].
	char == $D ifTrue: [block := [:each | (each between: $0 and: $9) not]].
	char == $s 
		ifTrue: [block := [:each | #(9 10 11 12 13 32) includes: each asInteger]].
	char == $S 
		ifTrue: 
			[block := [:each | (#(9 10 11 12 13 32) includes: each asInteger) not]].
	char == $w 
		ifTrue: 
			[block := 
					[:each | 
					(each between: $a and: $z) or: 
							[(each between: $A and: $Z) 
								or: [(each between: $0 and: $9) or: [each == $_]]]]].
	char == $W 
		ifTrue: 
			[block := 
					[:each | 
					((each between: $a and: $z) or: 
							[(each between: $A and: $Z) 
								or: [(each between: $0 and: $9) or: [each == $_]]]) 
						not]].
	block isNil 
		ifTrue: [^SmaCCCharacterRENode characters: (String with: char)].
	^SmaCCCharacterRENode 
		characters: (String withAll: (self allCharacters select: block))
]

{ #category : #private }
SmaCCScannerParser >> parseCharacterBlock: aToken [ 
	| characters aStream invert |
	aStream := ReadStream 
				on: (aToken value copyFrom: 2 to: aToken value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[aStream atEnd] 
		whileFalse: [characters addAll: (self charactersFor: aStream in: aToken)].
	^String withAll: (invert 
				ifTrue: [self allCharacters reject: [:each | characters includes: each]]
				ifFalse: [characters])
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForExcludeStates2: nodes [
	^ scannerDefinition addExcludeState: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForFile1: nodes [
	^ scannerDefinition
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForFile2: nodes [
	^ scannerDefinition
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegex1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegex2: nodes [
	^ (nodes at: 1) | (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegex3: nodes [
	^ (nodes at: 1) , (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexRule1: nodes [
	(nodes at: 3) position: (nodes at: 1) startPosition.
	scannerDefinition addToken: (nodes at: 3) withName: (nodes at: 1) value.
	^ nodes at: 3
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexRule2: nodes [
	^ (nodes at: 2)
		addState: (nodes at: 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm10: nodes [
	^ (nodes at: 1) repeatFor: 0 to: 1
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm11: nodes [
	| readStream start stop |
	readStream := ReadStream on: ((nodes at: 2) value copyFrom: 2 to: (nodes at: 2) value size - 1).
	start := readStream upTo: $,.
	stop := readStream upToEnd.
	^ (nodes at: 1)
		repeatFor:
			(start isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ start asNumber ])
		to:
			(stop isEmpty
				ifTrue: [ 1 bitShift: 31 ]
				ifFalse: [ stop asNumber ])
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm1: nodes [
	^ SmaCCCharacterRENode characters: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm2: nodes [
	^ SmaCCCharacterRENode characters: self allCharacters
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm3: nodes [
	^ self nodeFor: (ReadStream on: ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size))
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm4: nodes [
	^ nodes at: 2
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm5: nodes [
	^ SmaCCCharacterRENode characters: (self parseCharacterBlock: (nodes at: 1))
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm6: nodes [
	^ (scannerDefinition tokenNamed: (nodes at: 1) value ifAbsentPut: [ self generateImplicitToken: (nodes at: 1) ]) copy
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm7: nodes [
	^ SmaCCSequenceRENode
		nodes:
			((nodes at: 1) value asOrderedCollection collect: [ :each | SmaCCCharacterRENode characters: (String with: each) ])
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm8: nodes [
	^ (nodes at: 1) repeat
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRegexTerm9: nodes [
	^ (nodes at: 1) repeatForAtLeast: 1
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForRule1: nodes [
	^ (nodes at: 1) states isEmpty
		ifTrue: [ (nodes at: 1) addStates: scannerDefinition nonExcludeStates ]
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForStates2: nodes [
	^ scannerDefinition addState: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCScannerParser >> reduceActionForSymbol1: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-tables' }
SmaCCScannerParser >> reduceTable [
	^#(
#(20 1 #reduceFor:)
#(21 1 #reduceActionForFile1:)
#(21 0 #reduceActionForFile2:)
#(22 3 #reduceActionForRegexRule1:)
#(22 2 #reduceActionForRegexRule2:)
#(23 2 #reduceFor:)
#(24 1 #reduceActionForRule1:)
#(24 1 #reduceFor:)
#(24 1 #reduceFor:)
#(25 1 #reduceActionForRegex1:)
#(25 3 #reduceActionForRegex2:)
#(25 2 #reduceActionForRegex3:)
#(26 1 #reduceActionForSymbol1:)
#(27 0 #reduceFor:)
#(27 2 #reduceActionForStates2:)
#(28 0 #reduceFor:)
#(28 2 #reduceActionForExcludeStates2:)
#(29 1 #reduceActionForRegexTerm1:)
#(29 1 #reduceActionForRegexTerm2:)
#(29 1 #reduceActionForRegexTerm3:)
#(29 3 #reduceActionForRegexTerm4:)
#(29 1 #reduceActionForRegexTerm5:)
#(29 1 #reduceActionForRegexTerm6:)
#(29 1 #reduceActionForRegexTerm7:)
#(29 2 #reduceActionForRegexTerm8:)
#(29 2 #reduceActionForRegexTerm9:)
#(29 2 #reduceActionForRegexTerm10:)
#(29 2 #reduceActionForRegexTerm11:)
#(32 2 #reduceFor:)
#(32 3 #reduceFor:)
#(33 2 #reduceFor:)
)
]

{ #category : #private }
SmaCCScannerParser >> reportCharacterBlockErrorForToken: aToken [ 
	currentToken := aToken.
	self reportErrorMessage: 'Invalid character block'
]

{ #category : #'generated-tables' }
SmaCCScannerParser >> transitionTable [
	^#(
#[1 0 9 0 7 0 13 0 8 0 17 0 14 0 21 0 17 0 25 0 21 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 26 0 14 0 30 0 45 0 32 0 49 0 33]
#[1 0 66 0 9 0 66 0 17 0 53 0 28]
#[1 0 58 0 9 0 58 0 17 0 57 0 27]
#[0 0 61 0 10]
#[0 0 54 0 9 0 14 0 17]
#[0 0 0 0 30]
#[0 0 30 0 9]
#[0 0 34 0 9]
#[0 0 65 0 9]
#[1 0 17 0 14 0 21 0 17 0 69 0 22 0 41 0 26]
#[1 0 9 0 7 0 13 0 8 0 17 0 14 0 21 0 17 0 29 0 22 0 33 0 23 0 73 0 24 0 41 0 26 0 10 0 30 0 49 0 33]
#[0 0 38 0 9]
#[1 0 26 0 9 0 21 0 17 0 77 0 26]
#[1 0 126 0 9 0 21 0 17 0 81 0 26]
#[1 0 85 0 2 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 113 0 25 0 117 0 29]
#[0 0 118 0 7 0 8 0 14 0 17 0 30]
#[0 0 22 0 9]
#[0 0 121 0 9]
#[0 0 70 0 9 0 17]
#[0 0 62 0 9 0 17]
#[1 0 85 0 2 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 125 0 25 0 117 0 29]
#[0 0 82 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 90 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 94 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 98 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 74 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[1 0 85 0 2 0 129 0 5 0 18 0 9 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 133 0 29]
#[1 0 42 0 1 0 42 0 2 0 137 0 3 0 141 0 4 0 42 0 5 0 145 0 6 0 42 0 9 0 42 0 11 0 42 0 12 0 42 0 14 0 149 0 16 0 42 0 17 0 42 0 18 0 42 0 19]
#[0 0 122 0 7 0 8 0 14 0 17 0 30]
#[1 0 153 0 1 0 85 0 2 0 129 0 5 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 133 0 29]
#[1 0 85 0 2 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 157 0 25 0 117 0 29]
#[1 0 50 0 1 0 50 0 2 0 137 0 3 0 141 0 4 0 50 0 5 0 145 0 6 0 50 0 9 0 50 0 11 0 50 0 12 0 50 0 14 0 149 0 16 0 50 0 17 0 50 0 18 0 50 0 19]
#[0 0 106 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 102 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 110 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 9 0 11 0 12 0 14 0 16 0 17 0 18 0 19]
#[1 0 46 0 1 0 85 0 2 0 46 0 5 0 46 0 9 0 89 0 11 0 93 0 12 0 97 0 14 0 101 0 17 0 105 0 18 0 109 0 19 0 133 0 29]
)
]
