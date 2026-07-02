"
SmaCCNode is a node in a directed graph.

Instance Variables:
	action	<SequenceableCollection>	a collection of integers or a symbol. This contains the action to be performed when we match and can't find a longer match.
	id	<Integer>	a unique number that allows us to sort the nodes
	transitions	<Collection of: SmaCCEdge>	our transitions


"
Class {
	#name : #SmaCCNode,
	#superclass : #Object,
	#instVars : [
		'transitions',
		'action',
		'id'
	],
	#classVars : [
		'MaxSubNodesInMethod',
		'NextId'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'class initialization' }
SmaCCNode class >> initialize [
	NextId := 0.
	MaxSubNodesInMethod := 20
]

{ #category : #accessing }
SmaCCNode class >> maxSubNodesInMethod [
	^MaxSubNodesInMethod
]

{ #category : #accessing }
SmaCCNode class >> maxSubNodesInMethod: anInteger [
	MaxSubNodesInMethod := anInteger
]

{ #category : #comparing }
SmaCCNode >> <= aSmaCCNode [ 
	^self id <= aSmaCCNode id
]

{ #category : #comparing }
SmaCCNode >> = anObject [ 
	^self class = anObject class and: [self id = anObject id]
]

{ #category : #private }
SmaCCNode >> action [
	^action
]

{ #category : #'initialize-release' }
SmaCCNode >> action: anObject [ 
	anObject isNil ifTrue: [^self].
	action := anObject isSymbol 
				ifTrue: [anObject]
				ifFalse: [SortedCollection with: anObject]
]

{ #category : #'compiling-scanner' }
SmaCCNode >> actionForSpecificRegularExpression: aSmaCCRegularExpression [ 
	| matchedAction strings |
	strings := aSmaCCRegularExpression possibleMatches.
	matchedAction := self simulate: (ReadStream on: strings first).
	strings 
		do: [:each | matchedAction = (self simulate: (ReadStream on: each)) ifFalse: [^nil]].
	^matchedAction
]

{ #category : #private }
SmaCCNode >> addActions: aCollection [ 
	aCollection isNil ifTrue: [^self].
	action isNil 
		ifTrue: 
			[action := aCollection copy.
			^self].
	action isSymbol ifTrue: [^self].
	aCollection isSymbol ifTrue: [^action := aCollection].
	aCollection 
		do: [:each | (action includes: each) ifFalse: [action add: each]]
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode [ 
	transitions add: (SmaCCEdge to: aSmaCCNode on: nil)
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode onCharacters: characterCollection [ 
	transitions add: (SmaCCCharacterEdge to: aSmaCCNode on: characterCollection)
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode onStates: symbolCollection [ 
	transitions add: (SmaCCStateEdge to: aSmaCCNode on: symbolCollection)
]

{ #category : #compiling }
SmaCCNode >> addImplementationSpecificRewritesTo: rewriter [
]

{ #category : #private }
SmaCCNode >> allStates [
	| nodes |
	nodes := Set new.
	self allStatesInto: nodes.
	^nodes
]

{ #category : #private }
SmaCCNode >> allStatesInto: aSet [ 
	(aSet includes: self) ifTrue: [^self].
	aSet add: self.
	transitions do: [:each | each to allStatesInto: aSet]
]

{ #category : #converting }
SmaCCNode >> asDFA [
	| new |
	new := (SmaCCNFAtoDFA convertToDFA: self asNFAWithoutEpsilonTransitions) 
				startingNodeWithoutUnnecessaryDefaultTransition.
	new removeDuplicateNodes.
	^new
]

{ #category : #converting }
SmaCCNode >> asNFAWithoutEpsilonTransitions [
	^SmaCCEpsilonRemoval removeEpsilonEdgesFrom: self
]

{ #category : #compiling }
SmaCCNode >> asStatement: methodMap usingSelectorMap: aDictionary forClass: aClass [ 
	| stream |
	stream := WriteStream with: String new.
	self hasSimpleLoop ifTrue: [stream nextPut: $[].
	self writeMatchingCodeOn: stream usingSelectorMap: aDictionary.
	(self sortedTransitionsFor: aClass) do: 
			[:each | 
			each to = self 
				ifTrue: 
					[stream
						nextPutAll: each expression;
						nextPut: $];
						nextPutAll: ' whileTrue.';
						cr]
				ifFalse: 
					[stream
						nextPutAll: each expression;
						nextPutAll: ' ifTrue: ['.
					stream
						nextPutAll: (methodMap at: each to
									ifAbsentPut: 
										[each to 
											asStatement: methodMap
											usingSelectorMap: aDictionary
											forClass: aClass]);
						nextPutAll: '].';
						cr]].
	(transitions notEmpty or: [action isNil]) 
		ifTrue: 
			[stream
				nextPutAll: '^self reportLastMatch';
				cr].
	^stream contents
]

{ #category : #compiling }
SmaCCNode >> compileInto: aClass usingSelectorMap: aDictionary [ 
	| methodNodes methodMap index |
	methodNodes := self statesToMakeIntoMethods.
	methodMap := self methodNameMapFor: methodNodes.
	index := 0.
	methodNodes do: 
			[:each | 
			| stream |
			stream := WriteStream with: String new.
			stream
				nextPutAll: (each = self 
							ifTrue: ['scanForToken']
							ifFalse: ['scan' , (index := index + 1) printString]);
				cr.
			stream nextPutAll: (each 
						asStatement: methodMap
						usingSelectorMap: aDictionary
						forClass: aClass).
			aClass 
				compile: (self optimizedParseTreeFor: stream contents) formattedCode
				classified: #'generated-scanner']
]

{ #category : #private }
SmaCCNode >> groupedTransitions [
	^transitions inject: OrderedCollection new
		into: 
			[:sum :each | 
			(sum detect: [:edgeCollection | edgeCollection first canMergeWith: each]
				ifNone: [sum add: OrderedCollection new]) add: each.
			sum]
]

{ #category : #testing }
SmaCCNode >> hasSimpleLoop [
	^transitions anySatisfy: [:each | each to = self]
]

{ #category : #comparing }
SmaCCNode >> hash [
	^id bitShift: 4
]

{ #category : #private }
SmaCCNode >> id [
	^id
]

{ #category : #'initialize-release' }
SmaCCNode >> initialize [
	id := NextId := NextId + 1.
	transitions := SortedCollection new
]

{ #category : #testing }
SmaCCNode >> isTerminalNode [
	^transitions isEmpty or: [transitions size = 1 and: [self hasSimpleLoop]]
]

{ #category : #private }
SmaCCNode >> mergeTransitions [
	self groupedTransitions do: 
			[:edges | 
			| toMap |
			toMap := Dictionary new.
			edges do: 
					[:each | 
					(toMap includesKey: each to) 
						ifTrue: 
							[(toMap at: each to) mergeWith: each.
							transitions remove: each]
						ifFalse: [toMap at: each to put: each]]]
]

{ #category : #private }
SmaCCNode >> mergeWith: aSmaCCNode [ 
	id := aSmaCCNode id.
	transitions := aSmaCCNode transitions.
	action := aSmaCCNode action
]

{ #category : #compiling }
SmaCCNode >> methodNameMapFor: methodNodes [ 
	| index methodMap |
	methodMap := Dictionary new.
	index := 0.
	methodNodes do: 
			[:value | 
			methodMap at: value
				put: (value = self 
						ifTrue: ['^self scanForToken']
						ifFalse: ['^self scan' , (index := index + 1) printString])].
	^methodMap
]

{ #category : #compiling }
SmaCCNode >> needsSeparateMethod [
	^self allStates size > MaxSubNodesInMethod
]

{ #category : #compiling }
SmaCCNode >> optimizationRewriter [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace: '`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				currentCharacter == `#l ifTrue: [`@.Stmts3].
				`@.Stmts4'
			with: '`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				`@.Stmts3';
		replaceMethod: '`name
							`@.Stmts1.
							`@a ifTrue: [	^self `name].
							`@.Stmts3'
			with: '`name
				[`@.Stmts1.
				`@a] whileTrue.
				`@.Stmts3';
		replaceMethod: '`name
							`@.Stmts1.
							`@a ifTrue: [`@.Stmts2.
									^self `name].
							`@.Stmts3'
			with: '`name
				[`@.Stmts1.
				`@a] whileTrue: [`@.Stmts2].
				`@.Stmts3';
		replace: '`@.Stmts1.
				currentCharacter isLiteral ifTrue: [`@.Stmts2].
				`@.Stmts3'
			with: '`@.Stmts1.
				`@.Stmts2';
		replace: '`@.Stmts1.
				`.Stmt.
				`@.Stmts.
				`@a ifTrue: [self step. `.Stmt. `@.Stmts].
				`@.Stmts2'
			with: '`@.Stmts1.
				`@a ifTrue: [self step].
				`.Stmt.
				`@.Stmts.
				`@.Stmts2';
		replace: '`@.Stmts1.
				`@a ifTrue: [`@.Stmts. ^self reportLastMatch]'
			with: '`@.Stmts1.
				`@a ifTrue: [`@.Stmts]'.
	self addImplementationSpecificRewritesTo: rewriter.
	^rewriter
]

{ #category : #compiling }
SmaCCNode >> optimizedParseTreeFor: aString [ 
	| tree rewriter |
	tree := RBParser parseMethod: aString.
	rewriter := self optimizationRewriter.
	[rewriter executeTree: tree] whileTrue: [tree := rewriter tree].
	^tree
]

{ #category : #printing }
SmaCCNode >> printOn: aStream [ 
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: id printString;
		nextPut: $)
]

{ #category : #private }
SmaCCNode >> removeDuplicateNodes [
	^SmaCCDuplicateNodeEliminator removeDuplicateNodesIn: self
]

{ #category : #simulating }
SmaCCNode >> simulate: aStream [ 
	| char |
	aStream atEnd ifTrue: [^action].
	char := aStream next.
	transitions 
		do: [:each | (each includes: char) ifTrue: [^each to simulate: aStream]].
	^nil
]

{ #category : #compiling }
SmaCCNode >> sortedTransitionsFor: aClass [ 
	| frequencies |
	frequencies := (aClass realClass ifNil: [SmaCCScanner]) frequencyTable.
	^transitions asSortedCollection: 
			[:a :b | 
			| aFrequency bFrequency |
			aFrequency := a edgeFrequencyUsingTable: frequencies.
			bFrequency := b edgeFrequencyUsingTable: frequencies.
			aFrequency > bFrequency or: [aFrequency = bFrequency and: [a <= b]]]
]

{ #category : #private }
SmaCCNode >> startingNodeWithoutUnnecessaryDefaultTransition [
	| edge |
	self transitions size = 1 ifFalse: [^self].
	edge := self transitions first.
	(edge includes: #default) ifTrue: [^edge to].
	^self
]

{ #category : #compiling }
SmaCCNode >> statesToMakeIntoMethods [
	| allStates incoming |
	allStates := self allStates.
	incoming := Dictionary new.
	allStates do: 
			[:each | 
			each transitions do: 
					[:edge | 
					each ~= edge to 
						ifTrue: [(incoming at: edge to ifAbsentPut: [Set new]) add: each]]].
	^(allStates asOrderedCollection select: 
			[:each | 
			self = each or: 
					[each isTerminalNode not and: 
							[(incoming at: each ifAbsent: [#()]) size > 1 
								or: [each needsSeparateMethod]]]]) 
		asSortedCollection: [:a :b | a id < b id]
]

{ #category : #private }
SmaCCNode >> transitions [
	^transitions
]

{ #category : #private }
SmaCCNode >> transitions: aCollection [ 
	transitions reset.
	transitions addAll: aCollection
]

{ #category : #compiling }
SmaCCNode >> writeMatchingCodeOn: aStream usingSelectorMap: aDictionary [ 
	| matchedItem |
	(action notNil and: [action size > 0]) 
		ifTrue: 
			[matchedItem := aDictionary at: action first ifAbsent: [action asArray].
			aStream nextPutAll: (transitions isEmpty 
						ifTrue: ['^self recordAndReportMatch:']
						ifFalse: ['self recordMatch: ']).
			matchedItem isSymbol 
				ifTrue: [aStream nextPutAll: matchedItem storeString]
				ifFalse: 
					[aStream nextPutAll: '#('.
					matchedItem do: [:each | aStream nextPutAll: each storeString]
						separatedBy: [aStream nextPut: $ ].
					aStream nextPut: $)].
			aStream
				nextPut: $.;
				cr].
	(transitions anySatisfy: [:each | each isCharacterTransition]) 
		ifTrue: 
			[aStream
				nextPutAll: 'self step.';
				cr]
]
