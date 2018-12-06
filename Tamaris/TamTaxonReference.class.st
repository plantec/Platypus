Class {
	#name : #TamTaxonReference,
	#superclass : #TamListItemReference,
	#instVars : [
		'contents'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menus }
TamTaxonReference class >> canBeCreatedInteractively [	^ true
]

{ #category : #accessing }
TamTaxonReference class >> externalLabel [ 	^ 'a taxon'
]

{ #category : #menus }
TamTaxonReference class >> menuAddReferenceIntoOwner: aReference [ 
	| newRef |
	newRef := self taxonLabel: self externalLabel.
	aReference insertReference: newRef
]

{ #category : #accessing }
TamTaxonReference class >> subMenuLabel [
	^ 'a taxon'
]

{ #category : #'instance creation' }
TamTaxonReference class >> taxonLabel: aString [ 
	^ self new listLabel: aString
]

{ #category : #'drag and drop' }
TamTaxonReference >> acceptDroppingMorph: aTransfertMorph copy: shouldCopy [
	| passenger copyIt |
	copyIt := shouldCopy.
	passenger := (aTransfertMorph respondsTo: #passenger)
		ifTrue: [ aTransfertMorph passenger ]
		ifFalse: [ aTransfertMorph ].
	(passenger isKindOf: String)
		ifFalse: [ 
			passenger isTamListItemReference
				ifTrue: [ copyIt := copyIt or: [ passenger isRemoveable not ] ] ].
	^ self insertLinkableListItemFromTransfertMorph: aTransfertMorph copy: copyIt
]

{ #category : #accessing }
TamTaxonReference >> children [	^ self contents
]

{ #category : #accessing }
TamTaxonReference >> containedLinksTo: aListItemOrACollectionOfListItems [ 
	| listItems |
	self isReleased ifFalse: [
	(aListItemOrACollectionOfListItems isKindOf: Collection)
		ifTrue: [listItems  :=  aListItemOrACollectionOfListItems]
		ifFalse: [listItems  :=  Array with: aListItemOrACollectionOfListItems].
	^ self contents
		select: [:i | i isLinkToOneOf: listItems]].
	^#()
]

{ #category : #accessing }
TamTaxonReference >> contents [	^contents
]

{ #category : #accessing }
TamTaxonReference >> contents: aCollection [ 	contents := aCollection
]

{ #category : #copying }
TamTaxonReference >> copy [	| copy sr |	copy  :=  super copy.	copy		contents: (self contents				collect: [:r | 					sr  :=  r copy.					sr owner: copy.					sr]).	^ copy
]

{ #category : #'drag and drop' }
TamTaxonReference >> copyListItemHereFromTransfertMorph: aTransfertMorph [ 
	| aReference theCopy |
	aReference := TamListItemReference fromTransfertMorph: aTransfertMorph.
	aReference isCopyable
		ifTrue: [theCopy := aReference copy owner: nil.
			^ self insertReference: theCopy]
		ifFalse: [
			self inform: 'can''t make a copy of it here'.
			^ false]
]

{ #category : #accessing }
TamTaxonReference >> deepContainedLinksTo: aListItemOrACollectionOfListItems [ 
	| links |
	links  :=  self containedLinksTo: aListItemOrACollectionOfListItems.
	self children
		do: [:i | links  :=  links
						, (i deepContainedLinksTo: aListItemOrACollectionOfListItems)].
	^ links
]

{ #category : #'initialize/release' }
TamTaxonReference >> destroy [
	self children ifNotNil: [self children do: [:child | child destroy]].
	contents := nil.
	super destroy
]

{ #category : #accessing }
TamTaxonReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/taxon'
]

{ #category : #accessing }
TamTaxonReference >> includesLinksTo: aListItemOrACollectionOfListItems [ 
	| listItems |
	self isReleased
		ifFalse: [(aListItemOrACollectionOfListItems isKindOf: Collection)
				ifTrue: [listItems  :=  aListItemOrACollectionOfListItems]
				ifFalse: [listItems  :=  Array with: aListItemOrACollectionOfListItems].
			^ self contents
				anySatisfy: [:i | i isLinkToOneOf: listItems]].
	^ false
]

{ #category : #'initialize/release' }
TamTaxonReference >> initialize [	super initialize.	contents := OrderedCollection new
]

{ #category : #'drag and drop' }
TamTaxonReference >> insertLinkableListItemFromTransfertMorph: aTransfertMorph copy: shouldCopy [ 
	shouldCopy
		ifTrue: [^ self copyListItemHereFromTransfertMorph: aTransfertMorph]
		ifFalse: [^ self moveListItemHereFromTransfertMorph: aTransfertMorph]
]

{ #category : #updating }
TamTaxonReference >> insertReference: anotherReference [ 
	anotherReference owner == self
		ifFalse: [anotherReference owner: self.
			self contents add: anotherReference.
			TamManager changed: self.
			^ true].
	^ false
]

{ #category : #updating }
TamTaxonReference >> insertReferenceSilently: anotherReference [ 
	anotherReference owner: self.
	self contents add: anotherReference.
	^ true
]

{ #category : #testing }
TamTaxonReference >> isTaxon [	^ true
]

{ #category : #menus }
TamTaxonReference >> keyStroke: aCharacter from: tamuggableListMorph [ 
	aCharacter = $e
		ifTrue: [^ self menuRemoveAll].
	^ super keyStroke: aCharacter from: tamuggableListMorph
]

{ #category : #'drag and drop' }
TamTaxonReference >> linkListItemHere: aListItem [
	| link |
	link := TamListItemSoftLinkReference from: aListItem.
	^ self insertReference: link
]

{ #category : #'drag and drop' }
TamTaxonReference >> linkListItemHereFromTransfertMorph: aTransfertMorph [ 
	| aPassenger |
	(aTransfertMorph class canUnderstand: #passenger)
		ifTrue: [aPassenger := aTransfertMorph passenger]
		ifFalse: [^ false].
	^ self linkListItemHere: aPassenger 

]

{ #category : #menus }
TamTaxonReference >> menuAddReference [	| menuAddReference |	
	menuAddReference  :=  MenuMorph new.	
	^ self menuAddReferenceInto: menuAddReference
]

{ #category : #menus }
TamTaxonReference >> menuAddReferenceInto: aMenu [ 
	| classes |
	classes := OrderedCollection with: TamListItemReference.
	classes addAll: TamListItemReference allSubclasses.
	^TamListItemReference 
		menuAddReferenceInto: aMenu
		owner: self
		fromClasses: classes.
]

{ #category : #menus }
TamTaxonReference >> menuRemoveAll [
	| message |	
	message  :=  'remove all ? '.	
	(self confirm: message)		
		ifTrue: [^ self removeAll]
]

{ #category : #updating }
TamTaxonReference >> move: aReference before: anotherReference [ 
	aReference ~= anotherReference ifTrue: [
	self contents remove: aReference.
	self contents add: aReference before: anotherReference.
	TamManager changed: self]
]

{ #category : #updating }
TamTaxonReference >> moveDownReference: aReference [ 
	| index moveableContents |
	moveableContents := self contents
				select: [:i | i isMoveable].
	index := moveableContents indexOf: aReference.
	index < moveableContents size
		ifTrue: [index := contents indexOf: aReference.
			contents swap: index with: index + 1.
			TamManager changed: aReference.
			^ true].
	^ false
]

{ #category : #'drag and drop' }
TamTaxonReference >> moveListItemHereFromTransfertMorph: aTransfertMorph [ 
	| aPassenger |
	aPassenger := (aTransfertMorph class canUnderstand: #passenger)
				ifTrue: [aTransfertMorph passenger]
				ifFalse: [aTransfertMorph].
	(aPassenger isTamListItemReference
			and: [aPassenger isLink not])
		ifTrue: [(aPassenger includes: self)
				ifTrue: [self inform: 'Can''t move myself inside myself' translated.
					^ false]].
	(aPassenger respondsTo: #isMoveable)
		ifTrue: [aPassenger isMoveable
				ifTrue: [^ self insertReference: aPassenger]
				ifFalse: [self inform: 'can''t move it here' translated.
					^ false]].
	^ false
]

{ #category : #updating }
TamTaxonReference >> moveUpReference: aReference [ 
	| index moveableContents |
	moveableContents := self contents
				select: [:i | i isMoveable].
	index := moveableContents indexOf: aReference.
	index > 1
		ifTrue: [index := contents indexOf: aReference.
			contents swap: index with: index - 1.
			TamManager changed: aReference.
			^ true].
	^ false
]

{ #category : #private }
TamTaxonReference >> privateSilentlyRemove: aReference [
	contents
			remove: aReference
				ifAbsent: [].

]

{ #category : #updating }
TamTaxonReference >> removeAll [ 
	self children do: [:ch | ch destroy].
	[self contents isEmpty] whileFalse: [self contents removeLast].
	TamManager changed: self
]

{ #category : #updating }
TamTaxonReference >> removeChild: aReference [ 	self contents		remove: aReference		ifAbsent: [].	super removeChild: aReference
]

{ #category : #updating }
TamTaxonReference >> removeChildSilently: aReference [ 
	self contents ifNotNil: [self contents
		remove: aReference
		ifAbsent: []].
	super removeChildSilently: aReference
]

{ #category : #updating }
TamTaxonReference >> removeSilently [
	contents 
		ifNotNil: [
			contents 
				do: [:c | 
					c removeSilently.
					c destroy]].
	super removeSilently
]

{ #category : #menus }
TamTaxonReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the  
	#shifted boolean"

	| menuAddReference |
	self isRootTaxon 
		ifTrue: 
			[menu 
				add: 'freeze'
				target: menu defaultTarget taxonomyBrowser
				selector: #freeze].
	menu 
		add: 'empty (e)'
		target: self
		selector: #menuRemoveAll.
	menu addLine.
	menuAddReference := self menuAddReference.
	menu 
		add: 'add reference on ...'
		target: self
		selector: nil
		argumentList: #().
	 menu lastItem subMenu: menuAddReference

]
