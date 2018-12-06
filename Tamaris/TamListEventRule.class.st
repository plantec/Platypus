Class {
	#name : #TamListEventRule,
	#superclass : #Object,
	#instVars : [
		'handler'
	],
	#category : #'Tamaris-Event-Rules'
}

{ #category : #events }
TamListEventRule >> doActionOn: aListItem [ 
	self subclassResponsibility
]

{ #category : #events }
TamListEventRule >> eventMatch: anEvent [
^ false
]

{ #category : #events }
TamListEventRule >> handleEvent: anEvent item: aListItem [ 
	^ (self eventMatch: anEvent)
		and: [self
				doActionOn: (self unwrappedListItemFrom: aListItem).
			anEvent wasHandled: true.
			true]
]

{ #category : #accessing }
TamListEventRule >> handler: aListEventRulesHandler [
	handler := aListEventRulesHandler
]

{ #category : #accessing }
TamListEventRule >> list [
	^ handler list
]

{ #category : #accessing }
TamListEventRule >> unwrappedListItemFrom: aSourceItem [ 
	^ handler unwrappedFromItem: aSourceItem
]
