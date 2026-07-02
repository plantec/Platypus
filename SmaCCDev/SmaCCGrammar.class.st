"
SmaCCGrammar represents a LR(1) or a LALR(1) grammar.

Instance Variables:
	otherStartingSymbols	<Collection of: SmaCCSymbol>	other starting productions. The first production in the grammar is the defaulting starting position, but this can list other starting positions.
	shiftReduceTable	<Dictionary key: SmaCCSymbol value: SmaCCAction class>	when we have a shift/reduce conflict how should we handle it. This table contains the left/right associative rules. Left is a reduce action and right is a shift action.
	symbols	<OrderedCollection of: SmaCCSymbol>	all symbols in our grammar -- includes both terminal and non-terminal
	tokens	<Dictionary key: String value: SmaCCRegularExpressionNode>	the tokens for our scanner
	type	<Symbol>	the type of grammar (LALR1 or LR1)


"
Class {
	#name : #SmaCCGrammar,
	#superclass : #Object,
	#instVars : [
		'type',
		'shiftReduceTable',
		'symbols',
		'scannerDefinition',
		'otherStartingSymbols'
	],
	#classVars : [
		'IgnoreCase',
		'MaximumCharacterValue'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #accessing }
SmaCCGrammar class >> allCharacters [
	^String withAll: ((0 to: self maximumCharacterValue) 
				collect: [:each | Character value: each])
]

{ #category : #accessing }
SmaCCGrammar class >> ignoreCase [
	^IgnoreCase
]

{ #category : #accessing }
SmaCCGrammar class >> ignoreCase: aBoolean [ 
	IgnoreCase := aBoolean
]

{ #category : #accessing }
SmaCCGrammar class >> implicitToken: aString [ 
	| symbol node |
	symbol := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	(Character canUnderstand: symbol) ifFalse: [^nil].
	node := SmaCCCharacterRENode 
				characters: (self allCharacters select: [:each | each perform: symbol]).
	node position: SmallInteger maxVal.	"Implicit nodes have least precedence"
	^node
]

{ #category : #'class initialization' }
SmaCCGrammar class >> initialize [
	IgnoreCase := false.
	self maximumCharacterValue: 255
]

{ #category : #accessing }
SmaCCGrammar class >> maximumCharacterValue [
	^MaximumCharacterValue
]

{ #category : #accessing }
SmaCCGrammar class >> maximumCharacterValue: anInteger [ 
	MaximumCharacterValue := anInteger.
	SmaCCCharacterEdge initializeIsExpressions
]

{ #category : #accessing }
SmaCCGrammar >> addEmptySymbol [
	self addSymbol: SmaCCSymbol empty.
	self addSymbol: SmaCCSymbol error
]

{ #category : #accessing }
SmaCCGrammar >> addStartingSymbol: aSmaCCSymbol [ 
	(otherStartingSymbols includes: aSmaCCSymbol) 
		ifFalse: [otherStartingSymbols add: aSmaCCSymbol]
]

{ #category : #private }
SmaCCGrammar >> addSymbol: aSmaCCSymbol [ 
	^symbols add: aSmaCCSymbol
]

{ #category : #accessing }
SmaCCGrammar >> allStartingSymbols [
	"Return all starting symbols with the default starting symbol listed first."

	| startingSymbols default |
	default := self startSymbol.
	startingSymbols := otherStartingSymbols copy.
	startingSymbols remove: default ifAbsent: [].
	startingSymbols := startingSymbols collect: 
					[:each | 
					(SmaCCStartingSymbol name: 'B e g i n' , each name)
						addProduction: ((SmaCCRHS new)
									add: each;
									yourself);
						yourself].
	startingSymbols addFirst: default.
	^startingSymbols
]

{ #category : #private }
SmaCCGrammar >> calculateFirstSets [
	| changed |
	changed := true.
	[changed] whileTrue: 
			[changed := false.
			self symbols 
				do: [:each | changed := changed | each calculateFirstTerminals]]
]

{ #category : #accessing }
SmaCCGrammar >> emptySymbols [
	^self symbols select: [:each | each isTerminal not and: [each isEmpty]]
]

{ #category : #accessing }
SmaCCGrammar >> initialItemSetFor: aSmaCCSymbol [ 
	^(aSmaCCSymbol asLRItemSet)
		type: type;
		yourself
]

{ #category : #'initialize-release' }
SmaCCGrammar >> initialize [
	type := #LALR1.
	symbols := OrderedCollection new.
	shiftReduceTable := Dictionary new.
	otherStartingSymbols := OrderedCollection new
]

{ #category : #private }
SmaCCGrammar >> keywordRegularExpressionFor: aString [ 
	| regularExpressionString regex |
	regularExpressionString := (aString copyFrom: 2 to: aString size - 1) 
				copyReplaceAll: '""'
				with: '"'.
	regex := regularExpressionString inject: nil
				into: 
					[:sum :each | 
					sum isNil 
						ifTrue: [SmaCCCharacterRENode characters: (String with: each)]
						ifFalse: [sum , (SmaCCCharacterRENode characters: (String with: each))]].
	regex addStates: scannerDefinition states.
	^regex
]

{ #category : #private }
SmaCCGrammar >> keywordTerminalNamed: aString [ 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols addFirst: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (self keywordRegularExpressionFor: aString);
						yourself)]
]

{ #category : #precedence }
SmaCCGrammar >> leftPrecedenceFor: aSmaCCSymbol [ 
	shiftReduceTable at: aSmaCCSymbol put: SmaCCReduceAction
]

{ #category : #accessing }
SmaCCGrammar >> makeGroupFor: aSmaCCRHSCollection [ 
	| symbol name |
	name := aSmaCCRHSCollection inject: ''
				into: [:sum :each | sum , ' | ' , each printString].
	symbol := self nonTerminalSymbolNamed: 'Group: ' , name.
	symbol isEmpty 
		ifTrue: 
			[(aSmaCCRHSCollection allSatisfy: [:each | each size = 1]) 
				ifTrue: [aSmaCCRHSCollection do: [:each | each reduceAction: '''1''']].
			aSmaCCRHSCollection do: [:each | symbol addProduction: each]].
	^symbol
]

{ #category : #accessing }
SmaCCGrammar >> makeOptionalSymbolFor: aSmaCCSymbol [ 
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Optional: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							reduceAction: 'nil';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: aSmaCCSymbol;
							reduceAction: '''1''';
							yourself)].
	^symbol
]

{ #category : #accessing }
SmaCCGrammar >> makeRepeatMultipleSymbolFor: aSmaCCSymbol [ 
	| symbol |
	symbol := self 
				nonTerminalSymbolNamed: 'Repeat Multiple: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							add: aSmaCCSymbol;
							reduceAction: 'OrderedCollection with: ''1''';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: symbol;
							add: aSmaCCSymbol;
							reduceAction: '''1'' add: ''2''; yourself';
							yourself)].
	^symbol
]

{ #category : #accessing }
SmaCCGrammar >> makeRepeatSymbolFor: aSmaCCSymbol [ 
	| symbol |
	symbol := self nonTerminalSymbolNamed: 'Repeat: ' , aSmaCCSymbol printString.
	symbol isEmpty 
		ifTrue: 
			[symbol
				addProduction: ((SmaCCRHS new)
							reduceAction: 'OrderedCollection new';
							yourself);
				addProduction: ((SmaCCRHS new)
							add: symbol;
							add: aSmaCCSymbol;
							reduceAction: '''1'' add: ''2''; yourself';
							yourself)].
	^symbol
]

{ #category : #accessing }
SmaCCGrammar >> makeTokenIdMethodFor: aString [ 
	| token |
	token := (scannerDefinition includesTokenNamed: aString) 
				ifTrue: [self terminalSymbolNamed: aString]
				ifFalse: 
					[symbols detect: [:each | each name = aString]
						ifNone: [symbols add: (SmaCCTerminalSymbol name: aString)]].
	token createIdMethod: true
]

{ #category : #precedence }
SmaCCGrammar >> nonAssociativePrecedenceFor: aSmaCCSymbol [ 
	shiftReduceTable at: aSmaCCSymbol put: SmaCCRejectAction
]

{ #category : #private }
SmaCCGrammar >> nonTerminalSymbolNamed: aString [ 
	^symbols detect: [:each | each name = aString]
		ifNone: [self addSymbol: (SmaCCNonTerminalSymbol name: aString)]
]

{ #category : #accessing }
SmaCCGrammar >> preferredActionFor: aSmaCCSymbol [ 
	^shiftReduceTable at: aSmaCCSymbol ifAbsent: [nil]
]

{ #category : #private }
SmaCCGrammar >> reduceTableIndexFor: aSmaCCSymbol rhs: aSmaCCRHS [ 
	| index |
	index := 0.
	self symbols do: 
			[:each | 
			each = aSmaCCSymbol ifTrue: [^index + (each positionOf: aSmaCCRHS)].
			index := index + each size].
	^0
]

{ #category : #precedence }
SmaCCGrammar >> rightPrecedenceFor: aSmaCCSymbol [ 
	shiftReduceTable at: aSmaCCSymbol put: SmaCCShiftAction
]

{ #category : #'initialize-release' }
SmaCCGrammar >> scannerDefinition: aSmaCCScannerDefinition [
	scannerDefinition := aSmaCCScannerDefinition
]

{ #category : #precedence }
SmaCCGrammar >> setOperatorPrecedenceFor: aSmaCCSymbol to: anInteger [
	aSmaCCSymbol precedence: anInteger
]

{ #category : #accessing }
SmaCCGrammar >> setStartSymbolIfNone: aSmaCCSymbol [ 
	| startSymbol |
	self startSymbol notNil ifTrue: [^self].
	startSymbol := SmaCCStartingSymbol name: 'B e g i n'.
	self addSymbol: startSymbol.
	startSymbol addProduction: ((SmaCCRHS new)
				add: aSmaCCSymbol;
				yourself)
]

{ #category : #accessing }
SmaCCGrammar >> startSymbol [
	^symbols detect: [:each | each isStartingSymbol] ifNone: [nil]
]

{ #category : #private }
SmaCCGrammar >> symbols [
	^symbols
]

{ #category : #private }
SmaCCGrammar >> symbols: aCollection [
	symbols := aCollection
]

{ #category : #private }
SmaCCGrammar >> terminalSymbolNamed: aString [ 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols add: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (scannerDefinition tokenNamed: aString);
						yourself)]
]

{ #category : #private }
SmaCCGrammar >> terminalSymbolNamed: aString ifAbsent: aBlock [ 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols add: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (scannerDefinition tokenNamed: aString
									ifAbsentPut: 
										[| node |
										node := self class implicitToken: aString.
										node isNil ifTrue: [^aBlock value].
										node addStates: scannerDefinition nonExcludeStates.
										node]);
						yourself)]
]

{ #category : #accessing }
SmaCCGrammar >> tokens [
	^scannerDefinition tokens
]

{ #category : #'initialize-release' }
SmaCCGrammar >> type: aSmaCCSymbol [
	type := aSmaCCSymbol
]

{ #category : #accessing }
SmaCCGrammar >> unusedSymbols [
	| nonTerminals problemSymbols todo symbol |
	nonTerminals := self symbols reject: [:each | each isTerminal].
	problemSymbols := nonTerminals asSet.
	problemSymbols remove: self startSymbol.
	todo := OrderedCollection with: self startSymbol.
	[todo isEmpty] whileFalse: 
			[symbol := todo removeFirst.
			symbol productionsDo: 
					[:rhs | 
					rhs do: 
							[:each | 
							each isTerminal 
								ifFalse: 
									[(problemSymbols includes: each) 
										ifTrue: 
											[todo add: each.
											problemSymbols remove: each]]]]].
	^problemSymbols
]
