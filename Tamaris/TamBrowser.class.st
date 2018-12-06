Class {
	#name : #TamBrowser,
	#superclass : #TamHierarchicalList,
	#instVars : [
		'mainWindow',
		'rootWrapper',
		'listBtnRow',
		'listBtnRowHeight',
		'listButtons',
		'listMorph',
		'editorRow',
		'manager',
		'editorsIndex',
		'specificButtonsAlignment',
		'worldButtons',
		'globalRecentsInput',
		'recentsRow'
	],
	#classVars : [
		'InitialExtent',
		'TaxonomyListWidth'
	],
	#category : #'Tamaris-UI'
}

{ #category : #accessing }
TamBrowser class >> buttonExtent [ 
	^ Tamaris buttonExtent
]

{ #category : #'private reference removing' }
TamBrowser class >> destroyEditorFor: aReference [ 
	self allInstances copy
		do: [:brw | brw destroyEditorFor: aReference]
]

{ #category : #'private reference removing' }
TamBrowser class >> destroyNotSelectedEditorFor: aReference [ 
	self allInstances copy
		do: [:brw | brw destroyNotSelectedEditorFor: aReference]
]

{ #category : #'dialog building' }
TamBrowser class >> genericTree: aTitle flatCollection: aCollectionOfCollection selectingBlock: selBlock client: aClientModel [ 
	| aghl |
	aghl := TamGenericHierarchicalList 
				fromFlatCollection: aCollectionOfCollection
				title: aTitle
				client: aClientModel.
	aghl doDeeply: [:el | el selectingBlock: selBlock].
	aghl doDeeply: [:el | el unSelectingBlock: [:e | ]].
	aghl open.
	aghl expandAll.
	^ aghl
]

{ #category : #'dialog building' }
TamBrowser class >> genericTree: aTitle listBlock: listBlock selectingBlock: selBlock client: aClientModel [ 
	| aghl parentsChain |
	(TamGenericHierarchicalList openedHierarchicalListsOfClient: aClientModel key: aTitle)
		ifNotEmpty: [:founds | founds
				do: [:w | w delete; destroy]].
	aghl := TamGenericHierarchicalList
				fromUpdateBlock: [:hl | 
					hl
						fromFlatCollection: (listBlock value
								inject: OrderedCollection new
								into: [:col :r | 
									parentsChain := r parentsChain.
									parentsChain add: r.
									col add: parentsChain;
										 yourself]).
					hl
						doDeeply: [:el | el selectingBlock: selBlock].
					hl
						doDeeply: [:el | el unSelectingBlock: [:e ]]]
				title: aTitle
				client: aClientModel.
	aghl open.
	aghl expandAll.
	^ aghl
]

{ #category : #accessing }
TamBrowser class >> initialExtent [	
	^InitialExtent ifNil: [InitialExtent := 750@550]
]

{ #category : #accessing }
TamBrowser class >> initialExtent: aPoint [ 	
	InitialExtent := aPoint
]

{ #category : #accessing }
TamBrowser class >> localWorkspaceNumberOfLines [
	^4
]

{ #category : #'instance creation' }
TamBrowser class >> onReference: aReference [ 
	| aNewOne |
	aNewOne := self new.
	aReference ifNotNil: 
			[aNewOne 
				rootWrapper: (aReference wrapperClass with: aReference model: nil)].
	^aNewOne buildMainWindow
]

{ #category : #'instance creation' }
TamBrowser class >> onReference: aReference window: aWindow [ ^ self onReference: aReference window: aWindow direction: #toRight
]

{ #category : #'instance creation' }
TamBrowser class >> onReference: aReference window: aWindow direction: ToRightOrToLeft [ 	^ self		onReference: aReference		window: aWindow		insideManager: nil		direction: ToRightOrToLeft
]

{ #category : #'instance creation' }
TamBrowser class >> onReference: aReference window: aWindow insideManager: aTamManager direction: ToRightOrToLeft [ 
	| aNewOne |
	aNewOne := self new.
	aReference ifNotNil: 
			[aNewOne 
				rootWrapper: (aReference wrapperClass with: aReference model: nil)].
	aWindow model: aNewOne.
	aNewOne 
		buildWindow: aWindow
		insideManager: aTamManager.
	^aWindow
]

{ #category : #'instance creation' }
TamBrowser class >> open [
	self openOnReference: TamManagerItem default taxonomy

]

{ #category : #'instance creation' }
TamBrowser class >> openOnReference: aReference [ 
	| awindow |
	(awindow := self onReference: aReference) openInWorld.
	^ awindow
]

{ #category : #'installing/desinstalling' }
TamBrowser class >> preferedWindowColor [
	^ Color veryLightGray muchLighter
]

{ #category : #'private reference removing' }
TamBrowser class >> reloadEditorFor: aReference [ 

	self allInstances copy
		do: [:brw | brw reloadEditorFor: aReference ]
]

{ #category : #accessing }
TamBrowser class >> taxonomyListWidth [
	^TaxonomyListWidth ifNil: [TaxonomyListWidth := 250]
]

{ #category : #accessing }
TamBrowser class >> taxonomyListWidth: anInteger [
	TaxonomyListWidth := anInteger
]

{ #category : #'drag and drop' }
TamBrowser >> acceptDroppingMorph: transferMorph event: evt inMorph: dstListMorph [ 
	| destItem shouldCopy |
	(transferMorph respondsTo: #passenger) 
		ifTrue: 
			[(transferMorph passenger isKindOf: SelectionMorph) 
				ifTrue: [^ transferMorph passenger justDroppedInto: dstListMorph event: evt].
			(transferMorph passenger isKindOf: TamManagerItem) 
				ifTrue: [transferMorph passenger: transferMorph passenger taxonomy]].
	destItem := dstListMorph itemFromPoint: evt position.
	shouldCopy := (transferMorph respondsTo: #shouldCopy) 
				ifTrue: 
					[transferMorph shouldCopy 
						or: [(transferMorph source isKindOf: listMorph class) not]]
				ifFalse: [true].
	destItem ifNotNil: 
			[^ destItem complexContents acceptDroppingMorph: transferMorph
				copy: shouldCopy].
	^ rootWrapper notNil 
		and: [rootWrapper acceptDroppingMorph: transferMorph copy: shouldCopy]
]

{ #category : #'button actions' }
TamBrowser >> acceptRecentsInputContent: aFragment [ 
	self rootWrapperIsSet 
		ifFalse: 
			[manager 
				ifNotNil: [manager globalSearchListItemFromFragment: aFragment asString. ^ true]].
	self localSearchListItemFromFragment: aFragment asString.
	^true
]

{ #category : #'ui building' }
TamBrowser >> addButtons [
	| btn |
	({{'32x32/actions/reload'.
	self.
	#reinitializeCurrentSelectionEditor.
	'rebuild current selection editor'.
	#haveCurrentSelection}.
	{'16x16/actions/remove'.
	self.
	#removeCurrentSelection.
	'remove selected item'.
	#canRemoveItem.
	#buildMenuRemoveSelection:}.
	#spacer.
	{'16x16/actions/up_level_green'.
	self.
	#selectUpLevel.
	'move up current selection to owner level'.
	#canSelectUpLevel.
	#menuSelectUpLevel:}.
	{'16x16/actions/collapse_all'.
	self.
	#collapseAll.
	'collapse all'.
	#canCollapseAll}.
	{'16x16/actions/local_recents'.
	self.
	#recentsTree.
	'local recents list'.
	#canShowRecents}.
	{'16x16/actions/unaccepted'.
	self.
	#unacceptedList.
	'list of unaccepted editors'.
	#haveUnaccepted}.
	{'16x16/actions/next_green'.
	self.
	#historyNext.
	'go forward in history'.
	#canSelectHistoryNext.
	#menuHistoryNextList:}.
	{'16x16/actions/previous_green'.
	self.
	#historyPrev.
	'go back in history'.
	#canSelectHistoryPrev.
	#menuHistoryPrevList:}.
	#spacer.
	{'16x16/actions/tam_browser_open'.
	self.
	#browseCurrentSelection.
	'open selected item specific editor as detached window'.
	#haveCurrentSelection.
	#buildMenuBrowseSelection:}.
	{'16x16/actions/new_right'.
	self.
	#newReference.
	'add new item into selected taxon or current taxonomy'.
	#canInsertNewReference}.
	{'22x22/actions/tool_dock'.
	self.
	#freeze.
	'freeze current taxonomy'.
	#rootWrapperIsSet}.
	(manager
		ifNotNil: [ 
			{'22x22/actions/view_top_bottom'.
			manager.
			#splitHorizontally.
			'split manager horizontally'.
			nil.
			#splitMenu:} ]).
	(manager ifNotNil: [  ])} select: [ :e | e notNil ])
		do: [ :arr | 
			arr == #spacer
				ifTrue: [ self listButtons addSpacer ]
				ifFalse: [ 
					| label |
					label := ImageMorph withForm: (TamIcons icon: arr first).
					btn := (Smalltalk ui theme
						newButtonIn: World
						for: arr second
						getState: nil
						action: arr third
						arguments: {}
						getEnabled:
							(arr size >= 5
								ifTrue: [ arr fifth ])
						getLabel: nil
						help: arr fourth translated)
						label: label;
						yourself.
					self listButtons addMorph: btn ] ].
	listBtnRow addMorph: listButtons
	
]

{ #category : #accessing }
TamBrowser >> addSpecificButtonsFor: aListItemReference [ 
	self specificButtonsAlignment addTransparentSpacer.
	aListItemReference specificButtonsColumn: self
		inAlignment: self specificButtonsAlignment.

]

{ #category : #'initialize/release' }
TamBrowser >> allEditorsSuchThat: aBlock do: anotherBlock [
	editorsIndex
		ifNotNil: [ editorsIndex copy
				keysAndValuesDo: [:k :v | (aBlock value: v)
						ifTrue: [anotherBlock value: v]]]
]

{ #category : #accessing }
TamBrowser >> anySelectedAndRemoveable [
	^ self removeableSelection notEmpty
]

{ #category : #accessing }
TamBrowser >> boldBlueSelection [
		^(listMorph respondsTo: #boldBlueEmphasisSet) 
		ifTrue: [listMorph boldBlueEmphasisSet asOrderedCollection]
		ifFalse: [#() asOrderedCollection]
]

{ #category : #accessing }
TamBrowser >> boldRedSelection [
	^(listMorph respondsTo: #boldRedEmphasisSet) 
		ifTrue: [listMorph boldRedEmphasisSet asOrderedCollection]
		ifFalse: 
			[#() asOrderedCollection]
]

{ #category : #updating }
TamBrowser >> boundsOf: oneOfMyMorphs updatedWith: newBounds [ 
	oneOfMyMorphs == listMorph 
		ifTrue: [self class taxonomyListWidth: newBounds width]
]

{ #category : #'button actions' }
TamBrowser >> browseCurrentSelection [
	self getCurrentSelection notNil
		ifTrue: [^ self browseSelection: self getCurrentSelection].

]

{ #category : #'button actions' }
TamBrowser >> browseSelection: aWrapper [	^ aWrapper withoutListWrapper menuBrowse
]

{ #category : #'ui building' }
TamBrowser >> buildMainWindow [	
	mainWindow := (StandardWindow labelled: self mainWindowLabel)
	model: self.
	self buildWindow: mainWindow.	
	^ mainWindow
]

{ #category : #menus }
TamBrowser >> buildMenuBrowseSelection: aMenu [ 	^ self genericMenu: aMenu selector: #browseSelection: recursive: true
]

{ #category : #menus }
TamBrowser >> buildMenuRemoveSelection: aMenu [ 
	self 
		genericMenu: aMenu
		selector: #removeSelection:
		conditionBlock: [:r | r isRemoveable]
		recursive: true.
	self anySelectedAndRemoveable 
		ifTrue: 
			[aMenu addLine.
			aMenu 
				add: 'remove all selected'
				target: self
				selector: #removeAllSelected].
	^aMenu
]

{ #category : #menus }
TamBrowser >> buildMenuSelection: aMenu [ 
	^ self
		genericMenu: aMenu
		selector: #noteNewSelection:
		recursive: true
]

{ #category : #'ui building' }
TamBrowser >> buildWindow: aWindow [ 	
	^ self
		buildWindow: aWindow
		insideManager: nil
]

{ #category : #'ui building' }
TamBrowser >> buildWindow: aWindow direction: toRightOrToLeft [ 
	^ self
		buildWindow: aWindow
		insideManager: nil
]

{ #category : #'ui building' }
TamBrowser >> buildWindow: aWindow insideManager: aManager [
	| listBtnRowFrame listMorphFrame editorRowFrame listAndEvalPaneMorphFrame listAndEvalPaneMorph leftDelta topFrame topRowHeight |
	topRowHeight := listBtnRowHeight + 2.
	manager := aManager.
	leftDelta := TamListItemReferenceUtil subFrameBorderDelta.
	topFrame := TamListItemReferenceUtil subWindowClass model: self.
	aWindow
		addMorph: topFrame
		fullFrame: (LayoutFrame identity
				
				leftOffset: leftDelta; topOffset: (aManager
								ifNil: [topRowHeight]
								ifNotNil: [0])).
	aWindow model: self.
	listBtnRowFrame := LayoutFrame identity bottomFraction: 0; bottomOffset: listBtnRowHeight.
	listMorphFrame := LayoutFrame identity.
	editorRowFrame := LayoutFrame identity leftOffset: (self taxonomyListWidth + TamListItemReferenceUtil subFrameBorderDelta).
	listAndEvalPaneMorphFrame := LayoutFrame identity rightFraction: 0; rightOffset: self taxonomyListWidth.
	listButtons := TamButtonsAlignmentMorph newRow.
	aManager
		ifNil: [listBtnRow := TamButtonsAlignmentMorph typicalRowOwner]
		ifNotNil: [listBtnRow := aManager listBtnRow.
			listBtnRow addMorphBack: listButtons].
	listBtnRow borderColor: #raised.
	specificButtonsAlignment := TamButtonsAlignmentMorph newRow.
	listBtnRow addMorphBack: specificButtonsAlignment.
	editorRow := TamListItemReferenceUtil subWindowClass model: self.
	listAndEvalPaneMorph := TamListItemReferenceUtil subWindowClass model: self.
	listMorph := self hierarchicalListMorphClass
				on: self
				list: #getList
				selected: #getCurrentSelection
				changeSelected: #noteNewSelection:
				menu: #menu:shifted:
				keystroke: #keyStroke:from:.
	aManager
		ifNil: [mainWindow addMorph: listBtnRow fullFrame: listBtnRowFrame].
	listAndEvalPaneMorph addMorph: listMorph fullFrame: listMorphFrame.
	topFrame addMorph: listAndEvalPaneMorph fullFrame: listAndEvalPaneMorphFrame.
	topFrame addMorph: editorRow fullFrame: editorRowFrame.
	listBtnRow minimumExtent: 1 @ 1.
	topFrame addPaneVSplitterBetween: listAndEvalPaneMorph and: {editorRow}.
	self addButtons.
	listMorph autoDeselect: true.
	listMorph color: Color white.
	listMorph enableDragNDrop: true.
	listMorph selection: nil.
	listMorph changed: #getList.
	listMorph changed: #getSelection.
	topFrame startStepping.
	^ mainWindow
]

{ #category : #accessing }
TamBrowser >> buttonExtent [
	^manager ifNil: [self class buttonExtent] ifNotNil: [manager buttonExtent]
]

{ #category : #testing }
TamBrowser >> canCollapseAll [
	| topSubmorphs |
	^ (topSubmorphs := self listMorph scroller submorphs) size > 2
				and: [topSubmorphs
						anySatisfy: [:sm | sm isExpanded]]
]

{ #category : #testing }
TamBrowser >> canInsertNewReference [
	^true
]

{ #category : #testing }
TamBrowser >> canMoveDownCurrentSelection [
	^ self haveCurrentSelection
		and: [self unwrappedSelection canBeMovedDown]
]

{ #category : #testing }
TamBrowser >> canMoveUpCurrentSelection [
	^ self haveCurrentSelection
		and: [self unwrappedSelection canBeMovedUp]
]

{ #category : #testing }
TamBrowser >> canRemoveItem [
	^self rootWrapperIsSet 
]

{ #category : #testing }
TamBrowser >> canSearchItemByName [
	^self rootWrapperIsSet or: [manager notNil ]
	
]

{ #category : #'history-handling' }
TamBrowser >> canSelectHistoryNext [
	^ self rootWrapperIsSet and: [self getHistory canSelectNext]
]

{ #category : #'history-handling' }
TamBrowser >> canSelectHistoryPrev [
	^ self rootWrapperIsSet and: [self getHistory canSelectPrev]
]

{ #category : #testing }
TamBrowser >> canSelectUpLevel [
	| |
	^ self getCurrentSelection notNil
				and: [self getCurrentSelection withoutListWrapper hierarchyLevel > 1]
]

{ #category : #'history-handling' }
TamBrowser >> canShowRecents [
	^ self rootWrapperIsSet and: [self getHistory canShowRecents]
]

{ #category : #updating }
TamBrowser >> checkAndClean [
	self checkAndCleanEditorsIndex.
	self getHistory checkAndClean.
	TamListItemWrapper allSubInstances 
		do: [:w | (w item notNil and: [w item isReleased]) ifTrue: [w destroy]].
	TamIndentingListItemMorph allSubInstances do: 
			[:w | 
			(w complexContents notNil and: [w complexContents isReleased]) 
				ifTrue: [w delete]]
]

{ #category : #updating }
TamBrowser >> checkAndCleanAfterClassRemoval [
	self getCurrentSelection
		ifNotNil: [(self getCurrentSelection isReleased or: [self getCurrentSelection withoutListWrapper isReleased])
				ifTrue: [self noteNewSelection: nil]].
	self destroyAllEditors.
	self getHistory checkAndClean
]

{ #category : #updating }
TamBrowser >> checkAndCleanEditorsIndex [
	^ editorsIndex
		ifNotNil: [editorsIndex
				keysAndValuesRemove: [:k :v | k notNil
						and: [k isReleased]]]
]

{ #category : #updating }
TamBrowser >> collapseAll [
	self okToChange
		ifTrue: [self listMorph collapseAll.
			]
]

{ #category : #updating }
TamBrowser >> collapseItem: aMorph [ 
	^ super collapseItem: aMorph
]

{ #category : #accessing }
TamBrowser >> copyPasteBuffer [
	^ TamManager copyPasteBuffer
]

{ #category : #accessing }
TamBrowser >> copyPasteBuffer: aSet [ 
	TamManager copyPasteBuffer: aSet
]

{ #category : #accessing }
TamBrowser >> copyPasteBufferList [
	^ TamManager copyPasteBufferList
]

{ #category : #'copy/paste' }
TamBrowser >> copySelection [
	self rootWrapper
		ifNotNil: [
				self copySelection: self selection]
				
]

{ #category : #'copy/paste' }
TamBrowser >> copySelection: aCollection [ 
	TamManager copySelection: aCollection 
]

{ #category : #accessing }
TamBrowser >> currentlyExpanded [	^ listMorph currentlyExpanded
]

{ #category : #accessing }
TamBrowser >> currentlyExpanded: aCollection [ 
	| morphList |
	listMorph scroller removeAllMorphs.
	morphList := OrderedCollection new.
	listMorph
		addMorphsTo: morphList
		from: self getList
		allowSorting: false
		withExpandedItems: self expandedItems
		atLevel: 0.
		
	listMorph insertNewMorphs: morphList
]

{ #category : #accessing }
TamBrowser >> defaultBackgroundColor [
	^Tamaris preferedWindowColor
]

{ #category : #'initialize/release' }
TamBrowser >> destroy [
	self noteNewSelection: nil.
	self destroyAllEditors.
	self checkAndClean.
	self breakDependents.
	TamManager removeDependent: self.
	mainWindow ifNotNil: 
			[mainWindow stopStepping.
			mainWindow submorphs do: [:sm | sm delete].
			mainWindow := nil].
	rootWrapper ifNotNil: 
			[rootWrapper destroy.
			rootWrapper := nil].
	listBtnRow := nil.
	listButtons ifNotNil: [listButtons destroy].
	listButtons := nil.
	listMorph ifNotNil: 
			[listMorph model: nil.
			listMorph := nil].
	editorRow ifNotNil: 
			[editorRow destroy.
			editorRow := nil].
	manager := nil.
	editorsIndex := nil.
	specificButtonsAlignment destroy.
	specificButtonsAlignment := nil.
	worldButtons destroy.
	worldButtons := nil.
	globalRecentsInput destroy.
	globalRecentsInput := nil.
	recentsRow destroy.
	recentsRow := nil.
	super destroy
]

{ #category : #'initialize/release' }
TamBrowser >> destroyAllEditors [
	 editorsIndex ifNotNil: 
			[ editorsIndex copy keysAndValuesDo: [:k :v | self destroyEditorFor: k]]
]

{ #category : #'initialize/release' }
TamBrowser >> destroyAllEditors: editorsList [
	 editorsIndex
		ifNotNil: [ editorsIndex copy
				keysAndValuesDo: [:k :v | (editorsList includes: v)
						ifTrue: [self destroyEditorFor: k]]]
]

{ #category : #'initialize/release' }
TamBrowser >> destroyAllEditorsExceptFor: aReferenceList [ 
	 editorsIndex ifNotNil: 
			[ editorsIndex copy keysAndValuesDo: 
					[:k :v | 
					(aReferenceList includes: k) ifFalse: [self destroyEditorFor: k]]]
]

{ #category : #'initialize/release' }
TamBrowser >> destroyAllEditorsSuchThat: aBlock [ 
	 editorsIndex
		ifNotNil: [ editorsIndex copy
				keysAndValuesDo: [:k :v | (aBlock value: v)
						ifTrue: [
							self destroyEditorFor: k]]]
]

{ #category : #updating }
TamBrowser >> destroyEditorFor: aReference [ 
	| editor |
	 editorsIndex
		ifNotNil: [(editor :=  editorsIndex
						at: aReference
						ifAbsent: [])
				ifNotNil: [
					aReference announcer unsubscribe: self.
					aReference announcer unsubscribe: editor.
					editor removeDependent: aReference.
					editor model removeDependent: aReference.
					editor model changed: #clearUserEdits.
					editor model windowIsClosing; destroy.
					(editor isKindOf: SystemWindow)
						ifTrue: [editor delete].
					 editorsIndex removeKey: aReference]]
]

{ #category : #updating }
TamBrowser >> destroyNotSelectedEditorFor: aReference [ 
	self unwrappedSelection ~= aReference
		ifTrue: [self destroyEditorFor: aReference. ^ true].
	^ false
]

{ #category : #'drag and drop' }
TamBrowser >> dragPassengerFor: item inMorph: dragSource [ 
	^ item complexContents withoutListWrapper
]

{ #category : #'drag and drop' }
TamBrowser >> dragTransferTypeForMorph: aMorph [ 
	^ #tamaris
]

{ #category : #accessing }
TamBrowser >> editor [
	^self editorRow ifNotNil: [self editorRow findA: TamListItemReferenceUtil subWindowClass ]
]

{ #category : #'ui building' }
TamBrowser >> editor: anEditor for: aReference [ 
	anEditor
		ifNotNil: [ editorsIndex at: aReference put: anEditor]
]

{ #category : #'ui building' }
TamBrowser >> editorFor: aReference [ 
	^  editorsIndex ifNotNil: [ editorsIndex
		at: aReference
		ifAbsent: []]
]

{ #category : #accessing }
TamBrowser >> editorModel [	^ self editor		ifNotNil: [self editor model]
]

{ #category : #accessing }
TamBrowser >> editorRow [	^ editorRow
]

{ #category : #updating }
TamBrowser >> expandItem: aMorph [ 
	^ super expandItem: aMorph
]

{ #category : #accessing }
TamBrowser >> expandedItems [
	| l |
	l := self rootTaxon managerItem ifNotNil: [self rootTaxon managerItem currentlyExpanded].
	^ l
		ifNil: [OrderedCollection new]
]

{ #category : #accessing }
TamBrowser >> expandedItems: aCollection [ 
	| item |
	self rootTaxon ifNotNil: [
	(item := self rootTaxon managerItem) ifNotNil: 
			[item currentlyExpanded: aCollection.
			item currentSelection: self unwrappedSelection]]
]

{ #category : #'button actions' }
TamBrowser >> findWindow [
	^ World findWindow: ActiveEvent
]

{ #category : #updating }
TamBrowser >> freeze [
	self takeExpandedItems.

]

{ #category : #accessing }
TamBrowser >> fullPathAsStringFor: aWrapperOrReference [ 	^ aWrapperOrReference fullPathAsString.
]

{ #category : #menus }
TamBrowser >> genericMenu: aMenu selector: aSelector conditionBlock: aBlock recursive: aBoolean [ 
	self rootWrapper contents do: 
			[:c | 
			c 
				genericMenu: aMenu
				selector: aSelector
				conditionBlock: aBlock
				fromTaxonomyBrowser: self
				recursive: aBoolean].
	^aMenu
]

{ #category : #menus }
TamBrowser >> genericMenu: aMenu selector: aSelector recursive: aBoolean [ 
	^ self genericMenu: aMenu selector: aSelector conditionBlock: [:r| true] recursive: aBoolean 

]

{ #category : #'history-handling' }
TamBrowser >> getHistory [
	^ TamBrowserHistoryList historyListFor: self

]

{ #category : #accessing }
TamBrowser >> getList [
	rootWrapper withoutListWrapper
		ifNotNil: [rootWrapper withoutListWrapper isReleased
				ifTrue: [self mainWindow
						ifNotNil: [self mainWindow delete].
					^ #()]].
	^ (rootWrapper isNil or: [rootWrapper isReleased])
		ifTrue: [#()]
		ifFalse: [rootWrapper contents]
]

{ #category : #accessing }
TamBrowser >> getRecentsInputContent [
	^self unwrappedSelection ifNil: ['']
		ifNotNil: [self unwrappedSelection shortName]
]

{ #category : #testing }
TamBrowser >> hasUnacceptedEdits [
	^ self editorModel notNil and: [self editorModel hasUnacceptedEdits]
]

{ #category : #testing }
TamBrowser >> haveCurrentSelection [
	^ self getCurrentSelection notNil
	
]

{ #category : #'ui building' }
TamBrowser >> haveEditorFor: aReference [ 
	^( editorsIndex at: aReference ifAbsent: []) notNil
]

{ #category : #accessing }
TamBrowser >> haveUnaccepted [
	editorsIndex
		keysAndValuesDo: [:k :v | v model
				ifNotNil: [
						v model hasUnacceptedEdits
								ifTrue: [^ true]]].
	^ false
]

{ #category : #accessing }
TamBrowser >> hierarchicalListMorphClass [
	^ Smalltalk
		at: #TamHierarchicalListMorph
		ifAbsent: [SimpleHierarchicalListMorph]
]

{ #category : #'history-handling' }
TamBrowser >> historyAddItem: aListItemReference [ 
	self getHistory 
		addItem: (TamBrowserHistoryItem listItemReference: aListItemReference)
]

{ #category : #'history-handling' }
TamBrowser >> historyItem [
	^ self getCurrentSelection notNil
		ifTrue: [TamBrowserHistoryItem listItemReference: self getCurrentSelection]
]

{ #category : #'history-handling' }
TamBrowser >> historyNext [
	self okToChange
		ifTrue: [self getHistory selectNext.
			]
]

{ #category : #'history-handling' }
TamBrowser >> historyPrev [
	self okToChange
		ifTrue: [self getHistory selectPrev.
			]
]

{ #category : #'history-handling' }
TamBrowser >> historyRecents [
	self getHistory selectFromRecentsList.
	
]

{ #category : #'ui building' }
TamBrowser >> initialExtent [	
	^ self class initialExtent
]

{ #category : #'initialize/release' }
TamBrowser >> initialize [
	super initialize.
	listBtnRowHeight := self buttonExtent y + 4.
	self getHistory.
	editorsIndex := WeakIdentityKeyDictionary new
]

{ #category : #'history-handling' }
TamBrowser >> isBrowserHistoryItemValid: anHistoryItem [ 
	^ anHistoryItem listItemReference  isReleasedOrHaveReleasedOwner not
]

{ #category : #testing }
TamBrowser >> isReleased [
	^ editorsIndex isNil.


]

{ #category : #menus }
TamBrowser >> keyStroke: aCharacter from: tamuggableListMorph [ 
	aCharacter = $f
		ifTrue: [^ self menuSearch].
	aCharacter = $c
		ifTrue: [^ self copySelection].
	aCharacter = $v
		ifTrue: [^ self pasteSelection].
	aCharacter = $x
		ifTrue: [self rootWrapper
				ifNotNil: [self anySelectedAndRemoveable
						ifTrue: [^ self removeAllSelected]]].
	self unwrappedSelection notNil
		ifTrue: [^ self unwrappedSelection keyStroke: aCharacter from: tamuggableListMorph]
]

{ #category : #'subframes building' }
TamBrowser >> listAndWorkspacePaneMorphsFrameInsideManager: aManager direction: toRightOrToLeft [ 
	^ toRightOrToLeft == #toRight
		ifTrue: [LayoutFrame identity rightFraction: 0;
						rightOffset: self taxonomyListWidth ]
		ifFalse: [LayoutFrame identity leftFraction: 1; leftOffset: self taxonomyListWidth negated ]
]

{ #category : #accessing }
TamBrowser >> listBtnRow [	^listBtnRow
]

{ #category : #accessing }
TamBrowser >> listButtons [	^ listButtons
]

{ #category : #accessing }
TamBrowser >> listMorph [ 	^ listMorph
]

{ #category : #'button actions' }
TamBrowser >> localSearchListItemByName [
	| pattern |
	pattern := UIManager default request: 'item name or fragment?' translated.
	pattern isNil ifTrue: [^nil].
	pattern isEmpty ifTrue: [^nil].
	^ self localSearchListItemFromFragment: pattern
]

{ #category : #'button actions' }
TamBrowser >> localSearchListItemFromFragment: aFragment [ 
	| toMatch founds target parents |
	toMatch := aFragment asLowercase.
	founds := self rootWrapper selectDeeplySuchThat: 
					[:e | 
					e item shortName includesSubstring: toMatch caseSensitive: false].
	founds remove: self rootWrapper ifAbsent: [].
	founds isEmpty ifTrue: [^self noSearchMatchFound].
	self class 
		genericTree: 'Tamaris: found items from ''' , aFragment , ''''
		flatCollection: (founds collect: 
					[:e | 
					parents := e item parentsChain.
					parents add: e item.
					parents])
		selectingBlock: 
			[:e | 
			target := self manager ifNil: [self].
			target 
				noteNewSelectionDeeply: (e linked wrapperClass with: e linked model: nil)]
		client: self
]

{ #category : #accessing }
TamBrowser >> mainWindow [	^mainWindow
]

{ #category : #accessing }
TamBrowser >> mainWindow: aWindow [	mainWindow := aWindow
]

{ #category : #accessing }
TamBrowser >> mainWindowLabel [	
	^ self class name , ' on: ' , self rootWrapper asString
]

{ #category : #accessing }
TamBrowser >> manager [	^ manager
]

{ #category : #menus }
TamBrowser >> menu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the #shifted  
	boolean"
	| listWrapper |
	(listWrapper := self getCurrentSelection
				ifNil: [rootWrapper])
		ifNotNil: [^ listWrapper menu: menu shifted: b].
	^ menu
]

{ #category : #menus }
TamBrowser >> menuClearHistory [
	self getHistory clearHistory.
	self changed
]

{ #category : #'history-handling' }
TamBrowser >> menuHistoryNextList: aMenu [ 
	^ aMenu
]

{ #category : #'history-handling' }
TamBrowser >> menuHistoryPrevList: aMenu [ 
	^ aMenu
]

{ #category : #menus }
TamBrowser >> menuNewReferenceFrom: aReference Into: aMenu [
	aReference menuAddReferenceInto: aMenu.
	aMenu addTitle: 'add reference on ...'.
	^ aMenu
]

{ #category : #'history-handling' }
TamBrowser >> menuRecentsList [
	self getHistory selectFromRecentsList
]

{ #category : #menus }
TamBrowser >> menuSearch [	self searchListItemByName
]

{ #category : #menus }
TamBrowser >> menuSelectUpLevel: aMenu [ 
	| owner |
	owner := self unwrappedSelection owner.
	[owner owner notNil] whileTrue: 
			[aMenu 
				add: owner fullPathAsString
				target: self
				selector: #noteNewSelectionDeeply:
				argumentList: { (owner wrapperClass with: owner model: nil) }.
			owner := owner owner].
	^aMenu
]

{ #category : #menus }
TamBrowser >> menuUpLevelCurrentSelection: aMenu [ 
	| owner |
	owner := self unwrappedSelection owner.
	[owner owner notNil] whileTrue: 
			[aMenu 
				add: owner fullPathAsString
				target: self
				selector: #noteNewSelectionDeeplyAndCollapse:
				argumentList: { (owner wrapperClass with: owner model: nil) }.
			owner := owner owner].
	^aMenu
]

{ #category : #'ui building' }
TamBrowser >> modelEditor: anEditor for: aReference [ 
	anEditor
		ifNotNil: [ editorsIndex at: aReference put: anEditor]
]

{ #category : #'ui opening/closing' }
TamBrowser >> modelWakeUpIn: aMorph [ 
	TamManager addDependent: self.
	super modelWakeUpIn: aMorph.
	self changed
]

{ #category : #'button actions' }
TamBrowser >> moveDownCurrentSelection [
	| curr |
	curr := self unwrappedSelection.
	(curr notNil and: [curr isMoveable])
		ifTrue: [curr owner moveDownReference: curr]
]

{ #category : #'button actions' }
TamBrowser >> moveUpCurrentSelection [
	| curr |
	curr := self unwrappedSelection.
	(curr notNil and: [curr isMoveable])
		ifTrue: [curr owner moveUpReference: curr]
]

{ #category : #'button actions' }
TamBrowser >> newReference [
	| menu |
	(self unwrappedSelection respondsTo: #menuAddReference) 
		ifTrue: 
			[menu := self unwrappedSelection menuAddReference.
			]
	ifFalse: [self rootWrapper withoutListWrapper ifNotNil: 
			[menu := self rootWrapper withoutListWrapper linked menuAddReference.
			]].
	menu ifNotNil: [
	menu addTitle: 'add ...'.
	menu invokeModal]
]

{ #category : #'button actions' }
TamBrowser >> noSearchMatchFound [
	self inform: 'no item found'.
	^ nil
]

{ #category : #updating }
TamBrowser >> noteNewSelection: aWrapper [ 
	(self okToChange and: [self rootWrapper notNil])
		ifTrue: [self noteNewSelectionFromWrapper: (self wrapperOf: aWrapper)]
]

{ #category : #updating }
TamBrowser >> noteNewSelection: aWrapper currentlyExpanded: aCollection [ 
	self okToChange
		ifTrue: [
			self currentlyExpanded: aCollection.
			aWrapper
				ifNotNil: [self
						noteNewSelectionFromWrapper: (self wrapperOf: aWrapper)]]
]

{ #category : #updating }
TamBrowser >> noteNewSelectionDeeply: aWrapper [ 
	| path pathMorph relatedWrapper adjustIt |
	adjustIt := false.
	self okToChange
		ifTrue: [self noteNewSelection: nil.
			(relatedWrapper := self wrapperOf: aWrapper)
				ifNil: [^ self inform: 'unable to select ''' , aWrapper asString , ''''].
			(path := relatedWrapper parentsChain allButFirst) isEmpty
				ifFalse: [pathMorph := self listMorph scroller submorphs
								detect: [:sm | sm complexContents withoutListWrapper linked = path first withoutListWrapper]
								ifNone: [^ false].
					path allButFirst
						do: [:p | 
							pathMorph isExpanded
								ifFalse: [pathMorph toggleExpandedState.
									adjustIt := true].
							self noteNewSelectionSilently: pathMorph complexContents.
							pathMorph := pathMorph children
										detect: [:sm | sm complexContents withoutListWrapper = p withoutListWrapper]
										ifNone: []].
					pathMorph
						ifNotNil: [pathMorph isExpanded
								ifFalse: [pathMorph toggleExpandedState.
									adjustIt := true]]].
			self noteNewSelectionFromWrapper: relatedWrapper.
			adjustIt
				ifTrue: [
					listMorph adjustSubmorphPositions]].
	^ true
]

{ #category : #updating }
TamBrowser >> noteNewSelectionDeeplyAndCollapse: aWrapper [ 	self okToChange		ifTrue: [self noteNewSelectionDeeply: aWrapper.			listMorph expandOrCollapseCurrentMorph]
]

{ #category : #updating }
TamBrowser >> noteNewSelectionFromWrapper: aWrapper [ 
	(self okToChange
			and: [self rootWrapper notNil])
		ifTrue: [self updateCodeRowFor: aWrapper.
			super noteNewSelection: aWrapper]
]

{ #category : #updating }
TamBrowser >> noteNewSelectionSilently: aWrapper [ 
	self okToChange
		ifTrue: [super
				noteNewSelection: (self wrapperOf: aWrapper)]
]

{ #category : #testing }
TamBrowser >> okToChange [
	| okForEditor result |
	okForEditor := self editorModel
				ifNil: [true]
				ifNotNil: [(currentSelection notNil
							and: [currentSelection forceOkToChange])
						or: [self editorModel canDiscardEdits
								ifFalse: [editorRow flash].
							self editorModel okToChange]].
	result := self isReleased
				or: [okForEditor].
	^ result
]

{ #category : #'ui building' }
TamBrowser >> openAsMorph [	^ self buildMainWindow openInWorld	
]

{ #category : #'copy/paste' }
TamBrowser >> pasteSelection [
	| trs whereToPaste |
	whereToPaste := self unwrappedSelection
				ifNil: [self rootWrapper withoutListWrapper].
	self copyPasteBufferList
		do: [:item | 
			trs := TransferMorph withPassenger: item from: self.
			whereToPaste acceptDroppingMorph: trs copy: true]
]

{ #category : #'history-handling' }
TamBrowser >> recents [
	^ self getHistory recents collect: [:wrapper | wrapper listItemReference]
]

{ #category : #'button actions' }
TamBrowser >> recentsListPopup [
	| index choice recentsItems usedRecents |
	self recents isEmpty
		ifFalse: [usedRecents := self recents reversed.
			recentsItems := usedRecents
						collect: [:rec | rec longName contractTo: 100].
			recentsItems
				do: [:ri | ri replaceAll: Character cr with: Character space].
			(index := (UIManager default chooseFrom: recentsItems lines: #())) = 0
				ifFalse: [choice := usedRecents at: index.
					self
						noteNewSelectionDeeply: (choice linked wrapperClass with: choice linked model: nil)]]
]

{ #category : #'history-handling' }
TamBrowser >> recentsTree [
	| aghl |
	aghl := self class
				genericTree: 'Tamaris: recents list'
				listBlock: [self  recents
						]
				selectingBlock: [:e | (self manager
						ifNil: [self])
						noteNewSelectionDeeply: (e linked wrapperClass with: e linked model: nil)]
				client: self.
	aghl addButtonSpacer.
	aghl
		addButton: '16x16/actions/erase'
		target: self
		selector: #menuClearHistory
		balloonText: 'clear recents list'.
	^ aghl
]

{ #category : #accessing }
TamBrowser >> referencesWithUnacceptedEdits [
	| unaccepted |
	unaccepted := OrderedCollection new.
	editorsIndex
		keysAndValuesDo: [:k :v | v model
				ifNotNil: [v model hasUnacceptedEdits
								ifTrue: [unaccepted add: k]]].
	^ unaccepted
]

{ #category : #updating }
TamBrowser >> reinitializeAnnounce: anAnnounce [
	self isReleased ifTrue: [^self ].
	self reinitializeFrom: anAnnounce itemReference

]

{ #category : #'button actions' }
TamBrowser >> reinitializeCurrentSelectionEditor [
	self getCurrentSelection notNil
		ifTrue: [^ self unwrappedSelection reinitializeEditor]
]

{ #category : #updating }
TamBrowser >> reinitializeFrom: aTamListItemReference [
	(self editorModel isNil or: [self editorModel okToChange])
		ifTrue: [
			self destroyEditorFor: aTamListItemReference.
			aTamListItemReference = self unwrappedSelection
				ifTrue: [
					self noteNewSelection: aTamListItemReference]]
]

{ #category : #updating }
TamBrowser >> reloadEditorFor: aReference [ 
	self unwrappedSelection = aReference
		ifTrue: [self noteNewSelection: nil.
			self destroyEditorFor: aReference.
			self noteNewSelection: aReference]
]

{ #category : #menus }
TamBrowser >> rememberWindowSize [
	self class initialExtent: mainWindow bounds extent
]

{ #category : #'button actions' }
TamBrowser >> removeAllSelected [
	self rootWrapper
		ifNotNil: [(self confirm: 'remove all selected items ?' translated)
				ifTrue: [self removeableSelection
						do: [:item | 
							item remove.
							listMorph removeEmphasisOf: item].
					TamManager changed: #contents.
					self noteNewSelection: nil]]
]

{ #category : #'button actions' }
TamBrowser >> removeCurrentSelection [
	| menu |
	self rootWrapper
		ifNotNil: [(self unwrappedSelection notNil
					and: [self unwrappedSelection isRemoveable])
				ifTrue: [menu := MenuMorph new.
					menu defaultTarget: self.
					menu
						add: 'remove current'
						target: self
						selector: #removeSelection:
						argumentList: {self getCurrentSelection}].
			menu
				ifNil: [menu := MenuMorph new]
				ifNotNil: [menu addLine].
			self buildMenuRemoveSelection: menu].
	^ menu
		ifNotNil: [menu popUpInWorld]
]

{ #category : #'button actions' }
TamBrowser >> removeSelection: aWrapper [ 
	| currItem |
	aWrapper withoutListWrapper menuDelete 
		ifTrue: 
			[(listMorph respondsTo: #removeEmphasisOf) 
				ifTrue: [listMorph removeEmphasisOf: aWrapper withoutListWrapper].
			(currItem := self getHistory currentItem) 
				ifNotNil: [self noteNewSelection: currItem listItemReference]]
]

{ #category : #accessing }
TamBrowser >> removeSpecificButtons [
	| buttons |
	buttons := self specificButtonsAlignment submorphs.
	self specificButtonsAlignment removeAllMorphs.
	buttons do: [:btn | btn destroy]
]

{ #category : #accessing }
TamBrowser >> removeableSelection [
	^(self boldRedSelection, self boldBlueSelection) select: [:item | item isRemoveable]
]

{ #category : #accessing }
TamBrowser >> rootTaxon [
	^ self rootWrapper withoutListWrapper
]

{ #category : #accessing }
TamBrowser >> rootWrapper [	^ rootWrapper
]

{ #category : #accessing }
TamBrowser >> rootWrapper: aWrapper [ 
	rootWrapper ifNotNil: [rootWrapper destroy].
	(rootWrapper := aWrapper) ifNil: 
			[self noteNewSelection: nil.
			self changed: #getList]
]

{ #category : #testing }
TamBrowser >> rootWrapperIsSet [
	^ self rootWrapper notNil
]

{ #category : #'button actions' }
TamBrowser >> searchListItemByName [
	self rootWrapperIsSet 
		ifFalse: [^manager ifNotNil: [manager  globalSearchListItemByName]].
	^self localSearchListItemByName
]

{ #category : #'button actions' }
TamBrowser >> selectUpLevel [
	listMorph selectedMorph
		ifNotNil: [self noteNewSelection: self unwrappedSelection owner]
]

{ #category : #accessing }
TamBrowser >> selection [
	(self boldBlueSelection)
				ifNotEmpty: [:selSet | ^ selSet asArray].
	self unwrappedSelection
		ifNotNil: [^ Array with: self unwrappedSelection].
	^ #()
]

{ #category : #'history-handling' }
TamBrowser >> setFromBrowserHistoryItem: anHistoryItem [ 
	| target |
	target := 
	manager ifNil: [self] ifNotNil: [manager].
	^target noteNewSelectionDeeply: anHistoryItem listItemReference
]

{ #category : #accessing }
TamBrowser >> specificButtonsAlignment [
	^specificButtonsAlignment
]

{ #category : #accessing }
TamBrowser >> specificButtonsAlignment: aButtonsAlignment [ 
	(specificButtonsAlignment := aButtonsAlignment) 

]

{ #category : #testing }
TamBrowser >> takeEvent: anEvent [
	^ true
]

{ #category : #updating }
TamBrowser >> takeExpandedItems [
	self expandedItems: self currentlyExpanded
]

{ #category : #accessing }
TamBrowser >> taxonomyBrowser [
	^ self
]

{ #category : #accessing }
TamBrowser >> taxonomyListWidth [
	^self class taxonomyListWidth
]

{ #category : #'button actions' }
TamBrowser >> unacceptedList [
	| index choice recentsItems list target |
	(list := self referencesWithUnacceptedEdits) isEmpty
		ifFalse: [recentsItems := list
						collect: [:rec | rec longName contractTo: 100].
			recentsItems
				do: [:ri | ri replaceAll: Character cr with: Character space].
			(index := UIManager default chooseFrom: recentsItems) = 0
				ifFalse: [choice := list at: index.
					target := self manager
								ifNil: [self].
					target
						noteNewSelectionDeeply: (choice linked wrapperClass with: choice linked model: nil)]]
]

{ #category : #accessing }
TamBrowser >> unwrappedSelection [	^ self getCurrentSelection ifNotNil: [self getCurrentSelection withoutListWrapper]
]

{ #category : #'button actions' }
TamBrowser >> upLevelCurrentSelection [
	self selectUpLevel.
	
	listMorph toggleExpandedState: listMorph selectedMorph
]

{ #category : #updating }
TamBrowser >> update: aSymbol [ 
	aSymbol isTamListItemReference
		ifTrue: [aSymbol isReleasedOrHaveReleasedOwner
				ifTrue: [aSymbol = self getCurrentSelection withoutListWrapper
						ifTrue: [self noteNewSelection: nil].						
					^ self updateTree ]].
	(aSymbol isTamListItemReference
			or: [#(#taxonomies #contents )
					anySatisfy: [:c | c = aSymbol]])
		ifTrue: [(aSymbol = self rootWrapper withoutListWrapper
					and: [self mainWindow notNil])
				ifTrue: [self mainWindow setLabel: self mainWindowLabel].
			^ self updateTree].
	super update: aSymbol
]

{ #category : #updating }
TamBrowser >> updateCodeRowFor: aWrapper [ 
	(currentSelection notNil and: [	currentSelection isReleased not])
		ifTrue: [currentSelection unSelectingFrom: self].
	aWrapper notNil
		ifTrue: [aWrapper selectingFrom: self]
]

{ #category : #updating }
TamBrowser >> updateTree [
	^ self changed: #getList.

]

{ #category : #updating }
TamBrowser >> updateTree: anAnnounce [
	^ self updateTree

]

{ #category : #'drag and drop' }
TamBrowser >> wantsDroppedMorph: transferMorph event: anEvent inMorph: destinationLM [ 
	^ TamManager
		wantsDroppedMorph: transferMorph
		event: anEvent
		inMorph: destinationLM
]

{ #category : #'ui opening/closing' }
TamBrowser >> windowIsClosing [
	self destroy.
	super windowIsClosing
]

{ #category : #accessing }
TamBrowser >> wrapperOf: aReferenceOrAWrapper [ 
	(aReferenceOrAWrapper isKindOf: TamListItemReference)
		ifTrue: [^ aReferenceOrAWrapper linked wrapperClass with: aReferenceOrAWrapper linked model: nil]
		ifFalse: [^ aReferenceOrAWrapper]
]
