Extension { #name : #PltSelectType }

{ #category : #'*xtra-platypus-accessing' }
PltSelectType >> annotation [
	^ String streamContents: [:strm |
		self selections
			do: [:e | strm nextPutAll: e annotation]
			separatedBy: [strm nextPutAll: ' or '] ]
]

{ #category : #'*xtra-platypus-converting' }
PltSelectType >> asDomainSet [
	| result |
	result := Set new.
	self selections
		do: [:s | result add: s].
	^ result
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> canBeAssignedWith: otherType [ 
	^ (super canBeAssignedWith: otherType)
		or: [self selections
				anySatisfy: [:sel | sel referenced canBeAssignedWith: otherType]]
]

{ #category : #'*xtra-platypus-checking' }
PltSelectType >> checksDomainPath: pathStack errorStack: errPathStack [ 
	| tmpPathStack tmpErrPathStack |
	self selections
		do: [:s | 
			tmpPathStack := pathStack copy.
			tmpErrPathStack := errPathStack copy.
			s referenced ifNotNil: [(s referenced checksDomainPath: tmpPathStack errorStack: tmpErrPathStack)
				ifFalse: [errPathStack addAll: tmpErrPathStack.
					^ false]]].
	^ true
]

{ #category : #'*xtra-platypus-copying' }
PltSelectType >> deepCopy [
	^ self copy.

]

{ #category : #'*xtra-platypus-accessing' }
PltSelectType >> errorQualifier [
	| qualifier |
	qualifier := super errorQualifier , ' ('.
	self selections
		do: [:sel | qualifier := qualifier , sel name]
		separatedBy: [qualifier := qualifier , ','].
	qualifier := qualifier , ')'.
	^ qualifier
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isAssignableTo: otherType [ 
	^ self selections
		anySatisfy: [:sl | sl referenced isAssignableTo: otherType]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isAssignableToAggregateType: anAggregateType [ 
	^ self selections
		allSatisfy: [:sl | sl referenced isAssignableTo: anAggregateType]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isAssignableToEntityDefinition: anEntityDefinition [ 
	^ self selections
		anySatisfy: [:sl | sl referenced isAssignableTo: anEntityDefinition]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isCompatibleWithEntityDefinition: anEntityDefinition [ 
	^ self selections
		anySatisfy: [:sl | sl referenced isCompatibleWithEntityDefinition: anEntityDefinition]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isGeneralizationOf: otherType [ 
	^ (super isGeneralizationOf: otherType)
		or: [self selections
				anySatisfy: [:sel | (sel referenced isCompatibleWith: otherType) ]]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isSpecializationOfAggregateType: anAggregateType [ 
	^ self selections
		anySatisfy: [:sl | sl referenced isSpecializationOf: anAggregateType]
]

{ #category : #'*xtra-platypus-testing' }
PltSelectType >> isSpecializationOfEntityDefinition: anEntityDefinition [ 
	^ self selections
		anySatisfy: [:sl | sl referenced isSpecializationOf: anEntityDefinition]
]

{ #category : #'*xtra-platypus-instance-creation' }
PltSelectType class >> selections: aCollectionOfNamedTypes [
	^ self new selections: aCollectionOfNamedTypes
]
