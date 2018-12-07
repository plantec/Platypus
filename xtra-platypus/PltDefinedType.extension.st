Extension { #name : #PltDefinedType }

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> annotation [
	(self domain isPltEnumerationType or: [self domain isPltSelectType])
		ifTrue: [^ self domain annotation withoutCr].
	^ self domain annotation withoutCr  
]

{ #category : #'*xtra-platypus-evaluating' }
PltDefinedType >> assignableValueFrom: aValue  interpretor: anInterpretor [
	^ self domain assignableValueFrom: aValue  interpretor: anInterpretor
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> bindings [
	^ self owner bindings

]

{ #category : #'*xtra-platypus-testing' }
PltDefinedType >> canBeAssignedWith: otherType [ 
	^ (super canBeAssignedWith: otherType)
		ifTrue: [true]
		ifFalse: [self domain canBeAssignedWith: otherType]
]

{ #category : #'*xtra-platypus-checking' }
PltDefinedType >> checksDomainPath [
	| errPathStack |
	errPathStack := OrderedCollection new.
	^ (self checksDomainPath: OrderedCollection new errorStack: errPathStack)
		ifFalse: [errPathStack]
]

{ #category : #'*xtra-platypus-checking' }
PltDefinedType >> checksDomainPath: pathStack errorStack: errPathStack [ 
	| res |
	res := true.
	(pathStack includes: self) 
		ifTrue: 
			[errPathStack
				addAll: pathStack;
				add: self.
			res := false]
		ifFalse: 
			[pathStack add: self.
			res := (self domain ifNil: [true] ifNotNil: [self domain referenced ifNil: [true]
						ifNotNil: 
							[self domain referenced checksDomainPath: pathStack copy
								errorStack: errPathStack]]) and: [res]].
	^res
]

{ #category : #'*xtra-platypus-checking' }
PltDefinedType >> checksDomainPathReportAndSetErrorStack: errPathStack [ 
	| res |
	(res := self checksDomainPath: OrderedCollection new errorStack: errPathStack)
		ifFalse: [Transcript show: 'Cycle in domain path: '.
			errPathStack
				do: [:e | Transcript show: e name]
				separatedBy: [Transcript show: '->'].
			Transcript show: '\' withCRs].
	^ res

]

{ #category : #'*xtra-platypus-checking' }
PltDefinedType >> checksDomainPathSetErrorStack: errPathStack [ 
	^ self checksDomainPath: OrderedCollection new errorStack: errPathStack
]

{ #category : #'*xtra-platypus-evaluating' }
PltDefinedType >> defaultValue [
	^ self domain defaultValue
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> domainsSet [
	^ self domain asDomainSet
]

{ #category : #'*xtra-platypus-testing' }
PltDefinedType >> hasEnumerationElementNamed: aName [ 
	self domain isPltEnumerationType
		ifTrue: [^ self domain hasElementNamed: aName].
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> initializedValue [ 
	^ self domain initializedValue
]

{ #category : #'*xtra-platypus-testing' }
PltDefinedType >> isGeneralizationOf: otherType [ 
	^ (super isGeneralizationOf: otherType)
		ifFalse: [self domain isGeneralizationOf: otherType]
]

{ #category : #'*xtra-platypus-testing' }
PltDefinedType >> isSpecializationOf: otherType [ 
	^ self domain isSpecializationOf: otherType 
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> lookUpIdentifierBN: aName [
	| found |
	(found := super lookUpIdentifierBN: aName)
		ifNil: [self domain 
			ifNotNil: [found := self domain lookUpIdentifierBN: aName]].
	^ found
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> lookUpNamedTypeBN: aName [ 
	| found |
	(found := super lookUpNamedTypeBN: aName)
		ifNil: [self domain
				ifNotNil: [found := self domain lookUpNamedTypeBN: aName]].
	^ found
]

{ #category : #'*xtra-platypus-data-management' }
PltDefinedType >> moveInto: aContextDefinition [ 
	aContextDefinition types add: self.
	self owner: aContextDefinition
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> name: anIdent domain: aDomain [
	self name: anIdent .
	self domain: aDomain
]

{ #category : #'*xtra-platypus-instance-creation' }
PltDefinedType class >> name: anIdent domain: aDomain [
	^ self new name: anIdent domain: aDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltDefinedType >> referenceClass [
	^ PltDefinedTypeReference
]

{ #category : #'*xtra-platypus-data-management' }
PltDefinedType >> removeFrom: aContextDefinition [ 
	aContextDefinition removeDefinedType: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltDefinedType >> renameWith: aString [
	self owner renameDefinedType: self with: aString.

]

{ #category : #'*xtra-platypus-type-infering' }
PltDefinedType >> staticDomain [
	^ self domain ifNotNil: [:d | d computedDomain]

]
