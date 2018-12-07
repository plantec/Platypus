Class {
	#name : #PlatypusTokenList,
	#superclass : #Object,
	#instVars : [
		'tokens'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusTokenList class >> tokens: aDLinkedList [
	^ self new tokens: aDLinkedList
]

{ #category : #adding }
PlatypusTokenList >> add: aToken [ 
	tokens
		add: aToken
]

{ #category : #adding }
PlatypusTokenList >> addAll: anotherTokenList [ 
	^ tokens addAll: anotherTokenList tokens
]

{ #category : #adding }
PlatypusTokenList >> addAll: anotherList before: oldObject [ 
	^ tokens addAll: anotherList beforeIndex: (tokens indexOf: oldObject)
]

{ #category : #adding }
PlatypusTokenList >> addFirst: aToken [ 
	tokens addFirst: aToken
]

{ #category : #converting }
PlatypusTokenList >> asArray [
	^ self tokens asArray
]

{ #category : #accessing }
PlatypusTokenList >> at: pos [

	^ tokens at: pos
]

{ #category : #accessing }
PlatypusTokenList >> beginningOfLineFrom: aNode [ 
	| currNode whiteSpaceTouched |
	aNode isNil
		ifTrue: [^ self first].
	currNode := aNode.
	whiteSpaceTouched := false.
	[currNode notNil]
		whileTrue: [currNode isEol
				ifTrue: [^ currNode next
						ifNil: [currNode]].
			currNode isSemicolon ifTrue: [^  currNode next].
			(currNode isBlank 
					and: [currNode isRemark not])
				ifTrue: [whiteSpaceTouched := true]
				ifFalse: [whiteSpaceTouched
						ifTrue: [currNode isBlank
								ifFalse: [^ currNode next]]].
			currNode := currNode previous].
	^ aNode
]

{ #category : #updating }
PlatypusTokenList >> calculate [
	^ self
]

{ #category : #accessing }
PlatypusTokenList >> closeTokenFrom: aNode [ 
	| currLevel curr |
	currLevel := 0.
	curr := aNode.
	curr notNil
		ifTrue: [[curr isOpenKeyword
				ifTrue: [currLevel := currLevel + 1]
				ifFalse: [curr isCloseKeyword
						ifTrue: [currLevel := currLevel - 1]].
			currLevel == 0
				ifTrue: [^ curr].
			curr := curr next.
			curr isNil
				ifTrue: [^ curr]] repeat].
	^ nil
]

{ #category : #enumerating }
PlatypusTokenList >> collect: aBlock [ 
	^ self class tokens: (tokens collect: aBlock)
]

{ #category : #copying }
PlatypusTokenList >> copy [
	^ Error signal: 'a ' , self class name , ' can''t be copied'
]

{ #category : #copying }
PlatypusTokenList >> copyEmpty [
	^ self class new 
]

{ #category : #copying }
PlatypusTokenList >> copyWithoutBlankFrom: startNode to: stopNode [ 
	| selection node |
	selection := self copyEmpty.
	node := startNode isNil
				ifTrue: [self first]
				ifFalse: [startNode].
	[node isNil
		ifTrue: [^ selection].
	node == stopNode
		ifTrue: [selection add: node copy.
			^ selection].
	node  isBlank
		ifFalse: [selection add: node copy].
	node := node next] repeat
]

{ #category : #'initialize/release' }
PlatypusTokenList >> destroy [
	self tokens destroy.
	super destroy
]

{ #category : #enumerating }
PlatypusTokenList >> detect: aBlock [ 
	^ tokens detect: aBlock ifNone: []
]

{ #category : #enumerating }
PlatypusTokenList >> detect: aBlock ifNone: noneBlock [
	^ tokens detect: aBlock ifNone: noneBlock
]

{ #category : #enumerating }
PlatypusTokenList >> do: aBlock [ 
	^ tokens do: aBlock
]

{ #category : #enumerating }
PlatypusTokenList >> do: aBlock from: startNode to: stopNode [ 
	| currNode endNode |
	currNode := startNode.
	endNode := stopNode.
	[currNode ~~ endNode and: [currNode notNil]]
		whileTrue: [aBlock value: currNode.
			currNode := currNode ifNotNil: [currNode next]].
	endNode notNil
		ifTrue: [aBlock value: endNode]
]

{ #category : #accessing }
PlatypusTokenList >> endOfLineFrom: aNode [ 
	| currNode whiteSpaceTouched prev |
	aNode isNil
		ifTrue: [^ self last].
	currNode := aNode.
	whiteSpaceTouched := false.
	[currNode notNil]
		whileTrue: [currNode isEol
				ifTrue: [^ currNode previous
						ifNil: [currNode]].
			currNode isSemicolon
				ifTrue: [^ currNode ].

			(currNode isBlank
					and: [currNode isRemark not])
				ifTrue: [whiteSpaceTouched := true]
				ifFalse: [whiteSpaceTouched
						ifTrue: [currNode isBlank
								ifFalse: [^ currNode previous]]].
			prev := currNode.
			currNode := currNode next].
	^ prev
]

{ #category : #accessing }
PlatypusTokenList >> first [
	^ tokens isEmpty ifTrue: [nil]
	ifFalse: [tokens first]
]

{ #category : #accessing }
PlatypusTokenList >> indexOf: aNode [
	^ tokens indexOf: aNode
]

{ #category : #'initialize/release' }
PlatypusTokenList >> initialize [
	super initialize.
	tokens := PltDLinkedList new
]

{ #category : #testing }
PlatypusTokenList >> isEmpty [
	^tokens isEmpty
]

{ #category : #accessing }
PlatypusTokenList >> last [
	^ tokens isEmpty
		ifFalse: [tokens last]
]

{ #category : #accessing }
PlatypusTokenList >> nextFrom: aNode satisfying: aBlock [ 
	| currNode |
	currNode := aNode.
	[currNode notNil]
		whileTrue: [(aBlock value: currNode)
				ifTrue: [^ currNode].
			currNode := currNode next].
	^ nil
]

{ #category : #accessing }
PlatypusTokenList >> nextNonBlankFrom: aNode [ 
^ self
		nextFrom: aNode
		satisfying: [:n | (n isBlank
				or: [n isRemark]) not]

]

{ #category : #accessing }
PlatypusTokenList >> nextOpenKeywordFrom: aNode [ 
	| currNode |
	currNode := aNode.
	[currNode notNil]
		whileTrue: [currNode isOpenKeyword
				ifTrue: [^ currNode].
			currNode := currNode next].
	^ nil
]

{ #category : #updating }
PlatypusTokenList >> noEndingEol [
	[self last notNil
		and: [self last isEol]]
		whileTrue: [self removeLast].

]

{ #category : #testing }
PlatypusTokenList >> notEmpty [
	^ self isEmpty not
]

{ #category : #updating }
PlatypusTokenList >> onlyOneEndingEol [
	self noEndingEol .
	self last
		ifNotNil: [self add: PlatypusEolToken new]
]

{ #category : #accessing }
PlatypusTokenList >> previousCloseKeywordFrom: aNode [ 
	^ self
		previousFrom: aNode
		satisfying: [:n | n isCloseKeyword]

]

{ #category : #accessing }
PlatypusTokenList >> previousFrom: aNode satisfying: aBlock [ 
	| currNode |
	currNode := aNode.
	[currNode notNil]
		whileTrue: [(aBlock value: currNode)
				ifTrue: [^ currNode].
			currNode := currNode previous].
	^ nil
]

{ #category : #accessing }
PlatypusTokenList >> previousKeywordFrom: aNode [ 
	^ self previousFrom: aNode satisfying: [:n | n isKeyword]

]

{ #category : #accessing }
PlatypusTokenList >> previousNonBlankFrom: aNode [ 
	^ self
		previousFrom: aNode
		satisfying: [:n | n isBlank not]	
]

{ #category : #accessing }
PlatypusTokenList >> previousOpenKeywordFrom: aNode [ 
	^ self
		previousFrom: aNode
		satisfying: [:n | n isOpenKeyword]

]

{ #category : #accessing }
PlatypusTokenList >> previousPrimaryElementCloseKeywordFrom: aNode [ 
	^ self
		previousFrom: aNode
		satisfying: [:n | n isPrimaryElementCloseKeyword]
]

{ #category : #accessing }
PlatypusTokenList >> previousPrimaryElementOpenKeywordFrom: aNode [ 
	^ self
		previousFrom: aNode
		satisfying: [:n | n isPrimaryElementOpenKeyword]

]

{ #category : #removing }
PlatypusTokenList >> removeFrom: firstNode to: lastNode [ 
	^ tokens
		replaceFromNode: firstNode
		toNode: lastNode
		with: self copyEmpty
]

{ #category : #removing }
PlatypusTokenList >> removeLast [
	^ tokens removeLast
	
]

{ #category : #removing }
PlatypusTokenList >> replaceFromNode: startNode toNode: stopNode with: replacementList [ 
	startNode ifNil: [self addAll: replacementList]
	ifNotNil: [
	tokens
		replaceFromNode: startNode
		toNode: stopNode
		with: replacementList]
]

{ #category : #enumerating }
PlatypusTokenList >> reverseDo: aBlock [ 
	^ tokens reverseDo: aBlock
]

{ #category : #enumerating }
PlatypusTokenList >> select: aBlock [ 
	^ self class tokens: (tokens select: aBlock)
]

{ #category : #accessing }
PlatypusTokenList >> size [
	^ tokens size
]

{ #category : #accessing }
PlatypusTokenList >> sizeFrom: first to: last [ 
	| currNode count |
	currNode := first.
	count := 0.
	[currNode ~= last and: [currNode notNil]]
		whileTrue: [count := count + 1.
			currNode := currNode next].
	^ count
]

{ #category : #printing }
PlatypusTokenList >> textWithStreamClass: aStreamClass [
	^ self
		textWithStreamClass: aStreamClass
		from: self first
		to: nil
]

{ #category : #printing }
PlatypusTokenList >> textWithStreamClass: aStreamClass from: startNode to: stopNode [ 
	| stream result |
	stream := aStreamClass on: Text new.
	result := PlatypusCodeStream on: Text new.
	self
		do: [:d | 
			stream nextPutAll: d asString.
			result nextPutAll: stream originalContents endingAt: stream position.
			stream reset]
		from: startNode
		to: stopNode.
	stream close.
	result close.
	^ result contents
]

{ #category : #accessing }
PlatypusTokenList >> tokens [
	^tokens
]

{ #category : #accessing }
PlatypusTokenList >> tokens: aCollection [ 
	tokens := aCollection.

]

{ #category : #updating }
PlatypusTokenList >> updateAllTokensPositions [
	| startPos |
	startPos := 1.
	self
		do: [:tok | startPos := tok stopPosWithStart: startPos]

]

{ #category : #printing }
PlatypusTokenList >> writeOn: aStream [
	^self writeOn: aStream from: self first to: nil

]

{ #category : #printing }
PlatypusTokenList >> writeOn: aStream from: startNode to: stopNode [ 
	self
		do: [:d | aStream nextPutAll: d asString]
		from: startNode
		to: stopNode.
	^ aStream contents
]
