"
SmaCCCharacterEdge is a SmaCCEdge for Character transitions
"
Class {
	#name : #SmaCCCharacterEdge,
	#superclass : #SmaCCEdge,
	#classVars : [
		'IsExpressions'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'class initialization' }
SmaCCCharacterEdge class >> generateCharacterSetFor: aSelector [ 
	| stream |
	stream := WriteStream with: String new.
	0 to: SmaCCGrammar maximumCharacterValue
		do: 
			[:i | 
			| ch |
			ch := Character value: i.
			(ch perform: aSelector) ifTrue: [stream nextPut: ch]].
	^stream contents
]

{ #category : #'class initialization' }
SmaCCCharacterEdge class >> initializeIsExpressions [
	"Creates a map from sets of characters to selectors that start with 'is' on Character. This allows generated scanners to take
	full advantage of selectors that are already implemented on Character"

	IsExpressions := Dictionary new.
	"selectors := Character selectors select: 
					[:each | 
					('is*' match: each) 
						and: [each numArgs = 0 and: [(each at: 3) isUppercase]]].
	selectors do: 
			[:sel | 
			| string |
			string := self generateCharacterSetFor: sel.
			string isEmpty ifFalse: [IsExpressions at: string put: sel]]"
]

{ #category : #comparing }
SmaCCCharacterEdge >> <= aSmaCCEdge [ 
	^self class = aSmaCCEdge class 
		and: [self transitionObjects <= aSmaCCEdge transitionObjects]
]

{ #category : #compiling }
SmaCCCharacterEdge >> closestIsExpression [
	"Attempts to find the #is selector that most closely matches the character set that this edge transitions on."

	| expressions closest |
	expressions := IsExpressions keys 
				select: [:each | each allSatisfy: [:ch | self includes: ch]].
	expressions isEmpty ifTrue: [^nil].
	closest := IsExpressions 
				at: (expressions asSortedCollection: [:a :b | a size > b size]) first.
	(self minMaxPairsWithout: closest) size 
		<= (self minMaxPairsWithout: nil) size ifFalse: [^nil].
	^closest
]

{ #category : #private }
SmaCCCharacterEdge >> does: aSequenceableCollection include: anObject [ 
	| start stop mid |
	(anObject isKindOf: Character) ifFalse: [^false].
	start := 1.
	stop := aSequenceableCollection size.
	stop = 0 ifTrue: [^false].
	
	[mid := (start + stop) // 2.
	mid = start] whileFalse: 
				[(aSequenceableCollection at: mid) asInteger < anObject asInteger 
					ifTrue: [start := mid]
					ifFalse: [stop := mid]].
	^(aSequenceableCollection at: start) = anObject 
		or: [(aSequenceableCollection at: stop) = anObject]
]

{ #category : #compiling }
SmaCCCharacterEdge >> edgeFrequencyUsingTable: frequencyTable [ 
	^self transitionObjects inject: 0
		into: [:sum :each | sum + (frequencyTable at: each asInteger \\ frequencyTable size + 1)]
]

{ #category : #printing }
SmaCCCharacterEdge >> edgeLabel [
	^transitionObjects
]

{ #category : #compiling }
SmaCCCharacterEdge >> expression [
	| stream isSelector |
	stream := WriteStream with: String new.
	stream nextPut: $(.
	transitionObjects size = SmaCCGrammar maximumCharacterValue 
		ifTrue: [self outputInvertedMatchOn: stream]
		ifFalse: 
			[isSelector := self outputClosestIsMethodOn: stream.
			self outputExpressionOn: stream without: isSelector].
	stream nextPut: $).
	^stream contents
]

{ #category : #testing }
SmaCCCharacterEdge >> isCharacterTransition [
	^true
]

{ #category : #accessing }
SmaCCCharacterEdge >> mergeWith: aSmaCCEdge [ 
	super mergeWith: aSmaCCEdge.
	transitionObjects := String withAll: (transitionObjects 
						asSortedCollection: [:a :b | a asInteger < b asInteger])
]

{ #category : #compiling }
SmaCCCharacterEdge >> minMaxPairsWithout: aSelector [ 
	"Converts a list of characters into a collection of pairs representing the minimum and maximum of each sequence.
	The list is first filtered to include only those characters that fail aSelector."

	| start last pairs charsLeft |
	charsLeft := aSelector isNil 
				ifTrue: [transitionObjects]
				ifFalse: [transitionObjects reject: [:ch | ch perform: aSelector]].
	pairs := OrderedCollection new.
	charsLeft isEmpty ifTrue: [^pairs].
	last := charsLeft first.
	start := nil.
	charsLeft do: 
			[:each | 
			last asInteger + 1 = each asInteger 
				ifFalse: 
					[start notNil ifTrue: [pairs add: (Array with: start with: last)].
					start := each].
			last := each].
	pairs add: (Array with: start with: last).
	^pairs
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputClosestIsMethodOn: aStream [ 
	| expr |
	expr := self closestIsExpression.
	expr isNil ifFalse: [aStream nextPutAll: 'currentCharacter ' , expr].
	^expr
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputExpressionFor: aPair on: aStream [ 
	aPair first = aPair last 
		ifTrue: [^self outputMatchSingleCharacter: aPair first on: aStream].
	aPair first = (Character value: 0) 
		ifTrue: [^self outputMatchLessThan: aPair last on: aStream].
	aPair last = (Character value: SmaCCGrammar maximumCharacterValue) 
		ifTrue: [^self outputMatchGreaterThan: aPair first on: aStream].
	self outputMatchRange: aPair on: aStream
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputExpressionOn: aStream without: aSelector [ 
	| pairs |
	pairs := self minMaxPairsWithout: aSelector.
	pairs isEmpty ifTrue: [^self].
	aSelector notNil ifTrue: [aStream nextPutAll: ' or: ['].
	pairs do: [:each | self outputExpressionFor: each on: aStream]
		separatedBy: [aStream nextPutAll: ' or: ['].
	aStream next: pairs size - 1 put: $].
	aSelector notNil ifTrue: [aStream nextPut: $]]
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputInvertedMatchOn: aStream [ 
	| char |
	char := Character value: ((0 to: SmaCCGrammar maximumCharacterValue) 
						detect: [:each | (transitionObjects includes: (Character value: each)) not]).
	aStream
		nextPutAll: 'currentCharacter ~= ';
		nextPutAll: char storeString
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputMatchGreaterThan: aCharacter on: aStream [ 
	aStream
		nextPutAll: 'currentCharacter >= ';
		nextPutAll: aCharacter storeString
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputMatchLessThan: aCharacter on: aStream [ 
	aStream
		nextPutAll: 'currentCharacter <= ';
		nextPutAll: aCharacter storeString
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputMatchRange: aPair on: aStream [ 
	aStream
		nextPutAll: '(currentCharacter between: ';
		nextPutAll: aPair first storeString;
		nextPutAll: ' and: ';
		nextPutAll: aPair last storeString;
		nextPutAll: ')'
]

{ #category : #compiling }
SmaCCCharacterEdge >> outputMatchSingleCharacter: aCharacter on: aStream [ 
	aStream
		nextPutAll: 'currentCharacter = ';
		nextPutAll: aCharacter storeString
]
