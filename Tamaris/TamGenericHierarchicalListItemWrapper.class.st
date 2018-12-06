Class {
	#name : #TamGenericHierarchicalListItemWrapper,
	#superclass : #ListItemWrapper,
	#category : #'Tamaris-UI'
}

{ #category : #accessing }
TamGenericHierarchicalListItemWrapper >> children [
	^ item children
]

{ #category : #accessing }
TamGenericHierarchicalListItemWrapper >> contents [
	^self children collect: [:each | item wrapperClass with: each model: nil]
]

{ #category : #'initialize/release' }
TamGenericHierarchicalListItemWrapper >> destroy [
	item := nil.
	model := nil.
	super destroy
]

{ #category : #accessing }
TamGenericHierarchicalListItemWrapper >> icon [
	^ (item respondsTo: #icon) ifTrue: [item icon] 
]

{ #category : #accessing }
TamGenericHierarchicalListItemWrapper >> isReleased [
	^ item = nil
]
