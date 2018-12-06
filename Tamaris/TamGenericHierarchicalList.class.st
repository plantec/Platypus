Class {
	#name : #TamGenericHierarchicalList,
	#superclass : #TamHierarchicalList,
	#instVars : [
		'mainWindow',
		'listMorph',
		'bottomButtons',
		'bottomButtonsRow',
		'rootListItems',
		'clientModel',
		'updateBlock',
		'sortBlock',
		'key'
	],
	#classVars : [
		'InitialExtent'
	],
	#category : #'Tamaris-UI'
}

{ #category : #accessing }
TamGenericHierarchicalList class >> buttonExtent [ 
	^ Tamaris buttonExtent
]

{ #category : #examples }
TamGenericHierarchicalList class >> classAndSelectorsByCategoryExample [
	"self classAndSelectorsByCategoryExample"
	| aghl editorClass categories classesOfCategoryBlock sysCatBrowserBlock browser classBrowserBlock |
	categories := SystemOrganization categories asOrderedCollection.
	editorClass := (Smalltalk
				at: #RefactoringBrowser
				ifAbsent: [])
				ifNil: [Browser].
	browser := editorClass new.
	(browser openAsMorphEditing: nil) openAsMorph.
	sysCatBrowserBlock := [:sysCat | browser
				systemCategoryListIndex: (browser systemCategoryList indexOf: sysCat)].
	classBrowserBlock := [:cls :sel | browser setClass: cls selector: sel].
	classesOfCategoryBlock := [:cat :flatCol | (Smalltalk organization listAtCategoryNamed: cat)
				inject: flatCol
				into: [:col :cls | col
						addAll: ((Smalltalk at: cls) selectors asOrderedCollection
								collect: [:s | OrderedCollection
										with: #sysCat -> cat
										with: #class
												-> (Smalltalk at: cls)
										with: #selector -> s]);
						 yourself]].
	aghl := self
				fromFlatCollection: (categories
						inject: OrderedCollection new
						into: [:col :cat | classesOfCategoryBlock value: cat value: col])
				title: 'All selectors by class and system categories'.
	aghl
		doDeeply: [:e | 
			e
				asStringBlock: [:item | item linked value asString].
			e
				selectingBlock: [:item | item linked key = #sysCat
						ifTrue: [sysCatBrowserBlock value: item linked value]
						ifFalse: [item linked key = #class
								ifTrue: [classBrowserBlock value:item linked value value: nil]
								ifFalse: [classBrowserBlock value: item owner linked value value: item linked value]]]].
	aghl open
]

{ #category : #examples }
TamGenericHierarchicalList class >> classAndSelectorsExample [
	"self classAndSelectorsExample"
	| aghl editorClass browser |
	editorClass := (Smalltalk
				at: #RefactoringBrowser
				ifAbsent: [])
				ifNil: [Browser].
	aghl := self
				fromFlatCollection: (SystemNavigation default allClasses
						inject: OrderedCollection new
						into: [:col :cls | col
								addAll: (cls selectors asOrderedCollection
										collect: [:s | OrderedCollection with: cls with: s]);
								 yourself])
				title: 'All selectors by class'.
	aghl
		doDeeply: [:e | 
			e
				selectingBlock: [:item | 
					Transcript show: '[+  '
							, (item owner
									ifNil: [item asString]
									ifNotNil: [item owner asString , '>>' , e asString]) , ']'.
					browser := item owner
								ifNil: [editorClass new setClass: item linked selector: nil]
								ifNotNil: [editorClass new setClass: item owner linked selector: item linked].
					(browser openAsMorphEditing: nil) openInWorld].
			e
				unSelectingBlock: [:item | Transcript show: '[-  '
							, (item owner
									ifNil: [item asString]
									ifNotNil: [item owner asString , '>>' ,item asString]) , ']']].
	aghl open
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromFlatCollection: aCollectionOfCollections [ 
	^ self new fromFlatCollection: aCollectionOfCollections
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromFlatCollection: aCollectionOfCollections title: aTitle [ 
	| aghl |
	aghl := self new fromFlatCollection: aCollectionOfCollections.
	aghl key: aTitle.
	^ aghl
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromFlatCollection: aCollectionOfCollections title: aTitle client: aClientModel [ 
	| aghl |
	aghl := self fromFlatCollection: aCollectionOfCollections title: aTitle.
	aghl clientModel: aClientModel.
	^ aghl
]

{ #category : #examples }
TamGenericHierarchicalList class >> fromFlatCollectionExample [
	| aghl |
	aghl := self fromFlatCollection: #(#(#String 'titi' 'toto') #(#String 'titi' 'tata') #(#String 'titi' 'momo') #(#String 'kiki' 'tata') #(#String 'mimi' 'tata') #(#Integer 'titi' 'tata') #(#Class 'momo' 'tata') #(#Class 'mimi' 'tata') #(#Class 'mimi' 'riri') #(#String 'titi' 'tata') ).
	aghl open
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromRootListItems: aCollectionOfListItems [ 
	^ self new rootListItems: aCollectionOfListItems
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromRootListItems: aCollectionOfListItems title: aTitle [ 
	| aghl |
	aghl := self fromRootListItems: aCollectionOfListItems.
	aghl key: aTitle.
	^ aghl
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromRootListItems: aCollectionOfListItems title: aTitle client: aClientModel [ 
	| aghl |
	aghl := self fromRootListItems: aCollectionOfListItems title: aTitle.
	aghl clientModel: aClientModel.
	^ aghl
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromUpdateBlock: aOneArgBlock [ 
	^ self new updateBlock: aOneArgBlock
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromUpdateBlock: aOneArgBlock title: aTitle [
	| aghl |
	aghl := self fromUpdateBlock: aOneArgBlock.
	aghl key: aTitle.
	^ aghl
]

{ #category : #'instance creation' }
TamGenericHierarchicalList class >> fromUpdateBlock: aOneArgBlock title: aTitle client: aClientModel [
	| aghl |
	aghl := self fromUpdateBlock: aOneArgBlock title: aTitle.
	aghl clientModel: aClientModel.
	^ aghl
]

{ #category : #accessing }
TamGenericHierarchicalList class >> initialExtent [
	^ InitialExtent
				ifNil: [InitialExtent := 300 @ 400]
]

{ #category : #accessing }
TamGenericHierarchicalList class >> initialExtent: aPoint [ 	InitialExtent := aPoint
]

{ #category : #accessing }
TamGenericHierarchicalList class >> openedHierarchicalLists [
	^ ActiveWorld submorphs
		select: [:sm | sm isSystemWindow
				and: [sm model isKindOf: self]]
]

{ #category : #accessing }
TamGenericHierarchicalList class >> openedHierarchicalListsOfClient: aClientModel [ 
	^ self openedHierarchicalLists
		select: [:h | h model clientModel = aClientModel]
]

{ #category : #accessing }
TamGenericHierarchicalList class >> openedHierarchicalListsOfClient: aClientModel key: anObject [ 
	^ (self openedHierarchicalListsOfClient: aClientModel)
		select: [:h | h model key = anObject]
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButton: formName block: aBlock balloonText: aText [ 
	self
		addButton: formName
		target: self
		selector: #buttonBlock:valueWithArguments:
		arguments: (Array with: aBlock with: (Array with: self))
		balloonText: aText
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButton: formName target: aTarget selector: aSelector arguments: args balloonText: aText [ 
	| btn label |
	label := ImageMorph withForm: (TamIcons icon: formName).
	btn := (UITheme current
			newButtonIn: World
		for: aTarget
		getState: nil 
		action: aSelector
		arguments: args
		getEnabled: nil
		getLabel: nil
		help: aText)
			label: label;
			yourself.
	bottomButtons addMorph: btn
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButton: formName target: aTarget selector: aSelector balloonText: aText [ 
	^ self addButton: formName target: aTarget selector: aSelector arguments: {} balloonText: aText 
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButtonLabelled: aName block: aBlock balloonText: aText [ 
	self
		addButtonLabelled: aName
		target: self
		selector: #buttonBlock:valueWithArguments:
		arguments: (Array
				with: aBlock
				with: (Array with: self))
		balloonText: aText
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButtonLabelled: aName target: aTarget selector: aSelector arguments: args balloonText: aText [ 
	| btn |
	btn := PluggableButtonMorph  new.
	btn model: aTarget.
	btn label: aName.
	btn action: aSelector.
	btn arguments: args.
	btn setBalloonText: aText.
	btn extent: self buttonExtent.
	btn offColor: Color veryLightGray.
	btn borderColor: #raised.
	btn borderWidth: 1.
	bottomButtons addMorph: btn
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButtonSpacer [
	bottomButtons addSpacer
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addButtons [
	bottomButtons := TamButtonsAlignmentMorph newRow.
	bottomButtons hResizing: #spaceFill.
	{{'16x16/actions/remove_pane'. self. #close. 'close this widow'}}
		do: [:arr | arr == #spacer
				ifTrue: [bottomButtons addSpacer]
				ifFalse: [self
						addButton: arr first
						target: arr second
						selector: arr third
						balloonText: arr fourth]].
	bottomButtonsRow addMorph: bottomButtons
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> addExtensibleButtonSpacer [
	bottomButtons addExtensibleSpacer
]

{ #category : #menus }
TamGenericHierarchicalList >> addModelItemsToWindowMenu: aMenu [ 	aMenu addLine.	aMenu		add: 'remember window size'		target: self		action: #rememberWindowSize
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> buildMainWindow [
	^ self buildMainWindow: self mainWindowLabel

]

{ #category : #'ui building' }
TamGenericHierarchicalList >> buildMainWindow: title [ 
	mainWindow := (StandardWindow labelled: title) model: self.
	self buildWindowWithButtons: mainWindow.
	mainWindow paneColor: Color gray muchLighter.
	listMorph color: Color gray muchLighter.
	bottomButtonsRow color: Color gray muchLighter.
	mainWindow extent: self initialExtent.
	^mainWindow
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> buildWindow: aWindow [ 
	listMorph
		ifNil: [listMorph := self hierarchicalListMorphClass
						on: self
						list: #getList
						selected: #getCurrentSelection
						changeSelected: #noteNewSelection:
						menu: #menu:shifted:
						keystroke: #keyStroke:from:.
			listMorph autoDeselect: true.
			listMorph enableDragNDrop: false].
	aWindow
		addMorph: listMorph
		fullFrame: (LayoutFrame identity).
	listMorph selection: nil.
	listMorph changed: #getList.
	listMorph changed: #getSelection.
	^ aWindow
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> buildWindowWithButtons: aWindow [ 
	| bottomButtonsRowHeight |
	bottomButtonsRowHeight := self buttonExtent y + 16 +  1.
	self buildWindow: aWindow.
	listMorph
		layoutFrame: (LayoutFrame identity bottomOffset: bottomButtonsRowHeight negated).
	bottomButtonsRow := TamButtonsAlignmentMorph typicalRowOwner.
	self addButtons.
	aWindow
		addMorph: bottomButtonsRow
		fullFrame: (LayoutFrame identity topFraction: 1; topOffset: bottomButtonsRowHeight negated).
	^ aWindow
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> buttonBlock: aBlock valueWithArguments: args [ 
	aBlock valueWithArguments: args
]

{ #category : #accessing }
TamGenericHierarchicalList >> buttonExtent [
	^self class buttonExtent
]

{ #category : #accessing }
TamGenericHierarchicalList >> clientModel [
	^clientModel
]

{ #category : #accessing }
TamGenericHierarchicalList >> clientModel: anObject [ 
	clientModel
		ifNotNil: [clientModel removeDependent: self].
	clientModel := anObject. 
	clientModel
		ifNotNil: [clientModel addDependent: self]
]

{ #category : #'ui opening/closing' }
TamGenericHierarchicalList >> close [
	mainWindow delete
]

{ #category : #updating }
TamGenericHierarchicalList >> collapseAll [
	self listMorph toggleExpandedState: self listMorph scroller submorphs first.
	self listMorph adjustSubmorphPositions 
]

{ #category : #'initialize/release' }
TamGenericHierarchicalList >> destroy [
	mainWindow
		ifNotNil: [mainWindow submorphs
				do: [:sm | sm delete].
			mainWindow := nil].
	bottomButtons
		ifNotNil: [bottomButtons destroy.
			bottomButtons := nil].
	bottomButtonsRow := nil.
	listMorph
		ifNotNil: [listMorph model: nil.
			listMorph := nil].
	clientModel := nil.
	updateBlock := nil.
	sortBlock := nil.
	super destroy
]

{ #category : #updating }
TamGenericHierarchicalList >> doDeeply: aBlock [ 
	^ self rootListItems
		do: [:e | e
				doDeeply: aBlock
				from: self
				]
]

{ #category : #updating }
TamGenericHierarchicalList >> expandAll [
	self listMorph expandAll

]

{ #category : #updating }
TamGenericHierarchicalList >> fromFlatCollection: aCollection [ 
	self

		rootListItems: (TamGenericHierarchicalListItem fromFlatCollection: aCollection).
	self sort.
	self changed: #getList
]

{ #category : #accessing }
TamGenericHierarchicalList >> getList [
	^self rootListItems isNil 
		ifTrue: 
			[#()]
		ifFalse: 
			[self rootListItems 
				collect: [:each | each wrapperClass with: each model: nil]]
]

{ #category : #accessing }
TamGenericHierarchicalList >> hierarchicalListMorphClass [
	^ TamHierarchicalListMorph
]

{ #category : #'ui building' }
TamGenericHierarchicalList >> initialExtent [
	^ self class initialExtent
]

{ #category : #accessing }
TamGenericHierarchicalList >> key [ 
	^ key
]

{ #category : #accessing }
TamGenericHierarchicalList >> key: anObject [
	key := anObject
]

{ #category : #menus }
TamGenericHierarchicalList >> keyStroke: aCharacter from: tamuggableListMorph [ 
	self unwrappedSelection notNil
		ifTrue: [(self unwrappedSelection respondsTo: #keyStroke:from:)
			ifTrue: [self unwrappedSelection  keyStroke: aCharacter from: tamuggableListMorph]]
]

{ #category : #accessing }
TamGenericHierarchicalList >> listMorph [ 	^ listMorph
]

{ #category : #accessing }
TamGenericHierarchicalList >> mainWindow [	^mainWindow
]

{ #category : #accessing }
TamGenericHierarchicalList >> mainWindowLabel [
	^ key ifNil: [self class name] ifNotNil: [key asString]
]

{ #category : #menus }
TamGenericHierarchicalList >> menu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring the  
	#shifted boolean"
	| listWrapper |
	(listWrapper := self getCurrentSelection)
		ifNotNil: [menu defaultTarget: self.
			^ listWrapper withoutListWrapper menu: menu shifted: b].
	^ menu
]

{ #category : #updating }
TamGenericHierarchicalList >> noteNewSelection: aWrapper [ 
	| oldSelection |
	self okToChange 
		ifTrue: 
			[oldSelection := currentSelection.
			super noteNewSelection: aWrapper.
			oldSelection notNil 
				ifTrue: [oldSelection withoutListWrapper unSelectingFrom: self].
			aWrapper notNil ifTrue: [aWrapper withoutListWrapper selectingFrom: self]]
]

{ #category : #'ui opening/closing' }
TamGenericHierarchicalList >> open [
	self buildMainWindow openInWorld.

]

{ #category : #'ui building' }
TamGenericHierarchicalList >> openAsMorph [	^ self buildMainWindow openInWorld	
]

{ #category : #'ui opening/closing' }
TamGenericHierarchicalList >> openModal [
	self buildMainWindow openInWorld.
	[mainWindow  notNil]
		whileTrue: [mainWindow outermostWorldMorph doOneCycle]
]

{ #category : #'ui opening/closing' }
TamGenericHierarchicalList >> openModalAndExpand [
	self buildMainWindow openInWorld.
	self expandAll.
	[mainWindow  notNil and: [mainWindow world notNil]]
		whileTrue: [mainWindow outermostWorldMorph doOneCycle]
]

{ #category : #menus }
TamGenericHierarchicalList >> rememberWindowSize [	self class initialExtent: mainWindow bounds extent
]

{ #category : #accessing }
TamGenericHierarchicalList >> rootListItems [
	^ rootListItems
]

{ #category : #accessing }
TamGenericHierarchicalList >> rootListItems: aCollection [ 
	rootListItems := aCollection.
	self changed: #getList
]

{ #category : #updating }
TamGenericHierarchicalList >> setFirstLevelSortBlock: aBlock [
	sortBlock := aBlock
]

{ #category : #updating }
TamGenericHierarchicalList >> sort [
	| sb |
	sb := self sortBlock
				ifNil: [[:a :b | a asString < b asString]].
	self rootListItems: (self rootListItems asArray sort: sb) asOrderedCollection.
	self rootListItems
		do: [:c | c sort].
	self changed: #getList
]

{ #category : #accessing }
TamGenericHierarchicalList >> sortBlock [
	^ sortBlock
]

{ #category : #updating }
TamGenericHierarchicalList >> stepIn: aSystemWindow [ 
	self updateList.
	super stepIn: aSystemWindow
]

{ #category : #accessing }
TamGenericHierarchicalList >> unwrappedSelection [	^ self getCurrentSelection ifNotNil: [self getCurrentSelection withoutListWrapper]
]

{ #category : #updating }
TamGenericHierarchicalList >> update: aSymbol [ 
	(aSymbol = self clientModel
			or: [aSymbol = #getCurrentSelection])
		ifTrue: [^ self updateList].
	super update: aSymbol
]

{ #category : #accessing }
TamGenericHierarchicalList >> updateBlock [
	^updateBlock
]

{ #category : #accessing }
TamGenericHierarchicalList >> updateBlock: aBlock [ 
	updateBlock := aBlock.
	self updateList
]

{ #category : #updating }
TamGenericHierarchicalList >> updateList [
	self updateBlock
		ifNotNil: [self updateBlock value: self.
			self changed: #getList]
]

{ #category : #'ui opening/closing' }
TamGenericHierarchicalList >> windowIsClosing [
	self destroy.
	super windowIsClosing
]
