Class {
	#name : #TamSubListReference,
	#superclass : #TamListItemReference,
	#instVars : [
		'listSelector'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #'instance creation' }
TamSubListReference class >> owner: anExpressReference listSelector: aSymbol label: aString [ 
	^self new 
		owner: anExpressReference
		listSelector: aSymbol
		label: aString
]

{ #category : #comparing }
TamSubListReference >> = other [ 
	^(other isKindOf: self class) 
		and: [self owner = other owner and: [self listLabel = other  listLabel]]
]

{ #category : #'morphic wrapper' }
TamSubListReference >> asMorph [
	^(self codeHolderClass sourceHandler: self) openAsMorph
]

{ #category : #accessing }
TamSubListReference >> children [
	^ (self owner notNil
			and: [listSelector notNil])
		ifTrue: [(self owner perform: listSelector)]
		ifFalse: [#()]
]

{ #category : #accessing }
TamSubListReference >> codeHolderClass [
	^Smalltalk at: self codeHolderClassName asSymbol
]

{ #category : #accessing }
TamSubListReference >> codeHolderClassName [
	^self subclassResponsibility
]

{ #category : #comparing }
TamSubListReference >> hash [
	^self owner hash + self listLabel hash
]

{ #category : #accessing }
TamSubListReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/group'
]

{ #category : #testing }
TamSubListReference >> includes: anotherReference [ 
	^ self owner includes: anotherReference 
	
]

{ #category : #'code updating' }
TamSubListReference >> insertReference: anotherReference [ 
	^ self owner insertReference: anotherReference 
]

{ #category : #testing }
TamSubListReference >> isEditable [
	^ false
]

{ #category : #testing }
TamSubListReference >> isRemoveable [
	^ false
]

{ #category : #menus }
TamSubListReference >> keyStroke: aCharacter from: aListMorph [ 
	super keyStroke: aCharacter from: aListMorph.

]

{ #category : #accessing }
TamSubListReference >> listSelector [
	^ listSelector
]

{ #category : #accessing }
TamSubListReference >> listSelector: aSymbol [ 
	listSelector := aSymbol	
]

{ #category : #accessing }
TamSubListReference >> owner: aReference listSelector: aSymbol label: aString [ 
	self owner: aReference.
	self listSelector: aSymbol.
	self listLabel: aString
]

{ #category : #menus }
TamSubListReference >> remove [
	^ self inform: 'unremoveable item!' translated
]

{ #category : #accessing }
TamSubListReference >> shortName [
	^'[' , self listLabel , ']'
]
