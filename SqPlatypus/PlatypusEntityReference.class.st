Class {
	#name : #PlatypusEntityReference,
	#superclass : #PlatypusSchemaElementReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusEntityReference class >> lexicalElement [
	^ #entity
]

{ #category : #accessing }
PlatypusEntityReference >> children [
	^ self isReleased 
		ifTrue: [#()]
		ifFalse: [self collectedSubtypes , super contents].

]

{ #category : #accessing }
PlatypusEntityReference >> collectedSubtypes [
	| subtypes subTypesReferences newLink toBeRemove |
	self metaData checksHierarchy
		ifNotNil: [^ #()].
	subtypes := (self metaData subtypes
				collect: [:st | st referenced]) select: [:st | st notNil].
	subTypesReferences := ((subtypes asArray
				select: [:st | st tamarisItemRef notNil])
				collect: [:st | st tamarisItemRef])
				sort: [:a :b | a name < b name].
	toBeRemove := self subContents
				select: [:l | (subTypesReferences
						anySatisfy: [:str | str = l linked]) not].
	self subContents removeAll: toBeRemove.
	toBeRemove
		do: [:l | l destroy].
	subTypesReferences
		do: [:str | (self subContents
					anySatisfy: [:l | l linked = str])
				ifFalse: [newLink := PlatypusSubtypeReference from: str.
					newLink owner: self.
					self subContents add: newLink]].
	^ self subContents
]

{ #category : #accessing }
PlatypusEntityReference >> icon [
	^ TamIcons mimeIcon: '10x10/mimetypes/blue_e'
]
