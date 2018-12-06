Class {
	#name : #TamListItemAbstractLinkReference,
	#superclass : #TamListItemReference,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #'instance creation' }
TamListItemAbstractLinkReference class >> from: aListItemReference [	^ self new linked: aListItemReference
]

{ #category : #'drag and drop' }
TamListItemAbstractLinkReference >> acceptDroppingMorph: transferMorph copy: shouldCopy [ 	^ self linked acceptDroppingMorph: transferMorph copy: shouldCopy 
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> asStringOrText [
 ^ self subclassResponsibility 
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> basicSmalltalkBrowser: aTaxonomyBrowser [ 
	^ self linked basicSmalltalkBrowser: aTaxonomyBrowser 
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> browserClass [	^ self linked browserClass
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> children [
	| lnk |
	^ (lnk := self linked) ifNil: [#()]
		ifNotNil: [lnk isReleased ifTrue: [#()] ifFalse: [lnk children]]
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> editorClass [	^ self linked editorClass
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> icon [
	| lnk |
	^(lnk := self linked) 
		ifNil: [TamIcons mimeIcon: '10x10/mimetypes/question']
		ifNotNil: [lnk icon]
]

{ #category : #testing }
TamListItemAbstractLinkReference >> includes: anotherReference [ 
	^self linked notNil and:[ self linked includes: anotherReference]
]

{ #category : #updating }
TamListItemAbstractLinkReference >> insertReference: anotherReference [ 	
	^ self linked insertReference: anotherReference 
]

{ #category : #testing }
TamListItemAbstractLinkReference >> isLink [	^ true
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> isLinkTo: anItem [ 
	^ self linked = anItem  linked
]

{ #category : #testing }
TamListItemAbstractLinkReference >> isRemoveable [ 
	^ true
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> linkPrefix [
	self subclassResponsibility 
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> linked [
	^ self subclassResponsibility 
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> linked: anItem [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> listLabel [
	^ self linked listLabel
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> longNameOn: aStream [
	^ self linked longNameOn: aStream
]

{ #category : #menus }
TamListItemAbstractLinkReference >> menu: aMenu shifted: b [ 
	| menuDeleteSubmorph |
self isRootTaxonLink ifFalse: [
	aMenu 
		add: 'remove (x)'
		target: self
		selector: #menuDelete.
	aMenu addLine].
	self linked menu: aMenu shifted: b.
	self isRemoveable 
		ifFalse: 
			[menuDeleteSubmorph := aMenu submorphs 
						select: [:sm | (sm isKindOf: MenuItemMorph) and: [sm selector = #menuDelete]].
			aMenu removeAllMorphsIn: menuDeleteSubmorph].
	aMenu submorphsDo: 
			[:aMenuItem | 
			((aMenuItem isKindOf: MenuItemMorph) and: 
					[#(
						#menuDelete
						#menuInspect
						#menuBrowse
						#menuExplore
					) anySatisfy: [:e | e == aMenuItem selector]]) 
				ifTrue: [aMenuItem target: self]].
	^aMenu
]

{ #category : #menus }
TamListItemAbstractLinkReference >> menuDelete [
	| message |
	message := ' really remove this link ? '.
	(self confirm: message)
		ifTrue: [self remove. ^ true].
	^ false
]

{ #category : #updating }
TamListItemAbstractLinkReference >> moveDownReference: aFirstLevelReference [ 	^ self linked moveDownReference: aFirstLevelReference 
]

{ #category : #updating }
TamListItemAbstractLinkReference >> moveUpReference: aFirstLevelReference [ 	^ self linked moveUpReference: aFirstLevelReference 
]

{ #category : #'morphic wrapper' }
TamListItemAbstractLinkReference >> newEditor [	^ self linked newEditor
]

{ #category : #printing }
TamListItemAbstractLinkReference >> printOn: aStream [ 	aStream nextPutAll: self asStringOrText
]

{ #category : #updating }
TamListItemAbstractLinkReference >> relabelWith: newName [ 	
	^ self linked relabelWith: newName 
]

{ #category : #updating }
TamListItemAbstractLinkReference >> removeAll [	
	self linked ifNotNil: [self linked removeAll]
]

{ #category : #updating }
TamListItemAbstractLinkReference >> removeChild: aReference [ 	
	self linked removeChild: aReference.
]

{ #category : #updating }
TamListItemAbstractLinkReference >> removeChildSilently: aReference [ 
	self linked removeChildSilently: aReference
]

{ #category : #'tam taxonomy browser' }
TamListItemAbstractLinkReference >> selectingFrom: aTaxonomyBrowser [ 
	| lnk |
	((lnk := self linked) isNil
			or: [lnk isReleased])
		ifTrue: [^ nil].
	^ lnk selectingFrom: aTaxonomyBrowser
]

{ #category : #accessing }
TamListItemAbstractLinkReference >> shortName [
	^ self linked name
]

{ #category : #'tam taxonomy browser' }
TamListItemAbstractLinkReference >> unSelectingFrom: aTaxonomyBrowser [ 
	self linked ifNotNil: [:lnk | lnk unSelectingFrom: aTaxonomyBrowser]
]
