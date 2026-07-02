"
SmaCCCharacterRENode represents a regular expression that matches one of a set of characters.

Instance Variables:
	characters	<SortedCollection of: Character>	The characters that this node can accept. Note that there are no duplicates and all characters are sorted.


"
Class {
	#name : #SmaCCCharacterRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'characters'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #'instance creation' }
SmaCCCharacterRENode class >> characters: aString [ 
	^(self new)
		characters: (self sortedCharactersFor: aString);
		yourself
]

{ #category : #private }
SmaCCCharacterRENode class >> sortedCharactersFor: aString [ 
	| characters stream |
	stream := WriteStream with: String new.
	SmaCCGrammar ignoreCase 
		ifTrue: 
			[aString do: 
					[:each | 
					stream
						nextPut: each asUppercase;
						nextPut: each asLowercase]]
		ifFalse: [stream nextPutAll: aString].
	characters := stream contents 
				asSortedCollection: [:a :b | a asInteger < b asInteger].
	stream := WriteStream with: String new.
	characters inject: nil
		into: 
			[:sum :each | 
			sum = each ifFalse: [stream nextPut: each].
			each].
	^stream contents
]

{ #category : #private }
SmaCCCharacterRENode >> asNFAStartingWith: aSmaCCNode [ 
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	startNode addEdgeTo: endNode onCharacters: characters.
	^endNode
]

{ #category : #testing }
SmaCCCharacterRENode >> canMergeWith: aSmaCCRegularExpressionNode [ 
	^self class = aSmaCCRegularExpressionNode class and: 
			[characters notNil and: 
					[aSmaCCRegularExpressionNode characters notNil 
						and: [self action = aSmaCCRegularExpressionNode action]]]
]

{ #category : #private }
SmaCCCharacterRENode >> characters [
	^characters
]

{ #category : #'initialize-release' }
SmaCCCharacterRENode >> characters: aString [ 
	characters := aString
]

{ #category : #private }
SmaCCCharacterRENode >> matchingCharacters [
	^SmaCCGrammar ignoreCase 
		ifTrue: [characters reject: [:each | each isLowercase]]
		ifFalse: [characters]
]

{ #category : #private }
SmaCCCharacterRENode >> possibleMatchesDo: aBlock on: aStream [ 
	self matchingCharacters do: 
			[:each | 
			aStream nextPut: each.
			aBlock value.
			aStream skip: -1]
]

{ #category : #accessing }
SmaCCCharacterRENode >> possibleMatchesSize [
	^self matchingCharacters size
]

{ #category : #printing }
SmaCCCharacterRENode >> printCharacter: aCharacter on: aStream [ 
	(aCharacter asInteger between: 32 and: 126) 
		ifTrue: [^aStream nextPut: aCharacter].
	aStream nextPutAll: '\x'.
	aStream nextPutAll: (aCharacter asInteger
		printPaddedWith: $0 to: 2 base: 16)
]

{ #category : #printing }
SmaCCCharacterRENode >> printOn: aStream [ 
	| allCharacters |
	characters size = 1 
		ifTrue: [^self printCharacter: characters first on: aStream].
	aStream nextPut: $[.
	allCharacters := characters.
	characters size > 128 
		ifTrue: 
			[aStream nextPut: $^.
			allCharacters := ((0 to: SmaCCGrammar maximumCharacterValue) 
						collect: [:each | Character value: each]) 
							reject: [:each | characters includes: each]].
	allCharacters do: [:each | self printCharacter: each on: aStream].
	aStream nextPut: $]
]

{ #category : #accessing }
SmaCCCharacterRENode >> | aSmaCCRegularExpressionNode [ 
	(self canMergeWith: aSmaCCRegularExpressionNode) 
		ifFalse: [^super | aSmaCCRegularExpressionNode].
	characters := String 
				withAll: ((characters , aSmaCCRegularExpressionNode characters) asSet 
						asSortedCollection: [:a :b | a asInteger < b asInteger]).
	^self
]
