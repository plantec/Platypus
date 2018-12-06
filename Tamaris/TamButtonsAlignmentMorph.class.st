Class {
	#name : #TamButtonsAlignmentMorph,
	#superclass : #AlignmentMorph,
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
TamButtonsAlignmentMorph class >> newColumn [
	| bl |
	bl := super newColumn.
	bl
		color: Color transparent;
		borderWidth: 0;
		layoutInset: 0;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	^bl
]

{ #category : #'instance creation' }
TamButtonsAlignmentMorph class >> newRow [
	| bl |
	bl := super newRow.
	bl color: Color transparent;
		 borderWidth: 0;
		 layoutInset: 2;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap.
	^ bl
]

{ #category : #accessing }
TamButtonsAlignmentMorph class >> newSpacer: aColor [
	"Answer a space-filling instance of me of the given color."

	^ self new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 0;
		borderWidth: 0;
		extent: 1@1;
		color: aColor.
]

{ #category : #accessing }
TamButtonsAlignmentMorph class >> typicalColumnOwner [
	^(AlignmentMorph newColumn)
		layoutInset: 0;
		borderWidth: 0;
		color: Color transparent;
		yourself

]

{ #category : #accessing }
TamButtonsAlignmentMorph class >> typicalRowOwner [
	^(AlignmentMorph newRow)
		layoutInset: 0;
		borderWidth: 0;
		color: Color transparent;
		vResizing: #shrinkWrap;
		borderColor: Color black;
		yourself
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> addExtensibleSpacer [
	self
		addMorphFront: (AlignmentMorph newSpacer: Color transparent)
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> addSpacer [
	| spacer |
	spacer := self addSpacerOfColor: self color darker.
	^ spacer
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> addSpacerOfColor: aColor [ 
	| spacer container |
	container := AlignmentMorph new.
	container layoutInset: 4.
	container color: Color transparent.
	container borderColor: Color transparent.
	container borderWidth: 0.
	spacer := self class newSpacer: aColor.
	container addMorph: spacer.
	self addMorph: container.
^ spacer
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> addTransparentFixSpacer [
	| spacer |
	spacer := Morph new.
	spacer color: Color transparent.
	spacer	hResizing: #rigid;
		vResizing: #spaceFill;
		borderWidth: 0;
		extent: 5@1.
	self addMorph: spacer.
	^ spacer
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> addTransparentSpacer [
	self addSpacerOfColor: Color transparent
]

{ #category : #'initialize/release' }
TamButtonsAlignmentMorph >> destroy [
	owner := nil.
	super destroy
]

{ #category : #'initialize/release' }
TamButtonsAlignmentMorph >> initialize [
	super initialize.
	self borderColor: Color transparent.
	self useSquareCorners.
	self layoutPolicy: TableLayout new.

]

{ #category : #accessing }
TamButtonsAlignmentMorph >> isColumn [
	^self rowOrColumn = #column
]

{ #category : #accessing }
TamButtonsAlignmentMorph >> isRow [
	^ self rowOrColumn = #row

]

{ #category : #accessing }
TamButtonsAlignmentMorph >> rowOrColumn [
	(#(#leftToRight #rightToLeft) includes: self listDirection) ifTrue: [^#row].
	^ #column

]

{ #category : #updating }
TamButtonsAlignmentMorph >> step [
	self updateIfNeeded
]

{ #category : #updating }
TamButtonsAlignmentMorph >> stepTime [
	^ 600
]

{ #category : #updating }
TamButtonsAlignmentMorph >> updateIfNeeded [
	self submorphsDo: [:sm | 
		(sm respondsTo: #getEnabledSelector) 
			ifTrue: [sm update: sm getEnabledSelector]]
]

{ #category : #updating }
TamButtonsAlignmentMorph >> wantsSteps [
	^ true
]
