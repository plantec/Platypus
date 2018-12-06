Class {
	#name : #TamPaneMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'model',
		'updatablePanes',
		'getChildrenSelector'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
TamPaneMorph class >> model: aModel [ 
	^ self new model: aModel

]

{ #category : #'LookEnhancements- compatibilty' }
TamPaneMorph >> addPaneHSplitterBetween: topMorph and: bottomBorphs [ 
	| splitter |
	super addPaneHSplitterBetween: topMorph and: bottomBorphs.
	splitter := self submorphs last.
	splitter addLeftOrTop: topMorph.
	bottomBorphs
		do: [:m | splitter addRightOrBottom: m].
	splitter comeToFront
]

{ #category : #'LookEnhancements- compatibilty' }
TamPaneMorph >> addPaneVSplitterBetween: leftMorph and: rightMorphs [ 
	| splitter |
	super addPaneVSplitterBetween: leftMorph and: rightMorphs.
	splitter := self submorphs last.
	splitter addLeftOrTop: leftMorph.
	rightMorphs
		do: [:m | splitter addRightOrBottom: m].
	splitter comeToFront
]

{ #category : #'panes- compatibility' }
TamPaneMorph >> announce: x [
]

{ #category : #'initialize/release' }
TamPaneMorph >> eat: aPane [ 
	| grips |
	aPane isSystemWindow
		ifTrue: [aPane emptyLabelArea].
	self layoutInset: -4@0.
	aPane removeCornerGrips.
	grips := aPane submorphsSatisfying: [:each | each isKindOf: WindowEdgeGripMorph].
	grips do: [:each | each delete].
	self model: aPane model.
	self addAllMorphs: aPane submorphs.
	self updatablePanes: aPane updatablePanes.
	aPane model
		ifNotNil: [aPane model removeDependent: aPane]
]

{ #category : #accessing }
TamPaneMorph >> getChildrenSelector [
	^ getChildrenSelector
]

{ #category : #accessing }
TamPaneMorph >> getChildrenSelector: anObject [
	getChildrenSelector := anObject
]

{ #category : #'initialize/release' }
TamPaneMorph >> initialize [
	super initialize.
	self useSquareCorners.
	self color: Color transparent.
	self borderWidth: 0.
	self layoutPolicy: ProportionalLayout new.
	self clipSubmorphs: true.
	self layoutInset: 0
]

{ #category : #accessing }
TamPaneMorph >> minExtent [
	^ 2 @ 60
]

{ #category : #accessing }
TamPaneMorph >> model [
	^ model
]

{ #category : #accessing }
TamPaneMorph >> model: anObject [
	model := anObject
]

{ #category : #'panes- compatibility' }
TamPaneMorph >> setUpdatablePanesFrom: getSelectors [ 
	"Set my updatablePanes inst var to the list of
	panes which are list panes with the given get-list
	selectors. Order is important here! Note that the
	method is robust in the face of panes not found,
	but a warning is printed in the transcript in each
	such case"
	| aList aPane possibles |
	aList := OrderedCollection new.
	possibles := OrderedCollection new.
	self
		allMorphsDo: [:pane | (pane isKindOf: PluggableListMorph)
				ifTrue: [possibles add: pane]].
	getSelectors
		do: [:sel | 
			aPane := possibles
						detect: [:pane | pane getListSelector == sel]
						ifNone: [].
			aPane
				ifNil: [Transcript cr; show: 'Warning: pane ' , sel , ' not found.']
				ifNotNil: [aList add: aPane]].
	updatablePanes := aList asArray
]

{ #category : #'initialize/release' }
TamPaneMorph >> splitHorizontally [
	| myFrame leftFrame rightFrame newRight newLeft |
	myFrame := self layoutFrame.
	leftFrame := myFrame copy.
	rightFrame := myFrame copy.
	leftFrame rightFraction: myFrame rightFraction / 2.
	rightFrame leftFraction: myFrame leftFraction / 2.
	newRight := self class new.
	newRight eat: self.
	newLeft := self class new.
	self addMorph: newLeft fullFrame: leftFrame.
	self addMorph: newRight fullFrame: rightFrame.
	^ newLeft
]

{ #category : #'initialize/release' }
TamPaneMorph >> splitVertically [
	| myFrame topFrame bottomFrame newTop newBottom |
	myFrame := self layoutFrame.
	topFrame := myFrame copy.
	bottomFrame := myFrame copy.
	topFrame bottomFraction: myFrame bottomFraction / 2.
	bottomFrame topFraction: myFrame topFraction / 2.
	newTop := self class new.
	newTop eat: self.
	newBottom := self class new.
	self removeAllMorphs.
	self addMorph: newTop fullFrame: topFrame.
	self addMorph: newBottom fullFrame: bottomFrame.
	^ newBottom
]

{ #category : #updating }
TamPaneMorph >> treeUpdated: anAnnounce [
	^ (self model respondsTo: #treeUpdated:) 
		ifTrue: [self model treeUpdated: anAnnounce]
]

{ #category : #'panes- compatibility' }
TamPaneMorph >> updatablePanes [
	"Answer the list of panes, in order, which should
	be sent the
	#verifyContents message"
	^ updatablePanes
		ifNil: [updatablePanes := #()]
]

{ #category : #'panes- compatibility' }
TamPaneMorph >> updatablePanes: aCollection [ 
	updatablePanes := aCollection
]

{ #category : #'panes- compatibility' }
TamPaneMorph >> updatePanesFromSubmorphs [
	
]
