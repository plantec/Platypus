Class {
	#name : #TamListItemMorphEmphasisIndex,
	#superclass : #Object,
	#instVars : [
		'itemsByEmphasis',
		'emphasisByItem',
		'emphasisIndex'
	],
	#category : #'Tamaris-Event-Rules'
}

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> add: anObject emphasis: aListItemMorphEmphasis [ 
	| itemsSet |
	self remove: anObject.
	itemsSet := itemsByEmphasis
				at: aListItemMorphEmphasis
				ifAbsentPut: [Set new].
	itemsSet add: anObject.
	emphasisByItem at: anObject put: aListItemMorphEmphasis
]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> clear [
	emphasisByItem
		ifNotEmpty: [:dict | 
			emphasisByItem keys
				do: [:k | emphasisByItem removeKey: k].
			itemsByEmphasis keys
				do: [:k | itemsByEmphasis removeKey: k]]
]

{ #category : #'emphasis handling' }
TamListItemMorphEmphasisIndex >> emphasisNamed: aSymbol [ 
	^ emphasisIndex
		at: aSymbol
		ifAbsent: [].

]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> emphasisOf: anObject [
	^ emphasisByItem at: anObject ifAbsent: []
]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> emphasisSet: aListItemMorphEmphasis [ 
	^ (itemsByEmphasis
		at: aListItemMorphEmphasis
		ifAbsent: [Set new]) copy
]

{ #category : #enumerating }
TamListItemMorphEmphasisIndex >> emphasisSet: aListItemMorphEmphasis collect: aBlock [ 
	^ self emphasisSet: aListItemMorphEmphasis collect: aBlock
]

{ #category : #enumerating }
TamListItemMorphEmphasisIndex >> emphasisSet: aListItemMorphEmphasis detect: aBlock [ 
	^ self emphasisSet: aListItemMorphEmphasis detect: aBlock
]

{ #category : #enumerating }
TamListItemMorphEmphasisIndex >> emphasisSet: aListItemMorphEmphasis do: aBlock [
	self emphasisSet: aListItemMorphEmphasis do: aBlock
]

{ #category : #enumerating }
TamListItemMorphEmphasisIndex >> emphasisSet: aListItemMorphEmphasis select: aBlock [ 
	^ self emphasisSet: aListItemMorphEmphasis select: aBlock
]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> emptyEmphasisSet: aListItemMorphEmphasis [ 
	| |
	(self emphasisSet: aListItemMorphEmphasis)
		do: [:item | self remove: item]
]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> includes: anObject [ 
	^ emphasisByItem
		includesKey: anObject

]

{ #category : #'initialize-release' }
TamListItemMorphEmphasisIndex >> initialize [
	super initialize.
	itemsByEmphasis := Dictionary new.
	emphasisByItem := WeakKeyDictionary new.
	emphasisIndex := Dictionary new.
	TamListItemMorphEmphasisModel standardEmphasisSet 
		do: [:std | self registerEmphasis: (TamListItemMorphEmphasisModel perform: std)]
]

{ #category : #'emphasis handling' }
TamListItemMorphEmphasisIndex >> registerEmphasis: aListItemMorphEmphasis [
	emphasisIndex
		at: aListItemMorphEmphasis key
		ifPresent: [:e | ^ false].
	emphasisIndex at: aListItemMorphEmphasis key put: aListItemMorphEmphasis.
	^ true
]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> remove: anObject [ 
	itemsByEmphasis
		keysAndValuesDo: [:k :v | v
				remove: anObject
				ifAbsent: []].
	emphasisByItem
		removeKey: anObject
		ifAbsent: [].

]

{ #category : #'object indexing' }
TamListItemMorphEmphasisIndex >> switch: anObject emphasis: aListItemMorphEmphasis [ 
	(self includes: anObject)
		ifTrue: [self remove: anObject]
		ifFalse: [self add: anObject emphasis: aListItemMorphEmphasis]
]
