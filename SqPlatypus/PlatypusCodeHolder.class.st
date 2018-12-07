Class {
	#name : #PlatypusCodeHolder,
	#superclass : #PlatypusCodeMorph,
	#instVars : [
		'codeBtnRow',
		'codeBtnRowHeight',
		'codeButtons',
		'messagesBrowserHeight',
		'messagesBrowserRow',
		'messagesBrowser',
		'messagesBrowserLayoutFrame',
		'errorSplitter'
	],
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #'instance creation' }
PlatypusCodeHolder class >> openWithSourceHandler: aSourceHandler windowLabel: aLabel [ 
	| window codeHolder |
	codeHolder := self sourceHandler: aSourceHandler.
	window := codeHolder asMorph.
	window setLabel: aLabel.
	window openInWorld.
	^ codeHolder
]

{ #category : #'ui building' }
PlatypusCodeHolder >> addButtons [
	codeButtons := TamButtonsAlignmentMorph newRow.
	codeButtons vResizing: #shrinkWrap.
	codeBtnRow addMorph: codeButtons.
	self addButtonsinAlignment: codeButtons. 

]

{ #category : #'ui building' }
PlatypusCodeHolder >> addButtonsinAlignment: aButtonsAlignment [ 

]

{ #category : #'ui building' }
PlatypusCodeHolder >> buildMainWindow [
	mainWindow := super buildMainWindow.
	codeBtnRow := TamButtonsAlignmentMorph typicalRowOwner.
	messagesBrowser := TamGenericHierarchicalList new.
	messagesBrowser clientModel: self.
	mainPane
		addMorph: codeBtnRow
		fullFrame: (LayoutFrame identity bottomFraction: 0; bottomOffset: codeBtnRowHeight).
	self addButtons.
	codeBtnRow minimumExtent: 1 @ 1.
	^ mainWindow
]

{ #category : #'ui building' }
PlatypusCodeHolder >> buildTamarisWindow [
	mainWindow := super buildMainWindow.
	codeBtnRow := TamButtonsAlignmentMorph typicalRowOwner.
	messagesBrowser := TamGenericHierarchicalList new.
	messagesBrowser clientModel: self.
	mainPane
		addMorph: codeRow
		fullFrame: LayoutFrame identity.
	^ mainWindow
]

{ #category : #accessing }
PlatypusCodeHolder >> codeButtons [ 
	^ codeButtons
]

{ #category : #'ui building' }
PlatypusCodeHolder >> codeRowLayoutFrame [
	^ LayoutFrame identity topOffset: codeBtnRowHeight
]

{ #category : #'code accessing' }
PlatypusCodeHolder >> contents: aText [
	Cursor wait showWhile: [ ^ super contents: aText "(self highlight: aText)" ]
]

{ #category : #'initialize/release' }
PlatypusCodeHolder >> destroy [
	codeButtons
		ifNotNil: [codeButtons destroy.
			codeButtons := nil].
	codeBtnRow
		ifNotNil: [codeBtnRow delete.
			codeBtnRow := nil].
	messagesBrowserRow
		ifNotNil: [messagesBrowserRow delete.
			messagesBrowserRow := nil].
	messagesBrowser
		ifNotNil: [messagesBrowser destroy.
			messagesBrowser := nil].
	messagesBrowserLayoutFrame
		ifNotNil: [messagesBrowserLayoutFrame destroy.
			messagesBrowserLayoutFrame := nil].
	super destroy
]

{ #category : #'code accessing' }
PlatypusCodeHolder >> getFullText [
	self acceptContents: self codeText.
	self changed: #contents
]

{ #category : #'ui updating' }
PlatypusCodeHolder >> hideMessagesBrowser [
	messagesBrowserRow
		ifNotNil: [(messagesBrowserLayoutFrame := messagesBrowserRow layoutFrame)
				ifNotNil: [self messageBrowserRowTopRow layoutFrame bottomFraction: messagesBrowserLayoutFrame bottomFraction.
					self messageBrowserRowTopRow layoutFrame bottomOffset: messagesBrowserLayoutFrame bottomOffset].
			messagesBrowserRow delete.
			errorSplitter
				ifNotNil: [errorSplitter delete.
					errorSplitter := nil].
			messagesBrowserRow := nil.
			mainPane updatePanesFromSubmorphs]
]

{ #category : #'ui updating' }
PlatypusCodeHolder >> hideOrShowMessageBrowser [
	| rootsMessages |
	self messagesBrowser
		ifNotNil: [((rootsMessages := self messagesBrowser rootListItems) isNil
					or: [rootsMessages isEmpty])
				ifTrue: [self hideMessagesBrowser]
				ifFalse: [self showMessagesBrowser]].
	self changed: #hideOrShowMessageBrowser
]

{ #category : #'initialize/release' }
PlatypusCodeHolder >> initialize [
	super initialize. 
	codeBtnRowHeight := Tamaris buttonExtent y + 8.
	messagesBrowserHeight := 65
]

{ #category : #accessing }
PlatypusCodeHolder >> isCodeCompletionAllowed [
	^ false
]

{ #category : #'ui updating' }
PlatypusCodeHolder >> messageBrowserRowTopRow [
	^ codeRow
]

{ #category : #accessing }
PlatypusCodeHolder >> messagesBrowser [
	^ messagesBrowser
]

{ #category : #'ui building' }
PlatypusCodeHolder >> messagesBrowserLayoutFrame [
	^ LayoutFrame identity topFraction: 2/3
]

{ #category : #menu }
PlatypusCodeHolder >> openFile [
	| result |
	result := Tamaris
			chooseFilePathMatching:  #('*.exp')
			label: 'Choose EXPRESS file to read' translated.
	result
		ifNotNil: [ | strm |
			[contents := (strm := StandardFileStream oldFileNamed: result) contentsOfEntireFile ]
				ensure: [strm close].
			self acceptContents: contents.
			self changed: #contents.
			self hasUnacceptedEdits: true]
]

{ #category : #'ui updating' }
PlatypusCodeHolder >> showMessagesBrowser [
	messagesBrowserRow
		ifNil: [messagesBrowserRow := TamListItemReferenceUtil subWindowClass model: self.
			messagesBrowser buildWindow: messagesBrowserRow.
			mainPane
				ifNotNil: [mainPane addMorph: messagesBrowserRow fullFrame: self messagesBrowserLayoutFrame.
					self messageBrowserRowTopRow layoutFrame bottomFraction: messagesBrowserRow layoutFrame topFraction.
					self messageBrowserRowTopRow layoutFrame bottomOffset: messagesBrowserRow layoutFrame topOffset - TamListItemReferenceUtil subFrameBorderDelta.
					mainPane addPaneHSplitterBetween: self messageBrowserRowTopRow  and: {messagesBrowserRow}.
					errorSplitter := mainPane submorphs first.
					mainPane updatePanesFromSubmorphs.
					mainPane layoutChanged]]
]

{ #category : #accessing }
PlatypusCodeHolder >> sourceHandlerSilently: anObject contents: aString [ 
	super sourceHandlerSilently: anObject contents: aString.
	self updateMessagesBrowser
]

{ #category : #'code updating' }
PlatypusCodeHolder >> updateCodePaneIfNeeded [
	self codeButtons
		ifNotNil: [self codeButtons updateIfNeeded]
]

{ #category : #'error handling' }
PlatypusCodeHolder >> updateMessagesBrowser [
	self messagesBrowser
		ifNotNil: [self messagesBrowser
			rootListItems: (self errors
				collect: [:err | 
					TamGenericHierarchicalListItem linked: (PlatypusVisitorErrorWrapper wrapped: err)]).
			self hideOrShowMessageBrowser]
]
