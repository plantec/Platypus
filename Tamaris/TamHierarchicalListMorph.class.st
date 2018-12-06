Class {
	#name : #TamHierarchicalListMorph,
	#superclass : #SimpleHierarchicalListMorph,
	#instVars : [
		'eventRulesHandler',
		'emphasisIndex',
		'maxNodeWidth'
	],
	#category : #'Tamaris-UI'
}

{ #category : #accessing }
TamHierarchicalListMorph class >> expandedForm [
	self indentingItemClass useStandardToggleIcons 
		ifTrue: [^super expandedForm].
	^TamIcons originalIcon: 'expandedForm'
]

{ #category : #accessing }
TamHierarchicalListMorph class >> indentingItemClass [
	^ TamIndentingListItemMorph
]

{ #category : #accessing }
TamHierarchicalListMorph class >> notExpandedForm [
	self indentingItemClass useStandardToggleIcons 
		ifTrue: [^super notExpandedForm].
	^TamIcons originalIcon: 'notExpandedForm'
]

{ #category : #private }
TamHierarchicalListMorph >> adjustSubmorphPositions [
	"Fixed to not require setting item widths to 9999."
	
	| p |
	maxNodeWidth := 0.
	p := 0@0.
	scroller submorphsDo: [ :each | | h |
		h := each height.
		each privateBounds: (p extent: each width@h).
		maxNodeWidth := maxNodeWidth max: (each fullBounds width + 100).
		p := p + (0@h)
	].
	self 
		changed;
		layoutChanged;
		setScrollDeltas.

]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldBlueEmphasisModel [
	^ TamListItemMorphEmphasisModel boldBlueOnLightBlueStandard
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldBlueEmphasisSet [
	^ self emphasisSet: self boldBlueEmphasisModel
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldBlueEmphasisSetRemoveAll [
	self emphasisIndex emptyEmphasisSet: self boldBlueEmphasisModel
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldRedEmphasisModel [
	^ TamListItemMorphEmphasisModel boldRedStandard
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldRedEmphasisSet [
	^ self emphasisSet: self boldRedEmphasisModel
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> boldRedEmphasisSetRemoveAll [
	self emphasisIndex emptyEmphasisSet: self boldRedEmphasisModel
]

{ #category : #updating }
TamHierarchicalListMorph >> bounds: newBounds [ 
	super bounds: newBounds.
	(model respondsTo: #boundsOf:updatedWith:) ifTrue: [model boundsOf: self updatedWith: newBounds]
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> clearAllEmphasis [
	self emphasisIndex clear.
	self changed
]

{ #category : #updating }
TamHierarchicalListMorph >> collapseAll [
	self scroller submorphsDo: [:sm | sm isExpanded ifTrue: [self toggleExpandedState: sm]].
	self adjustSubmorphPositions
]

{ #category : #'initialize-release' }
TamHierarchicalListMorph >> destroy [	
	super destroy.
	owner := nil.
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisIndex [
	^ emphasisIndex ifNil: [emphasisIndex := TamListItemMorphEmphasisIndex new]
]

{ #category : #accessing }
TamHierarchicalListMorph >> emphasisOf: anObject [ 
	^ (self emphasisIndex emphasisOf: anObject) 
		ifNil: [anObject emphasisModel ifNil: [TamListItemMorphEmphasisModel standard]]
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisSet: anListEmphasisModel [ 
	^ self emphasisIndex emphasisSet: anListEmphasisModel
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisSet: anListEmphasisModel collect: aBlock [ 
	^ self emphasisIndex emphasisSet: anListEmphasisModel collect: aBlock
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisSet: anListEmphasisModel detect: aBlock [ 
	^ self emphasisIndex emphasisSet: anListEmphasisModel detect: aBlock
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisSet: anListEmphasisModel do: aBlock [ 
	^ self emphasisIndex emphasisSet: anListEmphasisModel do: aBlock
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> emphasisSet: anListEmphasisModel select: aBlock [ 
	^ self emphasisIndex emphasisSet: anListEmphasisModel select: aBlock
]

{ #category : #events }
TamHierarchicalListMorph >> eventRulesHandleEvent: anEvent [ 
	^ self eventRulesHandler notNil 
		and: [self eventRulesHandler handleEvent: anEvent]
]

{ #category : #accessing }
TamHierarchicalListMorph >> eventRulesHandler [
	^ eventRulesHandler
]

{ #category : #updating }
TamHierarchicalListMorph >> expandAll [
	self scroller
		submorphsDo: [:sm | self expandAll: sm].
	self adjustSubmorphPositions
]

{ #category : #accessing }
TamHierarchicalListMorph >> indentingItemClass [
	^ self class indentingItemClass
]

{ #category : #'initialize-release' }
TamHierarchicalListMorph >> initialize [
	super initialize.
	 self initializeEventRulesHandler
]

{ #category : #'initialize-release' }
TamHierarchicalListMorph >> initializeEventRulesHandler [
	eventRulesHandler := TamSimpleHierarchicalListMorphEventRulesHandler 
				list: self.
	eventRulesHandler add: TamListItemBoldBlueEmphasisRule new.
	eventRulesHandler add: TamListItemBoldRedEmphasisRule new.
	eventRulesHandler add: TamHierarchicalListItemMenuRule new
]

{ #category : #private }
TamHierarchicalListMorph >> maxNodeWidth [
	^ maxNodeWidth ifNil: [maxNodeWidth := 0]
]

{ #category : #events }
TamHierarchicalListMorph >> mouseUp: event [ 
	(self eventRulesHandleEvent: event) ifTrue: [^ self changed].
	self clearAllEmphasis.	super mouseUp: event
]

{ #category : #'initialize-release' }
TamHierarchicalListMorph >> newTransformMorph [
	^TamHierarchicalListTransformMorph new 

]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> removeEmphasisOf: anObject [ 
	^ self emphasisIndex remove: anObject
]

{ #category : #'emphasis-handling' }
TamHierarchicalListMorph >> show: anUnwrappedItem asEmphasedWith: anEmphasisModel [
	self emphasisIndex switch: anUnwrappedItem emphasis: anEmphasisModel
]

{ #category : #'dropping/grabbing' }
TamHierarchicalListMorph >> startDrag: evt [ 
	| ddm itemMorph passenger trans tm subPassenger |
	self dragEnabled 
		ifTrue: 
			[itemMorph := scroller submorphs 
						detect: [:any | any highlightedForMouseDown]
						ifNone: []].
	(itemMorph isNil or: [evt hand hasSubmorphs]) ifTrue: [^ self].
	itemMorph highlightForMouseDown: false.
	itemMorph ~= self selectedMorph ifTrue: [self setSelectedMorph: itemMorph].
	(self boldBlueEmphasisSet notEmpty and: 
			[self boldBlueEmphasisSet 
				includes: itemMorph complexContents withoutListWrapper]) 
		ifTrue: 
			[trans := OrderedCollection new.
			self boldBlueEmphasisSet asOrderedCollection do: 
					[:s | 
					(subPassenger := self model dragPassengerFor: s inMorph: self) ifNotNil: 
							[tm := TransferMorph withPassenger: subPassenger.
							tm dragTransferType: (self model dragTransferTypeForMorph: self).
							trans add: tm]].
			trans isEmpty 
				ifFalse: 
					[passenger := SelectionMorph new.
					passenger setSelectedItems: trans.
					ddm := TransferMorph withPassenger: passenger from: self.
					ddm dragTransferType: (self model dragTransferTypeForMorph: self)]]
		ifFalse: 
			[(passenger := self model dragPassengerFor: itemMorph inMorph: self) 
				ifNotNil: 
					[ddm := TransferMorph withPassenger: passenger from: self.
					ddm dragTransferType: (self model dragTransferTypeForMorph: self)]].
	ddm ifNotNil: 
			[evt hand grabMorph: ddm].
	evt hand releaseMouseFocus: self
]
