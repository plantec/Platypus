Class {
	#name : #TamLinksTaxonReference,
	#superclass : #TamTaxonReference,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menus }
TamLinksTaxonReference class >> canBeCreatedInteractively [
	^ false
]

{ #category : #accessing }
TamLinksTaxonReference class >> externalLabel [
	^ 'a links taxon'
]

{ #category : #'drag and drop' }
TamLinksTaxonReference >> acceptDroppingMorph: aTransfertMorph copy: shouldCopy [ 
	| passenger |
	passenger := (aTransfertMorph respondsTo: #passenger)
				ifTrue: [aTransfertMorph passenger]
				ifFalse: [aTransfertMorph].
	(passenger isTamListItemReference)
		ifFalse: [^ false].
	^ self insertReference: passenger
]

{ #category : #updating }
TamLinksTaxonReference >> cleanDuplicates [
	| child toBeKept |
	child := self children.
	toBeKept := OrderedCollection new.
	child
		do: [:chl | (toBeKept
					anySatisfy: [:k | k linkedPath = chl linkedPath])
				ifFalse: [toBeKept add: chl]].
	(child difference: toBeKept)
		reverseDo: [:e | e removeSilently].
	TamManager changed: self
]

{ #category : #accessing }
TamLinksTaxonReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/links_taxon'
]

{ #category : #updating }
TamLinksTaxonReference >> insertReference: aReference [ 
	| newLnk |
	(aReference owner ~= self
			and: [aReference ~= self])
		ifTrue: [self contents
				detect: [:lnk | lnk isLinkTo: aReference]
				ifNone: [newLnk := TamListItemSoftLinkReference from: aReference.
					newLnk owner: self.
					self contents add: newLnk.
					^ true]].
	^ false
]

{ #category : #updating }
TamLinksTaxonReference >> removeUnlinked [
	| toBeRemoved lnk |
	toBeRemoved := self children
				select: [:ch | (lnk := ch linked) isNil
						or: [lnk isReleased]].
	toBeRemoved isEmpty ifFalse: [
		toBeRemoved reverseDo: [:e | e removeSilently].
	TamManager changed: self]
]

{ #category : #menus }
TamLinksTaxonReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the  
	#shifted boolean"
	| |
	menu addLine.
		menu
			add: 'remove unlinked'
			target: self
			selector: #removeUnlinked.
	super specificMenu: menu shifted: b.

]
