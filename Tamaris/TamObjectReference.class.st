Class {
	#name : #TamObjectReference,
	#superclass : #TamSqueakObjectReference,
	#instVars : [
		'itemObject'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menus }
TamObjectReference class >> menuAddReferenceIntoOwner: aReference [ 
	| expr result receiver newRef |
	expr := UIManager default request: 'Expression ' translated initialAnswer: 'self '.
	expr isEmpty
		ifFalse: [receiver := aReference.
			result := receiver withoutListWrapper class evaluatorClass new
						evaluate: (ReadStream on: expr)
						in: nil
						to: receiver withoutListWrapper
						notifying: nil
						ifFail: ["fix this"
							^ false].
			newRef := self new itemObject: result.
			aReference insertReference: newRef]
]

{ #category : #accessing }
TamObjectReference >> deepContents [ 	^#()
]

{ #category : #'initialize/release' }
TamObjectReference >> destroy [
	itemObject := nil.
	super destroy
]

{ #category : #accessing }
TamObjectReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/object'
]

{ #category : #accessing }
TamObjectReference >> itemObject [	^ itemObject 
]

{ #category : #accessing }
TamObjectReference >> itemObject: anObject [ 
	itemObject := anObject
]

{ #category : #accessing }
TamObjectReference >> listLabel [	^ self itemObject asString
]
