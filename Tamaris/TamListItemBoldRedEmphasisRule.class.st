Class {
	#name : 'TamListItemBoldRedEmphasisRule',
	#superclass : 'TamListItemEmphasisRule',
	#category : 'Tamaris-Event-Rules',
	#package : 'Tamaris',
	#tag : 'Event-Rules'
}

{ #category : 'emphasing' }
TamListItemBoldRedEmphasisRule >> emphasisModel [
	^ self list boldRedEmphasisModel
]

{ #category : 'emphasing' }
TamListItemBoldRedEmphasisRule >> eventMatch: anEvent [ 
	^ anEvent isKeyboard
		and: [anEvent commandKeyPressed
				and: [anEvent keyCharacter = $X]]
]
