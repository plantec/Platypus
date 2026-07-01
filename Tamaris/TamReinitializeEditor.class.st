Class {
	#name : 'TamReinitializeEditor',
	#superclass : 'TamAnnounce',
	#instVars : [
		'itemReference'
	],
	#category : 'Tamaris-Announces',
	#package : 'Tamaris',
	#tag : 'Announces'
}

{ #category : 'accessing' }
TamReinitializeEditor >> itemReference [
	^ itemReference
]

{ #category : 'accessing' }
TamReinitializeEditor >> itemReference: aListItemReference [
	itemReference := aListItemReference
]
