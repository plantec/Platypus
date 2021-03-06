Extension { #name : #BorderedMorph }

{ #category : #'*tamaris-overwrite' }
BorderedMorph >> addPaneHSplitterBetween: topMorph and: bottomMorphs [

	| targetY minX maxX splitter |
	
	"Halt now."  "Hello, anybody here? is there anyone using this?"
	self flag: #toRemove.
	
	targetY := topMorph layoutFrame bottomFraction.

	minX := (bottomMorphs detectMin: [:each | each layoutFrame leftFraction]) layoutFrame leftFraction.
	maxX := (bottomMorphs detectMax: [:each | each layoutFrame rightFraction]) layoutFrame rightFraction.
	splitter := ProportionalSplitterMorph new beSplitsTopAndBottom; yourself.
	splitter layoutFrame: (
	 (minX @ targetY corner: maxX @ targetY) asLayoutFrame
		leftOffset: topMorph layoutFrame leftOffset;
		rightOffset: topMorph layoutFrame rightOffset;
		bottomOffset: 4 + topMorph layoutFrame bottomOffset;
		topOffset: topMorph layoutFrame bottomOffset
		).

	self addMorphBack: (splitter position: self position).
]
