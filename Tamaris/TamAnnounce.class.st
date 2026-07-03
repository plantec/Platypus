Class {
	#name : 'TamAnnounce',
	#superclass : 'Announcement',
	#instVars : [
		'sourceHandler'
	],
	#category : 'Tamaris-Announces',
	#package : 'Tamaris',
	#tag : 'Announces'
}

{ #category : 'accessing' }
TamAnnounce >> sourceHandler [ 
	^ sourceHandler
]

{ #category : 'accessing' }
TamAnnounce >> sourceHandler: aSourceHandler [
	sourceHandler := aSourceHandler
]
