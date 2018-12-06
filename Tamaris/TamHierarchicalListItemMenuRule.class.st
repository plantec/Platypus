Class {
	#name : #TamHierarchicalListItemMenuRule,
	#superclass : #TamListEventRule,
	#category : #'Tamaris-Event-Rules'
}

{ #category : #events }
TamHierarchicalListItemMenuRule >> doActionOn: anItem [ 
	| cplxcts menu |
	anItem ~= self list selectedMorph 
		ifTrue: [self list setSelectedMorph: anItem].
	(cplxcts := anItem complexContents) ifNotNil: 
			[menu := MenuMorph new defaultTarget: self list model editorModel.
			(cplxcts  modelSpecificMenu: menu shifted: true) ifNotNil: 
					[menu setInvokingView: self list.
					menu popUpEvent: self list activeHand lastEvent in: self list world]]
]

{ #category : #events }
TamHierarchicalListItemMenuRule >> eventMatch: anEvent [ 
	^ anEvent isMouse
		and: [anEvent yellowButtonPressed
				and: [anEvent shiftPressed]]
]
