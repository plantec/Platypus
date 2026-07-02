"
SmaCCScannerCompiler represents the compiler for the scanner part of the parser.

Instance Variables:
	grammar	<SmaCCGrammar>	the grammar that defines the scanner
	scannerClass	<RBAbstractClass>	the class to compile the scanner into
	scannerDefinitionString	<String>	the string that defines the scanner
"
Class {
	#name : #SmaCCScannerCompiler,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'scannerClass',
		'scannerDefinitionString'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> addActions [
	self symbols keysAndValuesDo: [:index :each | 
		each regularExpression ifNotNilDo: [:eachRegex | eachRegex action: index ]]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addActionsFrom: aRegularExpression to: aKeywordMap at: states [ 
	^states do: 
			[:state | 
			state ~= aRegularExpression action 
				ifTrue: 
					[aRegularExpression possibleMatchesDo: 
							[:string | 
							(aKeywordMap at: state ifAbsentPut: [Dictionary new]) at: string
								put: aRegularExpression action]]]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addNormalSymbols [
	grammar 
		symbols: (self symbols asSortedCollection: self filePositionSortBlock)
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> addSpecialSymbols [
	grammar tokens keysDo: 
			[:each | 
			(self scannerActionFor: each) notNil 
				ifTrue: [grammar terminalSymbolNamed: each]]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addSpecificREsWithoutActionsTo: aRegularExpression [ 
	| dfa regex |
	regex := aRegularExpression.
	dfa := regex isNil ifTrue: [nil] ifFalse: [regex asDFA].
	self specificRegularExpressionsDo: 
			[:each | 
			| actions |
			actions := dfa isNil 
						ifTrue: [nil]
						ifFalse: [dfa actionForSpecificRegularExpression: each].
			actions isNil 
				ifTrue: [regex isNil ifTrue: [regex := each] ifFalse: [regex := regex | each]]].
	^regex
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> combinedGeneralRegexes [
	| combinedRegex |
	combinedRegex := nil.
	self generalRegularExpressionsDo: 
			[:each | 
			combinedRegex := combinedRegex isNil 
						ifTrue: [each]
						ifFalse: [combinedRegex | each]].
	^combinedRegex
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileEmptySymbolTokenId [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'emptySymbolTokenId';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: SmaCCSymbol empty) printString.
	self scannerClass compile: stream contents classified: #'generated-tokens'
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileErrorSymbolTokenId [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'errorTokenId';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: SmaCCSymbol error) printString.
	self scannerClass compile: stream contents classified: #'generated-tokens'
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileIgnoreCaseMethod [
	SmaCCGrammar ignoreCase 
		ifTrue: 
			[scannerClass compile: 'keywordFor: aString 
	^aString asUppercase'
				classified: #'generated-scanner']
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileKeywordInitializerUsing: keywordMapDictionary selectorMap: selectorMapDictionary [ 
	| stream dataStream |
	keywordMapDictionary isEmpty ifTrue: [^self].
	stream := WriteStream with: String new.
	stream nextPutAll: 'initializeKeywordMap'.
	stream nextPutAll: ' keywordMap :=  Dictionary new. '.
	dataStream := WriteStream with: Array new.
	keywordMapDictionary keysAndValuesDo: 
			[:key :value | 
			value keys asSortedCollection do: 
					[:each | 
					dataStream nextPut: (Array 
								with: (selectorMapDictionary at: key ifAbsent: [key])
								with: each
								with: (selectorMapDictionary at: (value at: each) ifAbsent: [value at: each]))]].
	stream
		nextPutAll: '#(';
		cr.
	dataStream contents do: 
			[:each | 
			stream nextPutAll: '#('.
			each do: [:item | item storeOn: stream] separatedBy: [stream nextPut: $ ].
			stream nextPut: $)]
		separatedBy: [stream cr].
	stream nextPut: $).
	stream 
		nextPutAll: ' do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last]. ^keywordMap'.
	scannerClass theMetaClass 
		compile: (RBParser parseMethod: stream contents) formattedCode
		classified: #'generated-initialization'
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileMethodsFor: regex withSelectors: selectorMap [ 
	| keywordmap dfa |
	dfa := regex asDFA.
	keywordmap := self computeKeywordMapFor: dfa.
	self compileKeywordInitializerUsing: keywordmap selectorMap: selectorMap.
	dfa compileInto: scannerClass usingSelectorMap: selectorMap.
	self compileEmptySymbolTokenId.
	self compileErrorSymbolTokenId.
	self compileIgnoreCaseMethod
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileScanner [
	| regex |
	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	self compileTokenIdMethods.
	regex := self addSpecificREsWithoutActionsTo: self combinedGeneralRegexes.
	self compileMethodsFor: regex withSelectors: self computeSelectorMap
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileScannerDefinitionComment [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'scannerDefinitionComment';
		cr;
		cr;
		tab;
		nextPut: $";
		nextPutAll: (scannerDefinitionString copyReplaceAll: '"' with: '""');
		nextPut: $".
	self scannerClass theMetaClass compile: stream contents
		classified: #'generated-comments'
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileTokenIdMethodFor: aTerminalSymbol [ 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: aTerminalSymbol safeMethodName;
		nextPutAll: 'Id';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: aTerminalSymbol) printString.
	scannerClass compile: stream contents classified: #'generated-tokens'
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileTokenIdMethods [
	(self symbols select: [:each | each createIdMethod]) 
		do: [:each | self compileTokenIdMethodFor: each]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> computeKeywordMapFor: dfa [ 
	| keywordmap |
	keywordmap := Dictionary new.
	self specificRegularExpressionsDo: 
			[:each | 
			| actions |
			actions := dfa actionForSpecificRegularExpression: each.
			actions isNil 
				ifFalse: 
					[self 
						addActionsFrom: each
						to: keywordmap
						at: actions]].
	^keywordmap
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> computeSelectorMap [
	| selectorMap |
	selectorMap := Dictionary new.
	self symbols keysAndValuesDo: 
			[:index :each | 
			(self scannerActionFor: each name) 
				ifNotNilDo: [:selector | selectorMap at: index put: selector]].
	^selectorMap
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> filePositionSortBlock [
	^
	[:a :b | 
	| aRegex bRegex |
	aRegex := a regularExpression.
	bRegex := b regularExpression.
	bRegex isNil or: 
			[aRegex notNil 
				and: [(aRegex position ifNil: [0]) < (bRegex position ifNil: [0])]]]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> generalRegularExpressionsDo: aBlock [ 
	self 
		regularExpressionsDo: [:each | each isKeywordLiteral ifFalse: [aBlock value: each]]
]

{ #category : #'initialize-release' }
SmaCCScannerCompiler >> grammar: aGrammar [
	grammar := aGrammar
]

{ #category : #'initialize-release' }
SmaCCScannerCompiler >> parseTokens [
	grammar scannerDefinition: (SmaCCScannerParser parse: scannerDefinitionString)
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> regularExpressionsDo: aBlock [ 
	self symbols do: [:each | each regularExpression ifNotNil: aBlock]
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> scannerActionFor: aString [ 
	| selector |
	aString size > 2 ifFalse: [^nil].
	selector := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	^((scannerClass definesMethod: selector) 
		and: [(Object canUnderstand: selector) not and: [selector numArgs = 0]]) 
			ifTrue: [selector]
			ifFalse: [nil]
]

{ #category : #accessing }
SmaCCScannerCompiler >> scannerClass [
	^scannerClass
]

{ #category : #accessing }
SmaCCScannerCompiler >> scannerClass: anObject [
	scannerClass := anObject
]

{ #category : #accessing }
SmaCCScannerCompiler >> scannerDefinitionString: aString [
	scannerDefinitionString := aString
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> specificRegularExpressionsDo: aBlock [ 
	self 
		regularExpressionsDo: [:each | each isKeywordLiteral ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
SmaCCScannerCompiler >> symbols [
	^grammar symbols
]
