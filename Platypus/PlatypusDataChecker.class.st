Class {
	#name : #PlatypusDataChecker,
	#superclass : #PlatypusStepChecker,
	#instVars : [
		'value',
		'attribute',
		'aggr',
		'aggrType',
		'aggrPos',
		'instanceOid',
		'platypusRepository',
		'errors'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #checking }
PlatypusDataChecker class >> checksValue: aValue attribute: anAttribute instanceOid: anInteger repository: aPlatypusRepository [ 
	| errors instance |
	errors := self new
				checksValue: aValue
				attribute: anAttribute
				instanceOid: anInteger
				repository: aPlatypusRepository.
	^ errors
		collect: [:err | 
			instance := aPlatypusRepository instanceAt: anInteger.
			self errorClass
				error: '#' , anInteger asString , '=' , instance class name , ': ' , err message
				oid: anInteger
				repository: aPlatypusRepository]
]

{ #category : #checking }
PlatypusDataChecker class >> checksValue: aValue elementType: aMetaData aggrType: anAggrType aggrPos: aPosition attribute: anAttribute instanceOid: anInteger repository: aPlatypusRepository [
	^ self new
		checksValue: aValue
		elementType: aMetaData
		aggrType: anAggrType
		aggrPos: aPosition
		attribute: anAttribute
		instanceOid: anInteger
		repository: aPlatypusRepository
]

{ #category : #accessing }
PlatypusDataChecker class >> errorClass [
	^ PlatypusPharoSmalltalk at: #PlatypusStepCheckerError
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptAggregationType: e [ 
	| pos tmpErrors cls |
	cls := PlatypusPharoSmalltalk at: (self smalltalkTypeOf: e) asSymbol.
	value isCollection
		ifTrue: [(value isKindOf: cls)
				ifFalse: [self valueIsA: value class insteadOf: cls].
			pos := 1.
			value
				do: [:elem | 
					tmpErrors := self class
								checksValue: elem
								elementType: e elementType
								aggrType: e
								aggrPos: pos
								attribute: attribute
								instanceOid: instanceOid
								repository: platypusRepository.
					tmpErrors
						ifNotEmpty: [:suberrs | 
							tmpErrors := tmpErrors
										collect: [:err | self errorClass
												error: self errorHeading , err message
												oid: instanceOid
												repository: platypusRepository].
							errors addAll: tmpErrors]]
				separatedBy: [pos := pos + 1]]
		ifFalse: [self valueIsA: value class insteadOf: cls]
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptArrayType: e [ 
	self acceptAggregationType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptBagType: e [ 
	self acceptAggregationType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptBinaryType: e [ 
	self acceptSimpleType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptBooleanType: e [ 
	self acceptSimpleType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptDefinedType: e [ 
	^ self acceptTry: e domain
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptDictionaryInstanceReference: e [ 
	^ self acceptTry: e referenced
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptEntityDefinition: e [ 
	| cls |
	cls := platypusRepository metaDataSchemaInstance classFromEntityName: e name.
	(value isKindOf: cls)
		ifFalse: [self valueIsA: value class insteadOf: cls]
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptEntityDefinitionReference: e [ 
	| cls |
	cls := platypusRepository metaDataSchemaInstance classFromEntityName: e name.
	(value  isKindOf: cls)
		ifFalse: [self valueIsA: value class insteadOf: cls]
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptEnumerationType: e [ 
	(value isKindOf: Symbol)
		ifTrue: [((e elements
					collect: [:el | el asUppercase])
					includes: value asUppercase)
				ifFalse: [self enumerationValueOutOfDomain: e]]
		ifFalse: [self valueIsA: value class insteadOf: Symbol]
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptExplicitAttribute: e [ 
	^ self acceptTry: e domain
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptIntegerType: e [ 
	self acceptSimpleType:e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptListType: e [ 
	self acceptAggregationType: e 
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptLogicalType: e [ 
	self acceptSimpleType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptNamedTypeReference: e [ 
	^ self acceptTry: e referenced
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptRealType: e [ 
	self acceptSimpleType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptSelectType: e [ 
	e selections
		do: [:sel | (self class
				checksValue: value
				elementType: sel referenced
				aggrType: aggrType
				aggrPos: aggrPos
				attribute: attribute
				instanceOid: instanceOid
				repository: platypusRepository)
				ifEmpty: [^ #()]].
	self selectValueOutOfDomain: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptSetType: e [ 
	self acceptAggregationType: e
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptSimpleType: e [ 
	| cls |
	cls := PlatypusPharoSmalltalk at: (self smalltalkTypeOf: e) asSymbol.
	(value isKindOf: cls)
		ifFalse: [self valueIsA: value class insteadOf: cls]
]

{ #category : #'visit dictionary schema' }
PlatypusDataChecker >> acceptStringType: e [ 
	self acceptSimpleType: e
]

{ #category : #accessing }
PlatypusDataChecker >> acceptTry: e [ 
	"Transcript show: e class name , String cr."
	value isNil
		ifTrue: [self checksMissingValue]
		ifFalse: [^ super acceptTry: e]
]

{ #category : #accessing }
PlatypusDataChecker >> aggrPos [
	^aggrPos
]

{ #category : #accessing }
PlatypusDataChecker >> aggrType [
	^aggrType
]

{ #category : #checking }
PlatypusDataChecker >> checksMissingValue [
	aggr
		ifNil: [attribute optionalFlag
				ifFalse: [self valueShouldNotBeMissing]]
		ifNotNil: [aggr elementsAreOptional
				ifFalse: [self valueShouldNotBeMissing]]
]

{ #category : #checking }
PlatypusDataChecker >> checksValue: aValue attribute: anAttribute instanceOid: anInteger repository: aPlatypusRepository [
	value := aValue.
	attribute := anAttribute.
	instanceOid := anInteger.
	platypusRepository :=  aPlatypusRepository.
	self acceptTry: anAttribute.
	^ errors
]

{ #category : #checking }
PlatypusDataChecker >> checksValue: aValue elementType: aMetaData aggrType: anAggrType aggrPos: aPosition attribute: anAttribute instanceOid: anInteger repository: aPlatypusRepository [ 
	value := aValue.
	aggrPos := aPosition.
	instanceOid := anInteger.
	attribute := anAttribute.
	platypusRepository :=  aPlatypusRepository.
	aggrType := anAggrType.
	self acceptTry: aMetaData.
	^ errors
]

{ #category : #'error handling' }
PlatypusDataChecker >> enumerationValueOutOfDomain: enumerationType [ 
	| elements |
	elements := String new.
	enumerationType elements
		do: [:el | elements := elements , '#' , el asUppercase]
		separatedBy: [elements := elements , ' '].
	errors
		add: (self errorClass
				error: self errorHeading , 'is #' , value , ' but should be one of (' , elements , ')'
				oid: instanceOid
				repository: platypusRepository)
]

{ #category : #accessing }
PlatypusDataChecker >> errorClass [
	^ self class errorClass
]

{ #category : #'error handling' }
PlatypusDataChecker >> errorHeading [
	| start |
	aggrPos
		ifNil: [start := 'attribute ' , attribute name , ' ']
		ifNotNil: [start := 'value at: #' , aggrPos asString , ' '].
	^ start
]

{ #category : #'initialize/release' }
PlatypusDataChecker >> initialize [
	super initialize.
	errors := OrderedCollection new
]

{ #category : #'meta data accessing' }
PlatypusDataChecker >> metaDataSchemaInstance [
	^ platypusRepository metaDataSchemaInstance 
]

{ #category : #'error handling' }
PlatypusDataChecker >> selectValueOutOfDomain: selectType [ 
	| elements cls |
	elements := String new.
	selectType selections
		do: [:el | 
			cls := (self smalltalkTypeOf: el referenced) asSymbol.
			elements := elements , cls]
		separatedBy: [elements := elements , ' '].
	errors
		add: (self errorClass
				error: self errorHeading , 'is a' , value class name , ' but should be in selections (' , elements , ')'
				oid: instanceOid
				repository: platypusRepository)
]

{ #category : #'meta data accessing' }
PlatypusDataChecker >> smalltalkTypeOf: anObject [ 
	^ self metaDataSchemaInstance smalltalkTypeOf: anObject
]

{ #category : #'error handling' }
PlatypusDataChecker >> valueIsA: valClass insteadOf: goodClass [ 
	errors
		add: (self errorClass
				error: self errorHeading , 'is a ' , valClass name , ' but should be a ' , goodClass name
				oid: instanceOid
				repository: platypusRepository)
]

{ #category : #'error handling' }
PlatypusDataChecker >> valueShouldNotBeMissing [
	errors
		add: (self errorClass
				error: self errorHeading , 'is mandatory but is missing'
				oid: instanceOid
				repository: platypusRepository)
]
