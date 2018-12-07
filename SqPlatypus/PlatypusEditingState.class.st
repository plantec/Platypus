Class {
	#name : #PlatypusEditingState,
	#superclass : #EditingState,
	#instVars : [
		'selectorChooser',
		'replaceAtEnd'
	],
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #chooser }
PlatypusEditingState >> chosenSelector: aSelector for: aTextMorph [
	| newStart replacement  caret prevSelection |
	self closeSelectorChooser.
	aSelector ifNil: [^ self].
	aTextMorph editor selectPrecedingIdentifier.
	prevSelection := aTextMorph selection.
	newStart := aTextMorph editor startIndex.
	caret := aTextMorph editor stopIndex.
	replacement := aTextMorph replacementFor: aSelector.
	replacement ifNil: [^self].
	replacement := String cr, replacement.
	self replaceAtEnd 
		ifTrue: [
			caret := aTextMorph editor string size + 1 + replacement size.
			aTextMorph selectFrom: caret to: caret - 1.]
		ifFalse: [caret := newStart + replacement size].
	prevSelection asString = replacement trimBoth 
		ifTrue: [aTextMorph flash]
		ifFalse: [aTextMorph replaceSelectionWith: replacement]. 
	aTextMorph editor selectFrom: caret to: caret - 1.
	(aTextMorph respondsTo: #editView) 
		ifTrue: [aTextMorph editView model contentsMorph setSelection: aTextMorph editor selectionInterval].
	replaceAtEnd := nil

]

{ #category : #chooser }
PlatypusEditingState >> closeSelectorChooser [
	selectorChooser 
		ifNotNil: [ [selectorChooser delete] ensure: [selectorChooser := nil] ]
]

{ #category : #events }
PlatypusEditingState >> focused: aBoolean from: aTextMorph [
	super focused: aBoolean from: aTextMorph.
	selectorChooser ifNotNil: [selectorChooser comeToFront]
]

{ #category : #accessing }
PlatypusEditingState >> forceReplaceAtEnd [
	replaceAtEnd := true
]

{ #category : #events }
PlatypusEditingState >> handlesKeyboard: evt from: aTextMorph [
	^ (super handlesKeyboard: evt from: aTextMorph)
		or: [selectorChooser notNil and: [selectorChooser handlesKeyboard: evt]]
]

{ #category : #events }
PlatypusEditingState >> keystroke: aKeyboardEvent from: aTextMorph [
	| asciiValue |
	selectorChooser 
		ifNotNil: [(selectorChooser handlesKeyboard: aKeyboardEvent) 
			ifTrue: [selectorChooser keyStroke: aKeyboardEvent.
				^ true]].
	asciiValue := aKeyboardEvent keyValue.
	asciiValue = Character cr asciiValue
		ifTrue: [self closeSelectorChooser.
			^ true].
	aKeyboardEvent controlKeyPressed
		ifTrue: [self closeSelectorChooser.
			^ true].
	"aKeyboardEvent commandKeyPressed
		ifTrue: [self closeSelectorChooser.
			^ true]."
	self updateSelectorChooserFrom: aTextMorph.
	^ false
]

{ #category : #events }
PlatypusEditingState >> mouseDown: anEvent from: aTextMorph [
	super mouseDown: anEvent from: aTextMorph.
	self closeSelectorChooser
]

{ #category : #chooser }
PlatypusEditingState >> querySymbolFrom: aTextMorph [
	| sel pref caret nextPref | 
	sel := aTextMorph editor selectionInterval.
	aTextMorph editor hasSelection
		ifFalse: [aTextMorph editor selectPrecedingIdentifier].
	pref := String streamContents: [:strm |
		aTextMorph selection asString trimBoth do: [:c | c isSeparator ifFalse: [strm nextPut: c]]].
	selectorChooser := PlatypusStepChooserMorph popUpPrefix: pref from: aTextMorph.

]

{ #category : #accessing }
PlatypusEditingState >> replaceAtEnd [
	^ replaceAtEnd ifNil: [replaceAtEnd := false]
]

{ #category : #chooser }
PlatypusEditingState >> selectorChooser [
	^ selectorChooser
]

{ #category : #chooser }
PlatypusEditingState >> updateSelectorChooserFrom: aTextMorph [
	selectorChooser ifNil: [^ self].
	self closeSelectorChooser.
	self querySymbolFrom: aTextMorph
]
