Extension { #name : #PltNamedType }

{ #category : #'*xtra-platypus-classification' }
PltNamedType >> asSelfIdentifier [
	^ PltSelfIdentifier new
]

{ #category : #'*xtra-platypus-accessing' }
PltNamedType >> errorQualifier [
	^ super errorQualifier , ' ''' , self name , ''''

]

{ #category : #'*xtra-platypus-evaluating' }
PltNamedType >> expressTypeForTypeOf [
	^ self owner expressTypeForTypeOf , '.' , self name asUppercase
]

{ #category : #'*xtra-platypus-accessing' }
PltNamedType >> identifiersCache [
	^ identifiersCache
		ifNil: [identifiersCache := Dictionary new]
]

{ #category : #'*xtra-platypus-accessing' }
PltNamedType >> identifiersCache: aDictionary [ 
	identifiersCache := aDictionary
]

{ #category : #'*xtra-platypus-accessing' }
PltNamedType >> lookUpSchemaDefinition [
	^ owner lookUpSchemaDefinition

]

{ #category : #'*xtra-platypus-accessing' }
PltNamedType >> referenceOnSelf [
	^ (self referenceClass ref: self) owner: self
]

{ #category : #'*xtra-platypus-data-management' }
PltNamedType >> renameWith: newName [ 
	self name: newName
]

{ #category : #'*xtra-platypus-code-generating' }
PltNamedType >> variableHolders [
	^ whereRules copy
]
