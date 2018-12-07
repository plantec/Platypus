Class {
	#name : #PlatypusTypeReference,
	#superclass : #PlatypusSchemaElementReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusTypeReference class >> lexicalElement [
	^ #type
]

{ #category : #accessing }
PlatypusTypeReference >> children [
	| children |
	children := #().
	self isReleased
		ifFalse: [children := self collectedDomains, super contents].
	^ children 
]

{ #category : #accessing }
PlatypusTypeReference >> collectedDomains [
	| newLink toBeRemove domains domainsReferences |
	self metaData ifNil: [^ #()].
	self metaData checksDomainPath
		ifNotNil: [^ #()].
	domains := self metaData domainsSet
				select: [:d | d isPltNamedType].
	domainsReferences := ((domains asArray
				select: [:st | st tamarisItemRef notNil])
				collect: [:st | st tamarisItemRef])
				sort: [:a :b | a name < b name].
	toBeRemove := self subContents
				select: [:l | (domainsReferences
						anySatisfy: [:str | str = l linked]) not].
	self subContents removeAll: toBeRemove.
	toBeRemove
		do: [:l | l destroy].
	domainsReferences
		do: [:str | (self subContents
					anySatisfy: [:l | l linked = str])
				ifFalse: [newLink := PlatypusDomainReference from: str.
					newLink owner: self.
					self subContents add: newLink]].
	^ self subContents
]

{ #category : #accessing }
PlatypusTypeReference >> icon [
	^ TamIcons mimeIcon: '10x10/mimetypes/blue_t'
]
