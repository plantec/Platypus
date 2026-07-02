"
SmaCCGrammarParser is a parser for grammars.

Instance Variables:
	grammar	<SmaCCGrammar>	the grammar we are producing

"
Class {
	#name : #SmaCCGrammarParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'grammar'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'generated-comments' }
SmaCCGrammarParser class >> parserDefinitionComment [

	"File:	Parser {grammar addEmptySymbol; yourself};

Parser:	Rule
	| Parser Rule ;

Rule : ProductionRule {grammar setStartSymbolIfNone: '1'. nil}
	| LeftLine 
	| RightLine 
	| NonAssociativeLine
	| IdMethodLine
	| StartLine ;

LeftLine:	""%left"" TokenList 'tokens' "";"" { tokens do: [:each | grammar leftPrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
RightLine:	""%right"" TokenList 'tokens' "";"" { tokens do: [:each | grammar rightPrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
NonAssociativeLine: ""%nonassoc"" TokenList 'tokens' "";"" { tokens do: [:each | grammar nonAssociativePrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
IdMethodLine: ""%id"" IdTokens 'tokens' "";"" {tokens do: [:each | grammar makeTokenIdMethodFor: each]. nil};
StartLine: ""%start"" StartingTokens "";"";

IdTokens: <tokenname> {OrderedCollection with: '1' value}
	| IdTokens <tokenname> {'1' add: '2' value; yourself};
TokenList:	Term
	| TokenList Term	;
StartingTokens: <symbolname> 'symbol' {grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)}
	| StartingTokens <symbolname> 'symbol' {grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)};

ProductionRule: <symbolname> <production> ParserRules "";"" {| symbol | symbol := grammar nonTerminalSymbolNamed: '1' value. '3' do: [:each | symbol addProduction: each]. symbol};

ParserRules:	ParserRules ""|"" ParserRule {'1' add: '3'; yourself}
	| ParserRule	 ;

ParserRule : Terms 'rhs' {rhs}
	| Terms 'rhs' <code> 'code' {self verifyCodeToken: code for: rhs} ;

Terms :	{SmaCCRHS new}
	| Terms 'rhs' Term 'term'	{rhs add: term; yourself}	
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken'	{rhs add: term; nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	
	| Terms 'rhs' Term 'term' ""?"" {rhs add: (grammar makeOptionalSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""?"" <variablename> 'variableNameToken' {rhs add: (grammar makeOptionalSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	
	| Terms 'rhs' Term 'term' ""*"" {rhs add: (grammar makeRepeatSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""*"" <variablename> 'variableNameToken' {rhs add: (grammar makeRepeatSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}		
	| Terms 'rhs' Term 'term' ""+"" {rhs add: (grammar makeRepeatMultipleSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""+"" <variablename> 'variableNameToken' {rhs add: (grammar makeRepeatMultipleSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	;

Term:	<keyword> {grammar keywordTerminalNamed: '1' value}
	| <tokenname> {grammar terminalSymbolNamed: '1' value ifAbsent: [currentToken := '1'. self reportErrorMessage: 'Token not specified']}
	| <symbolname> {grammar nonTerminalSymbolNamed: '1' value}
	| ""error"" {SmaCCSymbol error}
	| ""("" SimpleTerms "")"" {grammar makeGroupFor: '2'}
	| ""<%"" SimpleTerms ""%>"" {grammar makeRepeatSymbolFor: (grammar makeGroupFor: '2')}
	| ""["" SimpleTerms ""]"" {grammar makeOptionalSymbolFor: (grammar makeGroupFor: '2')};

SimpleTerms :
	SimpleTerm {OrderedCollection with: '1'}
	| SimpleTerms 'terms' ""|"" SimpleTerm 'term' {terms add: term; yourself};

SimpleTerm :
	{ SmaCCRHS new }
	| SimpleTerm 'rhs' Term 'term' {rhs add: term; yourself} 
	| SimpleTerm 'rhs' Term 'term' ""?"" {rhs add: (grammar makeOptionalSymbolFor: term); yourself}
	| SimpleTerm 'rhs' Term 'term' ""*"" {rhs add: (grammar makeRepeatSymbolFor: term); yourself}
	| SimpleTerm 'rhs' Term 'term' ""+"" {rhs add: (grammar makeRepeatMultipleSymbolFor: term); yourself}	;"
]

{ #category : #'generated-accessing' }
SmaCCGrammarParser class >> scannerClass [
	^SmaCCGrammarScanner
]

{ #category : #'generated-starting states' }
SmaCCGrammarParser class >> startingStateForFile [
	^1
]

{ #category : #accessing }
SmaCCGrammarParser >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #'initialize-release' }
SmaCCGrammarParser >> initialize [
	super initialize.
	grammar := SmaCCGrammar new
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForFile1: nodes [
	^ grammar
		addEmptySymbol;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForIdMethodLine1: nodes [
	(nodes at: 2) do: [ :each | grammar makeTokenIdMethodFor: each ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForIdTokens1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForIdTokens2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2) value;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForLeftLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				leftPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForNonAssociativeLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				nonAssociativePrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForParserRule1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForParserRule2: nodes [
	^ self verifyCodeToken: (nodes at: 2) for: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForParserRules1: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForProductionRule1: nodes [
	| symbol |
	symbol := grammar nonTerminalSymbolNamed: (nodes at: 1) value.
	(nodes at: 3) do: [ :each | symbol addProduction: each ].
	^ symbol
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForRightLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				rightPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForRule1: nodes [
	grammar setStartSymbolIfNone: (nodes at: 1).
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerm1: nodes [
	^ SmaCCRHS new
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerm2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerm3: nodes [
	^ (nodes at: 1)
		add: (grammar makeOptionalSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerm4: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerm5: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerms1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForSimpleTerms2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForStartingTokens1: nodes [
	^ grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: (nodes at: 1) value)
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForStartingTokens2: nodes [
	^ grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: (nodes at: 2) value)
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm1: nodes [
	^ grammar keywordTerminalNamed: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm2: nodes [
	^ grammar
		terminalSymbolNamed: (nodes at: 1) value
		ifAbsent: [ 
			currentToken := nodes at: 1.
			self reportErrorMessage: 'Token not specified' ]
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm3: nodes [
	^ grammar nonTerminalSymbolNamed: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm4: nodes [
	^ SmaCCSymbol error
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm5: nodes [
	^ grammar makeGroupFor: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm6: nodes [
	^ grammar makeRepeatSymbolFor: (grammar makeGroupFor: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerm7: nodes [
	^ grammar makeOptionalSymbolFor: (grammar makeGroupFor: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms1: nodes [
	^ SmaCCRHS new
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms3: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		nameLastItem: ((nodes at: 3) value copyFrom: 2 to: (nodes at: 3) value size - 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms4: nodes [
	^ (nodes at: 1)
		add: (grammar makeOptionalSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms5: nodes [
	^ (nodes at: 1)
		add: (grammar makeOptionalSymbolFor: (nodes at: 2));
		nameLastItem: ((nodes at: 4) value copyFrom: 2 to: (nodes at: 4) value size - 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms6: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms7: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatSymbolFor: (nodes at: 2));
		nameLastItem: ((nodes at: 4) value copyFrom: 2 to: (nodes at: 4) value size - 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms8: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCGrammarParser >> reduceActionForTerms9: nodes [
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		nameLastItem: ((nodes at: 4) value copyFrom: 2 to: (nodes at: 4) value size - 1);
		yourself
]

{ #category : #'generated-tables' }
SmaCCGrammarParser >> reduceTable [
	^#(
#(26 3 #reduceActionForIdMethodLine1:)
#(27 3 #reduceFor:)
#(28 1 #reduceFor:)
#(28 2 #reduceFor:)
#(29 1 #reduceActionForIdTokens1:)
#(29 2 #reduceActionForIdTokens2:)
#(30 1 #reduceActionForStartingTokens1:)
#(30 2 #reduceActionForStartingTokens2:)
#(31 3 #reduceActionForNonAssociativeLine1:)
#(32 1 #reduceActionForTerm1:)
#(32 1 #reduceActionForTerm2:)
#(32 1 #reduceActionForTerm3:)
#(32 1 #reduceActionForTerm4:)
#(32 3 #reduceActionForTerm5:)
#(32 3 #reduceActionForTerm6:)
#(32 3 #reduceActionForTerm7:)
#(33 1 #reduceFor:)
#(34 4 #reduceActionForProductionRule1:)
#(35 3 #reduceActionForParserRules1:)
#(35 1 #reduceFor:)
#(36 1 #reduceActionForParserRule1:)
#(36 2 #reduceActionForParserRule2:)
#(37 0 #reduceActionForTerms1:)
#(37 2 #reduceActionForTerms2:)
#(37 3 #reduceActionForTerms3:)
#(37 3 #reduceActionForTerms4:)
#(37 4 #reduceActionForTerms5:)
#(37 3 #reduceActionForTerms6:)
#(37 4 #reduceActionForTerms7:)
#(37 3 #reduceActionForTerms8:)
#(37 4 #reduceActionForTerms9:)
#(38 3 #reduceActionForRightLine1:)
#(39 1 #reduceActionForRule1:)
#(39 1 #reduceFor:)
#(39 1 #reduceFor:)
#(39 1 #reduceFor:)
#(39 1 #reduceFor:)
#(39 1 #reduceFor:)
#(40 1 #reduceActionForFile1:)
#(41 1 #reduceActionForSimpleTerms1:)
#(41 3 #reduceActionForSimpleTerms2:)
#(42 0 #reduceActionForSimpleTerm1:)
#(42 2 #reduceActionForSimpleTerm2:)
#(42 3 #reduceActionForSimpleTerm3:)
#(42 3 #reduceActionForSimpleTerm4:)
#(42 3 #reduceActionForSimpleTerm5:)
#(45 1 #reduceFor:)
#(45 2 #reduceFor:)
#(46 3 #reduceActionForLeftLine1:)
)
]

{ #category : #'generated-tables' }
SmaCCGrammarParser >> transitionTable [
	^#(
#[1 0 9 0 1 0 13 0 3 0 17 0 4 0 21 0 6 0 25 0 8 0 29 0 20 0 33 0 26 0 37 0 27 0 41 0 31 0 45 0 34 0 49 0 38 0 53 0 39 0 57 0 40 0 61 0 45 0 65 0 46]
#[1 0 69 0 20 0 73 0 30]
#[1 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 105 0 28 0 109 0 32]
#[1 0 113 0 19 0 117 0 29]
#[1 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 121 0 28 0 109 0 32]
#[1 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 125 0 28 0 109 0 32]
#[0 0 129 0 25]
#[0 0 150 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 154 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 146 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 134 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 142 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 190 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 0 0 43]
#[1 0 9 0 1 0 13 0 3 0 17 0 4 0 21 0 6 0 25 0 8 0 29 0 20 0 33 0 26 0 37 0 27 0 41 0 31 0 45 0 34 0 49 0 38 0 133 0 39 0 158 0 43 0 65 0 46]
#[0 0 138 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 30 0 7 0 20]
#[1 0 137 0 7 0 141 0 20]
#[1 0 170 0 2 0 170 0 9 0 170 0 11 0 170 0 13 0 170 0 15 0 170 0 17 0 170 0 19 0 170 0 20 0 170 0 21 0 145 0 41 0 149 0 42]
#[1 0 170 0 9 0 170 0 11 0 170 0 12 0 170 0 13 0 170 0 15 0 170 0 17 0 170 0 19 0 170 0 20 0 170 0 21 0 153 0 41 0 149 0 42]
#[0 0 54 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[1 0 170 0 9 0 170 0 11 0 170 0 13 0 170 0 14 0 170 0 15 0 170 0 17 0 170 0 19 0 170 0 20 0 170 0 21 0 157 0 41 0 149 0 42]
#[0 0 46 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[0 0 50 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[0 0 42 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[1 0 161 0 7 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 165 0 32]
#[0 0 14 0 7 0 11 0 13 0 15 0 17 0 19 0 20 0 21]
#[0 0 22 0 7 0 19]
#[1 0 169 0 7 0 173 0 19]
#[1 0 177 0 7 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 165 0 32]
#[1 0 181 0 7 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 165 0 32]
#[1 0 94 0 7 0 94 0 9 0 94 0 11 0 94 0 13 0 94 0 15 0 94 0 17 0 94 0 19 0 94 0 20 0 94 0 21 0 94 0 23 0 185 0 35 0 189 0 36 0 193 0 37]
#[0 0 194 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 10 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 34 0 7 0 20]
#[1 0 197 0 2 0 201 0 9]
#[1 0 162 0 2 0 162 0 9 0 77 0 11 0 162 0 12 0 81 0 13 0 162 0 14 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 205 0 32]
#[1 0 201 0 9 0 209 0 12]
#[1 0 201 0 9 0 213 0 14]
#[0 0 38 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 18 0 7 0 11 0 13 0 15 0 17 0 19 0 20 0 21]
#[0 0 6 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 26 0 7 0 19]
#[0 0 198 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[0 0 130 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[1 0 217 0 7 0 221 0 9]
#[0 0 82 0 7 0 9]
#[1 0 86 0 7 0 86 0 9 0 77 0 11 0 81 0 13 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 225 0 23 0 229 0 32]
#[0 0 66 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[1 0 170 0 2 0 170 0 9 0 170 0 11 0 170 0 12 0 170 0 13 0 170 0 14 0 170 0 15 0 170 0 17 0 170 0 19 0 170 0 20 0 170 0 21 0 233 0 42]
#[1 0 174 0 2 0 237 0 5 0 174 0 9 0 241 0 10 0 174 0 11 0 174 0 12 0 174 0 13 0 174 0 14 0 174 0 15 0 245 0 16 0 174 0 17 0 174 0 19 0 174 0 20 0 174 0 21]
#[0 0 62 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[0 0 58 0 2 0 5 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 23 0 24]
#[0 0 74 0 1 0 3 0 4 0 6 0 8 0 20 0 43]
#[1 0 94 0 7 0 94 0 9 0 94 0 11 0 94 0 13 0 94 0 15 0 94 0 17 0 94 0 19 0 94 0 20 0 94 0 21 0 94 0 23 0 249 0 36 0 193 0 37]
#[0 0 90 0 7 0 9]
#[1 0 253 0 5 0 98 0 7 0 98 0 9 1 1 0 10 0 98 0 11 0 98 0 13 0 98 0 15 1 5 0 16 0 98 0 17 0 98 0 19 0 98 0 20 0 98 0 21 0 98 0 23 1 9 0 24]
#[1 0 166 0 2 0 166 0 9 0 77 0 11 0 166 0 12 0 81 0 13 0 166 0 14 0 85 0 15 0 89 0 17 0 93 0 19 0 97 0 20 0 101 0 21 0 205 0 32]
#[0 0 178 0 2 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21]
#[0 0 182 0 2 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21]
#[0 0 186 0 2 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21]
#[0 0 78 0 7 0 9]
#[1 0 106 0 7 0 106 0 9 0 106 0 11 0 106 0 13 0 106 0 15 0 106 0 17 0 106 0 19 0 106 0 20 0 106 0 21 0 106 0 23 1 13 0 24]
#[1 0 114 0 7 0 114 0 9 0 114 0 11 0 114 0 13 0 114 0 15 0 114 0 17 0 114 0 19 0 114 0 20 0 114 0 21 0 114 0 23 1 17 0 24]
#[1 0 122 0 7 0 122 0 9 0 122 0 11 0 122 0 13 0 122 0 15 0 122 0 17 0 122 0 19 0 122 0 20 0 122 0 21 0 122 0 23 1 21 0 24]
#[0 0 102 0 7 0 9 0 11 0 13 0 15 0 17 0 19 0 20 0 21 0 23]
#[0 0 110 0 7 0 9 0 11 0 13 0 15 0 17 0 19 0 20 0 21 0 23]
#[0 0 118 0 7 0 9 0 11 0 13 0 15 0 17 0 19 0 20 0 21 0 23]
#[0 0 126 0 7 0 9 0 11 0 13 0 15 0 17 0 19 0 20 0 21 0 23]
)
]

{ #category : #private }
SmaCCGrammarParser >> verifyCodeToken: codeToken for: aSmaCCRHS [ 
	| code |
	code := codeToken value copyFrom: 2 to: codeToken value size - 1.
	RBParser parseExpression: code
		onError: 
			[:string :position | 
			currentToken := nil.
			scanner position: codeToken startPosition + position.
			self reportErrorMessage: string].
	aSmaCCRHS reduceAction: code.
	^aSmaCCRHS
]
