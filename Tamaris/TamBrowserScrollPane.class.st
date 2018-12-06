Class {
	#name : #TamBrowserScrollPane,
	#superclass : #ScrollPane,
	#instVars : [
		'pastUp'
	],
	#category : #'Tamaris-UI'
}

{ #category : #geometry }
TamBrowserScrollPane >> extent: newExtent [ 
	super
		extent: (newExtent max: 36 @ 16).
	pastUp
		ifNotNil: [
			pastUp extent: self innerBounds width - 6 @ self extent y.
			pastUp layoutChanged.self changed].
	self setScrollDeltas
]

{ #category : #'initialize/release' }
TamBrowserScrollPane >> initialize [
	super initialize.
	pastUp := AlignmentMorph newRow.
	scroller addMorph: pastUp.
	pastUp layoutPolicy: TableLayout new.
	pastUp listDirection: #leftToRight.
	pastUp wrapDirection: #TopToBottom.
	pastUp vResizing: #shrinkWrapp.
	pastUp hResizing: #shrinkWrapp.
	pastUp borderWidth: 0.
	pastUp color: Color transparent
]

{ #category : #accessing }
TamBrowserScrollPane >> pastUp [
	^pastUp
]

{ #category : #accessing }
TamBrowserScrollPane >> pastUp: anObject [
	pastUp := anObject
]

{ #category : #geometry }
TamBrowserScrollPane >> resetExtent [
	self extent: self extent.
]

{ #category : #geometry }
TamBrowserScrollPane >> vUnadjustedScrollRange [
	"Return the width of the widest item in the list"

	pastUp submorphs notEmpty ifFalse: [^0].
	^pastUp submorphs last fullBounds bottom
]
