Class {
	#name : #TamGenericHierarchicalListItem,
	#superclass : #Object,
	#instVars : [
		'owner',
		'children',
		'icon',
		'linked',
		'sortBlock',
		'selectingBlock',
		'unSelectingBlock',
		'asStringBlock'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
TamGenericHierarchicalListItem class >> fromFlatCollection: aCollection [ 
	| index first result element |
	index := Dictionary new.
	aCollection
		do: [:line | line notEmpty
				ifTrue: [first := line first.
					index at: first ifAbsentPut: OrderedCollection new.
					(index at: first)
						add: line allButFirst]].
	result := OrderedCollection new.
	index
		keysAndValuesDo: [:k :subs | 
			element := self linked: k.
			result add: element.
			element fromFlatCollection: subs].
	^ result asOrderedCollection
]

{ #category : #'instance creation' }
TamGenericHierarchicalListItem class >> linked: anObject [ 
	^ self new
		linked: anObject
		icon: nil
]

{ #category : #'instance creation' }
TamGenericHierarchicalListItem class >> linked: anObject icon: aForm [ 
	^ self new linked: anObject icon: aForm
]

{ #category : #testing }
TamGenericHierarchicalListItem >> = another [ 
	another class = self class
		ifFalse: [^ false].
	^ self linked  = another  linked

]

{ #category : #updating }
TamGenericHierarchicalListItem >> addChild: anItem [
	children add: anItem.
	anItem owner: self.
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> asString [
	^ self asStringBlock
		ifNil: [self linked asString]
		ifNotNil: [self asStringBlock valueWithPossibleArgs: { self }]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> asStringBlock [
	^ asStringBlock
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> asStringBlock: aBlock [
	 asStringBlock := aBlock
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> children [
	^ children
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> children: aCollection [ 
	children := children copyEmpty.
	aCollection
		do: [:e | self addChild: e]
]

{ #category : #'initialize/release' }
TamGenericHierarchicalListItem >> destroy [
	linked := nil.
	super destroy
]

{ #category : #actions }
TamGenericHierarchicalListItem >> doDeeply: aBlock from: aHierarchicalList [ 
	aBlock valueWithPossibleArgs: {self. aHierarchicalList}.
	self children
		do: [:child | child
				doDeeply: aBlock
				from: aHierarchicalList
				]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> emphasisModel [
	^ (linked respondsTo: #emphasisModel)
				ifTrue: [linked emphasisModel]
]

{ #category : #updating }
TamGenericHierarchicalListItem >> fromFlatCollection: aCollection [ 
	self
		children: (self class fromFlatCollection: aCollection)
]

{ #category : #testing }
TamGenericHierarchicalListItem >> hash [
	^ self linked hash
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> haveIcon [
	^ self icon notNil
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> icon [
	^ icon
		ifNil: [(linked respondsTo: #icon)
				ifTrue: [linked icon]
				]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> icon: aForm [ 
	icon := aForm
]

{ #category : #'initialize/release' }
TamGenericHierarchicalListItem >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #menu }
TamGenericHierarchicalListItem >> keyStroke: aCharacter from: tamuggableListMorph [ 
	aCharacter = $i
		ifTrue: [^ self inspect].
	aCharacter = $I
		ifTrue: [^ self explore]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> linked [
	^ linked 
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> linked: anObject [ 
	linked := anObject
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> linked: anObject icon: aForm [ 
	self linked: anObject.
	self icon: aForm
]

{ #category : #menu }
TamGenericHierarchicalListItem >> menu: aMenu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the  
	#shifted boolean"
	^ aMenu
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> owner [
	^ owner
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> owner: anotherListElement [
	owner := anotherListElement
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> selectingBlock [
	^ selectingBlock
		
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> selectingBlock: aBlockWithZeroOneOrTwoArgs [
	selectingBlock := aBlockWithZeroOneOrTwoArgs
]

{ #category : #updating }
TamGenericHierarchicalListItem >> selectingFrom: aHierarchicalList [ 
	^ self selectingBlock
		ifNil: [(linked respondsTo: #selectingFrom:)
				ifTrue: [linked selectingFrom: aHierarchicalList]]
		ifNotNil: [self selectingBlock valueWithPossibleArgs: {self. aHierarchicalList}]
]

{ #category : #updating }
TamGenericHierarchicalListItem >> sort [
	| sb |
	sb := [:a :b | a asString < b asString].
	self children: (self children asArray sort: sb) asOrderedCollection.
	self children
		do: [:c | c sort]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> unSelectingBlock [
	^ unSelectingBlock
	
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> unSelectingBlock: aBlockWithZeroOneOrTwoArgs [ 
	unSelectingBlock := aBlockWithZeroOneOrTwoArgs
]

{ #category : #updating }
TamGenericHierarchicalListItem >> unSelectingFrom: aHierarchicalList [ 
	^ self unSelectingBlock
		ifNil: [(linked respondsTo: #unSelectingFrom:)
				ifTrue: [linked unSelectingFrom: aHierarchicalList]]
		ifNotNil: [self unSelectingBlock valueWithPossibleArgs: {self. aHierarchicalList}]
]

{ #category : #accessing }
TamGenericHierarchicalListItem >> wrapperClass [
	^ TamGenericHierarchicalListItemWrapper
]
