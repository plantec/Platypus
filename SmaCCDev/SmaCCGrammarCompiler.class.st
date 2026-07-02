"
SmaCCGrammarCompiler compiles a SmaCCGrammar.

Instance Variables:
	actions	<Array>	the action table for the parser. It contains the action (shift/reduce/accept/reject) for each possible state/symbol pair
	grammar	<SmaCCGrammar>	our grammar
	itemSets	<SequenceableCollection of: SmaCCItemSet>	the item sets for our grammar
	model	<RBNameSpace>	where we are compiling our changes into
	parserClass	<RBAbstractClass>	the parser class for our changes
	parserDefinitionString	<String>	the definition of our parser
	scannerCompiler	<SmaCCScannerCompiler>	a compiler for the scanner
	shiftTable	<Dictionary key: (Array with: Integer with: SmaCCSymbol) value: Integer>	a table mapping a state/symbol pair to the new state that is aquired by shifting the symbol
	startingStateMap	<Dictionary key: SmaCCSymbol value: Integer>	the state for SmaCCSymbol's starting item set


"
Class {
	#name : #SmaCCGrammarCompiler,
	#superclass : #Object,
	#instVars : [
		'shiftTable',
		'itemSets',
		'startingStateMap',
		'actions',
		'parserClass',
		'parserDefinitionString',
		'scannerCompiler',
		'grammar',
		'model'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'instance creation' }
SmaCCGrammarCompiler class >> new [
	^self basicNew initialize
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> actionForState: anInteger on: aSmaCCSymbol [ 
	| action newStateIndex |
	action := (itemSets at: anInteger) action: aSmaCCSymbol
				prefer: (grammar preferredActionFor: aSmaCCSymbol).
	action isShift 
		ifTrue: 
			[newStateIndex := shiftTable 
						at: (Array with: anInteger with: aSmaCCSymbol).
			^(newStateIndex bitShift: 2) + action id].
	action isReduce 
		ifTrue: 
			[^((grammar reduceTableIndexFor: action symbol rhs: action rhs) 
				bitShift: 2) + action id].
	^action id
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> arrayTypeMask [
	^self hasLiteralByteArrays ifTrue: [0] ifFalse: [2]
]

{ #category : #'initialize-release' }
SmaCCGrammarCompiler >> buildScanner: scannerString andParser: parserString [ 
	| parser |
	scannerCompiler grammar: self grammar.
	scannerCompiler scannerDefinitionString: scannerString.
	parserDefinitionString := parserString.
	scannerCompiler parseTokens.
	parser := SmaCCGrammarParser on: (ReadStream on: parserString).
	parser grammar: grammar.
	parser parse
]

{ #category : #compiling }
SmaCCGrammarCompiler >> changes [
	^model changes
]

{ #category : #private }
SmaCCGrammarCompiler >> checkFor: problemSymbols errorMessage: errorMessage [ 
	| stream |
	problemSymbols isEmpty ifTrue: [^self].
	stream := WriteStream with: String new.
	problemSymbols do: [:each | stream nextPutAll: each printString]
		separatedBy: [stream space].
	SmaCCCompilationNotification new
		tag: stream contents;
		signal: errorMessage
]

{ #category : #private }
SmaCCGrammarCompiler >> checkForEmptySymbols [
	self checkFor: grammar emptySymbols
		errorMessage: 'Missing non-terminal productions'
]

{ #category : #private }
SmaCCGrammarCompiler >> checkForUnusedSymbols [
	self checkFor: grammar unusedSymbols
		errorMessage: 'Unused non-terminal symbols'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileChanges [
	RefactoryChangeManager instance performChange: self changes.
	scannerCompiler scannerClass realClass 
		ifNotNilDo: [:each | each initializeKeywordMap]
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileDefinitionComments [
	scannerCompiler compileScannerDefinitionComment.
	self compileParserDefinitionComment
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileInto: sClass andParser: pClass [ 
	self scannerClass: sClass.
	self parserClass: pClass.
	self createChanges.
	self compileChanges
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileItemSetsComment [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'itemSetsComment';
		cr;
		cr;
		tab;
		nextPut: $";
		cr.
	itemSets keysAndValuesDo: 
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: (each printString copyReplaceAll: '"' with: '""');
				cr].
	stream nextPut: $".
	self parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileParser [
	self compileTransitionTable.
	self compileStartingStateIds.
	self compileReductionTable.
	self compileScannerClassIntoParser
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileParserDefinitionComment [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'parserDefinitionComment';
		cr;
		cr;
		tab;
		nextPut: $";
		nextPutAll: (parserDefinitionString copyReplaceAll: '"' with: '""');
		nextPut: $".
	parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileReductionTable [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'reduceTable';
		cr;
		tab;
		nextPutAll: '^#(';
		cr.
	self reduceTable do: 
			[:each | 
			stream nextPutAll: '#('.
			each do: [:e | stream nextPutAll: e storeString]
				separatedBy: [stream space].
			stream
				nextPut: $);
				cr].
	stream nextPut: $).
	parserClass compile: stream contents classified: #'generated-tables'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileScanner [
	scannerCompiler compileScanner
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileScannerClassIntoParser [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'scannerClass';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: scannerCompiler scannerClass name.
	self parserClass theMetaClass compile: stream contents
		classified: #'generated-accessing'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileStartingStateIds [
	startingStateMap keysAndValuesDo: 
			[:symbol :position | 
			| stream |
			stream := WriteStream with: String new.
			stream
				nextPutAll: 'startingStateFor';
				nextPutAll: symbol compileName;
				cr;
				tab;
				nextPutAll: '^';
				nextPutAll: position printString.
			parserClass theMetaClass compile: stream contents
				classified: #'generated-starting states']
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileSymbolComment [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'symbolComment';
		cr;
		cr;
		tab;
		nextPut: $";
		cr.
	scannerCompiler symbols keysAndValuesDo: 
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: '. ';
				nextPutAll: (each printString copyReplaceAll: '"' with: '""');
				cr].
	stream nextPut: $".
	self parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'
]

{ #category : #compiling }
SmaCCGrammarCompiler >> compileTransitionTable [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'transitionTable';
		cr;
		tab;
		nextPutAll: '^#(';
		cr.
	self transitionTable do: 
			[:each | 
			stream 
				nextPutAll: (self hasLiteralByteArrays ifTrue: ['#['] ifFalse: ['#(']).
			each do: [:byte | stream nextPutAll: byte printString]
				separatedBy: [stream nextPut: $ ].
			stream
				nextPut: (self hasLiteralByteArrays ifTrue: [$]] ifFalse: [$)]);
				cr].
	stream nextPut: $).
	parserClass compile: stream contents classified: #'generated-tables'
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressTable: table [ 
	^table collect: [:row | self compressTableRow: row]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressTableRow: row [ 
	| uniqueItems |
	uniqueItems := self uniqueNonErrorActionsForTableRow: row.
	^uniqueItems size = 1 
		ifTrue: [self singleActionTableRow: row forAction: uniqueItems first]
		ifFalse: [self multipleActionTableRow: row]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> compressedRowStream [
	^WriteStream with: (self hasLiteralByteArrays 
				ifTrue: [ByteArray new]
				ifFalse: [Array new])
]

{ #category : #compiling }
SmaCCGrammarCompiler >> createChanges [
	self removeOldMethods.
	self checkForEmptySymbols.
	self checkForUnusedSymbols.
	self compileScanner.
	self compileParser
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> createItemSets [
	| itemSet newState index |
	startingStateMap := Dictionary new.
	grammar calculateFirstSets.
	itemSets := OrderedCollection new.
	grammar allStartingSymbols do: 
			[:each | 
			itemSets add: (grammar initialItemSetFor: each).
			startingStateMap at: each put: itemSets size].
	shiftTable := Dictionary new.
	index := 1.
	[index <= itemSets size] whileTrue: 
			[itemSet := itemSets at: index.
			grammar symbols do: 
					[:each | 
					newState := itemSet moveOn: each.
					newState notEmpty 
						ifTrue: 
							[shiftTable at: (Array with: index with: each)
								put: (self indexOfState: newState)]].
			index := index + 1]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> createTransitionTable [
	| table |
	table := (1 to: itemSets size) collect: 
					[:index | 
					scannerCompiler symbols 
						collect: [:each | self actionForState: index on: each]].
	actions := self compressTable: table
]

{ #category : #compiling }
SmaCCGrammarCompiler >> defineClass: aString asSubclassOf: aBehavior [
	model defineClass: aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: '''' classVariableNames: '''' poolDictionaries: '''' category: '''' '.
	^model classNamed: aString asSymbol
]

{ #category : #private }
SmaCCGrammarCompiler >> generatedMethodsIn: aRBClass [ 
	^aRBClass selectors select: 
			[:each | 
			(aRBClass protocolsFor: each) 
				allSatisfy: [:protocol | protocol notNil and: ['generated*' match: protocol]]]
]

{ #category : #accessing }
SmaCCGrammarCompiler >> grammar [
	^grammar isNil ifTrue: [grammar := SmaCCGrammar new] ifFalse: [grammar]
]

{ #category : #testing }
SmaCCGrammarCompiler >> hasLiteralByteArrays [
	"The #hasLiteralByteArrays wasn't meant to be changed without also changing the SmaCCParser #actionForState:and: and #binarySearchIn:for:size: methods. This issue is fixed now and the SmaCCParser can now handle both cases."

	^ true
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> indexOfState: newState [ 
	| newStateIndex |
	newStateIndex := itemSets indexOf: newState.
	newStateIndex = 0 
		ifTrue: 
			[itemSets add: newState.
			newStateIndex := itemSets size]
		ifFalse: [(itemSets at: newStateIndex) mergeWith: newState].
	^newStateIndex
]

{ #category : #'initialize-release' }
SmaCCGrammarCompiler >> initialize [
	scannerCompiler := SmaCCScannerCompiler new.
	model := (RBNamespace new)
				name: 'Compile Scanner/Parser';
				yourself.
	startingStateMap := Dictionary new
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> multipleActionTableRow: row [ 
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 1 + self arrayTypeMask.
	row keysAndValuesDo: 
			[:index :each | 
			each ~= 3 
				ifTrue: 
					[self writeInteger: each on: stream.
					self writeInteger: index on: stream]].
	^stream contents
]

{ #category : #accessing }
SmaCCGrammarCompiler >> parserClass [
	^parserClass
]

{ #category : #accessing }
SmaCCGrammarCompiler >> parserClass: aClassOrString [ 
	(aClassOrString isKindOf: Behavior) 
		ifTrue: [parserClass := model classFor: aClassOrString]
		ifFalse: 
			[parserClass := model classNamed: aClassOrString.
			parserClass isNil 
				ifTrue: [parserClass := self defineClass: aClassOrString asSubclassOf: SmaCCParser]]
]

{ #category : #'reduction table' }
SmaCCGrammarCompiler >> reduceTable [
	| table nonterminals |
	table := OrderedCollection new.
	nonterminals := scannerCompiler symbols reject: [:each | each isTerminal].
	nonterminals do: 
			[:each | 
			each productionsDo: 
					[:rhs | 
					table add: (Array 
								with: (scannerCompiler symbols indexOf: each)
								with: rhs size
								with: (rhs compileSourceFor: each in: parserClass))]].
	^table
]

{ #category : #private }
SmaCCGrammarCompiler >> removeOldMethods [
	self
		removeOldMethodsFrom: scannerCompiler scannerClass;
		removeOldMethodsFrom: scannerCompiler scannerClass theMetaClass;
		removeOldMethodsFrom: parserClass;
		removeOldMethodsFrom: parserClass theMetaClass
]

{ #category : #private }
SmaCCGrammarCompiler >> removeOldMethodsFrom: aRBClass [ 
	(self generatedMethodsIn: aRBClass) 
		do: [:each | aRBClass removeMethod: each]
]

{ #category : #accessing }
SmaCCGrammarCompiler >> scannerClass: aClassOrString [ 
	(aClassOrString isKindOf: Behavior) 
		ifTrue: [scannerCompiler scannerClass: (model classFor: aClassOrString)]
		ifFalse: 
			[scannerCompiler scannerClass: (model classNamed: aClassOrString).
			scannerCompiler scannerClass isNil 
				ifTrue: 
					[scannerCompiler 
						scannerClass: (self defineClass: aClassOrString asSubclassOf: SmaCCScanner)]]
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> singleActionTableRow: row forAction: anInteger [ 
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 0 + self arrayTypeMask.
	self writeInteger: anInteger on: stream.
	row 
		keysAndValuesDo: [:index :each | each ~= 3 ifTrue: [self writeInteger: index on: stream]].
	^stream contents
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> transitionTable [
	actions isNil 
		ifTrue: 
			[self createItemSets.
			self createTransitionTable].
	^actions
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> uniqueNonErrorActionsForTableRow: row [ 
	^(row asSet)
		remove: 3 ifAbsent: [];
		asArray
]

{ #category : #'action table' }
SmaCCGrammarCompiler >> writeInteger: anInteger on: aStream [ 
	self hasLiteralByteArrays 
		ifTrue: 
			[aStream
				nextPut: (anInteger bitShift: -8);
				nextPut: (anInteger bitAnd: 16rFF)]
		ifFalse: [aStream nextPut: anInteger]
]
