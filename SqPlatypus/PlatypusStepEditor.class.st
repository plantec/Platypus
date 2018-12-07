Class {
	#name : #PlatypusStepEditor,
	#superclass : #TextEditor,
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #'class initialization' }
PlatypusStepEditor class >> initialize [ 
	"Initialize the keyboard shortcut maps and the shared buffers
	for copying text across views and managing again and undo." 
 
	"
	self initialize
	" 

	self initializeCmdKeyShortcuts.
	self initializeShiftCmdKeyShortcuts.

]

{ #category : #'keyboard shortcut tables' }
PlatypusStepEditor class >> initializeCmdKeyShortcuts [
	"Initialize the (unshifted) command-key (or alt-key) shortcut table."



	"
	self initialize
	"

	| cmds |
	self initializeBasicCmdKeyShortcuts.
			
	'0123456789-=' 
		do: [:char | cmdActions at: char asciiValue + 1 put: #changeEmphasis:].
	
	cmds := #($k #offerFontMenu: $u #align:  $q #querySymbol: ).
	1 to: cmds size
		by: 2
		do: [:i | self cmdActions at: (cmds at: i) asciiValue + 1 put: (cmds at: i + 1)]
]

{ #category : #accessing }
PlatypusStepEditor >> editingStateClass [
	^ PlatypusEditingState
]

{ #category : #'typing/selecting keys' }
PlatypusStepEditor >> querySymbol: aKeyboardEvent [
	"Invoked by Ctrl-q to query the Symbol table and display alternate symbols.
	 See comment in completeSymbol:lastOffering: for details."

	self closeTypeIn.
	self editingState closeSelectorChooser.
	self editingState querySymbolFrom: morph.
	^true
]

{ #category : #accessing }
PlatypusStepEditor >> schemaInstance [
	^ self model schemaInstance
]

{ #category : #'new selection' }
PlatypusStepEditor >> selectPrecedingIdentifier [
	"Invisibly select the identifier that ends at the end of the selection, if any."

	| string sep stop tok |
	tok := false.
	string := self string.
	stop := self stopIndex - 1.
	[stop > 0 and: [(string at: stop) isSeparator]] whileTrue: [stop := stop - 1].
	sep := stop.
	[sep > 0 and: [(string at: sep) tokenish]] whileTrue: [tok := true. sep := sep - 1].
	tok ifTrue: [self selectInvisiblyFrom: sep + 1 to: stop]
]
