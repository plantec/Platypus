"
A TamListItemReference is xxxxxxxxx.

Instance Variables
	emphasisModel:		<Object>
	listLabel:		<Object>
	localWorkspacePaneContents:		<Object>
	owner:		<Object>
	showSubLists:		<Object>
	subLists:		<Object>
	updateFlag:		<Object>

emphasisModel
	- xxxxx

listLabel
	- xxxxx

localWorkspacePaneContents
	- xxxxx

owner
	- xxxxx

showSubLists
	- xxxxx

subLists
	- xxxxx

updateFlag
	- xxxxx

"
Class {
	#name : #TamListItemReference,
	#superclass : #Object,
	#instVars : [
		'owner',
		'listLabel',
		'localWorkspacePaneContents',
		'subLists',
		'showSubLists',
		'emphasisModel'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menu }
TamListItemReference class >> addReferenceMenuItemToMenu: aMenu owner: anotherReference [ 
	| |
	(self subMenuLabelSubMenu: aMenu)
		add: self externalLabel
		target: self
		selector: #menuAddReferenceIntoOwner:
		argumentList: {anotherReference}
]

{ #category : #menu }
TamListItemReference class >> canNotBeCreatedInteractively [	^ true
]

{ #category : #accessing }
TamListItemReference class >> externalLabel [
	^ self printString
]

{ #category : #'instance creation' }
TamListItemReference class >> from: anObject [ 
	| ref |
	ref := anObject withoutListWrapper.
	(anObject isTamListItemReference)
		ifTrue: [^ anObject copy].
	^ TamExploredObjectReference new
		itemObject: (ObjectExplorerWrapper with: ref)
]

{ #category : #'instance creation' }
TamListItemReference class >> fromTransfertMorph: aTransfertMorph [
	| passenger |
	passenger := (aTransfertMorph class canUnderstand: #passenger)
		ifTrue: [ aTransfertMorph passenger ]
		ifFalse: [ aTransfertMorph ].
	^ self from: passenger
]

{ #category : #accessing }
TamListItemReference class >> longNameFirstSep [
	^ ': '
]

{ #category : #accessing }
TamListItemReference class >> longNameSep [
	^ '/'
]

{ #category : #menu }
TamListItemReference class >> menuAddReferenceInto: aMenu owner: aListItemReference fromClasses: aCollectionOfListItemReferenceClasses [ 
	| addable |
	addable := aCollectionOfListItemReferenceClasses select: 
					[:sc | 
					(sc class includesSelector: #canBeCreatedInteractively) 
						and: [sc canBeCreatedInteractively]].
	(addable asArray sort: [:a :b | a name < b name]) 
		do: [:sc | sc addReferenceMenuItemToMenu: aMenu owner: aListItemReference].
	aMenu submorphs size = 1 ifTrue: [^aMenu submorphs first subMenu].
	^aMenu
]

{ #category : #menu }
TamListItemReference class >> menuAddReferenceIntoOwner: aReference [ 	aReference insertReference: self new
]

{ #category : #menu }
TamListItemReference class >> subMenuLabel [	^ nil
]

{ #category : #menu }
TamListItemReference class >> subMenuLabelSubMenu: aMenu [ 
	| updatedMenu updatedMenuItem |
	self subMenuLabel
		ifNil: [updatedMenu := aMenu]
		ifNotNil: [updatedMenuItem := aMenu submorphs
						detect: [:sm | sm hasSubMenu
								and: [sm contents = self subMenuLabel]]
						ifNone: [].
			updatedMenuItem
				ifNil: [aMenu add: self subMenuLabel subMenu: MenuMorph new].
			updatedMenuItem := aMenu submorphs
						detect: [:sm | sm hasSubMenu
								and: [sm contents = self subMenuLabel]].
			updatedMenu := updatedMenuItem subMenu].
	^ updatedMenu

]

{ #category : #testing }
TamListItemReference >> <= another [
	^ self asString < another asString
]

{ #category : #'drag and drop' }
TamListItemReference >> acceptDroppingMorph: transferMorph copy: shouldCopy [ 
	| passenger |
	(transferMorph respondsTo: #passenger)
		ifFalse: [^ false].
	passenger := transferMorph passenger.
	owner
		ifNotNil: [(owner acceptDroppingMorph: transferMorph copy: shouldCopy)
				ifFalse: [((passenger isTamListItemReference)
							and: [passenger owner = owner
									and: [self isMoveable]])
						ifTrue: [owner move: passenger before: self.
							^ true]]].
	^ false
]

{ #category : #private }
TamListItemReference >> addToParentsChain: aCollection from: aChild [
	aCollection addFirst: self.
	self owner
		ifNotNil: [self owner addToParentsChain: aCollection from: self]
]

{ #category : #updating }
TamListItemReference >> announce: anAnnouncement [
	self announcer announce: anAnnouncement
]

{ #category : #accessing }
TamListItemReference >> announcer [
	^ self taxonomyRoot announcer
]

{ #category : #accessing }
TamListItemReference >> asString [	
	^ self asStringOrText
]

{ #category : #accessing }
TamListItemReference >> asStringOrText [	
	^ self listLabel
]

{ #category : #accessing }
TamListItemReference >> balloonText [
	| |
	"^ (bt := self asStringOrText)
		ifNotNil: [bt contractTo: 100]"
	^ nil
]

{ #category : #accessing }
TamListItemReference >> basicSmalltalkBrowser: aTaxonomyBrowser [ 
	| editor browser |
	editor := aTaxonomyBrowser editor
		ifNotNil: [(editor model isKindOf: Browser)
				ifTrue: [browser := editor model]].
	^ browser
]

{ #category : #accessing }
TamListItemReference >> browserClass [	^ TamBrowser
]

{ #category : #testing }
TamListItemReference >> canBeMovedDown [
	"true if self can be moved down (in my owner children collection)"
	| moveableBrothers |
	self isMoveable
		ifTrue: [self hierarchyLevel > 0
				ifTrue: [moveableBrothers := self owner children
								select: [:i | i isMoveable].
					moveableBrothers size > 1
						ifTrue: [^ (moveableBrothers indexOf: self)
								< moveableBrothers size]]].
	^ false
]

{ #category : #testing }
TamListItemReference >> canBeMovedUp [
	"true if self can be moved up (in my owner children collection)"
	| moveableBrothers |
	self isMoveable
		ifTrue: [self hierarchyLevel > 0
				ifTrue: [moveableBrothers := self owner children
								select: [:i | i isMoveable].
					moveableBrothers size > 1
						ifTrue: [^ (moveableBrothers indexOf: self)
								> 1]]].
	^ false
]

{ #category : #testing }
TamListItemReference >> canChangeLabel [
	"my label can be changed (not computed)"
	^ true
]

{ #category : #testing }
TamListItemReference >> canHaveCachedEditor [
	"if true, my editor will be cached by the browser so that next
	editing will reuse cached editor"
	^ true
]

{ #category : #accessing }
TamListItemReference >> children [
	| subRefs |
	self showSubLists = #never
		ifTrue: [^ self contents]
		ifFalse: [subRefs := self subLists.
			self showSubLists = #always
				ifTrue: [^ subRefs].
			subRefs size <= 1
				ifTrue: [^ self contents]].
	^ subRefs
]

{ #category : #'system changes handling' }
TamListItemReference >> commentClass: class [ 
	(class respondsTo: #platypusMetaData) ifTrue: []
]

{ #category : #accessing }
TamListItemReference >> containedLinksTo: aListItem [ 	^#()
]

{ #category : #accessing }
TamListItemReference >> contents [	^#()
]

{ #category : #accessing }
TamListItemReference >> contentsDo: aBlock [
	self contents do: aBlock
]

{ #category : #copying }
TamListItemReference >> copy [
	^super copy
]

{ #category : #'tam taxonomy browser' }
TamListItemReference >> createModelHolderContaining: aMorphicModel inside: aMorph [ 
	| holder |
	aMorphicModel model
		ifNil: [holder := TamListItemReferenceUtil windowWrapperClass new.
			holder wrapped: aMorphicModel]
		ifNotNil: [holder := TamListItemReferenceUtil subWindowClass new model: aMorphicModel model].
	holder eat: aMorphicModel.
	^ holder
]

{ #category : #'tam taxonomy browser' }
TamListItemReference >> createMorphHolderContaining: aMorph [ 
	| holder |
	holder := (PasteUpMorph new)
				borderWidth: 0;
				layoutPolicy: TableLayout new;
				listDirection: #leftToRight;
				wrapCentering: #center;
				listCentering: #center;
				cellPositioning: #center;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				layoutInset: 6 @ 6;
	color: Color transparent;
				yourself.
	holder addMorph: aMorph.
	^holder
]

{ #category : #accessing }
TamListItemReference >> deepContainedLinksTo: aListItem [ 	^ #()
]

{ #category : #accessing }
TamListItemReference >> deepContents [
	| subs |
	subs := OrderedCollection new.
	subs addAll: self children.
	self children
		do: [:i | subs := subs , i deepContents].
	^ subs
]

{ #category : #testing }
TamListItemReference >> deepIncludesLinkTo: aListItem [ 
	self isReleased
		ifFalse: [(self isLinkTo: aListItem)
				ifTrue: [^ true]
				ifFalse: [self
						contentsDo: [:item | (item deepIncludesLinkTo: aListItem)
								ifTrue: [^ true]]]].
	^ false
]

{ #category : #'initialize/release' }
TamListItemReference >> destroy [
	localWorkspacePaneContents := nil.
	listLabel := nil.
	super destroy
]

{ #category : #updating }
TamListItemReference >> doInternalChecking [
]

{ #category : #accessing }
TamListItemReference >> editorClass [	^ nil
]

{ #category : #accessing }
TamListItemReference >> emphasisModel [
	^ emphasisModel
]

{ #category : #accessing }
TamListItemReference >> emphasisModel: anEmphasisModel [
	emphasisModel := anEmphasisModel
]

{ #category : #updating }
TamListItemReference >> empty [
]

{ #category : #accessing }
TamListItemReference >> findChildReferenceFromPath: aPathArray forLink: aLinkReference [ 
	| childShortName child |
	aPathArray
		ifEmpty: [^ self].
	childShortName := aPathArray first.
	child := self children
				detect: [:chl | chl shortName = childShortName
						and: [aLinkReference ~~ chl
								and: [chl isLink not]]]
				ifNone: [^ nil].
	^ child findChildReferenceFromPath: aPathArray allButFirst forLink: aLinkReference
]

{ #category : #accessing }
TamListItemReference >> findDeeplySuchThat: aBlock [ 
	^ self findDeeplySuchThat: aBlock visited: Set new
]

{ #category : #accessing }
TamListItemReference >> findDeeplySuchThat: aBlock visited: aSetOfRefs [
	| res |
	(aSetOfRefs includes: self) ifFalse:  [aSetOfRefs add: self. (aBlock value: self)
				ifTrue: [^ self].
				
			self children
				do: [:sr | (res := sr findDeeplySuchThat: aBlock visited: aSetOfRefs)
						ifNotNil: [^ res]]].
	^ nil
]

{ #category : #testing }
TamListItemReference >> forceOkToChange [
	"for some editor, in order to force reference deselection even if okToChange 
	is false"
	^ false
]

{ #category : #accessing }
TamListItemReference >> fullPathAsString [
	| str |
	str := ''.
	self fullPathStrings
		do: [:s | str := str , s]
		separatedBy: [str := str , self interPathString].
	^ str
]

{ #category : #accessing }
TamListItemReference >> fullPathStrings [
	^ (self parentsChain
		collect: [:p | p shortName])
		, (Array with: self shortName)
]

{ #category : #testing }
TamListItemReference >> hasContents [
	^self isReleased not and: [self children isEmpty not]
]

{ #category : #accessing }
TamListItemReference >> haveIcon [
	^ true

]

{ #category : #accessing }
TamListItemReference >> hierarchyLevel [
	| own lvl |
	own := self owner.
	lvl := 0.
	[own notNil]
		whileTrue: [lvl := lvl + 1.
			own := own owner].
	^ lvl
]

{ #category : #accessing }
TamListItemReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/file'
]

{ #category : #testing }
TamListItemReference >> includes: anotherReference [ 
	^ anotherReference notNil and: [anotherReference isIncludeIn: self]
]

{ #category : #'initialize/release' }
TamListItemReference >> initialize [
	super initialize.
	showSubLists := #ifNotEmpty.
	localWorkspacePaneContents := ''.

]

{ #category : #updating }
TamListItemReference >> insertReference: anotherReference [ ^false
]

{ #category : #accessing }
TamListItemReference >> interPathString [	^ self wrapperClass interPathString
]

{ #category : #updating }
TamListItemReference >> internalChecking [
	self isReleased
		ifFalse: [
			[self doInternalChecking]
				on: AssertionFailure
				do: [:err | 
					Transcript show: String cr , 'Warning: ' , self longName , ': "' , err printString , '"'.
					Beeper beep]]
]

{ #category : #testing }
TamListItemReference >> isCopyable [
	^ true
]

{ #category : #testing }
TamListItemReference >> isIncludeIn: maybeOwner [ 
	^ maybeOwner = self
		or: [self owner notNil
				and: [self owner isIncludeIn: maybeOwner]]
]

{ #category : #testing }
TamListItemReference >> isLink [	^ false
]

{ #category : #testing }
TamListItemReference >> isLinkTo: aListItem [	^ false
]

{ #category : #testing }
TamListItemReference >> isLinkToOneOf: aListItem [ 	^ aListItem		anySatisfy: [:i | self isLinkTo: i]
]

{ #category : #testing }
TamListItemReference >> isLinkable [
	^ true
]

{ #category : #testing }
TamListItemReference >> isMoveable [
	"true if self can be moved as a child of another owner"
	^ self owner isKindOf: TamTaxonReference
]

{ #category : #testing }
TamListItemReference >> isReleased [
	"evalPaneContents serve as a flag for that purpose"

	^localWorkspacePaneContents isNil
]

{ #category : #testing }
TamListItemReference >> isReleasedOrHaveReleasedOwner [
	self isReleased
		ifTrue: [^ true].
	self owner
		ifNotNil: [^ self owner isReleasedOrHaveReleasedOwner].
	^ false
]

{ #category : #testing }
TamListItemReference >> isRemoveable [
	^ (self owner isKindOf: TamTaxonReference)
]

{ #category : #testing }
TamListItemReference >> isRootTaxon [
	^ false

]

{ #category : #testing }
TamListItemReference >> isRootTaxonLink [
	^false
]

{ #category : #classification }
TamListItemReference >> isTamListItemReference [
	^ true
]

{ #category : #testing }
TamListItemReference >> isTaxon [	^ false
]

{ #category : #testing }
TamListItemReference >> isTaxonomyRoot [
	^ self taxonomyRoot  = self
]

{ #category : #menus }
TamListItemReference >> keyStroke: aCharacter from: tamuggableListMorph [ 
	self isRemoveable
		ifTrue: [aCharacter = $x
				ifTrue: [^ self menuDelete]].
	aCharacter = $u
		ifTrue: [^ self moveUp].
	aCharacter = $d
		ifTrue: [^ self moveDown].
	aCharacter = $n
		ifTrue: [^ self menuLink].
	aCharacter = $b
		ifTrue: [^ self menuBrowse].
	aCharacter = $i
		ifTrue: [^ self menuInspect].
	aCharacter = $I
		ifTrue: [^ self menuExplore].
	aCharacter = $g
		ifTrue: [^ self subListsSwitchMenu]
]

{ #category : #'morphic wrapper' }
TamListItemReference >> labelString [	
	^ self longName
]

{ #category : #updating }
TamListItemReference >> link [
	^ self taxonomyRoot linkListItemHere: self
]

{ #category : #updating }
TamListItemReference >> linkListItemHere: aListItem [ 
	^ owner linkListItemHere: aListItem 
]

{ #category : #accessing }
TamListItemReference >> linked [
	^ self
]

{ #category : #accessing }
TamListItemReference >> listLabel [	
	^listLabel ifNil: [self shortName]
]

{ #category : #accessing }
TamListItemReference >> listLabel: aStringOrNil [ 	
	listLabel := aStringOrNil
]

{ #category : #'system changes handling' }
TamListItemReference >> localAddClass: class [ 
	"Include indication that a new class was created."

^ false
]

{ #category : #'system changes handling' }
TamListItemReference >> localChangeClass: class from: oldClass [
	"Include indication that a new class was created."
	^ false
]

{ #category : #'system changes handling' }
TamListItemReference >> localNoteRemovalOf: class [ 
	"The class is about to be removed from the system.
	Adjust the receiver to reflect that fact."

	^false
]

{ #category : #'system changes handling' }
TamListItemReference >> localRenameClass: class as: newName [ 
	"Include indication that a new class was created."

	^false
]

{ #category : #accessing }
TamListItemReference >> localWorkspacePaneContents [
	^ localWorkspacePaneContents
		
]

{ #category : #accessing }
TamListItemReference >> localWorkspacePaneContents: aStringOrText [ 
	localWorkspacePaneContents
		ifNotNil: [localWorkspacePaneContents := aStringOrText]
]

{ #category : #accessing }
TamListItemReference >> longName [
	^ String streamContents: [:strm | self longNameOn: strm]

]

{ #category : #accessing }
TamListItemReference >> longNameFirstSep [
	^ self class longNameFirstSep
]

{ #category : #accessing }
TamListItemReference >> longNameOn: aStream [
	self isReleased
		ifTrue: [aStream nextPutAll: 'A released Tamaris reference']
		ifFalse: [self owner notNil
				ifTrue: [
					self owner 
						longNameOn: aStream. aStream 
						nextPutAll: self 
						longNameSep. aStream 
						nextPutAll:  self shortName]
				ifFalse: [aStream nextPutAll:  self shortName]]
]

{ #category : #accessing }
TamListItemReference >> longNameSep [
	^ self class longNameSep
]

{ #category : #accessing }
TamListItemReference >> maxSubLevelDescent [
	^ 6
]

{ #category : #menus }
TamListItemReference >> menu: aMenu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the
	#shifted 
	boolean"
	| |
	self isLinkable
		ifTrue: [aMenu
				add: 'link (n)'
				target: self
				selector: #menuLink.
			aMenu addLine].
	self isRemoveable
		ifTrue: [aMenu
				add: 'remove (x)'
				target: self
				selector: #menuDelete.
			aMenu addLine].
	self isMoveable
		ifTrue: [self canBeMovedUp
				ifTrue: [aMenu
						add: 'move up (u)'
						target: self
						selector: #moveUp].
			self canBeMovedDown
				ifTrue: [aMenu
						add: 'move down (d)'
						target: self
						selector: #moveDown].
			aMenu addLine].
	self isRootTaxon
		ifFalse: [aMenu
				add: 'update editor'
				target: self
				selector: #reinitializeEditor].
	(self owner notNil
			and: [self canChangeLabel])
		ifTrue: [aMenu
				add: 'change label'
				target: self
				selector: #menuRelabel].
	aMenu
		add: 'browse (b)'
		target: self
		selector: #menuBrowse.
	self subListsDefsArray isEmpty
		ifFalse: [aMenu addLine.
			aMenu
				add: 'sublists...'
				target: self
				selector: nil
				argumentList: #().
			aMenu lastItem subMenu: self subListsSwitchMenu].
	aMenu addLine.
	self specificMenu: aMenu shifted: b.
	^ aMenu
]

{ #category : #menus }
TamListItemReference >> menuBrowse [
	^ self browserClass openOnReference: self
]

{ #category : #menus }
TamListItemReference >> menuDelete [
	| message |
	message := ' really remove ? '.
	(self confirm: message)
		ifTrue: [self remove. ^ true].
	^ false
]

{ #category : #menus }
TamListItemReference >> menuExplore [	^ self explore
]

{ #category : #menus }
TamListItemReference >> menuInspect [	^ self inspect
]

{ #category : #menus }
TamListItemReference >> menuLink [
	^ self link
]

{ #category : #menus }
TamListItemReference >> menuRelabel [
	| oldname newname |
	oldname := self listLabel.
	(newname := UIManager default
				request: 'new name ?' translated
				initialAnswer: (oldname
						ifNil: [''])) trimBoth
		ifEmpty: [^ false]
		ifNotEmpty: [:v | newname ~= oldname
				ifTrue: [^ self relabelWith: newname]]
]

{ #category : #menus }
TamListItemReference >> modelSpecificMenu: aMenu shifted: b [ 
	^ nil
]

{ #category : #updating }
TamListItemReference >> moveDown [
	^ self owner moveDownReference: self
]

{ #category : #updating }
TamListItemReference >> moveDownReference: aFirstLevelReference [ 	^ false
]

{ #category : #updating }
TamListItemReference >> moveUp [
	^ self owner moveUpReference: self
]

{ #category : #updating }
TamListItemReference >> moveUpReference: aFirstLevelReference [ 	^ false
]

{ #category : #'morphic wrapper' }
TamListItemReference >> newEditor [
	^ nil
]

{ #category : #accessing }
TamListItemReference >> numberOfChildren [
	^ self children size
]

{ #category : #updating }
TamListItemReference >> on: anAnnounce send: aSelector to: aReceiver [
	^ (self announcer weak
		when:  anAnnounce 
		send: aSelector 
		to: aReceiver) makeWeak 
]

{ #category : #accessing }
TamListItemReference >> owner [	^ owner
]

{ #category : #accessing }
TamListItemReference >> owner: anotherReference [ 
	owner
		ifNotNil: [owner privateSilentlyRemove: self].
	owner := anotherReference.

]

{ #category : #accessing }
TamListItemReference >> parentTaxon [
	"Return nearest parent taxon"
	self isTaxon ifTrue: [^ self] ifFalse: [
	self parentsChain reverseDo: [:p | p isTaxon ifTrue: [^p]]].
	^nil
]

{ #category : #accessing }
TamListItemReference >> parentsChain [
	"Return a collection of all my parents, up until root.
	The first element is 
	my parent, while the root is the last."
	| parents |
	parents := OrderedCollection new.
	self owner
		ifNotNil: [self owner addToParentsChain: parents from: self].
	^ parents
]

{ #category : #accessing }
TamListItemReference >> perform: selector orSendTo: otherTarget [
	"Selector was just chosen from a menu by a user. If can respond, then  	perform it on myself. If not, send it to otherTarget, presumably the  	editPane from which the menu was invoked."

	(self respondsTo: selector)
		ifTrue: [ ^ self perform: selector ]
		ifFalse: [ ^ otherTarget perform: selector ]
]

{ #category : #accessing }
TamListItemReference >> preferredColor [
	^ self emphasisModel ifNotNil: [:em | em textColor]
]

{ #category : #printing }
TamListItemReference >> printOn: aStream [ 
	aStream nextPutAll: '['.
	self longName ifNotNil: [aStream nextPutAll: self longName].
	aStream nextPutAll: ']'
]

{ #category : #private }
TamListItemReference >> privateSilentlyRemove: aReference [
]

{ #category : #accessing }
TamListItemReference >> receiver [	^ self 
]

{ #category : #updating }
TamListItemReference >> refresh [
	self refreshedData
		ifTrue: [
			TamManager changed: self. 
			^ true].
	^ false
]

{ #category : #updating }
TamListItemReference >> refreshedData [
	self children.
	^ true
]

{ #category : #updating }
TamListItemReference >> reinitializeEditor [
	self announce: (TamReinitializeEditor new itemReference: self)

]

{ #category : #updating }
TamListItemReference >> reinitializeEditor: aTamBrowser [
	(aTamBrowser editorModel isNil or: [aTamBrowser editorModel okToChange])
		ifTrue: [
			aTamBrowser destroyEditorFor: self.
			self == aTamBrowser unwrappedSelection
				ifTrue: [
					aTamBrowser noteNewSelection: self.
					TamManager changed: self]]
]

{ #category : #updating }
TamListItemReference >> relabelWith: newName [ 	self listLabel: newName.	TamManager changed: self
]

{ #category : #updating }
TamListItemReference >> remove [
	self removeSilently.
	self treeHasChanged 
]

{ #category : #updating }
TamListItemReference >> removeChild: aReference [ 
	self removeChildSilently: aReference.
	TamManager changed: self
]

{ #category : #updating }
TamListItemReference >> removeChildSilently: aReference [ 

]

{ #category : #updating }
TamListItemReference >> removeSilently [
	Cursor wait
		showWhile: [owner
				ifNotNil: [owner removeChildSilently: self].
			self destroy]
]

{ #category : #searching }
TamListItemReference >> selectDeeplySuchThat: aBlock [ 
	^ self selectDeeplySuchThat: aBlock visited: Set new 

]

{ #category : #searching }
TamListItemReference >> selectDeeplySuchThat: aBlock visited: aSetOfRefs [ 
	| res chil |
	res := OrderedCollection new.
	(aSetOfRefs includes: self)
		ifFalse: [aSetOfRefs add: self.
			(aBlock value: self)
				ifTrue: [res add: self].
			(chil := self children)
				ifNotNil: [chil
						do: [:sr | res := res
										, (sr selectDeeplySuchThat: aBlock visited: aSetOfRefs )]]].
	^ res
]

{ #category : #searching }
TamListItemReference >> selectSuchThat: aBlock [ 
	| res |
	res := OrderedCollection new.
	self children ifNotNil: [ 
		self children do: [:chld | 
			(aBlock value: chld) ifTrue: [res add: chld]]].
	^ res
]

{ #category : #accessing }
TamListItemReference >> selected [
	^false
]

{ #category : #'tam taxonomy browser' }
TamListItemReference >> selectingFrom: aTaxonomyBrowser [ 
	| tempEditor editor |
	(editor := aTaxonomyBrowser editorFor: self)
		ifNil: [
			(tempEditor := self newEditor)
				ifNotNil: [(tempEditor isMorph)
						ifTrue: [editor := self createModelHolderContaining: tempEditor inside: aTaxonomyBrowser editorRow.
							self announcer unsubscribe: editor.
							self announcer unsubscribe: aTaxonomyBrowser.
							self on: TamForceTreeUpdating send: #treeUpdated: to: editor.
							self on: TamForceTreeUpdating send: #updateTree: to: aTaxonomyBrowser.
							self on: TamReinitializeEditor send: #reinitializeAnnounce: to: aTaxonomyBrowser.
							self canHaveCachedEditor
								ifTrue: [aTaxonomyBrowser editor: editor for: self].
							aTaxonomyBrowser editorRow
								addMorph: editor
								fullFrame: (LayoutFrame identity).
							self updateEditor: aTaxonomyBrowser]
						ifFalse: [editor := self createMorphHolderContaining: tempEditor.
							editor bounds: aTaxonomyBrowser editorRow bounds.
							self canHaveCachedEditor
								ifTrue: [aTaxonomyBrowser editor: editor for: self].
							aTaxonomyBrowser editorRow addMorphCentered: editor.
							self updateEditor: aTaxonomyBrowser]]]
		ifNotNil: [aTaxonomyBrowser editorRow
				addMorph: editor
				fullFrame: (LayoutFrame identity)].
	(editor notNil and: [editor model notNil])
		ifTrue: [
			editor model modelWakeUpIn: editor.
			editor startStepping.
			editor model addDependent: self].
	aTaxonomyBrowser removeSpecificButtons.
	aTaxonomyBrowser addSpecificButtonsFor: self.
	aTaxonomyBrowser historyAddItem: self.
	"TamManager addToRecents: self."
	self internalChecking.
	^ editor
]

{ #category : #accessing }
TamListItemReference >> shortName [
	^ listLabel
		ifNil: [self class externalLabel]
]

{ #category : #'sublists handling' }
TamListItemReference >> showSubLists [
	^ showSubLists
]

{ #category : #'sublists handling' }
TamListItemReference >> showSubLists: aSymbol [ 
	"aSymbol is (#always | #never | #ifNotEmpty) "
	showSubLists := aSymbol
]

{ #category : #menus }
TamListItemReference >> specificButtonsColumn: aTaxonomyBrowser inAlignment: aButtonsAlignment [
	^nil
]

{ #category : #menus }
TamListItemReference >> specificMenu: aMenu shifted: aBoolean [ 
	| editorModel modelMenu |
	(editorModel := aMenu defaultTarget editorModel)
		ifNotNil: [modelMenu := MenuMorph new.
			modelMenu defaultTarget: editorModel.
			(self modelSpecificMenu: modelMenu shifted: aBoolean) ifNotNil: [
			aMenu addLine.
			aMenu
				add: 'item menu ...'
				subMenu: modelMenu
				target: editorModel
				selector: nil
				argumentList: #()]]
]

{ #category : #'sublists handling' }
TamListItemReference >> subLists [
	| subs |
	subs := OrderedCollection new.
	self subListsDefsArray do: 
			[:s | 
			((self showSubLists = #always) or: [self showSubLists = #ifNotEmpty and: [(self perform: s first) notEmpty]]) ifTrue: [
			subs add: (self subListsReferenceClass 
				owner: self
				listSelector: s first
				label: s second)]].
	^ subs
]

{ #category : #'sublists handling' }
TamListItemReference >> subListsDefsArray [
	"return an array of array. Each element array is for one sublist and 
	contains first a selector for sublist accessing and second a label for the sublist. 
	Example in platypus in PlatypusSchemaReference :
	#(#(#typesReferences #types )
		#(#entitiesReferences #entities )
		#(#functionsReferences #functions )
		#(#proceduresReferences #procedures )
		#(#rulesReferences #rules ))"
	^ #()

	
]

{ #category : #'sublists handling' }
TamListItemReference >> subListsReferenceClass [
	^Smalltalk at: self subListsReferenceClassName asSymbol
]

{ #category : #'sublists handling' }
TamListItemReference >> subListsReferenceClassName [
	^#TamSubListReference
]

{ #category : #'sublists handling' }
TamListItemReference >> subListsSwitchMenu [
	| menu |
	menu := MenuMorph new.
	menu 
		add: 'always shown'
		target: self
		selector: #showSubLists:
		argument: #always.
	menu 
		add: 'shown if not empty'
		target: self
		selector: #showSubLists:
		argument: #ifNotEmpty.
	menu 
		add: 'never shown'
		target: self
		selector: #showSubLists:
		argument: #never.
	^menu

]

{ #category : #'sublists handling' }
TamListItemReference >> subReferencesOfClass: subReferenceClass [ 
	^(self contents asArray 
		select: [:sr | sr isReleased not and: [sr class = subReferenceClass]]) 
			sort: [:a :b | a shortName < b shortName]
]

{ #category : #'sublists handling' }
TamListItemReference >> subReferencesOfKind: subReferenceClass [ 
	^(self contents asArray 
		select: [:sr | sr isReleased not and: [sr isKindOf: subReferenceClass]]) 
			sort: [:a :b | a shortName < b shortName]
]

{ #category : #accessing }
TamListItemReference >> taxonomyRoot [	
	self owner isNil ifTrue: [^self].	
	^ self owner taxonomyRoot	
]

{ #category : #accessing }
TamListItemReference >> tempNames [	^ #()
]

{ #category : #updating }
TamListItemReference >> treeHasChanged [
	self announce: (TamForceTreeUpdating new sourceHandler: self)
]

{ #category : #updating }
TamListItemReference >> treeHasChangedFrom: anEditor [
	self announce: (TamForceTreeUpdating new sourceHandler: self; codeMorph: anEditor)
]

{ #category : #'tam taxonomy browser' }
TamListItemReference >> unSelectingFrom: aTaxonomyBrowser [ 
	| editor |
	editor := aTaxonomyBrowser editor.
	aTaxonomyBrowser hasUnacceptedEdits
		ifTrue: [aTaxonomyBrowser editor: editor for: self].
	(aTaxonomyBrowser haveEditorFor: self)
		ifFalse: [
			editor
				ifNotNil: [editor stopStepping.
					editor model
						ifNotNil: [editor model windowIsClosing; destroy].
					editor isMorph
						ifTrue: [editor removeAllMorphs.
							editor delete]]].
	editor
		ifNotNil: [editor model
				ifNotNil: [editor model removeDependent: self]].
	aTaxonomyBrowser editorRow removeAllMorphs; updatePanesFromSubmorphs.
	aTaxonomyBrowser removeSpecificButtons
]

{ #category : #updating }
TamListItemReference >> updateEditor: aTaxonomyBrowser [ 
	^ true
]

{ #category : #accessing }
TamListItemReference >> wrapperClass [	
	^TamListItemWrapper
]
