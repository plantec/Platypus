Class {
	#name : 'TamListItemEmphasisRule',
	#superclass : 'TamListEventRule',
	#category : 'Tamaris-Event-Rules',
	#package : 'Tamaris',
	#tag : 'Event-Rules'
}

{ #category : 'emphasing' }
TamListItemEmphasisRule >> doActionOn: anUnwrappedItem [ 
	self list show: anUnwrappedItem asEmphasedWith: self emphasisModel 
]

{ #category : 'emphasing' }
TamListItemEmphasisRule >> emphasisModel [
	^ self subclassResponsibility
]
