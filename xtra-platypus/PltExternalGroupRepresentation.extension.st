Extension { #name : #PltExternalGroupRepresentation }

{ #category : #'*xtra-platypus-accessing' }
PltExternalGroupRepresentation >> addRecordsToExternalRepresentation: externalRep [ 
	self records
		do: [:rec | rec copy addRecordsToExternalRepresentation: externalRep]
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalGroupRepresentation >> asExternalRepresentation [
	^ self
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalGroupRepresentation >> equal: other [ 
	^ self equalExternal: other
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalGroupRepresentation >> groupClass [
	^ PltExternalGroupRepresentation
]

{ #category : #'*xtra-platypus-type-infering' }
PltExternalGroupRepresentation >> inferedDomain [
	| domains infered |
	domains := Set new.
	self records
		do: [:rec | domains add: rec computedDomain].
	domains isEmpty
		ifTrue: [^ PltGenericType asDomain].
	infered := PltSelectType new.
	infered selections: domains.
	^ infered
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalGroupRepresentation >> instEqual: other [ 
	| otherRecs myRecords otherRecords foundEqual |
	self groupClass == other groupClass
		ifFalse: [^ PltFalseConstant new].
	self == other
		ifTrue: [^ PltTrueConstant new].
	self records size ~= other records size
		ifTrue: [^ PltFalseConstant new].
	myRecords := IdentitySet new.
	otherRecords := IdentitySet new.
	myRecords addAll: self records.
	otherRecords addAll: other records.
	self records
		do: [:myRec | 
			otherRecs := otherRecords
						select: [:or | or definition == myRec definition].
			otherRecs isEmpty
				ifTrue: [^ PltFalseConstant new].
			foundEqual := otherRecs
						detect: [:or | (or instEqual: myRec) isPltTrueConstant]
						ifNone: [].
			foundEqual
				ifNil: [^ PltFalseConstant new].
			otherRecords remove: foundEqual.
			myRecords remove: myRec].
	^ PltLogicalLiteral
		val: (myRecords isEmpty
				and: [otherRecords isEmpty])
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalGroupRepresentation >> interpretingContext [
	^ self instRef interpretingContext
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalGroupRepresentation >> records [
	^ recordsCache
		ifNil: [recordsCache := self instRef recordsForGroup: self definition into: OrderedCollection new]
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalGroupRepresentation >> recordsForGroup: anEntityDef into: aCollection [ 
	self records
		do: [:rec | (rec isInsideGroup: anEntityDef)
				ifTrue: [aCollection add: rec.
					rec definition referenced supertypes
						do: [:st | self recordsForGroup: st ref into: aCollection]]].
	^ aCollection
]
