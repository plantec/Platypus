Extension { #name : #PltExternalSchema }

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> allImportedItems [
	^ self explicitlyImportedItems, self implicitlyImportedItems 
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> errorQualifier [
	^ super errorQualifier, ' "', self name , '"'.
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> explicitlyImportedItems [
	^ #()
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> getEquivalentItemFor: item [ 
	| itemName |
	itemName := item name asUppercase.
	^ self explicitlyImportedItems
		detect: [:i | itemName = i name asUppercase]
		ifNone: [self implicitlyImportedItems
				detect: [:i | itemName = i name asUppercase] ifNone: []]
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> implicitlyImportedItems [
	^ #()
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> lookUpIdentifierBN: aName [ 
	^ self nativeSchema
		ifNotNil: [self nativeSchema localLookUpIdentifierBN: aName]
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> lookUpNamedTypeBN: aName [ 
	^ self nativeSchema
		ifNotNil: [self nativeSchema localLookUpNamedTypeBN: aName]
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalSchema >> selectionString [
	^ 'FROM ', self name
]

{ #category : #'*xtra-platypus-data-management' }
PltExternalSchema >> updateExternalIdentifiersIndex: aDictionary [ 
	self allImportedItems
		do: [:item | (item nativeItem notNil
					and: [item nativeItem isPltNamedType not])
				ifTrue: [aDictionary at: item name asUppercase put: item]]
]

{ #category : #'*xtra-platypus-data-management' }
PltExternalSchema >> updateExternalNamedTypesIndex: aDictionary [ 
	self allImportedItems
		do: [:item | (item nativeItem notNil
					and: [item nativeItem isPltNamedType])
				ifTrue: [aDictionary at: item name asUppercase put: item]]
]
