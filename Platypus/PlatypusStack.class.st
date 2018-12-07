Class {
	#name : #PlatypusStack,
	#superclass : #Object,
	#instVars : [
		'stack',
		'stackp'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusStack >> asArray [
	| arr |
	arr := Array new: stackp.
	1
		to: stackp
		do: [:p | arr
				at: p
				put: (stack at: p)].
	^ arr
]

{ #category : #accessing }
PlatypusStack >> at: pos [
	^ stack at: pos
]

{ #category : #enumerating }
PlatypusStack >> collect: aBlock [ 
	| newCollection |
	newCollection := OrderedCollection new: self size.
	self
		do: [:each | newCollection
				add: (aBlock value: each)].
	^ newCollection
]

{ #category : #enumerating }
PlatypusStack >> collectWithIndex: aBlock [
	^stack asOrderedCollection collectWithIndex: aBlock
]

{ #category : #'initialize/release' }
PlatypusStack >> destroy [
	super destroy.
	stack := nil
]

{ #category : #enumerating }
PlatypusStack >> do: aBlock [
	1 to: stackp do: [:p | aBlock value: (stack at: p)]
]

{ #category : #accessing }
PlatypusStack >> first [
	^ stack first
]

{ #category : #accessing }
PlatypusStack >> grow [
	| newStack |
	newStack := Array
				new: stack size + self growSize.
	newStack
		replaceFrom: 1
		to: stack size
		with: stack
		startingAt: 1.
	stack := newStack
]

{ #category : #accessing }
PlatypusStack >> growSize [
	"Return the size by which the receiver should grow if there are no 
	empty slots left."
	^ stack size max: 2
]

{ #category : #'initialize/release' }
PlatypusStack >> initialize [
	super initialize.
	stack := Array new: 100.
	stackp := 0
]

{ #category : #accessing }
PlatypusStack >> isEmpty [
	^ self size = 0
]

{ #category : #accessing }
PlatypusStack >> notEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
PlatypusStack >> pop [
	| val |
	val := stack at: stackp.
	stackp := stackp - 1.
	^ val
]

{ #category : #copying }
PlatypusStack >> postCopy [
	| cpy |
	cpy := super postCopy.
	cpy privateStack: stack copy.
	cpy privateStackp: stackp copy.
	^ cpy
]

{ #category : #accessing }
PlatypusStack >> privateStack: aCollection [ 
	stack := aCollection
]

{ #category : #accessing }
PlatypusStack >> privateStackp: anInteger [
	stackp := anInteger
]

{ #category : #accessing }
PlatypusStack >> push: anObject [ 
	stackp := stackp + 1.
	stackp > stack size
		ifTrue: [self grow].
	stack at: stackp put: anObject
]

{ #category : #removing }
PlatypusStack >> removeAt: index [ 
	| removed |
	removed := stack at: index.
	stackp := stackp - 1.
	index
		to: stackp
		do: [:pos | stack
				at: pos
				put: (stack at: pos + 1)].
	^ removed
]

{ #category : #accessing }
PlatypusStack >> reverseDo: aBlock [ 
	stackp
		to: 1
		by: -1
		do: [:p | aBlock
				value: (stack at: p)]
]

{ #category : #accessing }
PlatypusStack >> size [
	^ stackp
]

{ #category : #accessing }
PlatypusStack >> top [
	^ stack at: stackp
]
