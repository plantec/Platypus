"
Un exemple de commentaire
"
Class {
	#name : #PltDLinkedList,
	#superclass : #Object,
	#instVars : [
		'nodesList'
	],
	#category : #'Platypus-HW-tools'
}

{ #category : #examples }
PltDLinkedList class >> example1 [
	| dlist |
	dlist := self new.
	#(1 2 4 6 8) do: [:e | dlist add: (PltDNode data: e)].
	dlist explore
]

{ #category : #examples }
PltDLinkedList class >> example10 [
	| col |
	#(#PltDLinkedList #OrderedCollection) do: 
			[:classSymb | 
			col := (Smalltalk at: classSymb) new.
			(Association key: classSymb , ' 100000 add time'
				value: (Time 
						millisecondsToRun: [1 to: 100000 do: [:e | col add: (PltDNode data: e)]])) 
					explore].
	#(#PltDLinkedList #OrderedCollection) do: 
			[:classSymb | 
			col := (Smalltalk at: classSymb) new.
			1 to: 100000 do: [:e | col add: (PltDNode data: e)].
			(Association key: classSymb , ' 100000 remove first time'
				value: (Time 
						millisecondsToRun: [[col isEmpty] whileFalse: [col removeFirst]])) 
					explore]
]

{ #category : #examples }
PltDLinkedList class >> example11 [
	| col rnd |
	col := self new.
	rnd := Random new.
	1 to: 10000 do: [:i | col add: (PltDNode data: (rnd nextInt: 1000))].
	(col asSortedCollection: [:a :b | a data < b data]) explore.
	col explore
]

{ #category : #examples }
PltDLinkedList class >> example12 [
	| col rnd |
	col := self new.
	rnd := Random new.
	1 to: 10000 do: [:i | col add: (PltDNode data: (rnd nextInt: 1000))].
	col explore.
	(col sortBy: [:a :b | a data < b data]) explore
]

{ #category : #examples }
PltDLinkedList class >> example13 [
	| col1 col2 |
	col1 := self new.
	col2 := self new.
	1
		to: 3
		do: [:i | 
			col1
				add: (PltDNode data: i).
			col2
				add: (PltDNode data: i * 10)].
	^ col1 , col2
]

{ #category : #examples }
PltDLinkedList class >> example14 [
	| col1 col2 |
	col1 := self new.
	col2 := self new.
	1 to: 10
		do: 
			[:i | 
			col1 add: (PltDNode data: i).
			col2 add: (PltDNode data: i * 1000)].
	^col1 
		replaceFrom: 4
		to: 5
		with: col2
		startingAt: 2
]

{ #category : #examples }
PltDLinkedList class >> example15 [
	| col1 |
	col1 := self new.
	1 to: 10 do: [:i | col1 add: (PltDNode data: i)].
	^col1 copyFrom: 3 to: 6
]

{ #category : #examples }
PltDLinkedList class >> example2 [
	| dlist |
	dlist := self new.
	dlist
		addFirst: (PltDNode data: 'first1');
		addLast: (PltDNode data: 'last1');
		addFirst: (PltDNode data: 'first2');
		addLast: (PltDNode data: 'last2').
	dlist explore.
	dlist asArray explore.
	1 to: dlist size
		do: [:pos | (Association key: pos value: (dlist at: pos)) explore]
]

{ #category : #examples }
PltDLinkedList class >> example3 [
	| dlist |
	dlist := self new.
	#(1 2 3 4 5) do: [:e | dlist add: (PltDNode data: e)].
	1 to: dlist size
		do: [:pos | (Association key: pos value: (dlist at: pos)) explore]
]

{ #category : #examples }
PltDLinkedList class >> example4 [
	| dlist |
	dlist := self new.
	#(1 2 3 4 5) do: [:e | dlist add: (PltDNode data: e)].
	1 to: dlist size
		do: [:pos | dlist at: pos put: (PltDNode data: (dlist at: pos) data * 10)].
	dlist explore
]

{ #category : #examples }
PltDLinkedList class >> example5 [
	1 to: 4
		do: 
			[:n | 
			| dlist |
			dlist := self new.
			1 to: n do: [:e | dlist add: (PltDNode data: e)].
			1 to: dlist size * 2
				by: 2
				do: [:pos | dlist add: (PltDNode data: (dlist at: pos) data * 10) afterIndex: pos].
			(Association key: n value: dlist) explore]
]

{ #category : #examples }
PltDLinkedList class >> example6 [
	| dlist |
	dlist := self new.
	#(1 2 3 4 5) do: [:e | dlist add: (PltDNode data: e)].
	(dlist collect: [:e | e data * 10]) explore
]

{ #category : #examples }
PltDLinkedList class >> example7 [
	| dlist |
	dlist := self new.
	#(1 2 3 4 5) do: [:e | dlist add: (PltDNode data: e)].
	(dlist select: [:e | e data \\ 2 > 0]) explore
]

{ #category : #examples }
PltDLinkedList class >> example8 [
	| dlist |
	dlist := self new.
	#(1 2 3 4 5 )
		do: [:e | dlist
				add: (PltDNode data: e)].
	[dlist isEmpty]
		whileFalse: [dlist removeFirst].
	dlist inspect.
	dlist := self new.
	#(1 2 3 4 5 )
		do: [:e | dlist
				add: (PltDNode data: e)].
	[dlist isEmpty]
		whileFalse: [dlist removeLast].
	dlist inspect.
	dlist := self new.
	#(1 2 3 4 5 )
		do: [:e | dlist
				add: (PltDNode data: e)].
	[dlist size == 1]
		whileFalse: [dlist removeLast].
	dlist inspect.
	dlist := self new.
	dlist inspect
]

{ #category : #examples }
PltDLinkedList class >> example9 [
	| dlist dlist2 |
	dlist := self new.
	dlist2 := dlist copyEmpty.
	#(1 2 3 4 5) do: [:e | dlist add: (PltDNode data: e)].
	dlist reverseDo: [:e | dlist2 add: (PltDNode data: e data)].
	dlist explore.
	dlist2 explore
]

{ #category : #'instance creation' }
PltDLinkedList class >> new: aSize [
	^ self new

]

{ #category : #'instance creation' }
PltDLinkedList class >> nodesList: anOrderedCollectionOfNodes [ 
	^ self new nodesList: anOrderedCollectionOfNodes 
]

{ #category : #adding }
PltDLinkedList >> add: data [ 
	^self addLast: data.
	
]

{ #category : #adding }
PltDLinkedList >> addAll: anotherList [ 
	| oldLast otherFirst |
	oldLast := self last.
	otherFirst := anotherList first.
	nodesList addAll: anotherList.
	otherFirst ifNotNil: [otherFirst previous: oldLast].
	oldLast
		ifNotNil: [oldLast next: otherFirst]
]

{ #category : #adding }
PltDLinkedList >> addAll: anotherList beforeIndex: index [ 
	| oldAtIndex |
	(index > self size
			or: [self isEmpty])
		ifTrue: [self addAll: anotherList] 
		ifFalse: [index <= 1
				ifTrue: [self addAllFirst: anotherList]
				ifFalse: [oldAtIndex := self at: index.
					anotherList last next: oldAtIndex.
					oldAtIndex previous
						ifNotNil: [oldAtIndex previous next: anotherList first].
					anotherList first previous: oldAtIndex previous.
					oldAtIndex previous: anotherList last.
					anotherList
						reverseDo: [:n | nodesList add: n beforeIndex: index]]]
]

{ #category : #adding }
PltDLinkedList >> addAllFirst: anotherList [ 
	| oldFirst otherLast |
	oldFirst := self first.
	otherLast := anotherList last.
	nodesList addAllFirst: anotherList.
	otherLast
		ifNotNil: [otherLast next: oldFirst].
	oldFirst
		ifNotNil: [oldFirst previous: otherLast]
]

{ #category : #adding }
PltDLinkedList >> addFirst: data [ 
	| oldSize next |
	oldSize := self size.
	nodesList addFirst: data.
	oldSize > 0 ifTrue: [
		data next: (next := nodesList at: 2).
		next previous: data.
		data previous: nil]
	ifFalse: [
		data next: nil.
		data previous: nil
		]
	
]

{ #category : #adding }
PltDLinkedList >> addLast: data [ 
	| oldSize prev |
	oldSize := self size.
	nodesList addLast: data.
	oldSize > 0
		ifTrue: [data previous: (prev := nodesList at: oldSize).
			prev next: data.
			data next: nil]
		ifFalse: [data next: nil.
			data previous: nil]
]

{ #category : #accessing }
PltDLinkedList >> at: pos [ 
	^ nodesList at: pos
]

{ #category : #accessing }
PltDLinkedList >> at: pos put: data [ 
	| added prev next |
	nodesList at: pos put: data.
	added := nodesList at: pos.
	pos > 1
		ifTrue: [added previous: (prev := nodesList at: pos - 1).
			prev next: added]
		ifFalse: [added previous: nil].
	pos < self size
		ifTrue: [added next: (next := nodesList at: pos + 1).
			next previous: added]
		ifFalse: [added next: nil]
]

{ #category : #enumerating }
PltDLinkedList >> collect: aBlock [ 
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each copy)].
	^ newCollection
]

{ #category : #copying }
PltDLinkedList >> copy [
	^ Error signal: 'a ' , self class name , ' can''t be copied'
]

{ #category : #copying }
PltDLinkedList >> copyEmpty [
	"Answer a copy of the receiver without any of the receiver's 
	elements. "
	^ self class new
]

{ #category : #copying }
PltDLinkedList >> copyReplaceFrom: start to: stop with: replacementList [ 
	| newLinkedList |
	newLinkedList := nodesList
				collect: [:n | n copy].
	newLinkedList
		replaceFrom: start
		to: stop
		with: replacementList.
	^ newLinkedList
]

{ #category : #'initialize/release' }
PltDLinkedList >> destroy [
	self do: [:node | node destroy].
	super destroy
]

{ #category : #enumerating }
PltDLinkedList >> detect: aBlock [ 
	^ nodesList
		detect: aBlock
		ifNone: []
]

{ #category : #enumerating }
PltDLinkedList >> detect: aBlock ifNone: noneBlock [
	^ nodesList
		detect: aBlock
		ifNone: noneBlock
]

{ #category : #enumerating }
PltDLinkedList >> do: aBlock [ 
nodesList do: aBlock
]

{ #category : #accessing }
PltDLinkedList >> first [
	^ nodesList ifEmpty: [nil] ifNotEmpty: [:l | l first]
]

{ #category : #accessing }
PltDLinkedList >> head [
	^ nodesList first
]

{ #category : #accessing }
PltDLinkedList >> indexOf: aNode [
	^ nodesList indexOf: aNode
]

{ #category : #'initialize/release' }
PltDLinkedList >> initialize [
	super initialize.
	nodesList := OrderedCollection new
]

{ #category : #testing }
PltDLinkedList >> isEmpty [
	^ nodesList isEmpty
]

{ #category : #accessing }
PltDLinkedList >> last [
	^ nodesList ifEmpty: [nil] ifNotEmpty: [:l | l last]
]

{ #category : #'private accessing' }
PltDLinkedList >> nodesList: anOrderedCollectionOfNodes [
	nodesList := anOrderedCollectionOfNodes
]

{ #category : #removing }
PltDLinkedList >> remove: data ifAbsent: aBlock [ 
	nodesList remove: data ifAbsent: [ aBlock value. ^ nil].
	data previous
	ifNotNil: [data previous next: data next].
	data next ifNotNil: [data next previous: data previous].
	^ data
]

{ #category : #removing }
PltDLinkedList >> removeFirst [
	| res first |
	nodesList notEmpty
		ifTrue: [res := nodesList removeFirst.
			nodesList notEmpty ifTrue: [(first := self first)
				ifNotNil: [first previous: nil]]].
	^ res
]

{ #category : #removing }
PltDLinkedList >> removeLast [
	| res last |
	nodesList isEmpty ifFalse: [
	res := nodesList removeLast. nodesList isEmpty ifFalse: 
	[(last := self last)
		ifNotNil: [last next: nil]]].
	^ res
]

{ #category : #removing }
PltDLinkedList >> replaceFrom: start to: stop with: replacementList [ 
	| endReplacement firstNode prevNode lastNode nextNode |
	endReplacement := start - 1 + replacementList size.
		start
		to: stop
		do: [:p | (nodesList at: p) destroy].

	nodesList := nodesList
				copyReplaceFrom: start
				to: stop
				with: replacementList.
	nodesList isEmpty
		ifFalse: [(start < self size
					and: [start > 0])
				ifTrue: [firstNode := nodesList at: start.
					start > 1
						ifTrue: [firstNode previous: (prevNode := nodesList at: start - 1).
							prevNode next: firstNode]
						ifFalse: [firstNode previous: nil]].
			endReplacement > 0
				ifFalse: [endReplacement := self size].
			lastNode := nodesList at: endReplacement.
			endReplacement < self size
				ifTrue: [lastNode next: (nextNode := nodesList at: endReplacement + 1).
					nextNode previous: lastNode]
				ifFalse: [lastNode next: nil]]
]

{ #category : #removing }
PltDLinkedList >> replaceFromNode: startNode toNode: stopNode with: replacementList [ 
	| start stop |
	start := self indexOf: startNode.
	stop := self indexOf: stopNode.
	self
		replaceFrom: start
		to: stop
		with: replacementList
]

{ #category : #'initialize/release' }
PltDLinkedList >> reset [
	self initialize
]

{ #category : #enumerating }
PltDLinkedList >> reverseDo: aBlock [ 
	nodesList reverseDo: aBlock
]

{ #category : #enumerating }
PltDLinkedList >> select: aBlock [ 
	| newCollection |
	newCollection := self species new.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each copy]].
	^newCollection
]

{ #category : #accessing }
PltDLinkedList >> size [
	^ nodesList size
]

{ #category : #copying }
PltDLinkedList >> sortBy: aBlock [ 
	"Create a copy that is sorted. Sort criteria is the block that 
	accepts two arguments. 
	When the block is true, the first arg goes first ([:a :b | a > b] 
	sorts in descending order)."
	| cpy |
	cpy := self copyEmpty.
	cpy addAll: (self asSortedCollection: aBlock).
	^cpy
]

{ #category : #accessing }
PltDLinkedList >> tail [
	^ nodesList last
]
