Extension { #name : #PltExternalRepresentation }

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> addRecordsToExternalRepresentation: externalRep [ 
 	self records do: [:rec | rec copy addRecordsToExternalRepresentation: externalRep]
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> asExternalRepresentation [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> at: pos [ 
	^ self records at: pos
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> at: position put: aValue [ 
	self records at: position put: aValue.
	aValue owner: self
]

{ #category : #'*xtra-platypus-copying' }
PltExternalRepresentation >> deepCopy [
	^ self copy
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> definitionInclusiveOwnerPath [
	| path |
	path := OrderedCollection new.
	self records do: [:rec | path addAll: rec definition inclusiveOwnerPath].
	^ path
]

{ #category : #'*xtra-platypus-testing' }
PltExternalRepresentation >> definitionOk [
	self records ifNil: [^ false].
	^ self records allSatisfy: [:rec | rec definitionOk]
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> equal: other [ 
	^ self equalExternal: other
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> groupClass [
	^ PltExternalGroupRepresentation
]

{ #category : #'*xtra-platypus-type-infering' }
PltExternalRepresentation >> inferedDomain [
	| domains infered |
	domains := Set new.
	self records
		do: [:rec | domains add: rec computedDomain].
	domains isEmpty
		ifTrue: [^ PltGenericType asDomain].
	domains size > 1 ifTrue: [
		infered := PltSelectType new.
		infered selections: domains]
	ifFalse: [infered := domains anyOne ].
	^ infered
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> inheritedDefinitions [
	| res |
	res := OrderedCollection new.
	self records do: [:rec | res addAll: rec inheritedDefinitions].
	^ res

]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> instEqual: another [ 
	^ PltLogicalLiteral val: self == another
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> isInsideGroup: anEntityDef [ 
	| |
	self records
		do: [:rec | (rec isInsideGroup: anEntityDef)
				ifTrue: [^ true]].
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> localDefinitions [
	| res |
	res := OrderedCollection new.
	self records do: [:rec | res add: rec definition ref].
	^ res
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> recordsForGroup: anEntityDef [ 
	^ self recordsForGroup: anEntityDef into: Set new
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> recordsForGroup: anEntityDef into: aCollection [ 
	self records
		do: [:rec | (rec isInsideGroup: anEntityDef)
				ifTrue: [aCollection add: rec.
					]].
	^ aCollection
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> stackElementOfExplicitAttribute: attr interpretor: anInterpretor [ 
	| anonymousVar allAttrIdentif identif def sorted |
	sorted := self records asArray
				sort: [:a :b | a definition referenced isGeneralizationOf: b definition referenced].
	sorted
		reverseDo: [:rec | 
			allAttrIdentif := rec definition referenced
						selectLocalAttributeIdentifications: [:a | a = attr].
			allAttrIdentif notEmpty
				ifTrue: [identif := allAttrIdentif last.
					def := identif definition.
					anonymousVar := PltAnonymousVariable domain: def domain.
					^ PlatypusExpressInterpretorStackAttribute
						var: anonymousVar
						record: rec
						pos: identif localPos
						interpretor: anInterpretor]].
	^ nil
]

{ #category : #'*xtra-platypus-tamaris' }
PltExternalRepresentation >> tamarisChildrenIntoOwner: anotherReference [ 
	| subs pos |
	subs := OrderedCollection new.
	self definitionOk
		ifTrue: [
			pos := 1.
			self records
				do: [:el | 
					subs
						add: (el tamarisStepValueReferenceClass
								owner: anotherReference
								position: pos).
					pos := pos + 1]].
	^ subs
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalRepresentation >> tamarisStepValueReferenceClass [
	^ PlatypusStepInstanceReference 
]

{ #category : #'*xtra-platypus-evaluating' }
PltExternalRepresentation >> valueOfExplicitAttributeNamed: aName [ 
	| sorted res |
	sorted := self records asArray 
				sort: [:a :b | a definition referenced isGeneralizationOf: b definition referenced].
	sorted reverseDo: 
			[:rec | (res := rec valueOfExplicitAttributeNamed: aName)  ifNotNil: [^res]].
	^ nil
]
