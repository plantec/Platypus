Class {
	#name : #TamListItemBoldBlueEmphasisRule,
	#superclass : #TamListItemEmphasisRule,
	#category : #'Tamaris-Event-Rules'
}

{ #category : #emphasing }
TamListItemBoldBlueEmphasisRule >> emphasisModel [
	^ self list boldBlueEmphasisModel
]

{ #category : #emphasing }
TamListItemBoldBlueEmphasisRule >> eventMatch: anEvent [ 
	^ anEvent isMouse and: [anEvent isMouseUp and: [anEvent shiftPressed]]
]
