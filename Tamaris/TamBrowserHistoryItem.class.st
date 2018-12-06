Class {
	#name : #TamBrowserHistoryItem,
	#superclass : #AbstractHistoryItem,
	#instVars : [
		'listItemReference'
	],
	#category : #'Tamaris-Browser-History'
}

{ #category : #'instance creation' }
TamBrowserHistoryItem class >> listItemReference: aListItemReference [ 
	^ self new listItemReference: aListItemReference
]

{ #category : #comparing }
TamBrowserHistoryItem >> <= other [ 
	^ listItemReference <= other listItemReference
]

{ #category : #comparing }
TamBrowserHistoryItem >> = another [ 
	another class == self class
		ifFalse: [^ false].
	^ listItemReference = another listItemReference
]

{ #category : #converting }
TamBrowserHistoryItem >> asString [
	^listItemReference asStringOrText
]

{ #category : #comparing }
TamBrowserHistoryItem >> hash [
	^listItemReference hash
]

{ #category : #testing }
TamBrowserHistoryItem >> isValidFromModel: aModel [ 
	^ aModel isBrowserHistoryItemValid: self 
]

{ #category : #accessing }
TamBrowserHistoryItem >> listItemReference [
	^listItemReference
]

{ #category : #accessing }
TamBrowserHistoryItem >> listItemReference: anObject [
	listItemReference := anObject
]

{ #category : #'model updating' }
TamBrowserHistoryItem >> updateModel: aModel [ 
	aModel setFromBrowserHistoryItem: self
]
