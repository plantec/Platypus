Class {
	#name : #TamSimpleHierarchicalListMorphEventRulesHandler,
	#superclass : #TamListEventRulesHandler,
	#category : #'Tamaris-Event-Rules'
}

{ #category : #'list item accessing' }
TamSimpleHierarchicalListMorphEventRulesHandler >> itemAtPoint: aPoint [ 
	"asks list to return item  at a given position (aPoint)"
	^self list itemFromPoint: aPoint
]

{ #category : #'list item accessing' }
TamSimpleHierarchicalListMorphEventRulesHandler >> unwrappedFromItem: aListItem [ 
	"returns the data stored and accessible from aListItem"
	^aListItem complexContents withoutListWrapper
]
