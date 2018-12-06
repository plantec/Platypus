"
I am an handler for history list inside browser: prev, next and recents. 
owner is typically an  instance of Browser ore one of its subclasses.
items is the collection of history items (instances of subclasses of AbstractHistoryList)
currentIndex is the current position in history
canAppendItem is private, it is used to forbid item appending while appending.
historyMaxSize is the maximum number of items (passed at history list creation)

Typically use :
Instance creation with: BrowserHistoryList class >> owner:historyMaxSize:
append items with addItem:.
next and prev selecting with: selectNext and selectPrev that send updateModel: to selected item (see AbstractHistoryItem). 

<EXPRESS>
entity BrowserHistoryList;
	items : list [1:historyMaxSize] of AbstractHistoryItem;
	currentIndex : integer;
	canAppendItem : Boolean;
	historyMaxSize : integer;
end_entity;
</EXPRESS>



"
Class {
	#name : #AbstractHistoryList,
	#superclass : #Object,
	#instVars : [
		'items',
		'currentIndex',
		'canAppendItem',
		'historyMaxSize'
	],
	#classVars : [
		'HistoryListsByOwnerIndex'
	],
	#category : #'Tamaris-Browser-History'
}

{ #category : #accessing }
AbstractHistoryList class >> getOwnerOf: aHistoryList [ 
	self historyListsByOwnerIndex
		keysAndValuesDo: [:k :v | v = aHistoryList
				ifTrue: [^ k]].
	^ nil
]

{ #category : #accessing }
AbstractHistoryList class >> historyListFor: aBrowser [ 
	^ self historyListsByOwnerIndex
		at: aBrowser
		ifAbsentPut: [
			self owner: aBrowser historyMaxSize: 20]
]

{ #category : #accessing }
AbstractHistoryList class >> historyListsByOwnerIndex [
	^ HistoryListsByOwnerIndex
		ifNil: [HistoryListsByOwnerIndex := WeakIdentityKeyDictionary new]
]

{ #category : #'class initialization' }
AbstractHistoryList class >> initialize [
	HistoryListsByOwnerIndex  := nil
]

{ #category : #'instance creation' }
AbstractHistoryList class >> owner: anObject historyMaxSize: anInteger [ 
	| newHistory |
	newHistory := self new historyMaxSize: anInteger.
	newHistory setOwner: anObject.
	^ newHistory
]

{ #category : #updating }
AbstractHistoryList >> addItem: anItem [ 
	canAppendItem
		ifTrue: [items notEmpty
				ifTrue: [anItem
							= (self items at: currentIndex)
						ifTrue: [^ false].
					items size < (historyMaxSize + 1)
						ifFalse: [items removeFirst.
							currentIndex := currentIndex - 1]].
			items add: anItem afterIndex: currentIndex.
			currentIndex := currentIndex + 1].
	^ true
]

{ #category : #testing }
AbstractHistoryList >> canSelectNext [
	"is there an item after currentIndex pos"
	^ self items size - currentIndex > 0
]

{ #category : #testing }
AbstractHistoryList >> canSelectPrev [
	"is there an item before currentIndex pos"
	^ currentIndex > 1
]

{ #category : #testing }
AbstractHistoryList >> canShowRecents [

	^ self recents size > 1
]

{ #category : #updating }
AbstractHistoryList >> checkAndClean [
	"remove all 'invalid items"
	| founds |
	founds := items
				select: [:it | [(it isValidFromModel: self owner) not]
						on: Error
						do: [true]].
	items removeAll: founds.
	"remove all items that are equal to their next"
	founds := OrderedCollection new.
	1
		to: items size - 1
		do: [:pos | (items at: pos)
					= (items at: pos + 1)
				ifTrue: [founds
						add: (items at: pos)]].
	items removeAll: founds.
	currentIndex <= items size
		ifFalse: [currentIndex := items size]
]

{ #category : #updating }
AbstractHistoryList >> clearHistory [
	items removeAllSuchThat: [:e | true].
	currentIndex := 0
]

{ #category : #accessing }
AbstractHistoryList >> currentItem [
"return current item if available"
	^ (currentIndex <= items size
			and: [currentIndex > 0])
		ifTrue: [items at: currentIndex]
]

{ #category : #'private accessing' }
AbstractHistoryList >> historyMaxSize: anInteger [ 
"maximum number of items in list"
	historyMaxSize := anInteger
]

{ #category : #'initialize/release' }
AbstractHistoryList >> initialize [
	super initialize.
	items := OrderedCollection new.
	currentIndex := 0.
	canAppendItem := true.

]

{ #category : #testing }
AbstractHistoryList >> isEmpty [
	^ self items isEmpty
]

{ #category : #testing }
AbstractHistoryList >> isFor: aBrowser [ 
	^ self owner == aBrowser
]

{ #category : #'private accessing' }
AbstractHistoryList >> items [
	"return the collection of items"
	^ items
]

{ #category : #accessing }
AbstractHistoryList >> last [	^ items notEmpty ifTrue: [items last]
]

{ #category : #'history selecting' }
AbstractHistoryList >> menuNextList: aMenu [ 
	"build a menu for all next items selection or clear history"
	| item nextList hidx |
	nextList := self nextList.
	hidx := currentIndex.
	1
		to: nextList size
		do: [:p | 
			item := nextList at: p.
			aMenu
				add: item asString
				target: self
				selector: #updateOwnerWithItem:
				argument: p + hidx].
	aMenu addLine.
	aMenu
		add: 'clear '
		target: self
		selector: #clearHistory.
	^ aMenu
]

{ #category : #'history selecting' }
AbstractHistoryList >> menuPrevList: aMenu [
" build a menu for all previous items selection or clear history" 
	| item prevList |
	prevList := self prevList.
	prevList size
		to: 1
		by: -1
		do: [:p | 
			item := prevList at: p.
			aMenu
				add: item asString
				target: self
				selector: #updateOwnerWithItem:
				argument: p].
	aMenu addLine.
	aMenu
		add: 'clear '
		target: self
		selector: #clearHistory.
	^ aMenu
]

{ #category : #accessing }
AbstractHistoryList >> nextList [
	"return 'next' items sublist "
	^ items copyFrom: currentIndex + 1 to: items size
]

{ #category : #testing }
AbstractHistoryList >> notEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
AbstractHistoryList >> owner [
	^ self class getOwnerOf: self
]

{ #category : #accessing }
AbstractHistoryList >> prevList [
	"return 'prev' items sublist"
	^ items copyFrom: 1 to: currentIndex - 1
]

{ #category : #accessing }
AbstractHistoryList >> recents [
self checkAndClean.

	^ items asSet asArray sort
]

{ #category : #'initialize/release' }
AbstractHistoryList >> release [
	items := nil.
	super release
]

{ #category : #'history selecting' }
AbstractHistoryList >> selectFromRecentsList [
	| sortedHistory historyItems index choice |
	"open a menu with all items in it"
	self checkAndClean.
	self isEmpty
		ifTrue: [^ UIManager default inform: 'empty'].
	sortedHistory := self recents asArray sort.
	historyItems := (sortedHistory
				collect: [:h | h asString]) asOrderedCollection.
	historyItems add: 'clear recents'.
	(index := (UIManager default  chooseFrom: historyItems lines: {historyItems size - 1})) = 0
		ifFalse: [index = historyItems size
				ifTrue: [self clearHistory]
				ifFalse: [choice := sortedHistory at: index.
					self updateOwnerWithItem: choice]]
]

{ #category : #'history selecting' }
AbstractHistoryList >> selectNext [
	"next item in history"
	self canSelectNext
		ifTrue: [self updateOwnerWithItemIndex: currentIndex + 1]
]

{ #category : #'history selecting' }
AbstractHistoryList >> selectPrev [
	"previous item in history"
	self canSelectPrev
		ifTrue: [self updateOwnerWithItemIndex: currentIndex - 1]
]

{ #category : #'private accessing' }
AbstractHistoryList >> setOwner: aBrowserOrSomethingLikeThat [ 
	
]

{ #category : #accessing }
AbstractHistoryList >> size [
^ items size
]

{ #category : #updating }
AbstractHistoryList >> update: aSymbol [ 
	super update: aSymbol.
	self checkAndClean
]

{ #category : #'history selecting' }
AbstractHistoryList >> updateOwnerWithItem: anHistoryItem [ 
	"ask owner to update itself with an item"
	[canAppendItem := false.
	anHistoryItem updateModel: self owner]
		ensure: [canAppendItem := true]
]

{ #category : #'history selecting' }
AbstractHistoryList >> updateOwnerWithItemIndex: anHistoryItemIndex [ 
	"take item at an index and ask owner to update itself with fetched item"
	currentIndex := anHistoryItemIndex.
	self
		updateOwnerWithItem: (self items at: currentIndex)
]
