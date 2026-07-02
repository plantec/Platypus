"
SmaCCParser is an abstract class that defines most of the parsing actions. Subclasses will define methods that specify their transitions and reduction actions. These are normally defined automatically when compiling the parser.

Subclasses must implement the following messages:
	accessing
		emptySymbolTokenId
		reduceTable
		transitionTable

Instance Variables:
	currentToken	<SmaCCToken>	the token last returned by the scanner that has not been shifted (reduce actions leave the current token alone)
	nodeStack	<OrderedCollection>	collection of items on stack. These items are specific to the parser and can be any object. 
	scanner	<SmaCCScanner>	our scanner
	stateStack	<OrderedCollection of: Integer>	the stack of states for our parser (standard LR state stack)


"
Class {
	#name : #SmaCCParser,
	#superclass : #Object,
	#instVars : [
		'scanner',
		'currentToken',
		'errorToken',
		'stateStack',
		'nodeStack'
	],
	#category : #'SmaCC-Runtime'
}

{ #category : #private }
SmaCCParser class >> defaultStartingState [
	^1
]

{ #category : #'instance creation' }
SmaCCParser class >> on: aStream [ 
	| parser scanner |
	scanner := self scannerClass on: aStream.
	parser := self new.
	parser scanner: scanner.
	^parser
]

{ #category : #accessing }
SmaCCParser class >> parse: aString [ 
	^self parse: aString startingAt: self defaultStartingState
]

{ #category : #accessing }
SmaCCParser class >> parse: aString onError: aBlock [ 
	^[self parse: aString] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]
]

{ #category : #accessing }
SmaCCParser class >> parse: aString startingAt: anInteger [ 
	^self parseStream: (ReadStream on: aString) startingAt: anInteger
]

{ #category : #accessing }
SmaCCParser class >> parse: aString startingAt: anInteger onError: aBlock [ 
	^[self parse: aString startingAt: anInteger] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]
]

{ #category : #accessing }
SmaCCParser class >> parseStream: aStream [ 
	^self parseStream: aStream startingAt: self defaultStartingState
]

{ #category : #accessing }
SmaCCParser class >> parseStream: aStream onError: aBlock [ 
	^[self parseStream: aStream] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]
]

{ #category : #accessing }
SmaCCParser class >> parseStream: aStream startingAt: anInteger [ 
	| parser |
	parser := self on: aStream.
	parser setStartingState: anInteger.
	^parser parse
]

{ #category : #accessing }
SmaCCParser class >> parseStream: aStream startingAt: anInteger onError: aBlock [ 
	^[self parseStream: aStream startingAt: anInteger] 
		on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]
]

{ #category : #private }
SmaCCParser class >> scannerClass [
	^self subclassResponsibility
]

{ #category : #private }
SmaCCParser >> acceptAction [
	^0
]

{ #category : #private }
SmaCCParser >> actionFor: aSymbolIndex [ 
	^self actionForState: self currentState and: aSymbolIndex
]

{ #category : #private }
SmaCCParser >> actionForCurrentToken [
	^self actionFor: currentToken id first
]

{ #category : #private }
SmaCCParser >> actionForState: stateIndex and: aSymbolIndex [
	| index row |
	row := self transitionTable at: stateIndex.
	^ row isArray 
		ifTrue: [ 
			(row at: 1) == 2 
				ifTrue: [
					index := self binarySearchInArray: row
						for: aSymbolIndex
						size: 1.
					index == 0 
						ifTrue: [ ^ self errorAction ]
						ifFalse: [ ^ row at: 2 ] ]
				ifFalse: [ 
					index := self binarySearchInArray: row
						for: aSymbolIndex
						size: 2.
					index == 0
						ifTrue: [ ^ self errorAction ]
						ifFalse: [ ^ row at: index - 1 ] ] ]
		ifFalse: [ 
			(row at: 1) == 0 
				ifTrue: [ 
					index := self binarySearchInBytes: row
						for: aSymbolIndex
						size: 2.
					index == 0 
						ifTrue: [ ^ self errorAction ] 
						ifFalse: [ ^ ((row at: 2) bitShift: 8) + (row at: 3) ] ]
				ifFalse: [ 
					index := self binarySearchInBytes: row
						for: aSymbolIndex
						size: 4.
					index == 0 
						ifTrue: [ ^ self errorAction ] 
						ifFalse: [ ^ ((row at: index - 2) bitShift: 8) + (row at: index - 1) ] ] ]
]

{ #category : #private }
SmaCCParser >> actionMask [
	^2r11
]

{ #category : #private }
SmaCCParser >> binarySearchInArray: aRow for: aSymbolIndex size: step [ 
	| start mid length midItem stop |
	start := 3.
	stop := aRow size.
	length := (stop - start) // step.
	[length > 4] whileTrue: 
			[length := length bitShift: -1.
			mid := length * step + start.
			midItem := aRow at: mid.
			midItem <= aSymbolIndex ifTrue: [start := mid] ifFalse: [stop := mid]].
	[start <= stop] whileTrue: 
			[(aRow at: start) == aSymbolIndex ifTrue: [^start].
			start := start + step].
	^0
]

{ #category : #private }
SmaCCParser >> binarySearchInBytes: aRow for: aSymbolIndex size: step [
	| start mid length high low midItem stop |
	high := aSymbolIndex bitShift: -8.
	low := aSymbolIndex bitAnd: 16rFF.
	start := 4.
	stop := aRow size - 1.
	length := (stop - start) // step.
	[length > 4]
		whileTrue:
			[length := length bitShift: -1.
			mid := length * step + start.
			midItem := aRow at: mid.
			((midItem == high and: [(aRow at: mid + 1) <= low]) or: [midItem < high])
				ifTrue: [start := mid]
				ifFalse: [stop := mid]].
	[start <= stop]
		whileTrue:
			[((aRow at: start) == high and: [(aRow at: start + 1) == low]) ifTrue: [^start].
			start := start + step].
	^0
]

{ #category : #'private-error handling' }
SmaCCParser >> checkForErrors [
	"If we have an error correction installed, we might have handled the errors. If we did, we don't 
	want to return the result, so we raise a final exception that can't be proceeded."

	errorToken isNil ifTrue: [^self].
	currentToken := errorToken.
	self reportErrorMessage: 'Token not expected'
]

{ #category : #private }
SmaCCParser >> currentState [
	^stateStack last
]

{ #category : #'private-error handling' }
SmaCCParser >> dismissErrorToken [
	currentToken := nil.
	self getNextToken
]

{ #category : #'private-error handling' }
SmaCCParser >> dismissStackTopForErrorRecovery [
	stateStack removeLast.
	^nodeStack removeLast
]

{ #category : #accessing }
SmaCCParser >> emptySymbolTokenId [
	^scanner emptySymbolTokenId
]

{ #category : #private }
SmaCCParser >> errorAction [
	^3
]

{ #category : #'private-error handling' }
SmaCCParser >> errorHandlerStates [
	^stateStack collect: 
			[:each | 
			| action |
			action := self actionForState: each and: self errorTokenId.
			(action bitAnd: self actionMask) = 1 
				ifTrue: [action bitShift: -2]
				ifFalse: [0]]
]

{ #category : #accessing }
SmaCCParser >> errorTable [
	^#()
]

{ #category : #accessing }
SmaCCParser >> errorTokenId [
	^scanner errorTokenId
]

{ #category : #private }
SmaCCParser >> findErrorHandlerIfNoneUseErrorNumber: anInteger [ 
	| handlerStates index startingErrorToken newStack |
	handlerStates := self errorHandlerStates reverse.
	startingErrorToken := currentToken.
	
	[index := (1 to: handlerStates size) detect: 
					[:each | 
					| state |
					state := handlerStates at: each.
					state ~= 0 and: 
							[newStack := stateStack copyFrom: 1 to: handlerStates size - each + 1.
							newStack add: state.
							self willShift: newStack]]
				ifNone: [nil].
	index isNil] 
			whileTrue: 
				[self dismissErrorToken.
				self isEOFToken 
					ifTrue: 
						[currentToken := startingErrorToken.
						self reportError: anInteger]].
	index - 1 timesRepeat: [self dismissStackTopForErrorRecovery].
	stateStack addLast: (handlerStates at: index).
	nodeStack addLast: startingErrorToken
]

{ #category : #private }
SmaCCParser >> getNextToken [
	currentToken isNil ifTrue: [currentToken := scanner next]
]

{ #category : #'private-error handling' }
SmaCCParser >> handleError: anInteger [ 
	errorToken isNil ifTrue: [errorToken := currentToken].
	(self isEOFToken or: [self hasErrorHandler not]) 
		ifTrue: [self reportError: anInteger].
	self findErrorHandlerIfNoneUseErrorNumber: anInteger
]

{ #category : #'private-error handling' }
SmaCCParser >> hasErrorHandler [
	^self errorHandlerStates anySatisfy: [:each | each ~~ 0]
]

{ #category : #'initialize-release' }
SmaCCParser >> initialize [
	nodeStack := OrderedCollection new
]

{ #category : #testing }
SmaCCParser >> isEOFToken [
	^currentToken id first = self emptySymbolTokenId
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftFirstValue: aCollection [ 
	^aCollection first
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftLastValue: aCollection [ 
	^aCollection last
]

{ #category : #'standard reduction rules' }
SmaCCParser >> liftSecondValue: aCollection [ 
	^aCollection at: 2
]

{ #category : #'standard reduction rules' }
SmaCCParser >> nil [
	^nil
]

{ #category : #accessing }
SmaCCParser >> parse [
	self setDefaultStartingStateIfNone.
	self performParsingLoop.
	^nodeStack last
]

{ #category : #private }
SmaCCParser >> performAction: action [ 
	| value actionType |
	actionType := action bitAnd: self actionMask.
	value := action bitShift: -2.
	actionType == self shiftAction 
		ifTrue: [self shift: value]
		ifFalse: 
			[actionType == self reduceAction 
				ifTrue: [self reduce: value]
				ifFalse: [self handleError: value]]
]

{ #category : #private }
SmaCCParser >> performParsingLoop [
	| action |
	
	[self getNextToken.
	action := self actionForCurrentToken.
	action = self acceptAction] 
			whileFalse: [self performAction: action].
	self checkForErrors
]

{ #category : #private }
SmaCCParser >> performReduceMethod: aSymbol with: items [ 
	^aSymbol last == $: 
		ifTrue: [self perform: aSymbol with: items]
		ifFalse: [self perform: aSymbol]
]

{ #category : #accessing }
SmaCCParser >> position [
	^currentToken isNil 
		ifTrue: [scanner position]
		ifFalse: [currentToken startPosition]
]

{ #category : #private }
SmaCCParser >> reduce: anInteger [ 
	| reduceEntry items size |
	reduceEntry := self reduceTable at: anInteger.
	items := OrderedCollection new: (size := reduceEntry at: 2).
	size timesRepeat: 
			[items addFirst: nodeStack removeLast.
			stateStack removeLast].
	nodeStack add: (self performReduceMethod: (reduceEntry at: 3) with: items).
	stateStack add: ((self actionFor: (reduceEntry at: 1)) bitShift: -2)
]

{ #category : #private }
SmaCCParser >> reduceAction [
	^2r10
]

{ #category : #private }
SmaCCParser >> reduceFor: aCollection [ 
	| newCollection item |
	(aCollection allSatisfy: [:each | each class ~~ OrderedCollection]) 
		ifTrue: [^aCollection].
	aCollection first class == OrderedCollection 
		ifTrue: 
			[newCollection := aCollection first.
			2 to: aCollection size
				do: 
					[:i | 
					item := aCollection at: i.
					item class = OrderedCollection 
						ifTrue: [newCollection addAll: item]
						ifFalse: [newCollection add: item]].
			^newCollection].
	newCollection := OrderedCollection new.
	aCollection do: 
			[:each | 
			each class == OrderedCollection 
				ifTrue: [newCollection addAll: each]
				ifFalse: [newCollection add: each]].
	^newCollection
]

{ #category : #accessing }
SmaCCParser >> reduceTable [
	^self subclassResponsibility
]

{ #category : #'private-error handling' }
SmaCCParser >> reportError: anInteger [ 
	self reportErrorMessage: (anInteger = 0 
				ifTrue: ['Token not expected']
				ifFalse: [self errorTable at: anInteger])
]

{ #category : #'private-error handling' }
SmaCCParser >> reportErrorMessage: aString [ 
	SmaCCParserError new 
		tag: self;
		signal: aString
]

{ #category : #accessing }
SmaCCParser >> scanner [
	^scanner
]

{ #category : #'initialize-release' }
SmaCCParser >> scanner: aScanner [ 
	scanner := aScanner
]

{ #category : #private }
SmaCCParser >> setDefaultStartingStateIfNone [
	stateStack isNil 
		ifTrue: [self setStartingState: self class defaultStartingState]
]

{ #category : #'initialize-release' }
SmaCCParser >> setStartingState: startingState [ 
	stateStack := OrderedCollection with: startingState
]

{ #category : #private }
SmaCCParser >> shift: stateIndex [ 
	stateStack add: stateIndex.
	nodeStack add: currentToken.
	currentToken := nil
]

{ #category : #private }
SmaCCParser >> shiftAction [
	^2r01
]

{ #category : #'standard reduction rules' }
SmaCCParser >> stringValue: anOrderedCollection [ 
	^anOrderedCollection first value
]

{ #category : #accessing }
SmaCCParser >> transitionTable [
	^self subclassResponsibility
]

{ #category : #'private-error handling' }
SmaCCParser >> willShift: potentialStateStack [ 
	| action compoundAction reduceEntry size |
	compoundAction := self actionForState: potentialStateStack last
				and: currentToken id first.
	action := compoundAction bitAnd: self actionMask.
	action == self shiftAction ifTrue: [^true].
	action == self reduceAction 
		ifTrue: 
			[reduceEntry := self reduceTable at: (compoundAction bitShift: -2).
			size := reduceEntry at: 2.
			size timesRepeat: [potentialStateStack removeLast].
			potentialStateStack 
				add: ((self actionForState: potentialStateStack last
						and: (reduceEntry at: 1)) bitShift: -2).
			^self willShift: potentialStateStack].
	^false
]
