Extension { #name : #PltSimpleRecord }

{ #category : #'*xtra-platypus-evaluating' }
PltSimpleRecord >> addRecordsToExternalRepresentation: externalRep [ 
	externalRep records add: self.
	self owner: externalRep
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> at: pos [ 
	^ pos <= self parameters size
		ifTrue: [self parameters at: pos]
		ifFalse: [self definition referenced componentList at: pos]
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> at: position put: aValue [ 
	self parameters at: position put: aValue
]

{ #category : #'*xtra-platypus-type-infering' }
PltSimpleRecord >> computedDomain [
	^ self  inferedDomain

]

{ #category : #'*xtra-platypus-copying' }
PltSimpleRecord >> deepCopy [
	^ self copy.

]

{ #category : #'*xtra-platypus-testing' }
PltSimpleRecord >> definitionOk [
	^ self definition ref notNil
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> detectInstanceAttributeIdentification: aBlock [ 
	(self definition referenced selectLocalAttributeIdentifications: aBlock)
		ifNotEmpty: [:founds | ^ founds first].
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltSimpleRecord >> equal: other [ 
	| myParam otherParam res |
	self == other
		ifTrue: [^ PltTrueConstant new].
	self definition referenced == other definition referenced
		ifFalse: [^ PltFalseConstant new].
	1
		to: self parameters size
		do: [:pos | 
			myParam := self parameters at: pos.
			otherParam := other parameters at: pos.
			res := myParam equal: otherParam.
			res
				ifFalseOrUnknownConstant: [^ res]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> errorQualifier [
	^ 'external instance record '
]

{ #category : #'*xtra-platypus-type-infering' }
PltSimpleRecord >> inferedDomain [
	^ definition
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> inheritedDefinitions [
	^ definition ref inheritedDefinitions
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> interpretingContext [
	^ self owner interpretingContext
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> isInsideGroup: anEntityDef [ 
	^ self definition referenced isGeneralizationOf: anEntityDef
]

{ #category : #'*xtra-platypus-classification' }
PltSimpleRecord >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-classification' }
PltSimpleRecord >> isSimpleRecord [
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> owningModel [
	^ self owner owningModel
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> printableCode [
	| writer |
	writer := PlatypusModelContentsStepWriter new.
	writer outStream: (WriteStream on: String new).
	writer acceptTry: self.
	^ writer outStream contents
]

{ #category : #'*xtra-platypus-enumerating' }
PltSimpleRecord >> privateExplicitAttributesAndValuesDo: aBlock [ 
	^ self definition referenced
		explicitAttributesAndValuesDo: aBlock
		values: self parameters
		startingAt: 1
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> recordsForGroup: anEntityDef [ 
	^ (self isInsideGroup: anEntityDef)
		ifTrue: [Set with: self]
		ifFalse: [Set new]
]

{ #category : #'*xtra-platypus-tamaris' }
PltSimpleRecord >> tamarisChildrenIntoOwner: anotherReference [ 
	| subs pos elements |
	subs := OrderedCollection new.
	self definitionOk
		ifTrue: [elements := self definition referenced componentList.
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
PltSimpleRecord >> tamarisStepValueReferenceClass [
	^ PlatypusStepRecordReference
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleRecord >> valueOfExplicitAttributeNamed: aName [ 
	| entDef pos |
	(entDef := self definition ref) ifNotNil: 
			[(pos := entDef positionOfExplicitAttributeNamed: aName) > 0 
				ifTrue: [^ parameters at: pos]].
	^ nil
]

{ #category : #'*xtra-platypus-copying' }
PltSimpleRecord >> veryDeepCopy [
	| n |
	n := self copy.
	n parameters: n parameters veryDeepCopy.
	^ n
]
