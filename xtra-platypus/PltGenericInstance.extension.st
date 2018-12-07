Extension { #name : #PltGenericInstance }

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> asExternalRepresentation [
	^ self subclassResponsibility 
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> assignableValue [
	^ self
]

{ #category : #'*xtra-platypus-data-management' }
PltGenericInstance >> becomeInstance: other [ 
	self owningModel replace: self with: other 
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> buildGroup: anEntityDef [ 
	| grp |
	grp := self groupClass new.
	grp definition: anEntityDef.
	grp instRef: self.
	^ grp
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> computed [
	^ computed ifNil: [ computed := false ]
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> computed: aBoolean [
	computed := aBoolean
]

{ #category : #'*xtra-platypus-copying' }
PltGenericInstance >> deepCopy [
	| n |
	n := self copy.
	n instanceScope: self instanceScope deepCopy.
	^ n	
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> definitionInclusiveOwnerPath [
	^ self subclassResponsibility 
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> entityDefinitionOfGroupNamed: anIdent [ 
	| found |
	self records
		do: [:rec | (found := rec definition referenced entityDefinitionOfGroupNamed: anIdent)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> equalExternal: other [ 
	| otherRecs myRecords otherRecords foundEqual |
	self groupClass == other groupClass
		ifFalse: [^ PltFalseConstant new].
	self == other
		ifTrue: [^ PltTrueConstant new].
	self records size ~= other records size
		ifTrue: [^ PltFalseConstant new].
	myRecords := (self records copy asArray
				sort: [:a :b | a definition name < b definition name]) asOrderedCollection.
	otherRecords := (other records copy asArray
				sort: [:a :b | a definition name < b definition name]) asOrderedCollection.
	self records
		do: [:myRec | 
			otherRecs := otherRecords
						select: [:or | or definition referenced == myRec definition referenced].
			otherRecs isEmpty
				ifTrue: [^ PltFalseConstant new].
			foundEqual := otherRecs
						detect: [:or | (or equal: myRec) isPltTrueConstant]
						ifNone: [].
			foundEqual
				ifNil: [^ PltFalseConstant new].
			otherRecords remove: foundEqual.
			myRecords remove: myRec].
	^ PltLogicalLiteral
		val: (myRecords isEmpty
				and: [otherRecords isEmpty])
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> equalInternal: other [ 
	| myParam otherParam res |
	self groupClass == other groupClass
		ifFalse: [^ PltFalseConstant new].
	self == other
		ifTrue: [^ PltTrueConstant new].
	self definition == other definition
		ifFalse: [^ PltFalseConstant new].
	self wrappedParameters size == other wrappedParameters size
		ifFalse: [^ PltFalseConstant new].
	1
		to: self wrappedParameters size
		do: [:pos | 
			myParam := self wrappedParameters at: pos.
			otherParam := other wrappedParameters at: pos.
			res := myParam equal: otherParam.
			res
				ifFalseOrUnknownConstant: [^ res]].
	^ PltTrueConstant new

]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> errorQualifier [
	^ '#' , self persistentLabel 
]

{ #category : #'*xtra-platypus-enumerating' }
PltGenericInstance >> explicitAttributesAndValuesDo: aBlock [ 
	self records do: [ :rec | rec privateExplicitAttributesAndValuesDo: aBlock]
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> getInstanceAttributeIdentification: aBlock [ 
	| sorted found |
	sorted := self records asArray
				sort: [:a :b | a definition referenced isGeneralizationOf: b definition referenced].
	sorted
		reverseDo: [:rec | (found := rec detectInstanceAttributeIdentification: aBlock)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> interpretingContext [
	^ self
]

{ #category : #'*xtra-platypus-testing' }
PltGenericInstance >> isComputed [
	^ self computed 
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> markAsComputed [
	computed := true
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> markAsPersistent [
	computed := false
]

{ #category : #'*xtra-platypus-enumerating' }
PltGenericInstance >> privateInternalExplicitAttributesAndValuesDo: aBlock [ 
	^ self definition referenced 
		explicitAttributesAndValuesDo: aBlock
		values: self parameters
		startingAt: self startAttributePrevPosition + 1
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> records [
	^ self subclassResponsibility 
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> rolesOf: anInstanceReference in: aSetOfString [ 
	self 
		explicitAttributesAndValuesDo: [:attrDef :val | val isPltGenericInstance
				ifTrue: [(val instEqual: anInstanceReference)
						ifTrueConstant: [aSetOfString
								add: (PltStringLiteral val: attrDef fullyQualifiedName)]]]
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> rolesValue: aGenericInstance roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: resultSet [ 
	| currDef |
	self records
		do: [:rec | 
			currDef := rec definition referenced.
			((entityKey isEmpty
						and: [schemaKey isEmpty])
					or: [currDef name asUppercase = entityKey
							and: [currDef owner name asUppercase = schemaKey]])
				ifTrue: [currDef
						explicitAttributesAndValuesDo: [:attrDef :val | (attributeKey isEmpty
									or: [attrDef name asUppercase = attributeKey
											and: [(val includesVal: aGenericInstance) isPltTrueConstant]])
								ifTrue: [resultSet add: self.
									^ self]]
						values: rec parameters
						startingAt: 1]]
]

{ #category : #'*xtra-platypus-accessing' }
PltGenericInstance >> selectionString [
	^ self printableCode
]

{ #category : #'*xtra-platypus-evaluating' }
PltGenericInstance >> stackElementOfExplicitAttribute: attr interpretor: anInterpretor [ 
	| anonymousVar allAttrIdentif identif def |
	allAttrIdentif := self definition referenced
				selectInheritedExplicitAttributeIdentifications: [:a | a = attr].
	identif := allAttrIdentif last.
	def := identif definition.
	anonymousVar := PltAnonymousVariable domain: def domain.
	^ PlatypusExpressInterpretorStackAttribute
		var: anonymousVar
		record: self
		pos: identif globalPos
		interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-data-management' }
PltGenericInstance >> updatePersistentLabelIndex: index [ 
	super updatePersistentLabelIndex: index.
	self instanceScope ifNotNil: [self instanceScope updatePersistentLabelIndex: index]
]

{ #category : #'*xtra-platypus-copying' }
PltGenericInstance >> veryDeepCopy [
	| n |
	n := self copy.
	n instanceScope: self instanceScope veryDeepCopy.
	^ n
]
