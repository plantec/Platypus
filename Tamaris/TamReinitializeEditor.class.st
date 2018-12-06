Class {
	#name : #TamReinitializeEditor,
	#superclass : #TamAnnounce,
	#instVars : [
		'itemReference'
	],
	#category : #'Tamaris-Announces'
}

{ #category : #accessing }
TamReinitializeEditor >> itemReference [
	^ itemReference
]

{ #category : #accessing }
TamReinitializeEditor >> itemReference: aListItemReference [
	itemReference := aListItemReference
]
