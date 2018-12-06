Class {
	#name : #TamManager,
	#superclass : #Object,
	#instVars : [
		'mainWindow',
		'selectedTaxonomy',
		'listBtnRow',
		'listBtnRowHeight',
		'listButtons',
		'listRow',
		'listMorph',
		'editorSubWindow',
		'taxonomyPane'
	],
	#classVars : [
		'CopyPasteBuffer',
		'DroppingArea',
		'InitialExtent',
		'ListWidth',
		'LogSystemChanges',
		'Taxonomies'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'copy/paste' }
TamManager class >> addSelection: aCollection [ 
	self copyPasteBuffer
		addAll: (aCollection
				select: [:item | item isReleased not])
]

{ #category : #accessing }
TamManager class >> allTaxonomiesNamed: anIdent [ 
	^ self
		allTaxonomiesSuchThat: [:c | c taxonomy listLabel = anIdent]

]

{ #category : #accessing }
TamManager class >> allTaxonomiesSuchThat: aBlock [ 
	^ self taxonomies select: [ :c | (aBlock value: c)]

]

{ #category : #accessing }
TamManager class >> buttonExtent [ 
	^ Tamaris buttonExtent
]

{ #category : #'copy/paste' }
TamManager class >> copyPasteBuffer [
	^ CopyPasteBuffer
		
]

{ #category : #'copy/paste' }
TamManager class >> copyPasteBuffer: aSet [ 
	CopyPasteBuffer := aSet
]

{ #category : #'copy/paste' }
TamManager class >> copyPasteBufferList [
	^ self copyPasteBuffer
		select: [:item | item isReleased not]
]

{ #category : #'copy/paste' }
TamManager class >> copySelection: aCollection [ 
	self copyPasteBuffer: WeakSet  new.
	self addSelection: aCollection
]

{ #category : #accessing }
TamManager class >> droppringArea [
	^ DroppingArea ifNil: [
	DroppingArea := AlignmentMorph newVariableTransparentSpacer.
	DroppingArea setBalloonText: 'here is a dropping area in which you can drop some morphs (typically some buttons)'.
	DroppingArea dropEnabled: true.
	DroppingArea borderWidth: 0.
	DroppingArea useSquareCorners.
	DroppingArea color: Color white]


]

{ #category : #'system changes handling' }
TamManager class >> event: anEvent [ 
	"Hook for SystemChangeNotifier"

]

{ #category : #accessing }
TamManager class >> fromFileListTaxonomy [
	^ ((self taxonomyNamed: TamManagerItem fromFileListTaxonName)
		ifNil: [self newTaxonomyNamed: TamManagerItem fromFileListTaxonName]) taxonomy
]

{ #category : #preferences }
TamManager class >> initialExtent [	^ InitialExtent	
]

{ #category : #preferences }
TamManager class >> initialExtent: aPoint [ 
	InitialExtent := aPoint
]

{ #category : #'class initialization' }
TamManager class >> initialize [
	"self initialize"

	self breakDependents.
	Taxonomies := SortedCollection sortBlock: 
					[:a :b | 
					a asStringOrText first = $< or: [a asStringOrText < b asStringOrText]].
	Taxonomies add: TamManagerItem default.
	CopyPasteBuffer := Set new.
	InitialExtent := 600 @ 500.

]

{ #category : #accessing }
TamManager class >> listWidth [
	^ ListWidth ifNil: [ListWidth := 120]
]

{ #category : #accessing }
TamManager class >> listWidth: anInteger [
	ListWidth := anInteger
]

{ #category : #'system changes handling' }
TamManager class >> logChange: message [ 
	LogSystemChanges  ifTrue: [Transcript show: '[TamManager: ' , message , ']' , String cr]
]

{ #category : #accessing }
TamManager class >> mainButtonLabel [
	^'Platypus'
]

{ #category : #accessing }
TamManager class >> managerOpenCommandName [	^ 'Tam taxonomies manager'
]

{ #category : #accessing }
TamManager class >> maxRecentsSize [
	^ 40
]

{ #category : #'taxonomies managing' }
TamManager class >> newTaxonomy: aNewTaxonomy [ 
	self taxonomies add: aNewTaxonomy.
	self sort.
	self  changed: #taxonomies.
	^ aNewTaxonomy
]

{ #category : #'taxonomies managing' }
TamManager class >> newTaxonomyNamed: anIdent [ 
	^ self
		newTaxonomy: (TamManagerItem rootNamed: anIdent)
]

{ #category : #'instance creation' }
TamManager class >> open [
	"self open"

	| newTaxonomiesManager |
	newTaxonomiesManager := self new.
	TamManager addDependent: newTaxonomiesManager.
	^newTaxonomiesManager buildMainWindow openInWorld
]

{ #category : #'instance creation' }
TamManager class >> openInWindow: aWindow [ 	^ self openInWindow: aWindow direction: #toRight
]

{ #category : #'instance creation' }
TamManager class >> openInWindow: aWindow direction: ToRightOrToLeft [ 
	| newTaxonomiesManager |
	newTaxonomiesManager := self new.
	TamManager addDependent: newTaxonomiesManager.
	aWindow model: newTaxonomiesManager.
	^newTaxonomiesManager buildWindow: aWindow direction: ToRightOrToLeft
]

{ #category : #'fileIn/Out' }
TamManager class >> saveAllSet [
	^ ((self taxonomies
		select: [:cls | cls isDefault not])
		collect: [:cls | cls taxonomy linked]) asSet
]

{ #category : #'taxonomies managing' }
TamManager class >> sort [
	self taxonomies reSort
]

{ #category : #accessing }
TamManager class >> taxonomies [	^ Taxonomies
]

{ #category : #accessing }
TamManager class >> taxonomyIndexSuchThat: aBlock [ 	1 to: self taxonomies size		do: [:idx | (aBlock					value: (self taxonomies at: idx))				ifTrue: [^ idx]].	^ 0
]

{ #category : #accessing }
TamManager class >> taxonomyNamed: anIdent [ 	^ self taxonomies		detect: [:c | c asStringOrText = anIdent]		ifNone: []
]

{ #category : #accessing }
TamManager class >> taxonomyOf: aListItemReference [ 	^ self taxonomies		detect: [:c | c taxonomy = aListItemReference]		ifNone: []
]

{ #category : #'drag and drop' }
TamManager class >> wantsDroppedMorph: transferMorph event: anEvent inMorph: destinationLM [ 
	(transferMorph respondsTo:#passenger) ifFalse: [^ false].
	(transferMorph passenger isKindOf: TamListItemReference) 
		ifTrue: [^ true].
	^ false
]

{ #category : #'drag and drop' }
TamManager >> acceptDroppingMorph: transferMorph event: evt inMorph: dstListMorph [ 
	| destItem item itemName passenger |
	(transferMorph respondsTo: #passenger) 
		ifTrue: 
			[passenger := transferMorph passenger.
			(transferMorph passenger isKindOf: SelectionMorph) 
				ifTrue: [^ transferMorph passenger justDroppedInto: dstListMorph event: evt].
			(passenger isKindOf: TamManagerItem) 
				ifTrue: 
					[self linkTaxonomy: passenger.
					^ true]].
	destItem := dstListMorph rowAtLocation: evt position.
	destItem > 0 
		ifTrue: 
			[itemName := dstListMorph getListItem: destItem.
			item := self taxonomyNamed: itemName.
			item notNil 
				ifTrue: 
					[^ item 
						acceptDroppingMorph: transferMorph
						event: evt
						inMorph: dstListMorph]].
	^ false
]

{ #category : #'ui building' }
TamManager >> addButtons [
	| mainButton |
	mainButton :=  (Smalltalk ui theme
						newButtonIn: World
						for: self
						getState: nil 
						action: #taxonomyMenuPopup
						arguments: { }
						getEnabled: nil
						getLabel: nil
						help: 'Platypus main menu')
							label: self mainButtonLabel;
							yourself.
	self listButtons addMorph: mainButton.
	listBtnRow addMorph: listButtons
]

{ #category : #accessing }
TamManager >> allTaxonomiesNamed: anIdent [ 	^ self class allTaxonomiesNamed: anIdent 
]

{ #category : #accessing }
TamManager >> allTaxonomiesSuchThat: aBlock [ 
	^ self class allTaxonomiesSuchThat: aBlock 
]

{ #category : #accessing }
TamManager >> boldBlueSelection [
	^ (listMorph respondsTo: #boldBlueEmphasisSet)
		ifTrue: [listMorph boldBlueEmphasisSet asOrderedCollection]
		ifFalse: [#() asOrderedCollection]
]

{ #category : #accessing }
TamManager >> boldRedSelection [
	^ (listMorph respondsTo: #boldRedEmphasisSet)
		ifTrue: [listMorph boldRedEmphasisSet asOrderedCollection]
		ifFalse: [#() asOrderedCollection]
]

{ #category : #updating }
TamManager >> boundsOf: oneOfMyMorphs updatedWith: newBounds [ 
	mainWindow
		ifNotNil: [oneOfMyMorphs == listMorph
				ifTrue: [newBounds origin x >= mainWindow bounds origin x
						ifTrue: [self class listWidth: newBounds width.
							]]]
]

{ #category : #'button actions' }
TamManager >> browseTaxonomy [
	self selectedTaxonomy notNil
		ifTrue: [^ self browseTaxonomy: self selectedTaxonomy]
		ifFalse: [^ (self buildMenuBrowseTaxonomy: MenuMorph new) popUpInWorld]
]

{ #category : #'button actions' }
TamManager >> browseTaxonomy: aTaxonomy [	^ aTaxonomy taxonomy menuBrowse
]

{ #category : #'ui building' }
TamManager >> buildMainWindow [
	mainWindow := (StandardWindow labelled: self class managerOpenCommandName) model: self;
				 yourself. 
	self buildWindow: mainWindow.
	mainWindow extent: self initialExtent.
	^ mainWindow
]

{ #category : #menu }
TamManager >> buildMenuBrowseTaxonomy: aMenu [ 	^ self genericMenu: aMenu selector: #browseTaxonomy:
]

{ #category : #menu }
TamManager >> buildMenuDeleteTaxonomy: aMenu [ 	^ self genericMenu: aMenu selector: #deleteTaxonomy:
]

{ #category : #menu }
TamManager >> buildMenuEmptyTaxonomy: aMenu [ 	^ self genericMenu: aMenu selector: #emptyTaxonomy:
]

{ #category : #menu }
TamManager >> buildMenuLinkTaxonomy: aMenu [ 	^ self genericMenu: aMenu selector: #linkTaxonomy:
]

{ #category : #'ui building' }
TamManager >> buildWindow: aWindow [ 	
	^ self buildWindow: aWindow direction: #toRight
]

{ #category : #'ui building' }
TamManager >> buildWindow: aWindow direction: toRightOrToLeft [ 
	| listBtnRowFrame listMorphFrame editorSubWindowFrame topRowHeight |
	topRowHeight := listBtnRowHeight + 2.
	toRightOrToLeft == #toRight
		ifTrue: [listBtnRowFrame := LayoutFrame identity bottomFraction: 0; bottomOffset: topRowHeight.
			listMorphFrame := LayoutFrame identity rightFraction: 0; topOffset: topRowHeight; rightOffset: self listWidth.
			editorSubWindowFrame := LayoutFrame identity leftOffset: self listWidth + TamListItemReferenceUtil subFrameBorderDelta; topOffset: topRowHeight]
		ifFalse: [listBtnRowFrame := LayoutFrame identity bottomFraction: 0; bottomOffset: topRowHeight.
			listMorphFrame := LayoutFrame identity leftFraction: 1; leftOffset: self listWidth negated; topOffset: topRowHeight.
			editorSubWindowFrame := LayoutFrame identity topOffset: topRowHeight;  rightOffset: self listWidth negated - TamListItemReferenceUtil subFrameBorderDelta].
	listRow := TamListItemReferenceUtil subWindowClass model: self.
	listBtnRow := TamButtonsAlignmentMorph typicalRowOwner.
	listButtons := TamButtonsAlignmentMorph newRow.
	listButtons vResizing: #shrinkWrap.
	listMorph := self hierarchicalListMorphClass
				on: self
				list: #taxonomies
				selected: #selectedTaxonomyIndex
				changeSelected: #changeSelectedTaxonomy:
				menu: #menu:shifted:
				keystroke: #keyStroke:from:.
	listMorph 
		hResizing: #spaceFill;
		 vResizing: #spaceFill.
	listMorph fillStyle: listMorph fillStyleToUse.
	editorSubWindow := TamBrowser
				onReference: nil
				window: TamListItemReferenceUtil subWindowClass new
				insideManager: self
				direction: toRightOrToLeft.
	TamManager addDependent: self.
	self addDependent: editorSubWindow model.
	listRow
		addMorph: listMorph
		fullFrame: (LayoutFrame identity).
	aWindow 
		addMorph: listBtnRow
		fullFrame: listBtnRowFrame.
	aWindow addMorph: listRow fullFrame: listMorphFrame.
	aWindow addMorph: editorSubWindow fullFrame: editorSubWindowFrame.
	toRightOrToLeft == #toRight
		ifTrue: [aWindow addPaneVSplitterBetween: listRow and: {editorSubWindow}]
		ifFalse: [aWindow addPaneVSplitterBetween: editorSubWindow and: {listRow}].
	self addButtons.
	listMorph enableDragNDrop: true.
	listMorph useSquareCorners.
	listRow useSquareCorners.
	listMorph selection: nil.
	^ aWindow
]

{ #category : #accessing }
TamManager >> buttonExtent [
	^self class buttonExtent
]

{ #category : #testing }
TamManager >> canRemovePane [
	^ self taxonomyPane notNil
				and: [self taxonomyPane editorSubWindows size > 1]
]

{ #category : #'taxonomies managing' }
TamManager >> changeSelectedTaxonomy: aTaxonomy [ 
	| selected oldSelected |
	self taxonomyBrowser okToChange
		ifTrue: [self selectedTaxonomyIndex ~= aTaxonomy
				ifTrue: [selected := aTaxonomy > 0
								ifTrue: [self taxonomies at: aTaxonomy].
					oldSelected := selectedTaxonomy.
					selectedTaxonomy := selected.
					self changed: #selectedTaxonomyIndex.
					oldSelected
						ifNotNil: [oldSelected unSelectingFrom: self].
					selected
						ifNil: [self taxonomyBrowser noteNewSelection: nil]
						ifNotNil: [selected selectingFrom: self]].
			^ true].
	^ false
]

{ #category : #'taxonomies managing' }
TamManager >> changeSelectedTaxonomyFromWrapper: aWrapper [ 
	| rootRefIdx |
	rootRefIdx := self taxonomyItemIndexFromWrapper: aWrapper.
	(self changeSelectedTaxonomy: rootRefIdx)
		ifTrue: [^ self taxonomyBrowser noteNewSelectionDeeply: aWrapper]
]

{ #category : #accessing }
TamManager >> currentSelection [
	| sel |
	sel := (self boldRedSelection , self boldBlueSelection) copy.
	sel remove: TamManagerItem default.
	^ sel
]

{ #category : #menu }
TamManager >> deleteTaxonomy: aTaxonomy [ 
	| oldSelectedIndex |
	aTaxonomy
		ifNotNil: [oldSelectedIndex  :=  self
						taxonomyIndexSuchThat: [:c | c = aTaxonomy].
			self removeTaxonomyAt: oldSelectedIndex confirm: true.
			oldSelectedIndex  :=  oldSelectedIndex <= self taxonomies size
						ifTrue: [oldSelectedIndex]
						ifFalse: [self taxonomies size].
			self changeSelectedTaxonomy: oldSelectedIndex]

]

{ #category : #'initialize/release' }
TamManager >> destroy [
	self breakDependents.
	TamManager removeDependent: self.
	self taxonomyBrowser
		ifNotNil: [self taxonomyBrowser destroy].
	mainWindow
		ifNotNil: [mainWindow submorphs
				do: [:sm | sm destroy].
			mainWindow := nil].
	selectedTaxonomy := nil.
	listBtnRow := nil.
	listButtons destroy.
	listButtons := nil.
	listMorph
		ifNotNil: [listMorph model: nil.
			listMorph := nil].
	listRow
		ifNotNil: [listRow delete; destroy.
			listRow := nil].
	editorSubWindow
		ifNotNil: [editorSubWindow destroy.
			editorSubWindow := nil].
	taxonomyPane := nil.
	super destroy
]

{ #category : #'drag and drop' }
TamManager >> dragPassengerFor: item inMorph: dragSource [ 	^ (self taxonomyNamed: item contents) 
]

{ #category : #accessing }
TamManager >> editorSubWindow [	^ editorSubWindow
]

{ #category : #'button actions' }
TamManager >> emptyTaxonomy [
	self selectedTaxonomy notNil
		ifTrue: [^ self emptyTaxonomy: self selectedTaxonomy]
		ifFalse: [
			^ (self buildMenuEmptyTaxonomy: MenuMorph new) popUpInWorld
]
]

{ #category : #'button actions' }
TamManager >> emptyTaxonomy: aTaxonomy [	
	^ aTaxonomy taxonomy menuRemoveAl
]

{ #category : #menu }
TamManager >> genericMenu: aMenu selector: aSelector [	|  |	self taxonomies		do: [:item | item genericMenu: aMenu selector: aSelector fromTaxonomyManager: self.].	^ aMenu
]

{ #category : #'button actions' }
TamManager >> globalSearchListItemByName [
	| pattern |
	pattern := UIManager default request: 'item name or fragment?' translated.
	pattern isEmpty
		ifTrue: [^ nil].
	^ self globalSearchListItemFromFragment: pattern
]

{ #category : #'button actions' }
TamManager >> globalSearchListItemFromFragment: aFragment [ 
	| toMatch founds parents |
	toMatch := aFragment asLowercase.
	founds := OrderedCollection new.
	self taxonomies do: 
			[:cls | 
			founds := founds 
						, (cls taxonomyWrapper selectDeeplySuchThat: 
									[:e | 
									e item shortName includesSubstring: toMatch caseSensitive: false])].
	founds isEmpty ifTrue: [^self taxonomyBrowser noSearchMatchFound].
	TamBrowser 
		genericTree: 'Tamaris: selectors from ''' , aFragment , ''''
		flatCollection: (founds collect: 
					[:e | 
					parents := e item parentsChain.
					parents add: e item.
					parents])
		selectingBlock: 
			[:e | 
			self 
				changeSelectedTaxonomyFromWrapper: (e linked wrapperClass with: e linked
						model: nil)]
		client: self
]

{ #category : #accessing }
TamManager >> hierarchicalListMorphClass [
	^TamPluggableListMorph
]

{ #category : #accessing }
TamManager >> initialExtent [	^ self class initialExtent
]

{ #category : #'initialize/release' }
TamManager >> initialize [
	super initialize.
	listBtnRowHeight := self buttonExtent y + 4
]

{ #category : #menu }
TamManager >> keyStroke: aCharacter from: tamuggableListMorph [ 
	aCharacter = $f
		ifTrue: [^ self menuSearch].
	aCharacter = $x
		ifTrue: [^ self menuDeleteTaxonomy].
	aCharacter = $l
		ifTrue: [^ self menuLinkTaxonomy].
	aCharacter = $n
		ifTrue: [^ self menuNewTaxonomy].
	aCharacter = $r
		ifTrue: [^ self menuRenameTaxonomy].
	self selectedTaxonomy
		ifNotNil: [self selectedTaxonomy keyStroke: aCharacter from: tamuggableListMorph]

]

{ #category : #'button actions' }
TamManager >> linkTaxonomy [
	self selectedTaxonomy notNil
		ifTrue: [^ self menuLinkTaxonomy]
		ifFalse: [^ (self buildMenuLinkTaxonomy: MenuMorph new) popUpInWorld]
]

{ #category : #'taxonomies managing' }
TamManager >> linkTaxonomy: anotherItem [ 
	| newItem id |
	newItem := TamManagerItem linkTo: anotherItem.
	id := (self
				allTaxonomiesSuchThat: [:c | c taxonomy linked = anotherItem taxonomy linked ]) size.
	newItem listId: (id + 1) printString.
	self taxonomies add: newItem.
	self sort.
	self class changed: #taxonomies
]

{ #category : #accessing }
TamManager >> listBtnRow [	^ listBtnRow
]

{ #category : #accessing }
TamManager >> listButtons [	^ listButtons
]

{ #category : #accessing }
TamManager >> listWidth [
	^self class listWidth

	
]

{ #category : #accessing }
TamManager >> mainButtonLabel [
	^self class mainButtonLabel
]

{ #category : #accessing }
TamManager >> mainWindow [	^ mainWindow
]

{ #category : #accessing }
TamManager >> mainWindow: aWindow [	mainWindow := aWindow
]

{ #category : #menu }
TamManager >> menu: menu shifted: aBoolean [ 
	#(#- #('new (n)' #menuNewTaxonomy ) )
		do: [:item | item == #-
				ifTrue: [menu addLine]
				ifFalse: [menu 
						add: item first
						target: self
						selector: item second]].
	self selectedTaxonomy
		ifNotNil: [#(#- #('remove' #menuRemoveTaxonomy ) #- #('link (l)' #menuLinkTaxonomy ) #- #('rename (r)' #menuRenameTaxonomy ) #- )
				do: [:item | item == #-
						ifTrue: [menu addLine]
						ifFalse: [menu
								add: item first
								target: self
								selector: item second]].
			self selectedTaxonomy menu: menu shifted: aBoolean].
	self splitMenu: menu.
	^ menu
]

{ #category : #menu }
TamManager >> menuDeleteTaxonomy [	
	self deleteTaxonomy: self selectedTaxonomy
]

{ #category : #menu }
TamManager >> menuLinkTaxonomy [	self selectedTaxonomy		ifNotNil: [self linkTaxonomy: self selectedTaxonomy]
]

{ #category : #menu }
TamManager >> menuNewManager [	
	self taxonomyPane ifNotNil: [^self taxonomyPane class open].	^ self class open
]

{ #category : #menu }
TamManager >> menuNewTaxonomy [
	| newname old |
	newname := UIManager default request: 'new taxonomy name ?' translated initialAnswer: ''.
	newname notNil
		ifTrue: [old := self taxonomyNamed: newname.
			old
				ifNotNil: [^ self inform: 'name already in use' translated].
			self newTaxonomyNamed: newname]
]

{ #category : #menu }
TamManager >> menuRelabelTaxonomy [
	| label |
	self selectedTaxonomy
		ifNotNil: [label := UIManager default request: 'taxonomy label complement ?' translated initialAnswer: ''.
			self selectedTaxonomy listLabel: label.
			self sort.
			self class changed: #taxonomies]
]

{ #category : #menu }
TamManager >> menuRemoveTaxonomy [
	| rep |
	rep := false.
	self selectedTaxonomy ifNotNil: 
			[self removeTaxonomyAt: self selectedTaxonomyIndex
				confirm: rep not]
]

{ #category : #menu }
TamManager >> menuRenameTaxonomy [	self selectedTaxonomy		ifNotNil: [self selectedTaxonomy taxonomy menuRelabel].	self changed: self selectedTaxonomy taxonomy.	self sort.	self class changed: #taxonomies
]

{ #category : #menu }
TamManager >> menuSearch [	^ self globalSearchListItemByName
]

{ #category : #'ui opening/closing' }
TamManager >> modelWakeUpIn: aMorph [ 
	self taxonomyBrowser		
		ifNotNil: [self taxonomyBrowser modelWakeUpIn: aMorph].	
	self mainWindow
		ifNotNil: [self mainWindow submorphsDo: [:sm | sm show]].	
	super modelWakeUpIn: aMorph
]

{ #category : #'button actions' }
TamManager >> newReference [
	| menu tamBrowser |
	(tamBrowser := self taxonomyBrowser) ifNotNil: 
			[(tamBrowser unwrappedSelection respondsTo: #menuAddReference) 
				ifTrue: [menu := tamBrowser unwrappedSelection menuAddReference]
				ifFalse: 
					[tamBrowser rootWrapper withoutListWrapper ifNotNil: 
							[menu := tamBrowser rootWrapper withoutListWrapper linked menuAddReference]].
			menu ifNotNil: 
					[menu addTitle: 'add ...'.
	menu addStayUpItem.

					menu invokeModal]]
]

{ #category : #'button actions' }
TamManager >> newTaxonomy [	
	^ self menuNewTaxonomy
]

{ #category : #'taxonomies managing' }
TamManager >> newTaxonomy: aNewTaxonomy [ 
	^ self class newTaxonomy: aNewTaxonomy 

]

{ #category : #'taxonomies managing' }
TamManager >> newTaxonomyNamed: anIdent [ 
	^ self class newTaxonomyNamed: anIdent 
	
]

{ #category : #'taxonomies managing' }
TamManager >> noteNewSelectionDeeply: aWrapper [	^ self changeSelectedTaxonomyFromWrapper: aWrapper 
]

{ #category : #accessing }
TamManager >> perform: selector orSendTo: otherTarget [ 	"Selector was just chosen from a menu by a user. If can respond, then  	perform it on myself. If not, send it to otherTarget, presumably the  	editPane from which the menu was invoked."	(self respondsTo: selector)		ifTrue: [^ self perform: selector]		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #'ui opening/closing' }
TamManager >> rememberWindowSize [	
	self class initialExtent: mainWindow bounds extent
]

{ #category : #'button actions' }
TamManager >> removePane [
	self canRemovePane ifTrue: [self taxonomyPane menuRemovePane: self mainWindow]
]

{ #category : #'button actions' }
TamManager >> removeTaxonomy [
	self selectedTaxonomy notNil
		ifTrue: [^ self menuDeleteTaxonomy]
		ifFalse: [^ (self buildMenuDeleteTaxonomy: MenuMorph new) popUpInWorld]
]

{ #category : #'taxonomies managing' }
TamManager >> removeTaxonomyAt: anIndex confirm: aBoolean [ 
	| found doit ident oldName newList |
	found := self taxonomies at: anIndex.
	oldName := found taxonomy asString.
	aBoolean
		ifTrue: [
			(self allTaxonomiesNamed: oldName) size = 1
				ifFalse: [found isRootTaxonLink
						ifFalse: [^ self inform: 'This taxon is linked, you have to remove those links before' translated]]].
	self changeSelectedTaxonomy: 0.
	self taxonomies remove: found.
	found destroy.
	newList := self allTaxonomiesNamed: oldName.
	2
		to: newList size
		do: [:pos | (newList at: pos)
				listId: pos printString].
	self class changed: found
]

{ #category : #accessing }
TamManager >> selectedTaxonomy [	^ selectedTaxonomy
]

{ #category : #accessing }
TamManager >> selectedTaxonomyIndex [	^ self taxonomies indexOf: self selectedTaxonomy ifAbsent: [0]
]

{ #category : #accessing }
TamManager >> showBookmarks [
	^true
]

{ #category : #'taxonomies managing' }
TamManager >> sort [
	self class sort
]

{ #category : #'button actions' }
TamManager >> splitHorizontally [	self taxonomyPane menuSplitHorizontally: self mainWindow.
]

{ #category : #menu }
TamManager >> splitMenu [
| menu |
menu := MenuMorph new.
						menu defaultTarget: self.
	self splitMenu: menu .
	menu popUpInWorld


]

{ #category : #menu }
TamManager >> splitMenu: menu [ 
	#(#- #('split horizontally' #splitHorizontally) #('split vertically' #splitVertically) #- #('browse separately' #browseTaxonomy) )
		do: [:item | item == #-
				ifTrue: [menu addLine]
				ifFalse: [menu
						add: item first
						target: self
						selector: item second]].
	self canRemovePane
		ifTrue: [menu
				add: 'remove pane'
				target: self
				selector: #removePane].
	^ menu
]

{ #category : #'button actions' }
TamManager >> splitVertically [	self taxonomyPane menuSplitVertically: self mainWindow.
]

{ #category : #accessing }
TamManager >> taxonomies [	^ self class taxonomies
]

{ #category : #accessing }
TamManager >> taxonomyBrowser [	^ self editorSubWindow ifNotNil: [self editorSubWindow model]
]

{ #category : #accessing }
TamManager >> taxonomyIndexSuchThat: aBlock [	^ self class taxonomyIndexSuchThat: aBlock
]

{ #category : #accessing }
TamManager >> taxonomyItemIndexFromWrapper: aWrapper [ 
	| parentsChain rootRefIdx rootRef |
	parentsChain := aWrapper parentsChain.
	parentsChain isEmpty
		ifTrue: [rootRefIdx := self
						taxonomyIndexSuchThat: [:ref | ref taxonomy == aWrapper withoutListWrapper]]
		ifFalse: [rootRef := parentsChain first.
			rootRefIdx := self
						taxonomyIndexSuchThat: [:ref | ref taxonomy == rootRef withoutListWrapper]].
	^ rootRefIdx

]

{ #category : #'button actions' }
TamManager >> taxonomyMenuPopup [
	| taxonomyMenu |
	taxonomyMenu := MenuMorph new.
	taxonomyMenu defaultTarget: self.
	taxonomyMenu addTitle: self mainButtonLabel.
	taxonomyMenu addStayUpItem.
	self menu: taxonomyMenu shifted: false.
	taxonomyMenu popUpInWorld
]

{ #category : #accessing }
TamManager >> taxonomyNamed: anIdent [ 	^ self class taxonomyNamed: anIdent 
]

{ #category : #accessing }
TamManager >> taxonomyOf: aListItemReference [ 	^ self class taxonomyOf: aListItemReference
]

{ #category : #accessing }
TamManager >> taxonomyPane [	^ taxonomyPane
]

{ #category : #accessing }
TamManager >> taxonomyPane: aTaxonomyPane [	 taxonomyPane := aTaxonomyPane
]

{ #category : #updating }
TamManager >> update: anObject [ 

	((anObject isKindOf: TamManagerItem)
			or: [anObject == #taxonomies])
		ifTrue: [(selectedTaxonomy = anObject
					and: [anObject isReleased])
				ifTrue: [self taxonomyBrowser noteNewSelection: nil].
			self changed: #taxonomies].
	(self taxonomies includes: TamManagerItem default)
		ifFalse: [TamManagerItem resetDefault.
			self taxonomies add: TamManagerItem default.
			self changed: #taxonomies].
	super update: anObject
]

{ #category : #'drag and drop' }
TamManager >> wantsDroppedMorph: transferMorph event: anEvent inMorph: destinationLM [ 
	^ self class wantsDroppedMorph: transferMorph event: anEvent inMorph: destinationLM 
]

{ #category : #updating }
TamManager >> wantsStepsIn: aWindow [ 
	^ false
]

{ #category : #'ui opening/closing' }
TamManager >> windowIsClosing [
	self destroy.
	super windowIsClosing
]
