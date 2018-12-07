Extension { #name : #PltDictionaryInstance }

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> annotation [
	^ self prettyPrintedExpressCode withoutCr
]

{ #category : #'*xtra-platypus-instance-creation' }
PltDictionaryInstance class >> asDomain [
	^ self new
]

{ #category : #'*xtra-platypus-converting' }
PltDictionaryInstance >> asDomainSet [
	^ Set with: self
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> assignableValueFrom: aValue interpretor: anInterpretor [ 
	^ aValue assignableValue
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> canBeAssignedWith: otherType [ 
	^ otherType isCompatibleWith: self
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> canHaveArguments [
	^ false
]

{ #category : #'*xtra-platypus-checking' }
PltDictionaryInstance >> checksDomainPath: pathStack errorStack: errPathStack [ 
	^ true
]

{ #category : #'*xtra-platypus-type-infering' }
PltDictionaryInstance >> computedDomain [

	^ self staticDomain
]

{ #category : #'*xtra-platypus-copying' }
PltDictionaryInstance >> deepCopy [
	self isPltValue
		ifTrue: [^ super deepCopy]
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> defaultValue [
	^ PltMissingValue  new
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> errorQualifier [
	^ self class platypusMetaData name
		collect: [:c | c == $_
				ifTrue: [$ ]
				ifFalse: [c]]
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> expressCode [
	| tokenList |
	tokenList := PlatypusSchemaInstanceTokenizer singleton tokenize: self.
	^ tokenList writeOn: String new writeStream
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> expressTypeForTypeOf [
	^ self class expressTypeForTypeOf
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance class >> expressTypeName [
	| en |
	^ ((en := self platypusMetaData name ) copyFrom: 1 to: en size - 5) asUppercase
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> expressTypeName [
	^ self class expressTypeName
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> initializeContextInInterpretor: anInterpretor [ 
	^ self
]

{ #category : #'*xtra-platypus-data-management' }
PltDictionaryInstance >> insertIntoIdentifiersCache: aPrimaryElement named: anIdentifier [ 
	| key |
	key := anIdentifier asUppercase.
	self identifiersCache at: key ifAbsentPut: Set new.
	(self identifiersCache at: key)
		add: aPrimaryElement
]

{ #category : #'*xtra-platypus-data-management' }
PltDictionaryInstance >> insertIntoNamedTypeCache: aPrimaryElement named: anIdentifier [ 
	| key |
	key := anIdentifier asUppercase.
	self namedTypesCache at: key ifAbsentPut: Set new.
	(self namedTypesCache at: key)
		add: aPrimaryElement
]

{ #category : #'*xtra-platypus-evaluating' }
PltDictionaryInstance >> interpretorContextClass [
	^ PlatypusExpressInterpretorContext
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isAssignableTo: otherType [ 
	^ otherType notNil and: [otherType computedDomain canBeAssignedWith: self computedDomain]
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isAssignableToAggregateType: anAggregateType [ 
	^ false
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isAssignableToEntityDefinition: anEntityDefinition [ 
	^ false
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isCompatibleWith: otherType [ 
	^ (self isSpecializationOf: otherType) or: [otherType isSpecializationOf: self]
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isCompatibleWithEntityDefinition: anEntityDefinition [ 
	^ false
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isDebugged [
	^ true
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isGeneralizationOf: otherType [ 
	^ otherType class == self class
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isPlatypusPrimitive [
	^ self schemaInstance isPlatypusPrimitive
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isSpecializationOf: otherType [ 
	^ otherType computedDomain isGeneralizationOf: self computedDomain

]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isSpecializationOfAggregateType: anAggregateType [ 
	^ anAggregateType isPltAggregateInitializerDomain
]

{ #category : #'*xtra-platypus-testing' }
PltDictionaryInstance >> isSpecializationOfEntityDefinition: anEntityDefinition [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> key [
^ self name asUppercase
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> lookUpIdentifierBN: aName [ 
	| availables |
	(self respondsTo: #identifiersCache)
		ifTrue: [availables := self identifiersCache
						at: aName asUppercase
						ifAbsent: [].
			^ availables
				ifNotNil: [availables anyOne]].
			^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> metaConcept [
	^ self schemaInstance ifNotNil: [:schi | schi metaConceptOf: self]
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> metaConcept: aMetaConcept [ 
	self schemaInstance metaConcept: aMetaConcept for: self
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> metaExpression: metaExpression [ 
	| metaConcept |
	metaConcept := PltMetaConceptDefinition new.
	metaConcept metaExpression: metaExpression.
	metaConcept definition: self.
	self metaConcept: metaConcept
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> position [
	^ self
		valueOfGenericProperty: #position
		ifAbsent: []
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> position: anInteger [ 
	self setGenericProperty: #position toValue: anInteger
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> prettyPrintedExpressCode [
	| ppTokenList |
	ppTokenList := PlatypusStepTokenPrettyPrinter new
				prettyPrint: (PlatypusSchemaInstanceTokenizer singleton tokenize: self).
	^ ppTokenList writeOn: String new writeStream
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> printableCode [
	^ self expressCode

]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> relatedRemarks [
	^ (self relatedRemarksReferences) collect: [:rr | rr remark]
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> relatedRemarksReferences [
	^ (self schemaDefinition remarkReferences 
		select: [:rr | rr referenced notNil and: [rr referenced ref = self]]) 
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> removeMetaConcept [
	self schemaInstance ifNotNil: [:schi | schi removeMetaConceptOf: self]
]

{ #category : #'*xtra-platypus-type-infering' }
PltDictionaryInstance >> staticDomain [
	^ self 
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> translatedSchemaCode [
	^ self prettyPrintedExpressCode
	
]

{ #category : #'*xtra-platypus-accessing' }
PltDictionaryInstance >> unwrappedItem [
	^ self
]
