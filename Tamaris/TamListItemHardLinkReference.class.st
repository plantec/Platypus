Class {
	#name : #TamListItemHardLinkReference,
	#superclass : #TamListItemAbstractLinkReference,
	#instVars : [
		'linked'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #accessing }
TamListItemHardLinkReference >> asStringOrText [
	^ self linkPrefix , self linked  asStringOrText
]

{ #category : #accessing }
TamListItemHardLinkReference >> icon [
	| lnk |
	^(lnk := self linked) isReleased 
		ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/question']
		ifFalse: [lnk icon]
]

{ #category : #accessing }
TamListItemHardLinkReference >> linkPrefix [
	^ '=> '
]

{ #category : #accessing }
TamListItemHardLinkReference >> linked [
	^ linked
]

{ #category : #accessing }
TamListItemHardLinkReference >> linked: anItem [ 
	linked := anItem.
	
]
