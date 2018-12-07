Class {
	#name : #PlatypusCodeMorph,
	#superclass : #StringHolderFromPharo4,
	#instVars : [
		'mainWindow',
		'mainPane',
		'contentsMorph',
		'codeRow',
		'sourceHandler'
	],
	#classVars : [
		'InitialExtent'
	],
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #utilities }
PlatypusCodeMorph class >> cleanCommentsOf: aTextOrString [ 
	| level loop prevChar inStream outputStream currentCharacter inComment |
	level := 1.
	inStream := ReadStream on: aTextOrString.
	outputStream := WriteStream on: String new.
	currentCharacter := inStream next.
	outputStream nextPut: currentCharacter.
	loop := inStream atEnd not.
	inComment := false.
	[loop]
		whileTrue: [inStream atEnd
				ifTrue: [loop := false]
				ifFalse: [prevChar := currentCharacter.
					currentCharacter := inStream next.
					(prevChar == $(
							and: [currentCharacter == $*])
						ifTrue: [level == 1
								ifTrue: [outputStream position: outputStream position - 1. outputStream nextPut: $ ].
							level := level + 1.
							inComment := true]
						ifFalse: [(prevChar == $*
									and: [currentCharacter == $)])
								ifTrue: [level := level - 1.
									level == 0
										ifTrue: [loop := false]]].
					inComment
						ifTrue: [outputStream nextPut: $ .
							level == 1
								ifTrue: [inComment := false]]
						ifFalse: [outputStream nextPut: currentCharacter]]].
	^ outputStream contents
]

{ #category : #utilities }
PlatypusCodeMorph class >> code: codeString match: aMatchString [ 
	^ self
		code: codeString
		match: aMatchString
		startingAt: 1"examples :  
	TamCodeHolder code: 'dqsqsdqsdqsd l := l + 1 ; jmk jmlkjmlj' match: 'l+1;'  
	TamCodeHolder code: 'l:=l+1;' match: 'l:=l+1;'  
	TamCodeHolder code: '	l	:=	l	+	1	;	' match: 'l:=l+1;'  
	TamCodeHolder code: ' l+1;' match: 'l:=l+1;'  
	TamCodeHolder code: ' l+1;' match: 'l+1'  
	"

]

{ #category : #utilities }
PlatypusCodeMorph class >> code: codeString match: aMatchString startingAt: firstPos [ 
	| csize msize mpos cpos startCodePos stopCodePos cleanedCode cleanedMatchString |
	cleanedCode := codeString asString asUppercase.
	"self cleanCommentsOf:"
	cleanedMatchString := aMatchString asUppercase.
	"self cleanCommentsOf:"
	csize := cleanedCode size.
	msize := cleanedMatchString size.
	mpos := 1.
	cpos := firstPos.
	startCodePos := 0.
	stopCodePos := 0.
	[mpos <= msize
		and: [cpos <= csize]]
		whileTrue: ["(cleanedCode at: cpos) = $. ifTrue: [self halt]."
			((cleanedCode at: cpos)
						= (cleanedMatchString at: mpos))
				ifTrue: [startCodePos = 0
						ifTrue: [startCodePos := cpos].
					stopCodePos := cpos.
					mpos := mpos + 1.
					cpos := cpos + 1]
				ifFalse: [		mpos = 1
						ifTrue: [cpos := cpos + 1].
					mpos := 1.
					startCodePos := stopCodePos := 0].
			[cpos < csize
				and: [(cleanedCode at: cpos) isSeparator]]
				whileTrue: [cpos := cpos + 1]].
	
	^ Array
		with: mpos > msize
		with: startCodePos
		with: stopCodePos
]

{ #category : #accessing }
PlatypusCodeMorph class >> codeFont [
	^ StandardFonts codeFont
]

{ #category : #accessing }
PlatypusCodeMorph class >> initialExtent [
	^ InitialExtent
		ifNil: [InitialExtent := 800@600]
]

{ #category : #accessing }
PlatypusCodeMorph class >> initialExtent: aPoint [ 
	InitialExtent := aPoint
]

{ #category : #'message handling' }
PlatypusCodeMorph class >> perform: selector orSendTo: otherTarget [ 
	(self respondsTo: selector)
		ifTrue: [^ self perform: selector]
		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #'instance creation' }
PlatypusCodeMorph class >> sourceHandler: aSourceHandler [ 
	^ self new sourceHandler: aSourceHandler
]

{ #category : #'code updating' }
PlatypusCodeMorph >> accept [
	^ contentsMorph accept
]

{ #category : #menu }
PlatypusCodeMorph >> addModelItemsToWindowMenu: aMenu [ 
	aMenu addLine.
	aMenu
		add: 'remember window size'
		target: self
		action: #rememberWindowSize
]

{ #category : #'morphic wrapper' }
PlatypusCodeMorph >> asMorph [
	^ self buildMainWindow

]

{ #category : #'code updating' }
PlatypusCodeMorph >> broadcastChanged [
	^ self sourceHandler 
		ifNotNil: [:sh | sh treeHasChangedFrom: self]
]

{ #category : #'ui building' }
PlatypusCodeMorph >> buildMainWindow [
	mainWindow := (StandardWindow labelled: self labelString)
				model: self.
	mainPane := TamListItemReferenceUtil subWindowClass model: self.
	mainWindow
		addMorph: mainPane
		fullFrame: (LayoutFrame identity).
	codeRow := TamListItemReferenceUtil subWindowClass model: self.
	codeRow
		addMorph: self contentsMorph
		fullFrame: self contentsMorphLayoutFrame.
	mainPane addMorph: codeRow fullFrame: self codeRowLayoutFrame.
	mainPane extent: self initialExtent.
	^ mainWindow
]

{ #category : #'ui building' }
PlatypusCodeMorph >> buildTamarisWindow [
	mainWindow := (StandardWindow labelled: self labelString)
				model: self.
	mainPane := TamListItemReferenceUtil subWindowClass model: self.
	mainPane borderWidth: 0.
	mainWindow
		addMorph: mainPane
		fullFrame: (LayoutFrame identity).
	codeRow := TamListItemReferenceUtil subWindowClass model: self.
	codeRow
		addMorph: self contentsMorph
		fullFrame: (self contentsMorphLayoutFrame
				).
	codeRow borderWidth: 0.
	mainPane addMorph: codeRow fullFrame: self codeRowLayoutFrame.
	mainWindow extent: self initialExtent.
	^ mainWindow
]

{ #category : #'code updating' }
PlatypusCodeMorph >> canBeUpdated [
	^ mainWindow notNil and: [mainWindow owner notNil]
]

{ #category : #accessing }
PlatypusCodeMorph >> codeFont [
	^ self class codeFont
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> codeMatch: aMatchString [ 
	^ self class code: self contents string match: aMatchString
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> codeMatch: aMatchString startingAt: pointPos [ 
	^ self class
		code: self contents
		match: aMatchString
		startingAt: (pointPos > 0 ifTrue: [pointPos] ifFalse: [1])
]

{ #category : #'ui building' }
PlatypusCodeMorph >> codeRowLayoutFrame [
	^ LayoutFrame identity
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> codeSelectionInterval: aStringOrText startingAt: startPos [ 
	| matchResult matchString |
	matchString := aStringOrText
				reject: [:c | c isSeparator].
	(matchResult := self codeMatch: matchString startingAt: startPos) first
		ifTrue: [self
				selectionInterval: (matchResult second to: matchResult third)].
	^ matchResult first
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> codeString [
	^ self sourceHandler
		ifNil: ['']
		ifNotNil: [self sourceHandler codeString]
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> codeText [
	^ self sourceHandler 
		ifNil: ['']
		ifNotNil: [self sourceHandler codeText]

]

{ #category : #'code updating' }
PlatypusCodeMorph >> contents: input notifying: aRequestor [ 
	"The retrieved information has changed and its source must now 
	be updated. The information can be a variety of things, 
	depending on the list selections. Answer the result of updating 
	the source."
	(self sourceHandler isNil or: [self sourceHandler isReleased])
		ifFalse: [
			self sourceHandler verifyUsedModelsBeforeChecking
				ifFalse: [^ false].
			(self sourceHandler accept: input notifying: aRequestor)
				ifTrue: [
					self acceptContents: input.
					self updateMessagesBrowser.
					self broadcastChanged.
					^ true].
			^ false].
	contentsMorph flash.
	^ false
]

{ #category : #menu }
PlatypusCodeMorph >> contentsMenu: aMenu shifted: shifted [ 
	"Note that unless we override perform:orSendTo:,  
	PluggableTextController  
	will respond to all menu items in a text pane"
	| donorMenu |
	donorMenu := shifted
				ifTrue: [TextEditor shiftedYellowButtonMenu]
				ifFalse: [TextEditor yellowButtonMenu].
	aMenu   addAllFrom: donorMenu.
	^ aMenu

]

{ #category : #'ui building' }
PlatypusCodeMorph >> contentsMorph [
	| txtClass |
	contentsMorph isNil
		ifTrue: [txtClass := PlatypusStepCodeMorph.
			contentsMorph := txtClass
						on: self
						text: #contents
						accept: #contents:notifying:
						readSelection: nil
						menu: #contentsMenu:shifted:].
	^ contentsMorph
]

{ #category : #'ui building' }
PlatypusCodeMorph >> contentsMorphLayoutFrame [
		^(LayoutFrame identity)
]

{ #category : #'initialize/release' }
PlatypusCodeMorph >> destroy [
	self breakDependents.
	mainWindow
		ifNotNil: [mainWindow stopStepping.
			mainWindow submorphs
				do: [:sm | sm delete].
			mainWindow := nil].
	sourceHandler := nil.
	mainPane ifNotNil: [mainPane delete. mainPane := nil].
	codeRow
		ifNotNil: [codeRow delete.
			codeRow := nil].
	contentsMorph
		ifNotNil: [contentsMorph model: nil.
			contentsMorph delete.
			contentsMorph := nil].
	contents := nil.
	super destroy
]

{ #category : #accessing }
PlatypusCodeMorph >> errors [
	| errs testste result |
	errs := self sourceHandler
		ifNil: [^ #()]
		ifNotNil: [self sourceHandler errors].
	testste := Set new.
	result := OrderedCollection new.
	errs
		do: [:er | (testste includes: er asString)
				ifFalse: [testste add: er asString.
					result add: er]].
	^ result
]

{ #category : #'code updating' }
PlatypusCodeMorph >> forceUpdate [
	self sourceHandler reinitializeLabelSilently.
	self contentsMorph hasUnacceptedEdits
		ifFalse: [TamBrowser reloadEditorFor: self sourceHandler].
	
	"self acceptContents: self codeText.
	self updateMessagesBrowser.
	self changed: #contents"
]

{ #category : #'code updating' }
PlatypusCodeMorph >> forceUpdate: anAnnounce [
	anAnnounce sourceHandler  = self sourceHandler
		ifTrue: [self forceUpdate]
]

{ #category : #'ui building' }
PlatypusCodeMorph >> initialExtent [
	^ self class initialExtent
]

{ #category : #'code updating' }
PlatypusCodeMorph >> keystrokeInContentsMorph [

]

{ #category : #accessing }
PlatypusCodeMorph >> labelString [
	^ self sourceHandler notNil
		ifTrue: [self class name , ' on: ' , self sourceHandler labelString]
		ifFalse: [self class name]
]

{ #category : #accessing }
PlatypusCodeMorph >> mainWindow [
	^ mainWindow
]

{ #category : #'error handling' }
PlatypusCodeMorph >> notify: errorMessage at: location [
	| repl |
	self contentsMorph selectFrom: location to: location - 1.
	self contentsMorph scrollSelectionIntoView.
	repl := Text string: errorMessage , '->' attribute: TextEmphasis bold.
	self contentsMorph replaceSelectionWith: repl.
	self contentsMorph
		setSelection: (location to: location + errorMessage size + 1).

]

{ #category : #'morphic wrapper' }
PlatypusCodeMorph >> openAsMorph [
	^ self asMorph openInWorld.

]

{ #category : #'message handling' }
PlatypusCodeMorph >> perform: selector orSendTo: otherTarget [ 
	(self respondsTo: selector)
		ifTrue: [^ self perform: selector]
		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #menu }
PlatypusCodeMorph >> rememberWindowSize [
	self class initialExtent: mainWindow bounds extent
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectCode: aStringOrText [ 
	^ self selectCode: aStringOrText startingAt: 1 


]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectCode: aStringOrText startingAt: startPos [ 
	| matchResult matchString |
	matchString := aStringOrText
				reject: [:c | c isSeparator].
	(matchResult := self codeMatch: matchString startingAt: startPos) first
		ifTrue: [self selectFrom: matchResult second to: matchResult third].
	^ matchResult first

]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectCodeFromPoint: aStringOrText [ 
	| |
	^ self selectCode: aStringOrText startingAt: self selectionInterval first

]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectFrom: startPos to: stopPos [ 
	self contentsMorph
		selectionInterval: (startPos to: stopPos).
	self contentsMorph setSearchString.
	self contentsMorph scrollSelectionIntoView.
	self contentsMorph selectFrom: startPos to: stopPos.
	self contentsMorph scrollSelectionIntoView
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectionInterval [
	^ self contentsMorph selectionInterval
]

{ #category : #'code accessing' }
PlatypusCodeMorph >> selectionInterval: anInterval [
	self contentsMorph selectionInterval: anInterval.

]

{ #category : #accessing }
PlatypusCodeMorph >> sourceHandler [
	^sourceHandler
]

{ #category : #accessing }
PlatypusCodeMorph >> sourceHandler: anObject [ 
	sourceHandler == anObject 
		ifFalse: 	[
			sourceHandler := anObject.
			self sourceHandler 
				on: TamForceEditorUpdating 
				send: #forceUpdate: to: self.
			self acceptContents: self codeText.
			self changed: #contents]
]

{ #category : #accessing }
PlatypusCodeMorph >> sourceHandlerSilently: anObject contents: aString [ 
	sourceHandler := anObject.
	self acceptContents: aString.
	self changed: #contents
]

{ #category : #'code updating' }
PlatypusCodeMorph >> treeUpdated: anAnnounce [
	self sourceHandler ifNil: [^ self].
	self sourceHandler isReleased ifTrue: [^self ].
	((anAnnounce codeMorph ~= self ) and: [anAnnounce codeMorph class = self class])
		ifTrue: [self forceUpdate]

]

{ #category : #'code updating' }
PlatypusCodeMorph >> updateCodePaneIfNeeded [
	
]

{ #category : #'code updating' }
PlatypusCodeMorph >> verify [
	self sourceHandler verify.
	self updateMessagesBrowser

]

{ #category : #'ui opening/closing' }
PlatypusCodeMorph >> windowIsClosing [
	self destroy.
	super windowIsClosing
]
