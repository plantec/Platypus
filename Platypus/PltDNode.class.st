Class {
	#name : #PltDNode,
	#superclass : #Object,
	#instVars : [
		'next',
		'previous',
		'data'
	],
	#category : #'Platypus-HW-tools'
}

{ #category : #'instance creation' }
PltDNode class >> data: data [ 
	| node |
	node := self new. node data: data. ^ node
]

{ #category : #'instance creation' }
PltDNode class >> new [
	^ super new initialize
]

{ #category : #'instance creation' }
PltDNode class >> previous: previousNode next: nextNode data: data [ 
	| node |
	node := self new.
	node previous: previousNode; next: nextNode; data: data.
	^node
]

{ #category : #converting }
PltDNode >> asString [
	^data asString
]

{ #category : #accessing }
PltDNode >> data [
	^data
]

{ #category : #accessing }
PltDNode >> data: anObject [ 
	data := anObject
]

{ #category : #'initialize/release' }
PltDNode >> destroy [
	next := nil.
	previous := nil.
	data := nil.
	super destroy
]

{ #category : #'initialize/release' }
PltDNode >> initialize [
	super initialize.
	next := nil.
	previous := nil.
	data := nil
]

{ #category : #accessing }
PltDNode >> next [
	^next
]

{ #category : #accessing }
PltDNode >> next: anObject [
	next := anObject
]

{ #category : #accessing }
PltDNode >> nextLink [
	^ next
]

{ #category : #accessing }
PltDNode >> nextLink: anObject [ 
	next := anObject
]

{ #category : #copying }
PltDNode >> postCopy [
	data := data copy
]

{ #category : #accessing }
PltDNode >> previous [
	^previous
]

{ #category : #accessing }
PltDNode >> previous: anObject [ 
previous := anObject
]

{ #category : #accessing }
PltDNode >> previous: anObject next: anotherObject [ 
	previous := anObject.
	next := anotherObject
]

{ #category : #printing }
PltDNode >> printOn: aStream [ 
	aStream nextPutAll: self class name, '('.
	data printOn: aStream.
	aStream nextPutAll: ')'
]
