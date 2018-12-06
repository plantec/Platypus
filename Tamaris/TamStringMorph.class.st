Class {
	#name : #TamStringMorph,
	#superclass : #StringMorph,
	#instVars : [
		'model',
		'getTextSelector',
		'setTextSelector',
		'editor',
		'cpt'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
TamStringMorph class >> on: anObject text: getTextSel accept: setTextSel [ 
	^ self new on: anObject text: getTextSel accept: setTextSel 
]

{ #category : #'event handling' }
TamStringMorph >> acceptContents [
	self acceptValue: contents
]

{ #category : #'event handling' }
TamStringMorph >> acceptValue: aValue [ 
"	self currentHand releaseKeyboardFocus: self."
	setTextSelector isNil or: 
			[setTextSelector numArgs = 2 
				ifTrue: 
					[self model 
						perform: setTextSelector
						with: aValue
						with: self]
				ifFalse: [self model perform: setTextSelector with: aValue]]
]

{ #category : #accessing }
TamStringMorph >> cpt [
	^ cpt ifNil: [cpt := 0]
]

{ #category : #'initialize-release' }
TamStringMorph >> destroy [
	model := nil.
editor ifNotNil: 
			[self removeMorph: editor.
			editor delete.
			editor := nil].
]

{ #category : #editing }
TamStringMorph >> doneWithEdits [
	editor
		ifNotNil: [self removeMorph: editor.
			editor delete.
			editor := nil].
	cpt := self cpt - 1.
	 cpt < 0
		ifTrue: [self halt]
]

{ #category : #editing }
TamStringMorph >> getText [
	"Retrieve the current model text"

	| newText |
	getTextSelector isNil ifTrue: [^Text new].
	newText := model perform: getTextSelector.
	newText ifNil: [^Text new].
	^newText shallowCopy
]

{ #category : #accessing }
TamStringMorph >> getTextSelector [
	^getTextSelector
]

{ #category : #'event handling' }
TamStringMorph >> handlesMouseDown: evt [ 
	^true	
]

{ #category : #'event handling' }
TamStringMorph >> handlesMouseOver: evt [ 
	^true
]

{ #category : #editing }
TamStringMorph >> launchMiniEditor: evt [ 
	hasFocus := true.
	"Really only means edit in progress for this morph"
	editor := TamStringMorph new contentsAsIs: contents.
	editor
		bounds: (self bounds expandBy: 0 @ 2).
	editor backgroundColor: Color transparent.
	self addMorphFront: editor.
	evt hand newMouseFocus: editor.
	evt hand newKeyboardFocus: editor.
	cpt := self cpt + 1.
	cpt < 0
		ifTrue: [self halt]
]

{ #category : #editing }
TamStringMorph >> lostFocusWithoutAccepting [
	"self doneWithEdits"
]

{ #category : #accessing }
TamStringMorph >> model [
	^ model
]

{ #category : #accessing }
TamStringMorph >> model: aModel [
	model := aModel
]

{ #category : #'event handling' }
TamStringMorph >> mouseDown: evt [ 
	self launchMiniEditor: evt
]

{ #category : #'event handling' }
TamStringMorph >> mouseLeave: evt [ 
	super mouseLeave: evt.
	evt hand releaseKeyboardFocus: self.
	hasFocus := false
]

{ #category : #'initialize-release' }
TamStringMorph >> on: anObject text: getTextSel accept: setTextSel [ 
	self model: anObject.
	getTextSelector := getTextSel.
	setTextSelector := setTextSel.
	self borderWidth: 1.
	self contents: self getText.
cpt := 0.
]

{ #category : #accessing }
TamStringMorph >> setTextSelector [
	^setTextSelector
]

{ #category : #updating }
TamStringMorph >> update: aSymbol [ 
	hasFocus ifFalse: [
	super update: aSymbol.
	self contents: self getText]
]
