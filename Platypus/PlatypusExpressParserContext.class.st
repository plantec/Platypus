Class {
	#name : #PlatypusExpressParserContext,
	#superclass : #Object,
	#instVars : [
		'namedTypesIndex',
		'identifiersIndex',
		'ownerContext',
		'contextInstance'
	],
	#category : #'Platypus-HW-parsers'
}

{ #category : #'instance creation' }
PlatypusExpressParserContext class >> contextInstance: anPltDictionaryInstance [ 
^ self contextInstance: anPltDictionaryInstance owner: nil 

]

{ #category : #'instance creation' }
PlatypusExpressParserContext class >> contextInstance: aPltDictionaryInstance owner: anotherContextOrNil [ 
	| context |
	context := self new.
	context ownerContext: anotherContextOrNil.
	context existingContextInstance: aPltDictionaryInstance.
	^ context
]

{ #category : #accessing }
PlatypusExpressParserContext >> contextInstance [
	^ contextInstance
]

{ #category : #accessing }
PlatypusExpressParserContext >> contextInstance: anObject [ 
	contextInstance := anObject
]

{ #category : #'initialize/release' }
PlatypusExpressParserContext >> destroy [
	namedTypesIndex := nil.
	identifiersIndex := nil.
	ownerContext := nil.
	contextInstance := nil.
	super destroy
]

{ #category : #accessing }
PlatypusExpressParserContext >> existingContextInstance: anObject [ 
	self contextInstance: anObject.
	anObject isPltSchemaDefinition
		ifTrue: [anObject identifiersCache
				ifNotNil: [anObject identifiersCache
						keysAndValuesDo: [:k :v | self identifiersIndex at: k put: v]].
			anObject namedTypesCache
				ifNotNil: [anObject namedTypesCache
						keysAndValuesDo: [:k :v | self namedTypesIndex at: k put: v]]]
]

{ #category : #'initialize/release' }
PlatypusExpressParserContext >> flushCaches [
	self contextInstance isPltContextDefinition
		ifTrue: [self contextInstance namedTypesCache isNil
				ifTrue: [self contextInstance namedTypesCache: self namedTypesIndex]
				ifFalse: [self namedTypesIndex
						associationsDo: [:assoc | self contextInstance namedTypesCache add: assoc]].
			self contextInstance identifiersCache isNil
				ifTrue: [self contextInstance identifiersCache: self identifiersIndex]
				ifFalse: [self identifiersIndex
						associationsDo: [:assoc | self contextInstance identifiersCache add: assoc]]]
]

{ #category : #accessing }
PlatypusExpressParserContext >> identifiersIndex [
	^ identifiersIndex
]

{ #category : #accessing }
PlatypusExpressParserContext >> identifiersIndex: aDictionary [
	identifiersIndex := aDictionary
]

{ #category : #'initialize/release' }
PlatypusExpressParserContext >> initialize [
	super initialize.

]

{ #category : #searching }
PlatypusExpressParserContext >> lookUpIdentifierBN: anIdent [ 
	| availables |
	availables := self identifiersIndex
				at: anIdent asUppercase
				ifAbsent: [].
	^ availables
		ifNotNil: [availables anyOne]
]

{ #category : #searching }
PlatypusExpressParserContext >> lookUpNamedTypeBN: anIdent [ 
	| availables |
	availables := self namedTypesIndex
				at: anIdent asUppercase
				ifAbsent: [].

	^ availables ifNotNil: [availables anyOne]
]

{ #category : #accessing }
PlatypusExpressParserContext >> namedTypesIndex [
	^ namedTypesIndex
]

{ #category : #accessing }
PlatypusExpressParserContext >> namedTypesIndex: aDictionary [
	namedTypesIndex := aDictionary
]

{ #category : #accessing }
PlatypusExpressParserContext >> ownerContext [
	^ ownerContext
]

{ #category : #accessing }
PlatypusExpressParserContext >> ownerContext: anotherContextOrNil [ 
	ownerContext := anotherContextOrNil.
	self identifiersIndex: Dictionary new.
	self namedTypesIndex: Dictionary new.
	
]

{ #category : #accessing }
PlatypusExpressParserContext >> registerIdentifier: data named: anIdent [ 
	| key set |
	key := anIdent asUppercase.
	set := self identifiersIndex at: key ifAbsentPut: Set new.
	set at: key add: data
]

{ #category : #accessing }
PlatypusExpressParserContext >> registerNamedType: data named: anIdent [ 
	| key set |
	key := anIdent asUppercase.
	set := self namedTypesIndex at: key ifAbsentPut: Set new.
	set at: key add: data
]
