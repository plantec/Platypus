Class {
	#name : #TamPluggableListMorphEventRulesHandler,
	#superclass : #TamListEventRulesHandler,
	#category : #'Tamaris-Event-Rules'
}

{ #category : #'list item accessing' }
TamPluggableListMorphEventRulesHandler >> itemAtPoint: aPoint [ 
	"asks list to return item  at a given position (aPoint)"
	^self list itemAtLocation: aPoint
]
