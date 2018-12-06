"
Handles event rules for list such as PluggableListMorph or SimpleHierarchicalListMorph. 
The first purpose was to handle item emphasis rules.

Event handling is performed from handleEvent: anEvent.
 
2 importants methods :
	itemAtPoint: aPoint 
		is subclassResponsibility, it asks list to return item  at a given position (aPoint). 
	unwrappedFromItem: aListItem 
		have here  a default implementation. 
		It returns the data stored and accessible from aListItem.

<Express>
ENTITY ListEventRulesHandler ABSTRACT SUPERTYPE;
	list : ScrollPane;	(* the target list for event rules *)
	rules : LIST OF ListEventRule; (* the list of rules to trigger *)
END_ENTITY;
</Express>


"
Class {
	#name : #TamListEventRulesHandler,
	#superclass : #Object,
	#instVars : [
		'list',
		'rules'
	],
	#category : #'Tamaris-Event-Rules'
}

{ #category : #'instance creation' }
TamListEventRulesHandler class >> list: aList [
	^ self new
		list: aList
]

{ #category : #accessing }
TamListEventRulesHandler >> add: aListItemRule [ 
"add a new rule (a ListItemRule)"
	rules add: aListItemRule.
	aListItemRule handler: self
]

{ #category : #'public events handling' }
TamListEventRulesHandler >> handleEvent: anEvent [ 
	^ self rules
		anySatisfy: [:rule | rule
				handleEvent: anEvent
				item: (self itemAtPoint: anEvent position)]
]

{ #category : #'initialize-release' }
TamListEventRulesHandler >> initialize [
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #'list item accessing' }
TamListEventRulesHandler >> itemAtPoint: aPoint [ 
"asks list to return item  at a given position (aPoint)"
	^self subclassResponsibility
]

{ #category : #accessing }
TamListEventRulesHandler >> list [
	^list
]

{ #category : #accessing }
TamListEventRulesHandler >> list: anObject [
	list := anObject
]

{ #category : #accessing }
TamListEventRulesHandler >> rules [
	^ rules
]

{ #category : #'list item accessing' }
TamListEventRulesHandler >> unwrappedFromItem: aListItem [ 
"returns the data stored and accessible from aListItem"
	^aListItem
]
