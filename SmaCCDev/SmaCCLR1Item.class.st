"
SmaCCLR1Item represents an item in a SmaCCItemSet.

Instance Variables:
	followers	<SmaCCSymbolSet>	all possible symbols that can follow this production in this state
	location	<Integer>	the position in the rhs of the production we are at
	rhs	<SmaCCRHS>	the rhs of the production
	symbol	<SmaCCSymbol>	the symbol for the production
"
Class {
	#name : #SmaCCLR1Item,
	#superclass : #Object,
	#instVars : [
		'rhs',
		'symbol',
		'location',
		'followers'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'instance creation' }
SmaCCLR1Item class >> symbol: aSmaCCSymbol rhs: aSmaCCRHS follow: aSmaCCSymbolCollection [ 
	^(self new)
		symbol: aSmaCCSymbol
			rhs: aSmaCCRHS
			follow: aSmaCCSymbolCollection;
		yourself
]

{ #category : #comparing }
SmaCCLR1Item >> = aSmaCCLR1Item [ 
	^self class == aSmaCCLR1Item class and: 
			[location = aSmaCCLR1Item location 
				and: [rhs == aSmaCCLR1Item rhs and: [symbol == aSmaCCLR1Item symbol]]]
]

{ #category : #accessing }
SmaCCLR1Item >> action: aSmaCCSymbol [ 
	location > rhs size 
		ifTrue: 
			[(symbol isStartingSymbol and: [aSmaCCSymbol isEmptySymbol]) 
				ifTrue: [^SmaCCAcceptAction new].
			(followers includes: aSmaCCSymbol) 
				ifTrue: [^SmaCCReduceAction symbol: symbol rhs: rhs]]
		ifFalse: [(rhs at: location) = aSmaCCSymbol ifTrue: [^SmaCCShiftAction new]].
	^SmaCCRejectAction new
]

{ #category : #accessing }
SmaCCLR1Item >> followers [
	^followers
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> followers: aSmaCCSymbolSet [ 
	followers := aSmaCCSymbolSet
]

{ #category : #comparing }
SmaCCLR1Item >> hash [
	^(symbol identityHash bitXor: (location bitShift: 14)) 
		bitXor: rhs identityHash
]

{ #category : #testing }
SmaCCLR1Item >> isLR1EqualTo: aSmaCCLR1Item [ 
	^self followers size = aSmaCCLR1Item followers size 
		and: [self followers allSatisfy: [:each | aSmaCCLR1Item followers includes: each]]
]

{ #category : #private }
SmaCCLR1Item >> location [
	^location
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> location: anInteger [ 
	location := anInteger
]

{ #category : #accessing }
SmaCCLR1Item >> mergeWith: aSmaCCLR1Item [ 
	followers mergeWith: aSmaCCLR1Item followers
]

{ #category : #accessing }
SmaCCLR1Item >> moveNext [
	^(self copy)
		followers: (followers class basedOn: followers);
		location: location + 1;
		yourself
]

{ #category : #accessing }
SmaCCLR1Item >> nextSymbol [
	^location > rhs size 
		ifTrue: [SmaCCSymbol sentinel]
		ifFalse: [rhs at: location]
]

{ #category : #accessing }
SmaCCLR1Item >> precedence [
	"If we don't have a precedence, then assume we are the lowest precedence (which will cause a shift action)."

	| max |
	max := -1.
	rhs do: [:each | max := max max: (each precedence ifNil: [max])].
	^max
]

{ #category : #printing }
SmaCCLR1Item >> printOn: aStream [ 
	| i |
	aStream
		nextPut: $[;
		nextPutAll: symbol printString;
		nextPutAll: ' :'.
	i := 1.
	rhs do: 
			[:each | 
			i = location ifTrue: [aStream nextPutAll: ' . '].
			aStream
				space;
				nextPutAll: each printString.
			i := i + 1].
	location > rhs size ifTrue: [aStream nextPutAll: ' . '].
	aStream nextPut: $;.
	followers printOn: aStream.
	aStream nextPut: $]
]

{ #category : #accessing }
SmaCCLR1Item >> rest [
	| newRHS |
	newRHS := SmaCCRHS new.
	location + 1 to: rhs size do: [:each | newRHS add: (rhs at: each)].
	^newRHS
]

{ #category : #private }
SmaCCLR1Item >> rhs [
	^rhs
]

{ #category : #private }
SmaCCLR1Item >> symbol [
	^symbol
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> symbol: aSmaCCSymbol rhs: aSmaCCRHS follow: aSmaCCSymbolCollection [ 
	symbol := aSmaCCSymbol.
	rhs := aSmaCCRHS.
	location := 1.
	followers := aSmaCCSymbolCollection
]
