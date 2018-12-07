Extension { #name : #PltDictionaryInstanceReference }

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> annotation [
	^ self ref 
		ifNil: ['Unresolved domain']
		ifNotNil: [:r | r annotation]
]

{ #category : #'*xtra-platypus-type-infering' }
PltDictionaryInstanceReference >> computedDomain [
	^ self ref ifNotNil: [self ref computedDomain]
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> errorQualifier [
	^ super errorQualifier, ' "', self name, '"'

]

{ #category : #'*xtra-platypus-type-infering' }
PltDictionaryInstanceReference >> inferedDomain [
	^ self ref inferedDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> initializedValue [ 
	^ self ref initializedValue 
]

{ #category : #'*xtra-platypus-instance-creation' }
PltDictionaryInstanceReference class >> name: anIdent [
	^ self new name: anIdent.

]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> name: anIdent ref: aReferenced [ 
	self name: anIdent.
	self ref: aReferenced
]

{ #category : #'*xtra-platypus-instance-creation' }
PltDictionaryInstanceReference class >> name: anIdent ref: aReferenced [ 
	^ self new name: anIdent ref: aReferenced 
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> owner [
	^ owner
]

{ #category : #'*xtra-platypus-instance-creation' }
PltDictionaryInstanceReference class >> ref: aReferenced [
	| ref |
	ref := self new ref: aReferenced.
	ref name: aReferenced name.
	^ ref
	
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstanceReference >> referenced [
	^ self ref
]
