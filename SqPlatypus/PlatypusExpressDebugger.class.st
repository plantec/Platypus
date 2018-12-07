Class {
	#name : #PlatypusExpressDebugger,
	#superclass : #PlatypusExpressEditor,
	#instVars : [
		'debuggingContextRow',
		'contextsListRow',
		'selectedContextDataRow',
		'selectedContextValueRow',
		'stackValueRow',
		'selectedContextValueTextMorph',
		'interpreter',
		'selectedContextIndex',
		'selectedContextDataIndex',
		'stackValueTextMorph',
		'stackDataListRow',
		'stackDataIndex',
		'selfStackDataIndex',
		'selfStackDataListRow',
		'selectedContextsAndStacksListRow',
		'stacksRow',
		'prevSelectedContextIndex',
		'currentInterpreterMetaData',
		'overContextDataIndex',
		'result'
	],
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #'instance creation' }
PlatypusExpressDebugger class >> interpretor: anInterpretor statementOrExpression: aMetaData [
	| debugger |
	debugger := PlatypusExpressDebugger sourceHandler: anInterpretor currentSourceHandler.
	anInterpretor debugger: debugger.
	debugger interpreter: anInterpretor.
	debugger buildMainWindow openInWorld.
	debugger beforeAccepting: aMetaData.
	
]

{ #category : #debugging }
PlatypusExpressDebugger >> aboutToAccept: aMetaData [ 
	| maybeNewSourceHandler |
	self beforeAccepting.
	overContextDataIndex isNil
		ifTrue: [currentInterpreterMetaData := aMetaData.
			(maybeNewSourceHandler := self getSelectedContext contextInstance referenced ownerTamarisItemRef)
				ifNotNil: [self sourceHandler ~= maybeNewSourceHandler
						ifTrue: [self sourceHandler: maybeNewSourceHandler.
							self
								selectionInterval: (1 to: 0).
							self selectCode: self sourceHandler metaData selectionString startingAt: 1]].
			self selectCode.
			[currentInterpreterMetaData notNil]
				whileTrue: [mainWindow outermostWorldMorph doOneCycle]].
	overContextDataIndex
		ifNotNil: [self contextsList size <= overContextDataIndex
				ifTrue: [overContextDataIndex := nil]]
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> addButtonsinAlignment: aButtonsAlignment [ 
	| button |
	button := PluggableButtonMorph
				on: self
				getState: #canShowIntoButton
				action: #doInto
				label: #intoButtonLabel.
	button onColor: Color transparent offColor: Color transparent;
		 borderWidth: 2;
		 borderColor: #raised.
	aButtonsAlignment owner addMorphBack: button.
	"Proceed"
	button := PluggableButtonMorph
				on: self
				getState: #canShowProceedButton
				action: #doProceed
				label: #proceedButtonLabel.
	button onColor: Color transparent offColor: Color transparent;
		 borderWidth: 2;
		 borderColor: #raised.
	aButtonsAlignment owner addMorphBack: button.
	"Over"
	button := PluggableButtonMorph
				on: self
				getState: #canShowOverButton
				action: #doOver
				label: #overButtonLabel.
	button onColor: Color transparent offColor: Color transparent;
		 borderWidth: 2;
		 borderColor: #raised.
	aButtonsAlignment owner addMorphBack: button.
	super addButtonsinAlignment: aButtonsAlignment
]

{ #category : #debugging }
PlatypusExpressDebugger >> beforeAccepting [
	
	[self changed: #contextsList.
	self changedSelectedContextIndex: self contextsList size.
	self changed: #contextDataList.
	self changed: #stackDataList.
	self changed: #selfStackDataList.
	] 
			on: Error
			do: 
				[:ex | 
				Transcript show: self class name , '>>afterAccepting: "' , ex printString 
							, ' "\ ' withCRs]
]

{ #category : #debugging }
PlatypusExpressDebugger >> beforeAccepting: aMetaData [
	currentInterpreterMetaData := aMetaData.
	self beforeAccepting
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> buildMainWindow [
	mainWindow := super buildMainWindow.
	debuggingContextRow := TamListItemReferenceUtil subWindowClass model: self.
	contextsListRow := TamListItemReferenceUtil subWindowClass model: self.
	selectedContextsAndStacksListRow := TamListItemReferenceUtil subWindowClass model: self.
	selectedContextDataRow := TamListItemReferenceUtil subWindowClass model: self.
	selectedContextValueRow := TamListItemReferenceUtil subWindowClass model: self.
	stackDataListRow := TamListItemReferenceUtil subWindowClass model: self.
	selfStackDataListRow := TamListItemReferenceUtil subWindowClass model: self.
	stacksRow := TamListItemReferenceUtil subWindowClass model: self.
	selectedContextsAndStacksListRow addMorph: selectedContextDataRow fullFrame: self selectedContextDataRowLayoutFrame.
	selectedContextsAndStacksListRow addMorph: selectedContextValueRow fullFrame: self selectedContextValueRowLayoutFrame.
	stacksRow addMorph: stackDataListRow fullFrame: self stackDataRowLayoutFrame.
	stacksRow addMorph: selfStackDataListRow fullFrame: self selfStackDataRowLayoutFrame.
	selectedContextsAndStacksListRow addMorph: stacksRow fullFrame: self stacksRowLayoutFrame.
	debuggingContextRow addMorph: contextsListRow fullFrame: self contextsListRowLayoutFrame.
	debuggingContextRow addMorph: selectedContextsAndStacksListRow fullFrame: self selectedContextsAndStacksLayoutFrame.
	mainPane addMorph: debuggingContextRow fullFrame: self debuggingContextRowLayoutFrame.
	mainPane addPaneHSplitterBetween: codeRow and: {debuggingContextRow}.
	debuggingContextRow addPaneHSplitterBetween: contextsListRow and: {selectedContextsAndStacksListRow}.
	stacksRow addPaneHSplitterBetween: stackDataListRow and: {selfStackDataListRow}.
	selectedContextsAndStacksListRow addPaneVSplitterBetween: selectedContextDataRow and: {selectedContextValueRow}.
	selectedContextsAndStacksListRow addPaneVSplitterBetween: selectedContextValueRow and: {stacksRow}.
	contextsListRow
		addMorph: self contextsListMorph
		fullFrame: LayoutFrame identity.
	selectedContextDataRow
		addMorph: self contextDataListMorph
		fullFrame: LayoutFrame identity.
	selectedContextValueRow
		addMorph: self selectedContextValueMorph
		fullFrame: LayoutFrame identity.
	selfStackDataListRow
		addMorph: self selfStackDataListMorph
		fullFrame: LayoutFrame identity.
	stackDataListRow
		addMorph: self stackDataListMorph
		fullFrame: LayoutFrame identity.
	^ mainWindow
]

{ #category : #debugging }
PlatypusExpressDebugger >> canShowIntoButton [
	^ currentInterpreterMetaData notNil
]

{ #category : #debugging }
PlatypusExpressDebugger >> canShowOverButton [
	^ currentInterpreterMetaData notNil
]

{ #category : #debugging }
PlatypusExpressDebugger >> canShowProceedButton [
	^ currentInterpreterMetaData notNil
]

{ #category : #'selected context data handling' }
PlatypusExpressDebugger >> changedSelectedContextDataIndex: anInteger [ 
	| |
	selectedContextDataIndex := anInteger.
	self changed: #selectedContextDataIndex.
	self changed: #selectedContextValueContents.
	selectedContextValueTextMorph update: #selectedContextValueContents.

]

{ #category : #'contexts list handling' }
PlatypusExpressDebugger >> changedSelectedContextIndex: anInteger [ 
	| maybeNewSourceHandler |
	anInteger > 0 ifFalse: [^self].
	selectedContextIndex := anInteger.
	self changed: #selectedContextIndex.
	self changed: #contextDataList.
	self changedSelectedContextDataIndex: 0.
	(maybeNewSourceHandler := (self contextsList at: anInteger) 
				contextInstance referenced 
				ownerTamarisItemRef) ifNotNil: [self sourceHandler: maybeNewSourceHandler].
	self selectCode
]

{ #category : #'self stack data handling' }
PlatypusExpressDebugger >> changedSelfStackDataIndex: anInteger [ 
	selfStackDataIndex := anInteger.
	self changed: #selfStackDataIndex.

]

{ #category : #'satck data handling' }
PlatypusExpressDebugger >> changedStackDataIndex: anInteger [ 
	stackDataIndex := anInteger.
	self changed: #stackDataIndex.

]

{ #category : #'ui building' }
PlatypusExpressDebugger >> codeRowLayoutFrame [
	^ LayoutFrame identity topOffset: codeBtnRowHeight; bottomOffset: (self debuggingContextRowHight ) negated
		
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> contentsMorphLayoutFrame [
	^ LayoutFrame identity
]

{ #category : #'selected context data handling' }
PlatypusExpressDebugger >> contextDataList [
	| interprContext |
	selectedContextIndex > 0 ifFalse: [^#()].
	interprContext := interpreter contextsStack at: selectedContextIndex.
	^interprContext dataIndex keys asOrderedCollection collect: [:e | e name]
]

{ #category : #'selected context data handling' }
PlatypusExpressDebugger >> contextDataListMorph [
	^ PluggableListMorph
		on: self
		list: #contextDataList
		selected: #selectedContextDataIndex
		changeSelected: #changedSelectedContextDataIndex:
	menu: nil
		keystroke: #arrowKey:from:
]

{ #category : #'contexts list handling' }
PlatypusExpressDebugger >> contextsList [
	^ interpreter contextsStack
]

{ #category : #'contexts list handling' }
PlatypusExpressDebugger >> contextsListMorph [
	^ PluggableListMorph
		on: self
		list: #contextsList
		selected: #selectedContextIndex
		changeSelected: #changedSelectedContextIndex:
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> contextsListRowHight [
	^ 120
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> contextsListRowLayoutFrame [
	^ LayoutFrame identity topOffset: TamListItemReferenceUtil subFrameBorderDelta; bottomOffset: (TamListItemReferenceUtil subFrameBorderDelta + self contextsListRowHight) negated.
		
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> debuggingContextRowHight [
	^ 200
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> debuggingContextRowLayoutFrame [
	^ LayoutFrame identity topOffset: (self debuggingContextRowHight)
]

{ #category : #debugging }
PlatypusExpressDebugger >> doInto [
	currentInterpreterMetaData := nil
]

{ #category : #debugging }
PlatypusExpressDebugger >> doOver [
	overContextDataIndex := selectedContextDataIndex.
	currentInterpreterMetaData := nil
]

{ #category : #debugging }
PlatypusExpressDebugger >> doProceed [
	currentInterpreterMetaData := nil.
	interpreter debugger: nil.
	mainWindow delete
]

{ #category : #debugging }
PlatypusExpressDebugger >> evaluate [
	| metaData |
	sourceHandler
		ifNotNil: [metaData := self sourceHandler metaData.
			interpreter
				compute: (Array with: metaData)
				in: self doItContext
				to: self doItReceiver
				notifying: self
				ifFail: []
				logged: false]
]

{ #category : #debugging }
PlatypusExpressDebugger >> evaluate: aStream [ 
	| metaData |
	sourceHandler
		ifNotNil: [metaData := self sourceHandler metaData.
			interpreter
				evaluate: aStream
				in: metaData
				to: nil
				notifying: self
				ifFail: [].
			self inform: 'Done']
]

{ #category : #'contexts list handling' }
PlatypusExpressDebugger >> getSelectedContext [
	^ self selectedContextIndex = 0
		ifFalse: [self contextsList at: self selectedContextIndex]
]

{ #category : #'selected context data handling' }
PlatypusExpressDebugger >> getSelectedContextData [
	self selectedContextDataIndex = 0
		ifTrue: [^ nil].
	^ self contextDataList at: self selectedContextDataIndex
]

{ #category : #'initialize/release' }
PlatypusExpressDebugger >> initialize [
	super initialize.
	interpreter := PlatypusExpressInterpretor new debugger: self.
prevSelectedContextIndex := 0.
]

{ #category : #debugging }
PlatypusExpressDebugger >> interpreter: anInterpretor [ 
	interpreter := anInterpretor
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> intoButtonLabel [
	^ 'Into'
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> messageBrowserRowTopRow [
	^ debuggingContextRow
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> overButtonLabel [
	^ 'Over'
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> proceedButtonLabel [
	^ 'Proceed'
]

{ #category : #debugging }
PlatypusExpressDebugger >> result [
	^ result
]

{ #category : #debugging }
PlatypusExpressDebugger >> run [
	sourceHandler ifNotNil: [
	]
	
]

{ #category : #debugging }
PlatypusExpressDebugger >> selectCode [
	currentInterpreterMetaData
		ifNotNil: [self selectCode: currentInterpreterMetaData selectionString startingAt: self selectionInterval first.
			(currentInterpreterMetaData isPltStatement
					or: [currentInterpreterMetaData isPltContextDefinition])
				ifTrue: [self selectionInterval: self selectionInterval.
					Transcript show: self selectionInterval printString , String cr]]
]

{ #category : #'selected context data handling' }
PlatypusExpressDebugger >> selectedContextDataIndex [
	^ selectedContextDataIndex
		ifNil: [selectedContextDataIndex := 0]
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> selectedContextDataRowLayoutFrame [
	^ LayoutFrame identity rightFraction: 0.333; rightOffset: TamListItemReferenceUtil subFrameBorderDelta negated
]

{ #category : #'contexts list handling' }
PlatypusExpressDebugger >> selectedContextIndex [
	^ selectedContextIndex
		ifNil: [selectedContextIndex := 0]
]

{ #category : #'selected context value handling' }
PlatypusExpressDebugger >> selectedContextValueContents [
	| ident |
	^ (ident := self getSelectedContextData)
		ifNil: ['']
		ifNotNil: [(self getSelectedContext dataNamed: ident) val asClearText]
]

{ #category : #'selected context value handling' }
PlatypusExpressDebugger >> selectedContextValueContents: aStringOrText notifying: aRequestor [ 
	 selectedContextValueTextMorph acceptContents: aStringOrText
]

{ #category : #'selected context value handling' }
PlatypusExpressDebugger >> selectedContextValueMorph [
	^ selectedContextValueTextMorph ifNil: [selectedContextValueTextMorph := TamTextMorph
		on: self
		text: #selectedContextValueContents
		accept: #selectedContextValueContents:notifying:
		readSelection: nil
		menu: nil]
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> selectedContextValueRowLayoutFrame [
	^ LayoutFrame identity leftFraction: 0.333; rightFraction: 0.666; rightOffset: TamListItemReferenceUtil subFrameBorderDelta negated
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> selectedContextsAndStacksLayoutFrame [
	^ LayoutFrame identity topFraction: 1; topOffset: self contextsListRowHight negated
		
]

{ #category : #'self stack data handling' }
PlatypusExpressDebugger >> selfStackDataIndex [
	^ selfStackDataIndex
		ifNil: [selfStackDataIndex := 0]
]

{ #category : #'self stack data handling' }
PlatypusExpressDebugger >> selfStackDataList [
	^ interpreter selfStack collect: [:s | s printableCode]
]

{ #category : #'self stack data handling' }
PlatypusExpressDebugger >> selfStackDataListMorph [
	^ PluggableListMorph
		on: self
		list: #selfStackDataList
		selected: #selfStackDataIndex
		changeSelected: #changedSelfStackDataIndex:
menu: nil
		keystroke: #arrowKey:from:
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> selfStackDataRowLayoutFrame [
	^ LayoutFrame identity topFraction: 0.5; topOffset: TamListItemReferenceUtil subFrameBorderDelta
		
]

{ #category : #'satck data handling' }
PlatypusExpressDebugger >> stackDataIndex [
	^ stackDataIndex
		ifNil: [stackDataIndex := 0]
]

{ #category : #'satck data handling' }
PlatypusExpressDebugger >> stackDataList [
	^ interpreter stack
]

{ #category : #'satck data handling' }
PlatypusExpressDebugger >> stackDataListMorph [
	^ PluggableListMorph
		on: self
		list: #stackDataList
		selected: #stackDataIndex
		changeSelected: #changedStackDataIndex:
	menu: nil
		keystroke: #arrowKey:from:
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> stackDataRowLayoutFrame [
	^ LayoutFrame identity bottomFraction: 0.5
]

{ #category : #'ui building' }
PlatypusExpressDebugger >> stacksRowLayoutFrame [
	^ LayoutFrame identity leftFraction: 0.666
		
]
