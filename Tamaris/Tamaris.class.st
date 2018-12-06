Class {
	#name : #Tamaris,
	#superclass : #Object,
	#instVars : [
		'mainWindow',
		'editorSubWindows',
		'mainPane',
		'firstPane',
		'topPane'
	],
	#classVars : [
		'InitialExtent'
	],
	#category : #'Tamaris-UI'
}

{ #category : #preferences }
Tamaris class >> buttonExtent [
	"default button extent"
	| prefSet |
	prefSet := StandardFonts buttonFont height + 6.
	^ (22 max: prefSet)
		@ (22 max: prefSet)
]

{ #category : #utilities }
Tamaris class >> chooseFilePathMatching: patterns label: title [
	| fd |
	fd := FileDialogWindow basicNew
		previewType: false;
		initialize;
		title: title;
		answerPathName.
	patterns ifNotNil: [
		fd fileSelectionBlock: [:de |
			(fd defaultFileSelectionBlock value: de) and: [
				de isDirectory or: [patterns anySatisfy: [:pat | pat match: de name]]]]].
	^(UIManager default modalMorph openModal: fd) answer
]

{ #category : #preferences }
Tamaris class >> initialExtent [	
	^ InitialExtent
]

{ #category : #preferences }
Tamaris class >> initialExtent: aPoint [ 
	InitialExtent := aPoint
]

{ #category : #'class initialization' }
Tamaris class >> initialize [
	"self initialize"
	self breakDependents.
	InitialExtent := 600 @ 500.

]

{ #category : #queries }
Tamaris class >> itemNamed: aName [
	| map |
	TamManager taxonomies detect: [:t | (map := t item findDeeplySuchThat: [:e | e name = aName]) notNil].
	^ map

]

{ #category : #accessing }
Tamaris class >> managerOpenCommandName [
	^ self name 
]

{ #category : #'instance creation' }
Tamaris class >> open [
	"self open"

	| newTaxonomiesPane |
	newTaxonomiesPane := self new .
	^newTaxonomiesPane buildMainWindow openInWorld
]

{ #category : #'instance creation' }
Tamaris class >> openInWindow: aWindow [ 
	"self open"

	| newTaxonomiesPane |
	newTaxonomiesPane := self new.
	newTaxonomiesPane buildWindow: aWindow.
	aWindow model: newTaxonomiesPane.
	^aWindow
]

{ #category : #preferences }
Tamaris class >> preferedWindowColor [
	^ Color veryLightGray veryMuchLighter muchLighter
]

{ #category : #'ui building' }
Tamaris >> addModelItemsToWindowMenu: aMenu [ 
	aMenu addLine.
	aMenu
		add: 'remember window size'
		target: self
		action: #rememberWindowSize.
	aMenu addLine.
	aMenu
		add: 'default lists width'
		target: self
		action: #setListsWidthToDefault.
	aMenu addLine.
	aMenu
		add: 'load button forms from disk'
		target: TamIcons
		action: #importForms.
	aMenu addLine.
	aMenu
		add: 'Quit'
		target: self
		action: #destroyAndQuit.
	aMenu addLine
]

{ #category : #'ui building' }
Tamaris >> buildMainWindow [
	mainWindow := (StandardWindow labelled: self class managerOpenCommandName) model: self;
				 yourself.
	topPane := TamListItemReferenceUtil subWindowClass  model: self.
	mainPane := TamListItemReferenceUtil subWindowClass  model: self.
	firstPane := TamListItemReferenceUtil subWindowClass  model: self.
	self buildWindow: firstPane.
	mainPane
		addMorph: firstPane
		fullFrame: (LayoutFrame identity).
	topPane
		addMorph: mainPane
		fullFrame: (LayoutFrame identity).
	mainWindow
		addMorph: topPane
		fullFrame: (LayoutFrame identity).
	mainWindow extent: self initialExtent.
	self changed: #taxonomies.
	^ mainWindow
]

{ #category : #'ui building' }
Tamaris >> buildWindow: aWindow [ 	
	^ self buildWindow: aWindow direction: #toRight
]

{ #category : #'ui building' }
Tamaris >> buildWindow: aWindow direction: ToRightOrToLeft [ 
	self editorSubWindows add: aWindow.
	TamManager openInWindow: aWindow direction: ToRightOrToLeft.
	aWindow model taxonomyPane: self.
	aWindow model mainWindow: aWindow.
	self addDependent: aWindow model.
	aWindow startStepping.
	^ aWindow
]

{ #category : #accessing }
Tamaris >> defaultBackgroundColor [
	^ self class preferedWindowColor
]

{ #category : #'initialize/release' }
Tamaris >> destroy [
	mainWindow
		ifNotNil: [
			mainWindow := nil].
	editorSubWindows
		ifNotNil: [editorSubWindows
				do: [:w | 
					self removeWindow: w.
					w destroy].
			editorSubWindows := nil].
	mainPane := nil.
	super destroy
]

{ #category : #'ui opening/closing' }
Tamaris >> destroyAndQuit [
mainWindow ifNotNil: [mainWindow delete].
	self destroy
]

{ #category : #accessing }
Tamaris >> editorSubWindows [	
	^editorSubWindows
]

{ #category : #accessing }
Tamaris >> initialExtent [	^ self class initialExtent
]

{ #category : #'initialize/release' }
Tamaris >> initialize [
	super initialize.
	editorSubWindows := WeakSet new.

]

{ #category : #accessing }
Tamaris >> mainWindow [	^ mainWindow
]

{ #category : #menu }
Tamaris >> menuRemovePane: aWindow [ 
	| ownerWindow ownerOwnerWindow other |
	ownerWindow := aWindow owner.
	ownerOwnerWindow := ownerWindow owner.
	other := ownerOwnerWindow submorphs
				detect: [:sm | (sm isKindOf: BorderedMorph)
						and: [sm ~= ownerWindow]].
	[other submorphs
		allSatisfy: [:sw | sw class == TamListItemReferenceUtil subWindowClass]]
		whileTrue: [other := other submorphs first].
	self removeOtherPane: other
]

{ #category : #menu }
Tamaris >> menuSplitHorizontally: aWindow [ 	self split: aWindow axe: #horizontally
]

{ #category : #menu }
Tamaris >> menuSplitVertically: aWindow [ 
	"| newPane |
	newPane := aWindow splitVertically.
	self buildWindow: newPane.
	self changed: #taxonomies"
		self split: aWindow axe: #vertically

]

{ #category : #'ui opening/closing' }
Tamaris >> modelWakeUpIn: aMorph [ 
	self mainWindow ifNotNil: [self mainWindow submorphsDo: [:sm | sm show]].
	self editorSubWindows ifNotNil: [self editorSubWindows do: [:e | e model modelWakeUpIn: aMorph]].
	super modelWakeUpIn: aMorph
]

{ #category : #menu }
Tamaris >> perform: selector orSendTo: otherTarget [ 	"Selector was just chosen from a menu by a user. If can respond, then  	perform it on myself. If not, send it to otherTarget, presumably the  	editPane from which the menu was invoked."	(self respondsTo: selector)		ifTrue: [^ self perform: selector]		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #menu }
Tamaris >> rememberWindowSize [	self class initialExtent: mainWindow bounds extent
]

{ #category : #menu }
Tamaris >> removeOtherPane: aWindow [ 
	| ownerWindow ownerOwnerWindow selectionIndex pane |
	selectionIndex := 0.
	selectionIndex := aWindow model
				ifNotNil: [aWindow model selectedTaxonomyIndex].
	ownerWindow := aWindow owner.
	ownerOwnerWindow := ownerWindow owner.
	ownerOwnerWindow removePaneSplitters.
	ownerOwnerWindow
		submorphsDo: [:sm | self removeWindow: sm firstSubmorph].
	ownerOwnerWindow removeAllMorphs.
	ownerOwnerWindow layoutChanged.
	pane := TamListItemReferenceUtil subWindowClass model: ownerOwnerWindow model.
	self buildWindow: pane.
	ownerOwnerWindow
		addMorph: pane
		fullFrame: (LayoutFrame identity).
	pane borderWidth: 0.
	pane model changeSelectedTaxonomy: selectionIndex.
	self changed: #taxonomies
]

{ #category : #'ui opening/closing' }
Tamaris >> removeWindow: aWindow [ 
	self removeDependent: aWindow model.
	self editorSubWindows remove: aWindow ifAbsent: [].
	(aWindow model)
		windowIsClosing;
		destroy.
	aWindow delete
]

{ #category : #'initialize/release' }
Tamaris >> setListsWidthToDefault [
	TamManager listWidth: 120.
	TamBrowser taxonomyListWidth: 220
]

{ #category : #menu }
Tamaris >> split: aWindow axe: verticallyOrHorizontally [ 
	| leftPane rightPane selectionIndex ownerWindow tmpPane fractions secondSubPanesDirection deltaY deltaX |
	verticallyOrHorizontally == #vertically
		ifTrue: [secondSubPanesDirection := #toLeft.
			deltaY := 0.
			deltaX := TamListItemReferenceUtil subFrameBorderDelta / 2.
			fractions := Array
						with: (0 @ 0 corner: 0.5 @ 1)
						with: (0.5 @ 0 corner: 1 @ 1)]
		ifFalse: [secondSubPanesDirection := #toRight.
			deltaY := TamListItemReferenceUtil subFrameBorderDelta / 2.
			deltaX := 0.
			fractions := Array
						with: (0 @ 0 corner: 1 @ 0.5)
						with: (0 @ 0.5 corner: 1 @ 1)].
	selectionIndex := aWindow model isNil
				ifTrue: [0]
				ifFalse: [aWindow model selectedTaxonomyIndex].
	aWindow model changeSelectedTaxonomy: 0.
	ownerWindow := aWindow owner.
	ownerWindow removeAllMorphs.
	leftPane := TamListItemReferenceUtil subWindowClass model: ownerWindow model.
	ownerWindow
		addMorph: leftPane
		fullFrame: (LayoutFrame identity leftFraction: fractions first left; topFraction: fractions first top; rightFraction: fractions first right; bottomFraction: fractions first bottom; rightOffset: deltaX negated; bottomOffset: deltaY negated).
	tmpPane := TamListItemReferenceUtil subWindowClass  model: leftPane model.
	leftPane
		addMorph: tmpPane
		fullFrame: (LayoutFrame identity).
	self buildWindow: tmpPane.
	tmpPane borderWidth: 0.
	tmpPane model changeSelectedTaxonomy: selectionIndex.
	rightPane := TamListItemReferenceUtil subWindowClass model: ownerWindow model.
	ownerWindow
		addMorph: rightPane
		fullFrame: (LayoutFrame identity leftFraction: fractions second left; topFraction: fractions second top; rightFraction: fractions second right; bottomFraction: fractions second bottom; leftOffset: deltaX ; topOffset: deltaY).
	rightPane borderWidth: 0.
	tmpPane := TamListItemReferenceUtil subWindowClass model: rightPane model.
	rightPane
		addMorph: tmpPane
		fullFrame: (LayoutFrame identity).
	self buildWindow: tmpPane direction: secondSubPanesDirection.
	tmpPane borderWidth: 0.
	tmpPane model changeSelectedTaxonomy: selectionIndex.
	ownerWindow layoutChanged.
	self removeWindow: aWindow.
	""
	verticallyOrHorizontally = #vertically
		ifTrue: [ownerWindow addPaneVSplitterBetween: leftPane and: {rightPane}]
		ifFalse: [ownerWindow addPaneHSplitterBetween: leftPane and: {rightPane}].
	self changed: #taxonomies
]

{ #category : #'ui opening/closing' }
Tamaris >> windowIsClosing [
	self destroy.
	super windowIsClosing
]
