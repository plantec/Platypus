Class {
	#name : #PlatypusInternalPrimitiveSchemaInstanceReference,
	#superclass : #PlatypusSchemaInstanceReference,
	#instVars : [
		'identifiersCache',
		'namedTypesCache'
	],
	#category : #'SqPlatypus-VW-Compatibility'
}

{ #category : #'private accessing' }
PlatypusInternalPrimitiveSchemaInstanceReference class >> classBlackList [
	"self classBlackList"
	| blackList |
	blackList := Set new.
	SystemOrganization categories
		do: [:cat | blackList
				addAll: ((SystemOrganization listAtCategoryNamed: cat)
						select: [:cls | (PlatypusPharoSmalltalk at: cls) class includesSelector: #translatedFromISO10303P11])].
	^ blackList
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> expressPrimitiveDictionary [
	^ self initializeExpressPrimitiveDictionaryIfNeeded
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> expressPrimitiveDictionaryName [
	^ 'Platypus_Express_primitives'
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> expressPrimitiveSchemasCode [
 ^ PltPlatypusExpressPrimitivesSchemaInstance singleton expressSchemaCode
]

{ #category : #initializing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> initializeExpressPrimitiveDictionary [
	"self initializeExpressPrimitiveDictionary"

	| newref |
	newref := self schemaInstanceNamed: self expressPrimitiveDictionaryName.
	TamManager platypusMetaDefaultTaxon insertReference: newref.
	newref accept: self expressPrimitiveSchemasCode notifying: nil.
	^ newref
]

{ #category : #initializing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> initializeExpressPrimitiveDictionaryIfNeeded [
	"self initializeExpressPrimitiveDictionaryIfNeeded"

	| candidats |
	(candidats := self 
				allSchemaInstanceReferencesNamed: self expressPrimitiveDictionaryName) size 
		> 1 ifTrue: [self error: 'Several meta schemas ??'].
	candidats isEmpty 
		ifTrue: [^ self initializeExpressPrimitiveDictionary]
		ifFalse: [^ candidats first]
]

{ #category : #initializing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> initializePharoPrimitiveDictionary [
	"self initializePharoPrimitiveDictionary"

	| newref |
	self halt.
	newref := self schemaInstanceNamed: self pharoPrimitiveDictionaryName.
	TamManager platypusMetaDefaultTaxon insertReference: newref.
	newref accept: self pharoPrimitiveSchemasCode notifying: nil.
	newref checks.
	^  newref

]

{ #category : #initializing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> initializePharoPrimitiveDictionaryIfNeeded [
	"self initializePharoPrimitiveDictionaryIfNeeded"

	| candidats |
	(candidats := self 
				allSchemaInstanceReferencesNamed: self pharoPrimitiveDictionaryName) size 
		> 1 ifTrue: [self error: 'Several meta schemas ??'].
	candidats isEmpty 
		ifTrue: [^ self initializePharoPrimitiveDictionary]
		ifFalse: [^ candidats first]
		
	
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> lookUpExpressPrimitiveDictionary [
	^ self allInstances copy
		detect: [:epd | epd isExpressPrimitiveDictionary]
		ifNone: []
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> lookUpPharoPrimitiveDictionary [
	^ self allInstances copy
		detect: [:epd | epd isPharoPrimitiveDictionary]
		ifNone: []
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> lookUpPrimitiveIdentifierBN: anIdent [ 
	| |
	^ self expressPrimitiveDictionary lookUpIdentifierBN: anIdent 
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> lookUpPrimitiveNamedTypeBN: anIdent [ 
	^ (self expressPrimitiveDictionary lookUpNamedTypeBN: anIdent)
		
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> pharoPrimitiveDictionaryName [
	^ 'Platypus_Pharo_primitives'.
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference class >> pharoPrimitiveSchemasCode [
	"self pharoPrimitiveSchemasCode"
	| res outCat nameClassifier outN clsName clsSupName usedCat usedOutCat addedCat classBlackList |
	res := WriteStream on: String new.
	classBlackList := self classBlackList.
	nameClassifier := PlatypusExpressTokenClassifier new.
	(SystemOrganization categories asSet difference: self systemCategoryBlackList)
		do: [:cat | 
			usedCat := Set
						with: (SystemOrganization categoryOfElement: #Object).
			(SystemOrganization superclassOrder: cat)
				do: [:cls | cls superclass
						ifNotNil: [(addedCat := SystemOrganization categoryOfElement: cls superclass name asSymbol)
								ifNotNil: [usedCat add: addedCat]]].
			usedCat
				remove: cat
				ifAbsent: [].
			outCat := cat
						copyReplaceAll: '-'
						with: '_'
						asTokens: false.
			outCat := outCat
						copyReplaceAll: ' '
						with: '_'
						asTokens: false.
			res nextPutAll: 'SCHEMA ' , outCat , ';' , String cr.
			usedCat
				do: [:ucat | 
					usedOutCat := ucat
								copyReplaceAll: '-'
								with: '_'
								asTokens: false.
					usedOutCat := usedOutCat
								copyReplaceAll: ' '
								with: '_'
								asTokens: false.
					res nextPutAll: '	USE FROM ' , usedOutCat , ';']
				separatedBy: [res nextPutAll: String cr].
			res nextPutAll: String cr.
			res nextPutAll: String cr.
			((SystemOrganization superclassOrder: cat) difference: classBlackList)
				do: [:cls | 
					(nameClassifier
						tokenClassFromString: cls name
						ifAbsent: [])
						ifNil: [clsName := cls name]
						ifNotNil: [clsName := cls name , '_'].
					(nameClassifier
						tokenClassFromString: cls superclass name
						ifAbsent: [])
						ifNil: [clsSupName := cls superclass name]
						ifNotNil: [clsSupName := cls superclass name , '_'].
					res nextPutAll: '	ENTITY ' , clsName.
					cls superclass
						ifNotNil: [res nextPutAll: ' subtype of (' , clsSupName , ')'].
					res nextPutAll: ';' , String cr.
					cls instVarNames
						do: [:n | 
							(nameClassifier
								tokenClassFromString: n
								ifAbsent: [])
								ifNil: [outN := n]
								ifNotNil: [outN := n , '_'].
							res nextPutAll: '		' , outN , ' : Object;' , String cr].
					res nextPutAll: '	END_ENTITY;' , String cr , String cr].
			res nextPutAll: 'END_SCHEMA; -- ' , outCat , String cr , String cr].
	^ res contents
]

{ #category : #'private accessing' }
PlatypusInternalPrimitiveSchemaInstanceReference class >> systemCategoryBlackList [
	"self systemCategoryBlackList"
	| blackList |
	blackList := Set with: #''.
	SystemOrganization categories
		do: [:cat | ((SystemOrganization listAtCategoryNamed: cat)
					select: [:cls | ((PlatypusPharoSmalltalk at: cls) class includesSelector: #translatedFromISO10303P11) not]) isEmpty
				ifTrue: [blackList add: cat]].
	^ blackList
]

{ #category : #copying }
PlatypusInternalPrimitiveSchemaInstanceReference >> copy [
	^ self error: 'can''t copy a primitive dictionary reference'
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference >> expressParserClassName [
	^ #PlatypusExpressPrimitiveParser
]

{ #category : #testing }
PlatypusInternalPrimitiveSchemaInstanceReference >> isExpressPrimitiveDictionary [
	^ self isReleased not
		and: [self  name = self class expressPrimitiveDictionaryName]
]

{ #category : #testing }
PlatypusInternalPrimitiveSchemaInstanceReference >> isPharoPrimitiveDictionary [
	^ self isReleased not
		and: [self  name = self class pharoPrimitiveDictionaryName]
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference >> namesBuilder [
	^ PlatypusNamesBuilder meta
]

{ #category : #accessing }
PlatypusInternalPrimitiveSchemaInstanceReference >> translaterForPharo [
	^ PlatypusExpressMetaStructure2PharoTranslater 
		namesBuilder: self namesBuilder
]
