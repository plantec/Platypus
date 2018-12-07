Extension { #name : #PltEntityDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> annotation [
	^ self name
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> attributeBN: aName [ 
	| upper |
	upper := aName asUppercase.
	^ self
		attributesReverseDetect: [:attr | attr name asUppercase = upper]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> attributesReverseDetect: aBlock [ 
	self attributes ifNotNil: [self attributes
		reverseDo: [:attr | (aBlock value: attr)
				ifTrue: [^ attr]]].
	^ nil
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> attributesReverseDo: aBlock [ 
	self attributes
		reverseDo: [:attr | aBlock value: attr].

]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> bindings [
	^ self inheritedExplicitAttributes, self owner bindings 

]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> buildAttributesNamesSetIndex: namesSetIndex [ 
	| key |
	
	(self attributes ifNil: [ ^ self ])
		do: [:a | 
			key := a name asUppercase.
			(a redeclaring notNil
					and: [a redeclaring entityRef ref ~= self])
				ifTrue: [key := a redeclaring entityRef name asUppercase , '.' , key].
			namesSetIndex at: key ifAbsentPut: Set new.
			(namesSetIndex at: key)
				add: a]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> buildFullInheritedDerivedAttributeList: aCollection [ 
	self supertypes
		do: [:st | st ref buildFullInheritedDerivedAttributeList: aCollection].
	aCollection addAll: self derivedAttributes.
	^ aCollection
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> buildFullInheritedExplicitAttributeList: aCollection [
	self supertypes ifNotNil: [
		self supertypes
			do: [:st | st ref buildFullInheritedExplicitAttributeList: aCollection]].
	self explicitAttributes do: [:ea | (aCollection includes: ea) ifFalse: [aCollection add: ea]].
	^ aCollection
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> buildFullInheritedInverseAttributeList: aCollection [ 
	self supertypes
		do: [:st | st ref buildFullInheritedInverseAttributeList: aCollection].
	aCollection addAll: self inverseAttributes.
	^ aCollection
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> buildFullInheritedWhereRuleList: aCollection [ 
	self supertypes
		do: [:st | st ref buildFullInheritedWhereRuleList: aCollection].
	aCollection addAll: self whereRules.
	^ aCollection
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> canBeAssignedWith: otherType [ 
	^ otherType isAssignableToEntityDefinition: self
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> canHaveArguments [
	^ true
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksAttributesNames [
	| namesSetIndex errorsIndex |
	namesSetIndex := Dictionary new.
	errorsIndex := Dictionary new.
	^ self checksAttributesNamesSetIndex: namesSetIndex errors: errorsIndex.

]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksAttributesNamesSetIndex: namesSetIndex errors: errorsIndex [ 
	^ self checksAttributesNamesSetIndex: namesSetIndex errors: errorsIndex visited: Set new 

]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksAttributesNamesSetIndex: namesSetIndex errors: errorsIndex visited: visitedSet [ 
	| errMessage namesSetIndex2 visitedSet2 |
	(visitedSet includes: self)
		ifFalse: [self buildAttributesNamesSetIndex: namesSetIndex.
			namesSetIndex
				keysAndValuesDo: [:k :l | l size > 1
						ifTrue: [errorsIndex
								at: k
								ifAbsentPut: [errMessage := 'name conflict with attribute ''' , k , ''': defined in entities  '.
									l
										do: [:el | errMessage := errMessage , '''' , el owner name , '''']
										separatedBy: [errMessage := errMessage , ','].
									PlatypusExpressSemanticCheckerError metaData: self message: errMessage]]].
			(self supertypes ifNil: [ ^errorsIndex ])
				do: [:st | 
					namesSetIndex2 := namesSetIndex copy.
					visitedSet2 := visitedSet copy.
					visitedSet2 add: self.
					st ref
						checksAttributesNamesSetIndex: namesSetIndex2
						errors: errorsIndex
						visited: visitedSet2]].
	^ errorsIndex
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksHierarchy [
	| errPathStack |
	errPathStack := OrderedCollection new.
	^ (self checksHierarchy: OrderedCollection new errorStack: errPathStack)
		ifFalse: [errPathStack]
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksHierarchy: pathStack errorStack: errPathStack [ 
	| res |
	res := true.
	(pathStack includes: self)
		ifTrue: [errPathStack addAll: pathStack;
				 add: self.
			res := false]
		ifFalse: [
			pathStack add: self.
			self supertypes 
				ifNotNil: [
					self supertypes
						do: [:st | 
							res := ((st notNil and: [st isPltEntityDefinition])
								ifTrue: [st checksHierarchy: pathStack copy errorStack: errPathStack]
								ifFalse: [true])
								and: [res]]]].
	^ res
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksHierarchy: pathStack errorStack: errPathStack visited: visitedSet [ 
	| res |
	res := true.
	(visitedSet includes: self)
		ifTrue: [res := false]
		ifFalse: [visitedSet add: self.
			(pathStack includes: self)
				ifTrue: [errPathStack addAll: pathStack;
						 add: self.
					res := false]
				ifFalse: [pathStack add: self.
					self supertypes
						do: [:st | res := st isPltEntityDefinition
										ifTrue: [st 
												checksHierarchy: pathStack copy
												errorStack: errPathStack
												visited: visitedSet]
										ifFalse: [true]]]].
	^ res
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksHierarchyReportAndSetErrorStack: errPathStack [ 
	| res |
	(res := self checksHierarchy: OrderedCollection new errorStack: errPathStack)
		ifFalse: [Transcript show: 'Cycle in hierarchy path: '.
			errPathStack
				do: [:e | Transcript show: e name]
				separatedBy: [Transcript show: '->'].
			Transcript show: '\' withCRs].
	^ res
]

{ #category : #'*xtra-platypus-checking' }
PltEntityDefinition >> checksHierarchySetErrorStack: errPathStack [ 
	^ self checksHierarchy: OrderedCollection new errorStack: errPathStack
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> componentList [
	| components |
	components := OrderedCollection new.
	components addAll: self explicitAttributes.
	components addAll: self inverseAttributes.
	components addAll: self derivedAttributes.
	components addAll: self whereRules.
	^ components
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> defaultValue [
	^ PltMissingValue new
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> derivedAttributes [
	^ self attributes ifNil: [#()]
		ifNotNil: [
		self attributes select: [:a | a isPltDerivedAttribute]]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> destroySubtypes [
	subtypes := nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> emptyExternalRepresentation [
	| inst |
	inst := PltExternalRepresentation new.
	self emptyRecordsInto: inst records.
	^ inst
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> emptyInternalRepresentation [
	| inst |
	inst := PltInternalRepresentation new.
	inst definition: self referenceOnSelf.
	self
		inheritedExplicitAttributesDo: [:a | inst parameters add: a initializedValue].
	^ inst
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> emptyRecord [
	| inst |
	inst := PltSimpleRecord new.
	inst definition: self referenceOnSelf.
	self
		explicitAttributesDo: [:a | inst parameters add: a initializedValue].
	^ inst
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> emptyRecordsInto: aCollection [
	self supertypes do: [ :st | st ref  emptyRecordsInto: aCollection].
	aCollection add: self emptyRecord.

]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> entityDefinitionOfGroupNamed: anIdent [ 
	| found |
	self name asUppercase = anIdent asUppercase
		ifTrue: [^ self].
	self supertypes
		do: [:st | (found := st ref entityDefinitionOfGroupNamed: anIdent)
				ifNotNil: [^ found]].
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> explicitAttributes [
	self attributes ifNil: [^ #() ].
	^ self attributes
		select: [:a | a isPltExplicitAttribute]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> explicitAttributesAndValuesDo: aBlock values: parameters startingAt: startAttributePosition [ 
	self explicitAttributesWithIndexDo: 
			[:attr :pos | 
			pos >= startAttributePosition 
				ifTrue: [aBlock value: attr value: (parameters at: pos)]]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> explicitAttributesDo: aBlock [ 
	self attributes ifNotNil: [self attributes 
		do: [:attr | attr isPltExplicitAttribute
				ifTrue: [aBlock value: attr]]]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> explicitAttributesDo: aBlock separatedBy: aSepBlock [
	| count pos |
	count := 0.
	self attributes ifNotNil: [:attrs | attrs
		do: [:attr | attr isPltExplicitAttribute
				ifTrue: [count := count + 1]] ].
	pos := 0.
	self attributes ifNotNil: [:attrs | attrs
		do: [:attr | attr isPltExplicitAttribute
				ifTrue: [pos := pos + 1. aBlock value: attr]. pos < count ifTrue: [aSepBlock value] ] ]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> explicitAttributesWithIndexDo: aBlock [ 
	self attributes ifNotNil: 
			[self attributes withIndexDo: 
					[:attr :idx | 
					attr isPltExplicitAttribute ifTrue: [aBlock value: attr value: idx]]]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> fullInheritedComponentList [
	| fullInheritedComponents |
	fullInheritedComponents := OrderedCollection new.
	self buildFullInheritedExplicitAttributeList: fullInheritedComponents.
	self buildFullInheritedInverseAttributeList: fullInheritedComponents.
	self buildFullInheritedDerivedAttributeList: fullInheritedComponents.
	self buildFullInheritedWhereRuleList: fullInheritedComponents.
	^ fullInheritedComponents
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> inheritancePath [
	^ self inheritancePathInto: OrderedCollection new
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> inheritancePathInto: aCollection [ 
	(aCollection includes: self)
		ifFalse: [aCollection add: self.
			self supertypes
				do: [:st | st 
						ifNotNil: [st ref inheritancePathInto: aCollection]]].
	^ aCollection
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedAttributesDo: aBlock [ 
	^ self
		inheritedAttributesDo: aBlock
		separatedBy: []
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedAttributesDo: aBlock separatedBy: aSepBlock [ 
	| done |
	done := false.
	self supertypes
		do: [:st | (st ref inheritedAttributesDo: aBlock separatedBy: aSepBlock)
				ifTrue: [done := true]].
	self attributes
		ifNotEmpty: [:eattrs | 
			done
				ifTrue: [aSepBlock value].
			done := true.
			eattrs
				do: [:attr | aBlock value: attr]
				separatedBy: aSepBlock].
	^ done
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedAttributesReverseDetect: aBlock [ 
	| found |
	(found := self attributesReverseDetect: aBlock)
		ifNil: [self supertypes ifNotNil: [self supertypes
				reverseDo: [:st | (found := st ref
								ifNotNil: [st ref inheritedAttributesReverseDetect: aBlock])
						ifNotNil: [^ found]]]].
	^ found
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedAttributesReverseDo: aBlock [ 
	self attributesReverseDo: aBlock.
	self supertypes
		reverseDo: [:st | st ref inheritedAttributesReverseDo: aBlock]
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedDefinitions [
| res |
res := OrderedCollection new.
self inheritedDefinitionsDo: [:d | res add: d].
^ res
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedDefinitionsDo: aBlock [
	self supertypes
		do: [:st | st ref inheritedDefinitionsDo: aBlock].
	aBlock value: self
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> inheritedExplicitAttributes [
	^ self buildFullInheritedExplicitAttributeList: OrderedCollection new
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedExplicitAttributesDo: aBlock [ 
	^ self
		inheritedExplicitAttributesDo: aBlock
		separatedBy: []
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedExplicitAttributesDo: aBlock separatedBy: aSepBlock [ 
	^ self inheritedExplicitAttributesDo: aBlock separatedBy: aSepBlock doneFor: Set new
]

{ #category : #'*xtra-platypus-enumerating' }
PltEntityDefinition >> inheritedExplicitAttributesDo: aBlock separatedBy: aSepBlock doneFor: aSet [
	| done attrs |
	done := false.
	self supertypes ifNotNil: [
		self supertypes do: [:st | 
			st ref 
				ifNotNil: [
					(st ref
						inheritedExplicitAttributesDo: aBlock 
						separatedBy: aSepBlock 
						doneFor: aSet)
						ifTrue: [
							done := true]]]].
	(self numberOfExplicitAttributes > 0 and: [done]) ifTrue: [aSepBlock value].
	self 
		explicitAttributesDo: [:attr | 
			(aSet includes: attr)
				ifFalse: [
					done := true.
					aBlock value: attr.
					aSet add: attr] ]
		separatedBy: aSepBlock.
	^ done
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> inheritsFrom: anEntityDefinition [ 
	^ self isSpecializationOfEntityDefinition: anEntityDefinition 
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> inheritsFromEntityDefinitionNamed: aName [
	^ self isSpecializationOfEntityDefinitionNamed: aName
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityDefinition >> initializeContextInInterpretor: anInterpretor [ 
	| stackVal args |
	stackVal := anInterpretor argsStackTop.
	stackVal arguments size ~= self numberOfExplicitAttributes
		ifTrue: ["PlatypusExpressArgumentNumberException signal:
			'invalid number of argument'"
			]. 
	"PlatypusExpressArgumentNumberException signal:
	'invalid number of argument'"
	args := stackVal arguments.
	self numberOfExplicitAttributes - args size
		timesRepeat: [args
				add: (PlatypusExpressInterpretorStackVar interpretor: anInterpretor)].
	self
		explicitAttributesWithIndexDo: [:attr :pos | anInterpretor localData: attr value: (args at: pos) val].
	super initializeContextInInterpretor: anInterpretor
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> inverseAttributes [
	^ self attributes ifNil: [#()]
		ifNotNil: [self attributes  
		select: [:a | a isPltInverseAttribute]]
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isAssignableToEntityDefinition: anEntityDefinition [ 
	^ (self inheritsFrom: anEntityDefinition) or: [anEntityDefinition inheritsFrom: self]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> isAttributeRedeclared: anAttribute [ 
	self inheritedAttributesDo: [: attr | 
		(attr redeclaring notNil
				and: [attr redeclaring referenced == anAttribute]) ifTrue: [^ true]].
	^ false

]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isCompatibleWith: otherType [ 
	^ otherType isCompatibleWithEntityDefinition: self.

]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isCompatibleWithEntityDefinition: anEntityDefinition [ 
	^ (self inheritancePath asSet intersection: anEntityDefinition inheritancePath asSet) notEmpty
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isDirectSubtypeOf: parent [ 
	^ self supertypes anySatisfy: [:st | st ref == parent]
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isGeneralizationOf: otherType [
	^ otherType isSpecializationOfEntityDefinition: self.
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isSpecializationOfEntityDefinition: anEntityDefinition [ 
	self == anEntityDefinition
		ifTrue: [^ true]
		ifFalse: [self supertypes ifNotNil: [self supertypes
				do: [:st | (st  notNil
							and: [st ref isSpecializationOfEntityDefinition: anEntityDefinition])
						ifTrue: [^ true]]]].
	^ false
]

{ #category : #'*xtra-platypus-testing' }
PltEntityDefinition >> isSpecializationOfEntityDefinitionNamed: aName [
	| key |
	key := aName asUppercase.
	self name asUppercase = key
		ifTrue: [^ true]
		ifFalse: [self supertypes ifNotNil: [self supertypes
				do: [:st | (st  notNil
							and: [st ref  isSpecializationOfEntityDefinitionNamed: key])
						ifTrue: [^ true]]]].
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> key [
^ self name asUppercase
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> lookUpAttributeBN: aName [ 
	| upper |
	upper := aName asUppercase.
	^ self inheritedAttributesReverseDetect: [:attr | attr name asUppercase = upper].

]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> lookUpIdentifierBN: aName [ 
	^ self lookUpAttributeBN: aName
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> lookUpSupertypeBN: aName [ 
	| key found |
	key := aName asUppercase.
	self name asUppercase = key
		ifTrue: [^ self].
	self supertypes
		do: [:st | (found := st ref lookUpSupertypeBN: key)
				ifNotNil: [^ found]]
]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> moveInto: aContextDefinition [ 
	aContextDefinition entities add: self.
	self owner: aContextDefinition.
	self updateSupertypes.
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> numberOfAttributesUntilGroup: groupEntityDef [ 
	| nb |
	self ~= groupEntityDef
		ifTrue: [self supertypes
				do: [:st | 
					nb := st ref numberOfAttributesUntilGroup: groupEntityDef fromSubtype: self.
					nb > 0
						ifTrue: [^ nb]]].
	^ 0
]

{ #category : #'*xtra-platypus-private-accessing' }
PltEntityDefinition >> numberOfAttributesUntilGroup: groupEntityDef fromSubtype: subTypeEntityDef [ 
	| nb |
	self == groupEntityDef
		ifTrue: [^ subTypeEntityDef numberOfAttributesBeforeSupertype: groupEntityDef fromSubtype: subTypeEntityDef]
		ifFalse: [self supertypes
				do: [:st | 
					nb := st numberOfAttributesUntilGroup: groupEntityDef fromSubtype: self.
					nb > 0
						ifTrue: [^ nb]]].
	^ 0
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> numberOfExplicitAttributes [
	| count |
	count := 0.
	self attributes ifNotNil: [
		self explicitAttributesDo: [:attr | count := count + 1]].
	^ count
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> numberOfInheritedExplicitAttributes [
	| count |
	count := 0.
	self inheritedExplicitAttributesDo: [:attr | count := count + 1].
	^ count
	
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> positionOfExplicitAttributeNamed: anIdent [ 
	| key pos foundPos |
	pos := foundPos := 0.
	key := anIdent asUppercase.
	self explicitAttributesDo: 
			[:attrDef | 
			pos := pos + 1.
			attrDef name asUppercase = key ifTrue: [foundPos := pos]].
	^ foundPos
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> positionOfInheritedAttributeNamed: anIdent [ 
	| key pos foundPos |
	pos := foundPos := 0.
	key := anIdent asUppercase.
	self inheritedExplicitAttributesDo: [:attrDef | 
		pos := pos + 1.
		attrDef name asUppercase = key ifTrue: [foundPos := pos]].
	^ foundPos
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> referenceClass [
	^ PltEntityDefinitionReference
]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> removeFrom: acontextDefinition [ 
	acontextDefinition removeEntityDefinition: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> removeSubtype: anEntityDefinition [ 
	self subtypes
		removeAllSuchThat: [:st | st referenced == anEntityDefinition]

]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> renameWith: aString [
	self owner renameEntityDefinition: self with: aString.

]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> selectAttributeIdentifications: aBlock startPosition: start [ 
	| result pos |
	result := OrderedCollection new.
	pos := 0.
	self attributes
		do: [:attr | 
			attr isPltExplicitAttribute ifTrue: [pos := pos + 1].
			(aBlock value: attr)
				ifTrue: [result
						add: (PlatypusAttributeIdentification
								definition: attr
								globalPos: (attr isPltExplicitAttribute
										ifTrue: [pos + start - 1])
								localPos: (attr isPltExplicitAttribute
										ifTrue: [pos]))]].
	^ result
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> selectInheritedExplicitAttributeIdentifications: aBlock [ 
	| attrs globalStart |
	attrs := OrderedCollection new.
	globalStart := 1.
	self
		inheritedDefinitionsDo: [:aDefinition | 
			attrs
				addAll: (aDefinition selectAttributeIdentifications: aBlock startPosition: globalStart).
			globalStart := globalStart + aDefinition numberOfExplicitAttributes].
	^ attrs
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> selectLocalAttributeIdentifications: aBlock [
	^ self selectAttributeIdentifications: aBlock startPosition: 1
]

{ #category : #'*xtra-platypus-type-infering' }
PltEntityDefinition >> staticDomain [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityDefinition >> subtypes [
	^ subtypes
		ifNil: [subtypes := OrderedCollection  new]
]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> takeSubtype: anNamedTypeReference [ 
	| key |
	key := anNamedTypeReference name asUppercase.
	self subtypes
		removeAllSuchThat: [:st | st name asUppercase = key].
	self subtypes
		add: (anNamedTypeReference)
]

{ #category : #'*xtra-platypus-data-management' }
PltEntityDefinition >> updateSupertypes [
	self supertypes
		do: [:s | s ref
				ifNotNil: [s ref takeSubtype: self referenceOnSelf]]
]
