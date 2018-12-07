Extension { #name : #PltAggregateInitializerElement }

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> addElementsTo: anAggregateInstance elementType: aType if: ifBlock interpretor: anInterpretor [ 
	| nb |
	nb := 0.
	(ifBlock value: val)
		ifTrue: [nb := repetition isNil
						ifTrue: [1]
						ifFalse: [anInterpretor acceptTry: repetition.
							anInterpretor popVal val].
			1
				to: nb
				do: [:r | anAggregateInstance
						add: (anInterpretor valueFromDomain: aType assignCompatibleWith: val)]].
	^ nb
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> addElementsTo: anAggregateInstance elementType: aType interpretor: anInterpretor [ 
	^ self addElementsTo: anAggregateInstance elementType: aType if: [:el | true] interpretor: anInterpretor 
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> addElementsTo: anAggregateInstance upTo: maxNb elementType: aType if: ifBlock interpretor: anInterpretor [ 
	| nb maxi |
	nb := 0.
	(ifBlock value: val) ifTrue: [
	nb := self repetitionValue.
	maxi := nb < maxNb
				ifTrue: [nb]
				ifFalse: [maxNb].
	1
		to: maxi
		do: [:r | anAggregateInstance
				add: (anInterpretor valueFromDomain: aType assignCompatibleWith: val)]].
	^ maxi
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> addElementsTo: anAggregateInstance upTo: maxNb elementType: aType interpretor: anInterpretor [ 
	^ self addElementsTo: anAggregateInstance upTo: maxNb elementType: aType if: [:el |true] interpretor: anInterpretor 

]

{ #category : #'*xtra-platypus-converting' }
PltAggregateInitializerElement >> asAggregateInitializerElement [
	^ self
]

{ #category : #'*xtra-platypus-type-infering' }
PltAggregateInitializerElement >> computedDomain [
	^ self val computedDomain

]

{ #category : #'*xtra-platypus-enumerating' }
PltAggregateInitializerElement >> do: aBlock [ 
	1 to: self repetitionValue do: [ :p | aBlock value: val]
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> equal: other [
	| o |
	o := other asAggregateInitializerElement.
	^ PltLogicalLiteral
		val: ((self val equal: o val) isPltTrueConstant
						and: [self repetitionValue = o repetitionValue])
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> includesVal: aValue [ 
	^ self val instEqual: aValue
]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> isPltMissingValue [
	^ self val isPltMissingValue
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializerElement >> repetitionValue [
	^self repetition ifNil: [1] ifNotNil: [self repetition referenced  val]
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregateInitializerElement >> repetitionValue: anInteger [ 
	self repetition: (PltIntegerLiteral val: anInteger)

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> rolesOf: anInstanceReference in: aSetOfString [ 
	^ self val rolesOf: anInstanceReference in: aSetOfString 

]

{ #category : #'*xtra-platypus-evaluating' }
PltAggregateInitializerElement >> rolesValue: anInstanceReference roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: resultSet [ 
	^ val rolesValue: anInstanceReference roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: resultSet 
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInitializerElement class >> val: aPrimitive [
	^ self new val: aPrimitive
]

{ #category : #'*xtra-platypus-instance-creation' }
PltAggregateInitializerElement class >> val: aPrimitive repetition: aIntegerLiteral [ 
	^ self new val: aPrimitive repetition: aIntegerLiteral
]
