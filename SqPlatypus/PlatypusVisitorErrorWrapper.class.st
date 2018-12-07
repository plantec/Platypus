Class {
	#name : #PlatypusVisitorErrorWrapper,
	#superclass : #Object,
	#instVars : [
		'wrapped'
	],
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #'instance creation' }
PlatypusVisitorErrorWrapper class >> wrapped: aStepError [
	^ self new wrapped: aStepError
]

{ #category : #converting }
PlatypusVisitorErrorWrapper >> asString [
	^ wrapped asString
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> icon [
	| found p |
	p := self path.
	p ifNil: [^ nil ].
	found := p reversed
		detect: [:elem | (elem respondsTo: #tamarisItemRef) and: [elem  tamarisItemRef notNil]]
		ifNone: [^ nil].
	^ found tamarisItemRef icon
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> message [
	^ wrapped message
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> metaData [
	^ wrapped metaData

]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> path [
	^ wrapped path
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> selectingFrom: aHierarchicalList [ 
	| editor firstIndex elem |
	editor := aHierarchicalList clientModel.
	(firstIndex := self path indexOf: editor sourceHandler metaData) > 0
		ifTrue: [editor
				selectionInterval: (1 to: 0).
			editor selectCode: ''.
			editor codeSelectionInterval: (self path at: firstIndex) selectionString startingAt: 1.
			firstIndex + 1
				to: self path size
				do: [:pos | 
					elem := self path at: pos.
					editor selectCode: elem selectionString startingAt: editor selectionInterval first.
					editor selectionInterval: editor selectionInterval]]
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> unSelectingFrom: aHierarchicalList [ 
	| editor |
	editor := aHierarchicalList clientModel.
	editor selectFrom: editor selectionInterval first to: editor selectionInterval first - 1
]

{ #category : #accessing }
PlatypusVisitorErrorWrapper >> wrapped: aStepError [
	wrapped := aStepError
]
