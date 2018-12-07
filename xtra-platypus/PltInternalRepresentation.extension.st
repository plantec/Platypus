Extension { #name : #PltInternalRepresentation }

{ #category : #'*xtra-platypus-evaluating' }
PltInternalRepresentation >> addRecordsToExternalRepresentation: externalRep [ 
	self asExternalRepresentation records do: [:rec | rec addRecordsToExternalRepresentation: externalRep]
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> asExternalRepresentation [
	| records pos externalRep |
	records := OrderedCollection new.
	self definition referenced emptyRecordsInto: records.
	pos := 1.
	externalRep := PltExternalRepresentation new records: records.
	records
		do: [:rec | 
			rec owner: externalRep.
			1
				to: rec definition referenced numberOfExplicitAttributes
				do: [:n | 
					rec at: n put: (parameters at: pos) copy.
					pos := pos + 1]].
	^ externalRep
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> at: pos [ 
	^ pos <= self parameters size
		ifTrue: [self parameters at: pos]
		ifFalse: [self definition referenced fullInheritedComponentList at: pos]
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> at: position put: aValue [
	self parameters at: position put: aValue
]

{ #category : #'*xtra-platypus-copying' }
PltInternalRepresentation >> deepCopy [
	^ self copy.

]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> definitionInclusiveOwnerPath [
	^ self definition inclusiveOwnerPath
]

{ #category : #'*xtra-platypus-testing' }
PltInternalRepresentation >> definitionOk [
	^ self definition notNil and: [self definition ref notNil and: [self definition ref owner notNil]]
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> detectInstanceAttributeIdentification: aBlock [ 
	(self definition referenced selectInheritedExplicitAttributeIdentifications: aBlock)
		ifNotEmpty: [:founds | ^ founds last].
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltInternalRepresentation >> equal: other [ 
^ self equalInternal: other
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> groupClass [
	^ PltInternalGroupRepresentation
]

{ #category : #'*xtra-platypus-type-infering' }
PltInternalRepresentation >> inferedDomain [
	^ self definition computedDomain

]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> inheritedDefinitions [
	^ definition ref isNil ifTrue: [#()] ifFalse: [definition ref inheritedDefinitions]
]

{ #category : #'*xtra-platypus-evaluating' }
PltInternalRepresentation >> instEqual: another [ 
	^ PltLogicalLiteral val: self = another
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> isInsideGroup: anEntityDef [  
	^ self definition == anEntityDef

]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> localDefinitions [
	^ OrderedCollection with: definition ref
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> numberOfAttributesUntilGroup: groupEntityDef [ 
	^ self definition referenced numberOfAttributesUntilGroup: groupEntityDef
]

{ #category : #'*xtra-platypus-enumerating' }
PltInternalRepresentation >> privateExplicitAttributesAndValuesDo: aBlock [ 
	^ self privateInternalExplicitAttributesAndValuesDo: aBlock
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> records [
	^ Array with: self
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> startAttributePrevPosition [
	^ 0
]

{ #category : #'*xtra-platypus-tamaris' }
PltInternalRepresentation >> tamarisChildrenIntoOwner: anotherReference [ 
	| subs pos elements |
	subs := OrderedCollection new.
	self definitionOk
		ifTrue: [
			elements := self definition referenced fullInheritedComponentList.
			pos := 1.
			elements
				do: [:el | 
					subs
						add: (el tamarisStepValueReferenceClass
								owner: anotherReference
								position: pos
								attributeOrRule: el).
					pos := pos + 1]].
	^ subs
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> tamarisStepValueReferenceClass [
	^ PlatypusStepInstanceReference
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> unwrappedParameters [
	^ self parameters
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> valueOfExplicitAttributeNamed: aName [ 
	| entDef pos  |
	(entDef := self definition ref)
		ifNotNil: [(pos := entDef positionOfInheritedAttributeNamed: aName) > 0
				ifTrue: [^ parameters at: pos]].
	^ nil
]

{ #category : #'*xtra-platypus-copying' }
PltInternalRepresentation >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n parameters: n parameters veryDeepCopy.
	^ n
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalRepresentation >> wrappedParameters [
	^ self parameters
]
