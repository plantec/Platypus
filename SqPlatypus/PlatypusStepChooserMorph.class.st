Class {
	#name : #PlatypusStepChooserMorph,
	#superclass : #IdentifierChooserMorph,
	#instVars : [
		'prefix',
		'requestorPos'
	],
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #opening }
PlatypusStepChooserMorph class >> popUpPrefix: aPrefix from: aTextMorph [ 
	Cursor wait
		showWhile: [| selectors chooser |
			selectors := self selectorsFromPrefix: aPrefix from: aTextMorph.
			selectors size = 1
				ifTrue: [aTextMorph editor editingState chosenSelector: selectors first for: aTextMorph.
					^ nil].
			selectors isEmpty
				ifFalse: [chooser := self new
								chooseBlock: [:chosen | aTextMorph editor editingState chosenSelector: chosen for: aTextMorph];
								 requestor: aTextMorph;
								 prefix: aPrefix; 
								 labels: selectors;
								 yourself.
					chooser open].
			^ chooser]
]

{ #category : #accessing }
PlatypusStepChooserMorph class >> selectorsFromPrefix: aPrefix from: aTextMorph [
	"returns the value of labels from a selector prefix"
	| cleaned |
	aPrefix isNil  ifTrue: [^ #()].
	cleaned := String streamContents: [:strm |
		aPrefix do: [:c | 
			(c isAlphaNumeric or: [c = $_])
				ifTrue: [strm nextPut: c]]].
	^ aTextMorph editView model possibleReplacementsFromPrefix: cleaned

]

{ #category : #action }
PlatypusStepChooserMorph >> choose: index [
	"Set the given choice and ok."
	requestor ifNil: [^ self delete].
	requestor editor editingState selectorChooser ~= self 
		ifTrue: [^ self delete].
	requestor takeKeyboardFocus.
	super choose: index
	
]

{ #category : #action }
PlatypusStepChooserMorph >> close [
	requestor 
		ifNotNil: [requestor takeKeyboardFocus.
			self choose: 0]
]

{ #category : #'submorphs-add/remove' }
PlatypusStepChooserMorph >> comeToFront [
	super comeToFront.
	self setPosition 
]

{ #category : #accessing }
PlatypusStepChooserMorph >> defaultBaseColor [
	^  (self theme menuColorFor: self) muchLighter
]

{ #category : #drawing }
PlatypusStepChooserMorph >> drawCommonPrefixAreasOn: aCanvas [
	| firstMenu firstMenuItem topLeft bottomLeft lastMenuItem |
	requestor ifNil: [^ self].
	prefix 
		ifNotNil: [ self choiceMenus 
			do: [:cm | self drawCommonPrefixAreasOn: aCanvas menu: cm]]

]

{ #category : #drawing }
PlatypusStepChooserMorph >> drawCommonPrefixAreasOn: aCanvas menu: aMenu [
	| firstMenuItem topLeft bottomLeft lastMenuItem w c |
	firstMenuItem := aMenu menuItems first.
	lastMenuItem := aMenu menuItems last.
	w := (firstMenuItem fontToUse widthOfString: prefix).
	topLeft := firstMenuItem boundsInWorld topLeft.
	bottomLeft := lastMenuItem boundsInWorld bottomLeft + ( w @ 0 ).
	c := aMenu color muchDarker.
	aCanvas fillRectangle: (topLeft  corner: bottomLeft) color: (c alpha: 0.3)
]

{ #category : #drawing }
PlatypusStepChooserMorph >> fullDrawOn: aCanvas [
	super fullDrawOn: aCanvas.
	self drawCommonPrefixAreasOn: aCanvas
	
]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> initialize [ 
	super initialize.
	self maxLines: 15
]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> newContentMorph [ 
	| sp |
	sp := super newContentMorph.
	sp
		updateScrollbars.
	^ sp

]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> nextPrefixWith: aPrefix [
	| curr pref found lab |
	curr := aPrefix size.
	lab := self labels first.
	found := false.
	[lab size <= curr 
		ifTrue: [found := true]
		ifFalse: [pref := lab copyFrom: 1 to: curr.
			self labels 
				do: [:l | found 
					ifFalse: [(l asString beginsWith: pref)
						ifFalse: [pref := pref allButLast.
							found := true]]]].
	found] whileFalse: [curr := curr + 1].
	^ (pref notNil and: [pref size > aPrefix size])
		ifTrue: [pref]

]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> open [
	super open.
	self borderStyle: ( self theme progressBarBorderStyleFor: self).
	self setPosition.

]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> positionInRequestor [
	| caret bottomLeft topLeft editor pos allowedArea |
	requestor ifNil: [^self].
	editor := requestor editor.
	caret := editor stopIndex.
	[editor selectAt: caret.
	bottomLeft := editor paragraph selectionRects first bottomLeft.
	topLeft := requestor owner submorphBounds topLeft.
	pos := topLeft + bottomLeft]
		ensure: [editor selectAt: caret].
	pos := pos + (40 @ 0).
	allowedArea := self allowedArea.
	(pos x + self width) > allowedArea width
		ifTrue: [pos := pos - (self width @ 0) - ((50 + 40)@ 0)].
	(pos y + self height) > allowedArea height
		ifTrue: [pos := (pos x @ (allowedArea height - self height - 5))].
	^ pos.

]

{ #category : #accessing }
PlatypusStepChooserMorph >> prefix: aPrefix [
	"Set the value of labels"
	prefix := aPrefix.

]

{ #category : #'ui-building' }
PlatypusStepChooserMorph >> setPosition [
	self position: self positionInRequestor.

]

{ #category : #'stepping and presenter' }
PlatypusStepChooserMorph >> step [
	[requestorPos 
		ifNil: [requestorPos := requestor owner position]
		ifNotNil: [requestorPos ~= requestor owner position
			ifTrue: [^ self close]].
	(requestor isNil or: [requestor isInWorld not])
		ifTrue: [^ self close].
	requestor editor editingState selectorChooser ~= self 
		ifTrue: [self close]
	] on: Error do: [self delete]

]

{ #category : #'stepping and presenter' }
PlatypusStepChooserMorph >> stepTime [
	^ 500
]

{ #category : #testing }
PlatypusStepChooserMorph >> wantsSteps [ 
	^ requestor notNil
]
